# DUDECT Constant-Time Validation

This document explains how the DUDECT (Differential Unbiased Detection of Constant Time) tool is integrated into this project to verify constant-time properties of CryptOpt-generated assembly code.

## Table of Contents
- [Overview](#overview)
- [What is Constant-Time Programming?](#what-is-constant-time-programming)
- [How DUDECT Works](#how-dudect-works)
- [Integration in This Project](#integration-in-this-project)
- [Running Validation](#running-validation)
- [Understanding Results](#understanding-results)
- [Technical Implementation](#technical-implementation)

## Overview

DUDECT is a statistical testing framework that detects timing leakages in cryptographic implementations. In this project, it validates that CryptOpt-generated assembly code maintains constant-time execution properties, which is crucial for preventing timing side-channel attacks.

## What is Constant-Time Programming?

Constant-time programming is a defensive coding practice where the execution time of cryptographic operations does not depend on secret data (like private keys). This prevents attackers from inferring secret information by measuring execution time.

### Key Principles:
- **No secret-dependent branches**: Code paths should not vary based on secret data
- **No secret-dependent memory access**: Memory access patterns should be independent of secrets
- **No variable-time operations**: Operations like division that have data-dependent timing should be avoided

### Example of Non-Constant-Time Code:
```c
// BAD: Execution time depends on secret key bits
if (secret_key_bit == 1) {
    perform_multiplication();  // Takes longer
} else {
    skip_operation();         // Takes less time
}
```

## How DUDECT Works

DUDECT uses statistical hypothesis testing to detect timing variations:

### 1. **Test Design**
- Creates two input classes:
  - **Class 0**: Fixed inputs (typically all zeros)
  - **Class 1**: Random inputs
- Measures execution time for many iterations of both classes

### 2. **Statistical Analysis**
- Uses Welch's t-test to compare timing distributions
- Null hypothesis: "The two timing distributions are identical"
- If rejected, it indicates timing leakage

### 3. **Key Metrics**
- **t-statistic**: Measures the difference between class means relative to variance
- **Threshold**: |t| > 4.5 indicates potential leakage (following original DUDECT paper)

### 4. **Measurement Process**
```
For each measurement cycle:
1. Randomly assign inputs to Class 0 or Class 1
2. Execute the function and measure CPU cycles
3. Post-process to remove outliers
4. Update running statistics
5. Compute t-statistic
6. Check if |t| > threshold
```

## Integration in This Project

### Architecture

```
build.rs
├── Include dudect_integration.rs
├── For each CryptOpt assembly file:
│   ├── Compile assembly to object file
│   ├── Generate C test harness
│   ├── Link with dudect.h
│   ├── Run statistical tests
│   └── Report results
└── Continue build process
```

### Components

1. **dudect_integration.rs**: Core integration module
   - Manages test generation and execution
   - Only validates CryptOpt files (filters by filename)
   - Provides visual feedback during build

2. **Test Harness Generation**: For each assembly function, generates:
   - Proper C wrapper with correct calling convention
   - Input preparation following field arithmetic constraints
   - Measurement loop using DUDECT framework

3. **Original DUDECT**: Uses unmodified dudect.h from the official repository

## Running Validation

### Enable Validation
```bash
# Run with validation enabled
CARGO_DUDECT_VALIDATE=1 cargo build

# Or set in .cargo/config.toml
[env]
CARGO_DUDECT_VALIDATE = "1"
```

### What Gets Validated
- Only `*_CryptOpt.asm` files
- Both multiplication and squaring operations
- All supported curves:
  - Curve25519
  - P448
  - Poly1305
  - BLS12
  - Secp256k1
  - And others

### Example Output
```
╔═══════════════════════════════════════════════════════════════════╗
║          DUDECT CONSTANT-TIME VALIDATION FOR CRYPTOPT             ║
╚═══════════════════════════════════════════════════════════════════╝

═══════════════════════════════════════════════════════════════════
🔍 Testing: rust_fiat_curve25519_carry_mul (mul)
   File: seed0001746533729338_ratio12461.asm
   Curve: curve25519
✅ PASS: Constant-time property verified!
═══════════════════════════════════════════════════════════════════
```

## Understanding Results

### Result Types

1. **✅ PASS**: No timing leakage detected
   - Function exhibits constant-time behavior
   - Safe for production use

2. **❌ FAIL**: Timing leakage detected
   - Statistical evidence of timing variations
   - Requires investigation and fixes

3. **⚠️ SKIP**: Could not validate
   - Usually due to compilation issues
   - May indicate ABI incompatibility

### Common Issues and Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| Segmentation fault | Stack alignment or calling convention mismatch | Check function signature matches assembly |
| Compilation failure | Missing symbols or incompatible code | Verify all dependencies are linked |
| Timing leakage | Non-constant-time operations | Review assembly for conditional branches |

## Technical Implementation

### Input Generation Strategy

For finite field arithmetic, inputs must respect field bounds:

```c
// For multiplication: prepare two inputs
uint64_t *input1 = (uint64_t*)data;
uint64_t *input2 = (uint64_t*)(data + FIELD_SIZE * sizeof(uint64_t));

// Ensure inputs are within field bounds
for (int j = 0; j < FIELD_SIZE; j++) {
    input1[j] = input1[j] % LOOSE_BOUND;
    input2[j] = input2[j] % LOOSE_BOUND;
}
```

### Measurement Methodology

1. **Number of measurements**: 100,000 per test (following DUDECT defaults)
2. **Timeout**: 60 seconds per function
3. **Iterations**: Maximum 50 cycles or until leakage detected
4. **CPU cycle measurement**: Uses RDTSC or equivalent

### Statistical Parameters

- **Confidence level**: 99.99% (t > 4.5)
- **Test type**: Two-tailed Welch's t-test
- **Preprocessing**: Outlier removal using percentile cropping

### Example Test Harness

```c
#include "dudect.h"

extern void rust_fiat_curve25519_carry_mul_CryptOpt(
    uint64_t *out, 
    const uint64_t *arg1, 
    const uint64_t *arg2
);

uint8_t do_one_computation(uint8_t *data) {
    uint64_t *test_input1 = (uint64_t*)data;
    uint64_t *test_input2 = (uint64_t*)(data + FIELD_SIZE * sizeof(uint64_t));
    
    static uint64_t result[FIELD_SIZE];
    rust_fiat_curve25519_carry_mul_CryptOpt(result, test_input1, test_input2);
    
    return (uint8_t)(result[0] & 0xFF);
}
```

## Best Practices

1. **Run validation regularly**: Include in CI/CD pipeline
2. **Investigate failures**: Don't ignore timing leakages
3. **Test on target hardware**: Timing can vary across platforms
4. **Consider noise**: Run in controlled environment for best results

## References

- [Original DUDECT Paper](https://github.com/oreparaz/dudect)
- [CryptOpt: Verified Compilation with Random Program Search for Cryptographic Primitives](https://arxiv.org/abs/2211.10665)
- [Constant-Time Implementations in Practice](https://www.bearssl.org/constanttime.html)

## Troubleshooting

### Build Errors
```bash
# Clean build artifacts
rm -rf dudect-validation/runtime-tests/
cargo clean

# Rebuild with verbose output
CARGO_DUDECT_VALIDATE=1 cargo build -vv
```

### Validation Failures
1. Check the specific error message
2. Examine the generated test harness in `dudect-validation/runtime-tests/`
3. Run the test manually to debug:
   ```bash
   cd dudect-validation/runtime-tests/curve25519/mul/
   ./test_rust_fiat_curve25519_carry_mul_CryptOpt
   ```

### Performance Impact
- Validation adds ~1-2 minutes to build time
- Only runs when CARGO_DUDECT_VALIDATE=1
- Can be disabled for faster development builds