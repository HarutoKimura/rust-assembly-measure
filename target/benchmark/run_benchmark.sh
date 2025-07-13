#!/bin/bash
# run_benchmark.sh - Complete benchmarking workflow

CURVE=${1:-curve25519}
OPERATION=${2:-mul}
REPEATS=${3:-10}

echo "=== Running comprehensive benchmark ==="
echo "Curve: $CURVE"
echo "Operation: $OPERATION"
echo "Repeats: $REPEATS"

# Configure system
sudo ./benchmark_setup.sh

# Wait for system to stabilize
sleep 5

# Run benchmark
echo "Starting benchmark..."
sudo taskset -c 0 nice -n -20 cargo run --release $CURVE $OPERATION $REPEATS

# Restore system
sudo ./benchmark_restore.sh

echo "=== Benchmark complete ===" 