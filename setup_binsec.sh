#!/bin/bash
# Script to set up BINSEC for constant-time verification

set -e

echo "Setting up BINSEC for formal constant-time verification..."
echo

# Check if opam is installed
if ! command -v opam &> /dev/null; then
    echo "ERROR: opam is not installed. Please install it first:"
    echo "  Ubuntu/Debian: sudo apt install opam"
    echo "  macOS: brew install opam"
    exit 1
fi

# Check if opam is initialized
if [ ! -d ~/.opam ]; then
    echo "Initializing opam..."
    opam init --auto-setup --yes
    eval $(opam env)
else
    echo "opam is already initialized"
    eval $(opam env)
fi

# Install required packages
echo "Installing OCaml dependencies..."
opam install -y dune dune-site menhir grain_dypgen ocamlgraph zarith toml

# Optional: Install SMT solver bindings for better performance
echo "Installing optional SMT solver bindings..."
opam install -y z3 || echo "Warning: z3 binding installation failed (optional)"

# Build BINSEC
echo "Building BINSEC..."
cd binsec
make clean || true
make

# Check if build succeeded
if [ -f "_build/install/default/bin/binsec" ]; then
    echo
    echo "✅ BINSEC built successfully!"
    echo "Binary location: $(pwd)/_build/install/default/bin/binsec"
    echo
    echo "To use BINSEC verification, run:"
    echo "  CARGO_BINSEC_VALIDATE=1 cargo build"
    echo
    echo "Or set a custom path:"
    echo "  BINSEC_PATH=$(pwd)/_build/install/default/bin/binsec CARGO_BINSEC_VALIDATE=1 cargo build"
else
    echo
    echo "❌ BINSEC build failed"
    echo "Please check the error messages above"
    exit 1
fi