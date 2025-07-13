# Constant-Time Validation with Dudect

This directory contains the integration of [dudect](https://github.com/oreparaz/dudect) for validating constant-time properties of assembly implementations.

## Overview

The dudect tool tests whether code runs in constant time by:
1. Running the code many times with different inputs
2. Measuring execution time
3. Applying statistical tests to detect timing variations

## Directory Structure

```
dudect-validation/
├── src/
│   ├── dudect.h              # Dudect library header
│   └── test_harness_template.c # Template for generating tests
├── generated/                 # Generated test harnesses
│   ├── curve25519/
│   ├── poly1305/
│   └── ...
├── runtime-tests/            # Tests generated during build
└── generate_test_harness.py  # Script to generate test harnesses
```

## Usage

### Enabling Validation in Build

To enable constant-time validation during build:

```bash
CARGO_DUDECT_VALIDATE=1 cargo build
```

This will:
1. Compile each assembly file as usual
2. Generate and run a dudect test for constant-time validation
3. Report results as cargo warnings
4. Continue building even if validation fails (but with warnings)

### Manual Testing

You can also manually test specific assembly files:

```bash
cd dudect-validation
python3 generate_test_harness.py
cd generated/curve25519
make test
```

## Integration with build.rs

To integrate dudect validation into your build process:

1. Include the `dudect_integration.rs` module in your `build.rs`
2. Replace standard build commands with the `build_and_validate!` macro

Example:
```rust
// Old way:
assert!(Command::new("nasm")
    .args(&["-f", "elf64", "file.asm", "-o", "file.o"])
    .status()
    .unwrap()
    .success());

// New way with validation:
build_and_validate!(
    "file.asm",
    "file.o",
    "libfile.a",
    "function_name",
    true,  // is NASM
    "curve25519",
    "mul",
    4,     // field size
    "0x18000000000000"  // loose bound
);
```

## Interpreting Results

- **PASS**: No timing leakage detected after the specified iterations
- **FAIL**: Statistical evidence of timing variations found

### Important Notes

1. **False Positives**: Dudect may report timing leaks due to:
   - CPU frequency scaling
   - System interrupts
   - Cache effects
   - Other system noise

2. **False Negatives**: Passing dudect doesn't guarantee constant-time execution:
   - Some leaks may be too small to detect
   - Specific input patterns might not be tested
   - Platform-specific behaviors may vary

3. **Best Practices**:
   - Run tests on isolated systems
   - Disable CPU frequency scaling
   - Run multiple times for confidence
   - Consider this as one tool among many for security validation

## Configuration

Configure validation behavior with environment variables:

- `CARGO_DUDECT_VALIDATE`: Enable/disable validation (0/false to disable)
- `DUDECT_MAX_ITERATIONS`: Maximum test iterations (default: 50)
- `DUDECT_TIMEOUT`: Timeout per test in seconds (default: 30)

## Troubleshooting

### Test compilation fails
- Ensure the assembly file has been compiled to .o first
- Check that function names match exactly
- Verify the dudect.h file is present

### Tests timeout
- Some implementations may take longer to validate
- Increase timeout with DUDECT_TIMEOUT environment variable
- Consider reducing max_iterations for faster feedback

### Too many false positives
- Run on isolated system
- Disable CPU frequency scaling: `sudo cpupower frequency-set -g performance`
- Close other applications
- Consider increasing the statistical threshold in the test harness