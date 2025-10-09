# Rust Assembly Performance & Security Measurement

This repository provides a comprehensive framework for measuring and verifying the performance and security properties of cryptographic assembly implementations, with a focus on CryptOpt-generated code.

## Overview

This project combines:
- **Performance Measurement**: High-precision timing analysis using RDTSC
- **Security Verification**: Formal constant-time verification using BINSEC
- **Statistical Analysis**: Dudect-based statistical constant-time testing
- **Comparative Benchmarking**: Compare CryptOpt, hand-optimized, and compiler-generated assembly

## Supported Algorithms

### Elliptic Curves
- **Curve25519**: Field arithmetic (mul, square) for X25519
- **P-448**: Solinas reduction-based field arithmetic
- **secp256k1**: Dettman's method for field arithmetic
- **BLS12-381**: Field arithmetic for pairing-based cryptography

### Other Algorithms
- **Poly1305**: MAC authentication field arithmetic

### Implementation Variants
For each algorithm, we test:
- **CryptOpt**: Automatically optimized assembly
- **LLVM**: Compiler-generated assembly
- **NASM**: Hand-ported assembly
- **Hand-optimized**: Manual assembly implementations

## Quick Start

### Prerequisites
```bash
# Install build tools
sudo apt-get install clang nasm build-essential

# Install OPAM and BINSEC (for formal verification)
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
opam install binsec

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Building
```bash
# Build all assembly implementations
cargo build

# Build with formal verification enabled
CARGO_BINSEC_VALIDATE=1 cargo build

# Build with statistical testing enabled
CARGO_DUDECT_VALIDATE=1 cargo build
```

### Dynamic API quickstart

Build the shared library with the desired assembly implementation:

```
CARGO_DYNAMIC_TARGETS=src/rust/curve25519/llc/mul/rust_fiat_curve25519_carry_mul_vec.asm \
cargo build --features dynamic-api --lib --release
```

Optionally include a C reference implementation compiled into the same DSO:

```
CARGO_BASELINE_C=src/cryptopt-fiat/fiat-c/wrappers/curve25519_64_mul_wrapper.c \
CARGO_BASELINE_SYMBOL=fiat_curve25519_carry_mul_baseline \
cargo build --features dynamic-api --lib --release
```

Verify that the expected symbols are exported:

```
nm -D target/release/librust_assembly_measure.so | grep -E 'rust_fiat_curve|fiat_curve'
```

Run a one-shot comparison directly from the CLI:

```
cargo run --features dynamic-api -- --dynamic \
  src/rust/curve25519/llc/mul/rust_fiat_curve25519_carry_mul_vec.asm \
  src/cryptopt-fiat/fiat-c/clang/curve25519/mul/fiat_curve25519_carry_mul_clang.asm \
  --batch-size 500 --batches 31 --cpu 3
```

This will compile both implementations into DSOs, measure them with identical runtime settings, and print the median cycles per call.

See `examples/load_and_call.rs` for a small loader that calls into the resulting `.so` using the runtime API.

### Benchmarking (Reproducible)

#### 1) Prepare environment (recommended)
```bash
# Make helper scripts executable
chmod +x setup_benchmark_environment.sh
chmod +x verify_benchmark_environment.sh || true
chmod +x restore_system_defaults.sh || true

# Configure reproducible environment (CPU governor, boost, optional SMT/ASLR, core pinning)
./setup_benchmark_environment.sh

# Verify current settings
./verify_benchmark_environment.sh
```

Optional: move IRQs off the benchmark core (reduces interrupt noise)
```bash
./move_irqs_off_core.sh

