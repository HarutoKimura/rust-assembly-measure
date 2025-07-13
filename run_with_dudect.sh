#!/bin/bash

echo "Building with constant-time validation enabled..."
echo "=============================================="
echo ""
echo "This will validate the constant-time properties of assembly files during build."
echo "Note: Some tests may timeout if the code is constant-time (this is expected)."
echo ""

# Set the environment variable to enable dudect validation
export CARGO_DUDECT_VALIDATE=1

# Clean previous build artifacts
echo "Cleaning previous build artifacts..."
cargo clean

# Build with validation
echo ""
echo "Building with dudect validation..."
echo "=================================="
cargo build

echo ""
echo "Build complete!"
echo ""
echo "Look for validation results in the build output above:"
echo "  ✓ = Passed constant-time check"
echo "  ✗ = Failed constant-time check (timing leak detected)"
echo ""
echo "To disable validation, run: cargo build"
echo "To enable validation, run: CARGO_DUDECT_VALIDATE=1 cargo build"