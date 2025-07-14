# BINSEC Formal Verification Setup

This project includes integration with BINSEC for formal verification of constant-time properties in CryptOpt-generated assembly code.

## Current Status

The BINSEC integration is now fully functional! It automatically generates test harnesses and performs formal constant-time verification on CryptOpt-generated assembly code.

### What's Implemented

1. **Build system integration**: Detects CryptOpt files and prepares them for verification
2. **Test harness generation**: Automatically creates C wrapper programs for each assembly function
3. **Configuration generation**: Creates BINSEC checkct configuration files with proper secret markings
4. **BINSEC execution**: Runs formal verification with timeout and result parsing
5. **Result reporting**: Shows control flow and memory access check results

### How It Works

For each CryptOpt assembly file:

1. **Test harness generation**: Create C wrapper programs that:
   - Call the CryptOpt assembly functions with appropriate parameters
   - Mark inputs as secret/public according to the operation
   - Compile into complete executables for BINSEC analysis

2. **Binary generation**: Update the build process to:
   - Generate test harness C code for each CryptOpt function
   - Link object files with the harness to create executables
   - Pass the executable (not .o file) to BINSEC

Example test harness structure:
```c
// test_harness_mul.c
#include <stdint.h>

// External assembly function
extern void rust_fiat_curve25519_carry_mul_CryptOpt(
    uint64_t* out, const uint64_t* arg1, const uint64_t* arg2);

int main() {
    uint64_t out[4];
    uint64_t arg1[4] = {/* secret values */};
    uint64_t arg2[4] = {/* secret values */};
    
    rust_fiat_curve25519_carry_mul_CryptOpt(out, arg1, arg2);
    
    return 0;
}
```

## Setup Instructions

### Prerequisites

1. OCaml compiler (>= 4.11)
2. opam package manager
3. Standard build tools (make, gcc, etc.)

### Building BINSEC

1. **Quick setup** (recommended):
   ```bash
   ./setup_binsec.sh
   ```

2. **Manual setup**:
   ```bash
   # Initialize opam (if not already done)
   opam init
   eval $(opam env)
   
   # Install dependencies
   opam install dune dune-site menhir grain_dypgen ocamlgraph zarith toml
   
   # Optional: Install SMT solver bindings
   opam install z3
   
   # Build BINSEC
   cd binsec
   make
   ```

## Usage

Once BINSEC is built, you can run formal verification alongside statistical validation:

```bash
# Run both DUDECT (statistical) and BINSEC (formal) validation
CARGO_DUDECT_VALIDATE=1 CARGO_BINSEC_VALIDATE=1 cargo build

# Run only BINSEC formal verification
CARGO_BINSEC_VALIDATE=1 cargo build

# Use custom BINSEC path
BINSEC_PATH=/path/to/binsec CARGO_BINSEC_VALIDATE=1 cargo build
```

## What the Integration Does

1. **For each CryptOpt assembly file**:
   - Generates a BINSEC configuration marking inputs as secret
   - Runs BINSEC with the checkct plugin
   - Reports results: secure, insecure (with leak details), or unknown

2. **Configuration includes**:
   - Entry point: The CryptOpt function name
   - Secret inputs: Operands marked as secret data
   - Analysis parameters: Loop unrolling limits, solver timeouts
   - Constant-time checks: Control flow and memory access verification

## Troubleshooting

- **"BINSEC not found"**: Run `./setup_binsec.sh` or build manually
- **"opam not initialized"**: Run `opam init` and follow instructions
- **Build failures**: Check OCaml version (need >= 4.11) and install missing dependencies

## Limitations

- BINSEC requires x86_64 binary format (which CryptOpt generates)
- Formal verification can be slower than statistical validation
- May report "unknown" for complex functions that exceed resource limits