# Verify that the benchmark core is not in the affinity lists
grep -H . /proc/irq/*/smp_affinity_list | head -n 20
```
Notes:
- You may be prompted for sudo.
- Some IRQs may ignore affinity changes.
- Re-run after reboot or when devices change.

This creates `run_benchmark_pinned.sh` which pins the benchmark to a dedicated CPU core to reduce noise.

#### 2) Run benchmarks

- Basic usage (default mode, no explicit warm-up):
```bash
cargo run --release <curve_name> <operation> [repeat_count]
# example
cargo run --release curve25519 mul 5
```

- Enhanced mode (recommended; includes warm-up, randomized batching, precise timing):
```bash
ENHANCED_MEASUREMENT=1 ./run_benchmark_pinned.sh cargo run --release <curve_name> <operation> [repeat_count]
# example
ENHANCED_MEASUREMENT=1 ./run_benchmark_pinned.sh cargo run --release curve25519 mul 5
```

In enhanced mode, each function is measured with a three-step warm-up matching the paper:
- 20 warm-up iterations (cache/code warm-up),
- 1 calibration iteration to set batch size (~10,000 cycles/batch),
- 5 final warm-up iterations with calibrated parameters,
then measurement collection. Additionally, a brief global warm-up of all compared functions runs first.

#### 3) Restore defaults (optional)
```bash
./restore_system_defaults.sh
```

#### Available curves and operations
- Curves: `curve25519`, `curve25519_dalek`, `p448`, `poly1305`, `secp256k1_dettman`, `secp256k1_rust_ec`, `bls12`, `fiat_c_curve25519`, `fiat_c_secp256k1_dettman`, `fiat_c_poly1305`, `fiat_c_p448`, `openssl_curve25519`, `openssl_p448`
- Operations: `mul`, `square` (note: not all combinations are implemented)

#### Example commands
```bash
# Curve25519 multiply, 5 runs, enhanced mode with pinning
ENHANCED_MEASUREMENT=1 ./run_benchmark_pinned.sh cargo run --release curve25519 mul 5

# P-448 square, 3 runs (if implemented for that variant)
cargo run --release p448 square 3

# OpenSSL fe51 multiply (5-way comparison path where available)
ENHANCED_MEASUREMENT=1 ./run_benchmark_pinned.sh cargo run --release openssl_curve25519 mul 5
```

#### Understanding output
- Default mode prints median statistics across batches for each run.
- Enhanced mode prints configuration, per-run medians, measurement quality (CV), and a final report including median-of-medians and confidence intervals.

For additional details on methodology and warm-up, see `ENHANCED_BENCHMARKING_METHODOLOGY.md`.

### Security Verification

#### Formal Verification (BINSEC)
```bash
# Verify all CryptOpt implementations
./verify_cryptopt_binsec.sh

# Enable verification during build
CARGO_BINSEC_VALIDATE=1 cargo build
```

#### Statistical Testing (Dudect)
```bash
# Run statistical constant-time tests
CARGO_DUDECT_VALIDATE=1 cargo build

# Results are shown during build
```

## Measurement Methodology

### Performance Timing

We use multiple timing approaches:

1. **RDTSC-based Measurement**
   - Direct CPU cycle counting
   - Serializing instructions (CPUID/LFENCE) for accurate measurements
   - Warm-up iterations to stabilize CPU state

2. **Statistical Analysis**
   - Median of multiple measurements
   - Outlier detection and removal
   - Confidence intervals

3. **CryptOpt-style Measurement**
   - Adaptive batch sizing
   - Target 10,000 cycles per batch
   - 31 batches for statistical significance

### Security Verification

#### BINSEC Formal Verification
- **Control Flow Integrity (CFI)**: Verifies no secret-dependent branches
- **Memory Access Integrity (MAI)**: Verifies no secret-dependent memory accesses
- **Result**: UNKNOWN (all checks pass) indicates constant-time behavior

#### Dudect Statistical Testing
- **Fixed vs Random**: Compares timing distributions
- **Welch's t-test**: Statistical significance testing
- **Threshold**: |t| < 10 indicates likely constant-time

## Data Collection

### Performance Metrics
```json
{
  "function": "curve25519_mul_CryptOpt",
  "cycles": {
    "median": 45678,
    "mean": 45890,
    "std_dev": 234,
    "min": 45123,
    "max": 46789
  },
  "measurements": 1000
}
```

### Security Verification Results
```
| Function | CFI | MAI | Status |
|----------|-----|-----|--------|
| curve25519_mul | 1/1 | 72/72 | ⚠ UNKNOWN (all checks pass) |
```

### Comparative Analysis
The framework automatically compares:
- CryptOpt vs LLVM assembly
- CryptOpt vs hand-optimized
- Different CryptOpt seeds/ratios

## Project Structure

```
rust-assembly-measure/
├── src/
│   ├── main.rs              # Main benchmark runner
│   ├── lib.rs               # Core measurement library
│   ├── precise_timing.rs    # RDTSC timing implementation
│   ├── cryptopt_timing.rs   # CryptOpt-style measurements
│   ├── rust/                # Rust implementation assemblies
│   │   ├── curve25519/
│   │   │   ├── cryptopt/    # CryptOpt-generated
│   │   │   ├── llc/         # LLVM-generated
│   │   │   └── llc-nasm/    # NASM-ported
│   │   └── ...
│   └── c/                   # C implementation assemblies
├── verify_cryptopt_binsec.sh # BINSEC verification script
├── build.rs                 # Build script with validations
├── dudect_integration.rs    # Dudect statistical testing
└── binsec_integration.rs    # BINSEC formal verification
```

## Advanced Usage

### Custom Timing Parameters
```rust
// In your code
let config = TimingConfig {
    warmup_iterations: 1000,
    measurement_iterations: 10000,
    outlier_threshold: 3.0,  // Standard deviations
};
```

### Adding New Algorithms
1. Add assembly files to `src/[rust|c]/algorithm_name/`
2. Update `build.rs` to compile new assemblies
3. Add FFI declarations in `src/lib.rs`
4. Create benchmark functions in `src/main.rs`

### Environment Variables
- `CARGO_BINSEC_VALIDATE=1`: Enable formal verification during build
- `CARGO_BINSEC_STRICT=1`: Fail build if verification fails
- `CARGO_DUDECT_VALIDATE=1`: Enable statistical testing during build
- `CARGO_DUDECT_MEASUREMENTS=N`: Set number of dudect measurements

## Output Files

- `logs/stub/`: BINSEC verification logs
- `target/`: Compiled binaries and libraries
- `dudect-measurements/`: Statistical test results

## Troubleshooting

### BINSEC Shows "UNKNOWN"
This is expected behavior. UNKNOWN with all checks passing means:
- ✅ No timing leaks detected
- ✅ Constant-time behavior verified
- ⚠️ Path exploration incomplete due to `ud2` termination

### Performance Variations
- Ensure CPU frequency scaling is disabled
- Run with high priority: `sudo nice -n -20 cargo run --release`
- Consider isolating CPU cores

### Build Failures
- Check all dependencies are installed
- Verify OPAM environment: `eval $(opam env)`
- Check assembly files exist: `find src -name "*.asm"`

## Contributing

When adding new implementations:
1. Follow the existing directory structure
2. Ensure constant-time properties
3. Add both performance and security tests

## References

- [CryptOpt Paper](https://arxiv.org/abs/2211.10665)
- [BINSEC Tool](https://binsec.github.io/)
- [Dudect Paper](https://eprint.iacr.org/2016/1123)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
