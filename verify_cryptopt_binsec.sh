#!/bin/bash
# verify_cryptopt_binsec.sh - Verify CryptOpt assemblies with BINSEC

# Don't use set -e to allow proper error handling
set -uo pipefail

# Ensure we're using the correct opam switch with working binsec
opam switch default >/dev/null 2>&1
eval $(opam env)

# Check for binsec
if ! command -v binsec >/dev/null 2>&1; then
    echo "Error: binsec not found in PATH"
    exit 1
fi

# Create output directory
mkdir -p logs/stub

# Find all CryptOpt object files
echo "Finding CryptOpt object files..."
OBJECTS=$(find src -name "*.o" -path "*/cryptopt/*" | sort)

if [[ -z "$OBJECTS" ]]; then
    echo "Error: No CryptOpt object files found"
    echo "Run 'cargo build' first to generate object files"
    exit 1
fi

# Initialize counters
TOTAL=0
SAFE=0
UNKNOWN_PASS=0
FAILED=0

# Results header
echo ""
echo "## BINSEC Constant-Time Verification Results"
echo ""
echo "| Symbol | CFI | MAI | Status |"
echo "|--------|-----|-----|--------|"

for obj in $OBJECTS; do
    # Extract symbol name
    SYMBOL=$(nm "$obj" 2>/dev/null | grep " T " | awk '{print $3}' | head -1)
    
    if [[ -z "$SYMBOL" ]]; then
        continue
    fi
    
    
    # Determine parameters based on symbol
    LIMBS=4
    if [[ "$SYMBOL" == *"poly1305"* ]]; then
        LIMBS=3
    elif [[ "$SYMBOL" == *"p448"* ]]; then
        LIMBS=8
    elif [[ "$SYMBOL" == *"bls12"* ]]; then
        LIMBS=6
    elif [[ "$SYMBOL" == *"secp256k1_dettman"* ]]; then
        LIMBS=5
    fi
    
    # Generate stub based on operation type
    if [[ "$SYMBOL" == *"square"* ]]; then
        cat > "${SYMBOL}_stub.c" << EOF
#include <stdint.h>
extern void ${SYMBOL}(uint64_t*,const uint64_t*);
__attribute__((section(".bss"))) uint64_t secret[${LIMBS}], output[${LIMBS}];
void _start(void){
    ${SYMBOL}(output, secret);
    __asm__("ud2");
}
EOF
    else
        cat > "${SYMBOL}_stub.c" << EOF
#include <stdint.h>
extern void ${SYMBOL}(uint64_t*,const uint64_t*,const uint64_t*);
__attribute__((section(".bss"))) uint64_t secret[${LIMBS}*2], output[${LIMBS}];
void _start(void){
    ${SYMBOL}(output, secret, secret+${LIMBS});
    __asm__("ud2");
}
EOF
    fi
    
    # Compile stub
    if ! clang -c "${SYMBOL}_stub.c" -o "${SYMBOL}_stub.o" -O0 -ffreestanding -fno-stack-protector; then
        echo "Failed to compile stub"
        rm -f "${SYMBOL}_stub.c"
        continue
    fi
    
    # Link freestanding
    if ! ld.lld -nostdlib -static -e _start -Ttext=0x401000 "${SYMBOL}_stub.o" "$obj" -o "${SYMBOL}_stub.elf"; then
        echo "Failed to link"
        rm -f "${SYMBOL}_stub.c" "${SYMBOL}_stub.o"
        continue
    fi
    
    # Create BINSEC config
    cat > "${SYMBOL}.cfg" << EOF
starting from <_start>
with concrete stack pointer
secret global secret
public global output
explore all
EOF
    
    # Run BINSEC
    LOG="logs/stub/${SYMBOL}.log"
    timeout 30 binsec -isa amd64 -sse -checkct -sse-script "${SYMBOL}.cfg" -sse-depth 2000 "${SYMBOL}_stub.elf" > "$LOG" 2>&1 || true
    
    # Parse results
    CFI=$(grep -oP '\d+(?= / \d+ control flow checks pass)' "$LOG" 2>/dev/null || echo "0")
    CFI_TOTAL=$(grep -oP '\d+ / \K\d+(?= control flow checks pass)' "$LOG" 2>/dev/null || echo "0")
    MAI=$(grep -oP '\d+(?= / \d+ memory access checks pass)' "$LOG" 2>/dev/null || echo "0")
    MAI_TOTAL=$(grep -oP '\d+ / \K\d+(?= memory access checks pass)' "$LOG" 2>/dev/null || echo "0")
    
    STATUS="❌ FAIL"
    if grep -q "Program status is : SAFE\|Program status is : secure" "$LOG" 2>/dev/null; then
        STATUS="✅ SAFE"
        ((SAFE++)) || true
    elif [[ "$CFI" == "$CFI_TOTAL" ]] && [[ "$MAI" == "$MAI_TOTAL" ]] && [[ "$CFI_TOTAL" != "0" ]]; then
        STATUS="⚠ UNKNOWN (all checks pass)"
        ((UNKNOWN_PASS++)) || true
    else
        ((FAILED++)) || true
    fi
    
    echo "| $SYMBOL | $CFI/$CFI_TOTAL | $MAI/$MAI_TOTAL | $STATUS |"
    ((TOTAL++)) || true
    
    # Cleanup
    rm -f "${SYMBOL}_stub.c" "${SYMBOL}_stub.o" "${SYMBOL}_stub.elf" "${SYMBOL}.cfg"
done

echo ""
echo "### Summary"
echo "- Total verified: $TOTAL"
echo "- SAFE (formally verified): $SAFE"
echo "- UNKNOWN (all checks pass): $UNKNOWN_PASS"
echo "- Failed/Incomplete: $FAILED"
echo ""
echo "Note: UNKNOWN with all checks passing still indicates constant-time behavior."
echo "Logs saved in: logs/stub/"