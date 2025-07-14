# BINSEC Integration - Comprehensive Documentation

## Overview

This document provides detailed documentation of the BINSEC integration in the rust-assembly-measure project. BINSEC is a formal verification tool that provides mathematical proofs of constant-time properties in cryptographic assembly code, complementing the statistical validation provided by DUDECT.

## Architecture

### Components

1. **binsec_integration.rs** - Main integration module
   - Manages BINSEC configuration and execution
   - Handles result parsing and reporting
   - Integrates with the build system

2. **binsec_harness_generator.rs** - Test harness generation
   - Creates C wrapper programs for assembly functions
   - Generates appropriate test cases for different operations
   - Handles global variable declarations for secret tracking

3. **setup_binsec.sh** - Installation script
   - Automates BINSEC dependency installation
   - Builds BINSEC from source
   - Sets up OCaml environment

4. **binsec-validation/** - Generated validation artifacts
   - `configs/` - BINSEC configuration files
   - `harnesses/` - C test harness files and executables

## How It Works

### 1. Detection and Filtering

The integration only validates CryptOpt-generated assembly files:

```rust
// Only validate CryptOpt files
if !validation.asm_file.contains("cryptopt") && !validation.function_name.contains("CryptOpt") {
    return true;
}
```

### 2. Test Harness Generation

For each assembly function, a C harness is generated with:

- **Global variables** for secret inputs (tracked by BINSEC)
- **Main function** that calls the assembly code
- **Static linking** for self-contained analysis

Example harness for multiplication:
```c
// Global variables for BINSEC to track
uint64_t secret_input1[4];
uint64_t secret_input2[4];
uint64_t public_output[4];

int main() {
    // Initialize secret inputs
    for (int i = 0; i < 4; i++) {
        secret_input1[i] = 0x1111111111111111ULL * (i + 1);
        secret_input2[i] = 0x2222222222222222ULL * (i + 1);
    }
    
    // Call the assembly function
    rust_fiat_curve25519_carry_mul_CryptOpt(public_output, secret_input1, secret_input2);
    
    return (int)(public_output[0] & 0xFF);
}
```

### 3. Configuration Generation

BINSEC configurations specify:
- Entry point (main function)
- Secret variables to track
- Exploration strategy

Example configuration:
```
starting from <main>

with concrete stack pointer

secret global secret_input1, secret_input2
public global public_output

explore all
```

### 4. Formal Verification

BINSEC performs symbolic execution to verify:
- **Control flow independence**: No branches depend on secret data
- **Memory access independence**: No address calculations depend on secrets

### 5. Result Interpretation

The integration parses BINSEC output for three possible results:

1. **SECURE**: Constant-time property formally verified
   ```
   ✅ PASS: Constant-time property formally verified!
   ```

2. **INSECURE**: Timing leakage formally proven
   ```
   ❌ FAIL: Timing leakage formally proven!
   Leak details: [specific information about the leak]
   ```

3. **UNKNOWN**: Verification incomplete (timeout or resource limits)
   ```
   ⚠️  UNKNOWN: Verification incomplete
   Reason: Analysis timed out after 60s
   ```

## Configuration Options

### Environment Variables

- `CARGO_BINSEC_VALIDATE=1` - Enable BINSEC validation
- `BINSEC_PATH=/path/to/binsec` - Custom BINSEC binary location
- Default timeout: 60 seconds

### Usage Examples

```bash
# Run with both DUDECT and BINSEC
CARGO_DUDECT_VALIDATE=1 CARGO_BINSEC_VALIDATE=1 cargo build

# Run only BINSEC validation
CARGO_BINSEC_VALIDATE=1 cargo build

# Use custom BINSEC installation
BINSEC_PATH=/opt/binsec/bin/binsec CARGO_BINSEC_VALIDATE=1 cargo build
```

## Integration with Build System

The integration is embedded in `build.rs` through the `build_and_validate_with_formal` macro:

```rust
build_and_validate_with_formal!(
    asm_file, obj_file, lib_file, 
    function_name, is_nasm, 
    curve_name, operation, field_size, loose_bound
);
```

This macro:
1. Builds the assembly file
2. Runs DUDECT statistical validation
3. Runs BINSEC formal verification
4. Creates the static library

## Supported Operations

### Multiplication (`mul`)
- Takes two secret inputs
- Produces one public output
- Verifies no timing leaks in multiplication operations

### Squaring (`square`)
- Takes one secret input
- Produces one public output
- Verifies no timing leaks in squaring operations

### Generic Operations
- Fallback for other operations
- Uses single input/output model

## Directory Structure

```
binsec-validation/
├── configs/
│   ├── curve25519/
│   │   ├── mul/
│   │   │   └── config_*.cfg
│   │   └── square/
│   │       └── config_*.cfg
│   ├── p448/
│   ├── poly1305/
│   └── secp256k1_dettman/
└── harnesses/
    └── [same structure as configs]
        ├── harness_*.c (source files)
        └── test_* (executables)
```

## Troubleshooting

### Common Issues

1. **BINSEC not found**
   - Run `./setup_binsec.sh` to install
   - Or set `BINSEC_PATH` to existing installation

2. **OCaml/opam errors**
   - Ensure OCaml >= 4.11 is installed
   - Initialize opam: `opam init`
   - Install dependencies: `opam install dune menhir grain_dypgen ocamlgraph zarith toml`

3. **Compilation failures**
   - Check gcc is installed
   - Verify object files exist before harness generation

4. **Timeout issues**
   - Complex functions may exceed 60s timeout
   - Results marked as "UNKNOWN" are considered passing (non-blocking)

## Advantages Over Statistical Methods

1. **Mathematical Certainty**: Provides formal proofs rather than statistical confidence
2. **Complete Coverage**: Explores all possible execution paths
3. **Precise Leak Location**: Identifies exact instructions causing leaks
4. **No False Negatives**: If marked secure, it's provably secure

## Limitations

1. **Performance**: Slower than statistical methods
2. **Scalability**: May timeout on very complex functions
3. **Binary Format**: Requires x86_64 ELF binaries
4. **Resource Usage**: Can be memory-intensive for large functions

## Future Enhancements

1. **Parallel Execution**: Run multiple BINSEC instances concurrently
2. **Caching**: Cache verification results to avoid re-verification
3. **Custom Timeout**: Per-function timeout configuration
4. **Extended Analysis**: Support for more cryptographic operations
5. **Report Generation**: Detailed HTML reports with verification results

## References

- [BINSEC Official Documentation](https://binsec.github.io/)
- [Constant-Time Verification Papers](https://binsec.github.io/references)
- [CryptOpt Project](https://github.com/0xADE1A1DE/CryptOpt)