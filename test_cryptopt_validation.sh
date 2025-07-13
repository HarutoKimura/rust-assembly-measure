#!/bin/bash

echo "Testing CryptOpt-only constant-time validation"
echo "=============================================="
echo ""
echo "This test will validate ONLY CryptOpt-generated assembly files."
echo ""

# Clean specific object files to force rebuild
echo "Cleaning build artifacts..."
rm -f src/rust/curve25519/llc/mul/*.o
rm -f src/rust/curve25519/llc-nasm/mul/*.o  
rm -f src/rust/curve25519/cryptopt/mul/*.o
rm -f src/rust/curve25519/llc/square/*.o
rm -f src/rust/curve25519/llc-nasm/square/*.o
rm -f src/rust/curve25519/cryptopt/square/*.o

# Build with validation enabled
echo "Building with CARGO_DUDECT_VALIDATE=1..."
echo ""
CARGO_DUDECT_VALIDATE=1 cargo build 2>&1 | grep -E "warning.*rust-assembly.*:|Finished" | \
while IFS= read -r line; do
    if [[ $line == *"Validating constant-time for CryptOpt"* ]]; then
        echo "🔍 $line"
    elif [[ $line == *"passed constant-time check"* ]]; then
        echo "✅ $line"
    elif [[ $line == *"FAILED constant-time check"* ]]; then
        echo "❌ $line"
    elif [[ $line == "Finished"* ]]; then
        echo ""
        echo "$line"
    else
        # Skip other warnings
        :
    fi
done

echo ""
echo "Summary:"
echo "- Only CryptOpt files were validated"
echo "- LLC and NASM versions were skipped"
echo "- Each validation used 100,000 measurements"
echo "- Using original dudect methodology"