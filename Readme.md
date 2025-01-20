# Performance Measurement for Cryptographic Assembly Code

This project is a Rust-based tool designed to measure and compare the performance of three assembly code formats: GAS format, NASM format, and CryptOpt output. The tool evaluates their execution times across various cryptographic curve implementations by running randomized performance benchmarks.

## Features

- Supports benchmarking for different cryptographic curves:
  - **Curve25519**
  - **P448**
  - **Poly1305**
  - **Secp256k1 (Dettman)**
  - **BLS12**
- Randomized order of function execution for unbiased results.
- Median-based performance comparison for robust metrics.
- Validation of correctness by comparing outputs from different assembly formats.

## How It Works

The tool performs the following steps:

1. **Generate Random Inputs**: Loose-bound random inputs are generated for the selected curve.
2. **Measure Execution Time**: Each assembly format function (GAS, NASM, CryptOpt) is executed multiple times to compute cycle counts.
3. **Correctness Check**: Outputs from the three functions are compared to ensure consistency.
4. **Calculate Median Performance**: Median cycle counts are computed for accurate benchmarking.
5. **Compare Performance**: Results are analyzed to determine the performance difference between CryptOpt and other formats.

## Usage

### Build the Project

To build the project, use:

```bash
cargo build
cargo run <curve_name> [repeat_count]

