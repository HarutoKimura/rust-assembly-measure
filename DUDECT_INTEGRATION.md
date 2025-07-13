# Dudect Constant-Time Validation Integration

## Overview

The dudect constant-time validation has been successfully integrated into the build process. This tool specifically validates **CryptOpt-generated assembly files** to ensure they maintain constant-time properties as guaranteed by the CryptOpt optimizer.

## How to Use

### Enable Validation During Build

```bash
# Option 1: Use the provided script
./run_with_dudect.sh

# Option 2: Set environment variable manually
CARGO_DUDECT_VALIDATE=1 cargo build

# Option 3: Set in .cargo/config.toml (already done)
# The validation is enabled by default in this project
```

### Disable Validation

```bash
# Temporarily disable for a single build
CARGO_DUDECT_VALIDATE=0 cargo build

# Or just run normal cargo build if you remove the .cargo/config.toml
cargo build
```

## What It Does

During the build process, the integration:

1. **Automatically identifies CryptOpt files** (containing "cryptopt" in path or "CryptOpt" in function name)
2. **Skips non-CryptOpt files** (LLC, NASM versions are not validated)
3. For each CryptOpt assembly file:
   - Compiles the assembly file as usual
   - Generates a test harness using the original dudect methodology
   - Runs statistical timing analysis with 100,000 measurements
   - Reports results as cargo warnings:
     - ✓ = Passed constant-time check
     - ✗ = Failed constant-time check (potential timing leak)

The validation uses the **original dudect implementation** with:
- Two input classes: all zeros (class 0) and random values (class 1)
- Welch's t-test for statistical analysis
- Multiple test configurations (cropped/uncropped measurements)

## Current Status

The following functions in `build.rs` have been updated to include validation:
- `rust_fiat_curve25519_carry_mul` (LLC)
- `rust_fiat_curve25519_carry_mul_nasm` (NASM)
- `rust_fiat_curve25519_carry_mul_CryptOpt` (CryptOpt)
- `rust_fiat_curve25519_carry_square` (LLC)

To add validation to other functions, replace the standard build commands with:

```rust
build_and_validate!(
    "path/to/file.asm",
    "path/to/file.o",
    "path/to/libfile.a",
    "function_name",
    true/false,  // is NASM?
    "curve_name",
    "mul/square",
    field_size,
    "loose_bound"
);
```

## Configuration

- **Timeout**: 60 seconds per test (adjustable in `dudect_integration.rs`)
- **Max iterations**: 50 (adjustable in `dudect_integration.rs`)
- **Measurements per iteration**: 1000

## Important Notes

1. **Performance**: Validation adds time to the build process
2. **False positives**: System noise can cause false timing leak detections
3. **False negatives**: Passing doesn't guarantee perfect constant-time execution
4. **CPU considerations**: Best run on isolated systems with fixed CPU frequency

## Files Added

- `dudect_integration.rs` - Core integration module
- `dudect-validation/` - Directory containing dudect tool and test harnesses
- `.cargo/config.toml` - Configuration to enable validation by default
- `run_with_dudect.sh` - Convenience script for building with validation

## Next Steps

To fully integrate dudect validation across all assembly files:

1. Update remaining functions in `build.rs` to use `build_and_validate!`
2. Adjust timeout/iteration settings based on your needs
3. Consider adding curve-specific validation configurations
4. Set up CI/CD to run validation tests