Performance Measurement for Cryptographic Assembly Code

This project is a Rust-based tool designed to measure and compare the performance of three assembly code formats: GAS format, NASM format, and CryptOpt output. The tool evaluates their execution times across various cryptographic curve implementations by running randomized performance benchmarks.

Features

Supports benchmarking for different cryptographic curves:

Curve25519

P448

Poly1305

Secp256k1 (Dettman)

BLS12

Randomized order of function execution for unbiased results.

Median-based performance comparison for robust metrics.

Validation of correctness by comparing outputs from different assembly formats.

How It Works

The tool performs the following steps:

Generate Random Inputs: Loose-bound random inputs are generated for the selected curve.

Measure Execution Time: Each assembly format function (GAS, NASM, CryptOpt) is executed multiple times to compute cycle counts.

Correctness Check: Outputs from the three functions are compared to ensure consistency.

Calculate Median Performance: Median cycle counts are computed for accurate benchmarking.

Compare Performance: Results are analyzed to determine the performance difference between CryptOpt and other formats.

Usage

Build the Project

To build the project, use:

cargo build

Run the Benchmark

To run the benchmark, use the following command:

cargo run <curve_name> [repeat_count]

Parameters

<curve_name>: Specifies the cryptographic curve to benchmark. Available options:

curve25519

p448

poly1305

secp256k1_dettman

bls12

[repeat_count] (optional): Specifies how many times the measurement should be repeated. Default is 1.

Examples

Run a single benchmark for Curve25519:

cargo run curve25519

Run 100 repeated benchmarks for Secp256k1 (Dettman):

cargo run secp256k1_dettman 100

Output

The program outputs the median cycle counts for the three assembly formats and calculates their relative performance differences.

Example Output:

=== Final 'Median of Medians' after 100 full runs ===
GAS format ASM: 123456
NASM format ASM: 120987
CryptOpt format ASM: 115678

CryptOpt is 6.34% faster than GAS (median-of-medians).
CryptOpt is 4.39% faster than NASM (median-of-medians).

Code Overview

main.rs

This file contains the main functionality of the tool, including:

Cryptographic Curves Module: Definitions and function bindings for Curve25519, P448, Poly1305, Secp256k1, and BLS12.

Performance Measurement Functions: Implements randomized input generation, cycle count measurement, and median calculation.

Correctness Validation: Ensures output consistency across formats.

Benchmarking Logic: Executes repeated measurements and outputs performance results.

build.rs

The build.rs file is responsible for linking the external assembly files required for the benchmark. Ensure the .asm files for GAS, NASM, and CryptOpt formats are included in your build environment.

Requirements

Rust: Ensure you have Rust installed. You can install it via rustup.

Assembly Files: Ensure the .asm files for GAS, NASM, and CryptOpt formats are available and properly linked in your build environment.

How to Add a New Curve

Define the curve's loose bound and size in a new module.

Provide the function bindings for the curve's assembly functions (GAS, NASM, CryptOpt).

Add the new curve to the CurveType enum and implement its parameters and functions.

