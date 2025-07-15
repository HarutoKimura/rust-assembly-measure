#!/bin/bash

# List of all supported curves
CURVES=(
    "curve25519"
    "curve25519_dalek"
    "fiat_c_curve25519"
    "fiat_c_secp256k1_dettman"
    "fiat_c_poly1305"
    "fiat_c_p448"
    "p448"
    "poly1305"
    "secp256k1_dettman"
    "secp256k1_rust_ec"
    "bls12"
    "openssl_curve25519"
)

# Operations
OPERATIONS=("mul" "square")

# Number of repetitions
REPEATS=21

# Create output directory if it doesn't exist
mkdir -p output

echo "Starting comprehensive benchmark suite..."
echo "Running ${#CURVES[@]} curves × ${#OPERATIONS[@]} operations × $REPEATS repetitions"
echo "================================================"

# Counter for progress
total=$((${#CURVES[@]} * ${#OPERATIONS[@]}))
current=0

# Run benchmarks for each combination
for curve in "${CURVES[@]}"; do
    for op in "${OPERATIONS[@]}"; do
        current=$((current + 1))
        output_file="output/${curve}_${op}_${REPEATS}.out"
        
        echo ""
        echo "[$current/$total] Running: $curve $op $REPEATS"
        echo "Output file: $output_file"
        echo "------------------------------------------------"
        
        # Run the benchmark and capture output
        # Using timeout to prevent hanging on unsupported operations
        timeout 300 cargo run --release -- "$curve" "$op" "$REPEATS" > "$output_file" 2>&1
        
        if [ $? -eq 0 ]; then
            echo "✓ Success: $curve $op"
            # Show summary from output
            grep -E "(faster|slower) than|p = " "$output_file" | tail -3
        elif [ $? -eq 124 ]; then
            echo "✗ Timeout: $curve $op (exceeded 5 minutes)"
        else
            echo "✗ Failed: $curve $op"
            # Show error message
            tail -5 "$output_file"
        fi
    done
done

echo ""
echo "================================================"
echo "Benchmark suite completed!"
echo "Results saved in: output/"
echo ""
echo "Summary of output files:"
ls -la output/*.out | wc -l
echo "files generated"