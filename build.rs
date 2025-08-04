use std::process::Command;
use std::fs::{self, File};
use std::io::Write;

// -----------------------------------------------------------------------------
// Dudect constant-time validation integration
include!("dudect_integration.rs");

// -----------------------------------------------------------------------------
// Binsec formal verification integration
include!("binsec_integration_new.rs");

// -----------------------------------------------------------------------------
// Build functions for each curve

fn print_validation_header() {
    let dudect_enabled = std::env::var("CARGO_DUDECT_VALIDATE")
        .map(|v| v != "0" && v != "false")
        .unwrap_or(false);
    let binsec_enabled = std::env::var("CARGO_BINSEC_VALIDATE")
        .map(|v| v != "0" && v != "false")
        .unwrap_or(false);
        
    if dudect_enabled || binsec_enabled {
        println!("cargo:warning=");
        println!("cargo:warning=╔═══════════════════════════════════════════════════════════════════╗");
        println!("cargo:warning=║          CONSTANT-TIME VALIDATION FOR CRYPTOPT                    ║");
        println!("cargo:warning=╚═══════════════════════════════════════════════════════════════════╝");
        println!("cargo:warning=");
        
        if dudect_enabled {
            println!("cargo:warning=DUDECT: Statistical constant-time validation enabled");
            println!("cargo:warning=  This will validate using statistical tests.");
        }
        
        if binsec_enabled {
            println!("cargo:warning=BINSEC: Formal constant-time verification enabled");
            println!("cargo:warning=  This will formally verify constant-time properties.");
        }
        
        println!("cargo:warning=");
    }
}

fn build_curve25519() {
    // ---------- MUL ----------
    // LLC version (mul)
    build_and_validate!(
        "src/rust/curve25519/llc/mul/rust_fiat_curve25519_carry_mul.asm",
        "src/rust/curve25519/llc/mul/rust_fiat_curve25519_carry_mul.o",
        "src/rust/curve25519/llc/mul/librust_fiat_curve25519_carry_mul.a",
        "rust_fiat_curve25519_carry_mul",
        false,  // not NASM
        "curve25519",
        "mul",
        4,      // field size
        "0x18000000000000"  // loose bound
    );

    // NASM version (mul)
    build_and_validate!(
        "src/rust/curve25519/llc-nasm/mul/rust_fiat_curve25519_carry_mul_nasm.asm",
        "src/rust/curve25519/llc-nasm/mul/rust_fiat_curve25519_carry_mul_nasm.o",
        "src/rust/curve25519/llc-nasm/mul/librust_fiat_curve25519_carry_mul_nasm.a",
        "rust_fiat_curve25519_carry_mul_nasm",
        true,   // NASM
        "curve25519",
        "mul",
        4,      // field size
        "0x18000000000000"  // loose bound
    );

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/curve25519/cryptopt/mul/seed0001746533729338_ratio12461.asm",
        "src/rust/curve25519/cryptopt/mul/seed0001746533729338_ratio12461.o",
        "src/rust/curve25519/cryptopt/mul/librust_fiat_curve25519_carry_mul_CryptOpt.a",
        "rust_fiat_curve25519_carry_mul_CryptOpt",
        true,   // NASM
        "curve25519",
        "mul",
        4,      // field size
        "0x18000000000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    build_and_validate!(
        "src/rust/curve25519/llc/square/rust_fiat_curve25519_carry_square.asm",
        "src/rust/curve25519/llc/square/rust_fiat_curve25519_carry_square.o",
        "src/rust/curve25519/llc/square/librust_fiat_curve25519_carry_square.a",
        "rust_fiat_curve25519_carry_square",
        false,  // not NASM
        "curve25519",
        "square",
        4,      // field size
        "0x18000000000000"  // loose bound
    );

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_nasm.asm",
            "-o",
            "src/rust/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519/llc-nasm/square/librust_fiat_curve25519_carry_square_nasm.a",
            "src/rust/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/curve25519/cryptopt/square/seed0001746532817891_ratio10523.asm",
        "src/rust/curve25519/cryptopt/square/seed0001746532817891_ratio10523.o",
        "src/rust/curve25519/cryptopt/square/librust_fiat_curve25519_carry_square_CryptOpt.a",
        "rust_fiat_curve25519_carry_square_CryptOpt",
        true,   // NASM
        "curve25519",
        "square",
        4,      // field size
        "0x18000000000000"  // loose bound
    );
    
}

fn build_curve25519_dalek() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/curve25519-dalek/llc/mul/curve25519_dalek_mul.asm",
            "-o",
            "src/rust/curve25519-dalek/llc/mul/curve25519_dalek_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519-dalek/llc/mul/libcurve25519_dalek_mul.a",
            "src/rust/curve25519-dalek/llc/mul/curve25519_dalek_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_nasm.asm",
            "-o",
            "src/rust/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519-dalek/llc-nasm/mul/libcurve25519_dalek_mul_nasm.a",
            "src/rust/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/curve25519-dalek/cryptopt/mul/seed0001746569406075_ratio12273.asm",
        "src/rust/curve25519-dalek/cryptopt/mul/seed0001746569406075_ratio12273.o",
        "src/rust/curve25519-dalek/cryptopt/mul/libcurve25519_dalek_mul_CryptOpt.a",
        "curve25519_dalek_mul_CryptOpt",
        true,   // NASM
        "curve25519",
        "mul",
        4,      // field size
        "0x18000000000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square) - Assuming file exists
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/curve25519-dalek/llc/square/curve25519_dalek_square.asm", // Assumed path
            "-o",
            "src/rust/curve25519-dalek/llc/square/curve25519_dalek_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519-dalek/llc/square/libcurve25519_dalek_square.a",
            "src/rust/curve25519-dalek/llc/square/curve25519_dalek_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_nasm.asm",
            "-o",
            "src/rust/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/curve25519-dalek/llc-nasm/square/libcurve25519_dalek_square_nasm.a",
            "src/rust/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/curve25519-dalek/cryptopt/square/seed0001746572411863_ratio09431.asm",
        "src/rust/curve25519-dalek/cryptopt/square/seed0001746572411863_ratio09431.o",
        "src/rust/curve25519-dalek/cryptopt/square/libcurve25519_dalek_square_CryptOpt.a",
        "curve25519_dalek_square_CryptOpt",
        true,   // NASM
        "curve25519",
        "square",
        4,      // field size
        "0x18000000000000"  // loose bound
    );
}

fn build_p448() {
    // (Only MUL is supported for p448 as per current structure)
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/p448/llc/rust_fiat_p448_solinas_carry_mul.asm",
            "-o",
            "src/rust/p448/llc/rust_fiat_p448_solinas_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/p448/llc/librust_fiat_p448_solinas_carry_mul.a",
            "src/rust/p448/llc/rust_fiat_p448_solinas_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.asm",
            "-o",
            "src/rust/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/p448/llc-nasm/librust_fiat_p448_solinas_carry_mul_nasm.a",
            "src/rust/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/p448/cryptopt/seed0001746580882393_ratio14028.asm",
        "src/rust/p448/cryptopt/seed0001746580882393_ratio14028.o",
        "src/rust/p448/cryptopt/librust_fiat_p448_solinas_carry_mul_CryptOpt.a",
        "rust_fiat_p448_solinas_carry_mul_CryptOpt",
        true,   // NASM
        "p448",
        "mul",
        8,      // field size
        "0x300000000000000"  // loose bound
    );
}

fn build_poly1305() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/poly1305/llc/mul/rust_fiat_poly1305_carry_mul.asm",
            "-o",
            "src/rust/poly1305/llc/mul/rust_fiat_poly1305_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/poly1305/llc/mul/librust_fiat_poly1305_carry_mul.a",
            "src/rust/poly1305/llc/mul/rust_fiat_poly1305_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_nasm.asm",
            "-o",
            "src/rust/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/poly1305/llc-nasm/mul/librust_fiat_poly1305_carry_mul_nasm.a",
            "src/rust/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/poly1305/cryptopt/mul/seed0001746568049762_ratio10480.asm",
        "src/rust/poly1305/cryptopt/mul/seed0001746568049762_ratio10480.o",
        "src/rust/poly1305/cryptopt/mul/librust_fiat_poly1305_carry_mul_CryptOpt.a",
        "rust_fiat_poly1305_carry_mul_CryptOpt",
        true,   // NASM
        "poly1305",
        "mul",
        3,      // field size
        "0x300000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/poly1305/llc/square/rust_fiat_poly1305_carry_square.asm",
            "-o",
            "src/rust/poly1305/llc/square/rust_fiat_poly1305_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/poly1305/llc/square/librust_fiat_poly1305_carry_square.a",
            "src/rust/poly1305/llc/square/rust_fiat_poly1305_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_nasm.asm",
            "-o",
            "src/rust/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/poly1305/llc-nasm/square/librust_fiat_poly1305_carry_square_nasm.a",
            "src/rust/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/poly1305/cryptopt/square/seed0001746568793896_ratio10366.asm",
        "src/rust/poly1305/cryptopt/square/seed0001746568793896_ratio10366.o",
        "src/rust/poly1305/cryptopt/square/librust_fiat_poly1305_carry_square_CryptOpt.a",
        "rust_fiat_poly1305_carry_square_CryptOpt",
        true,   // NASM
        "poly1305",
        "square",
        3,      // field size
        "0x300000000"  // loose bound
    );
}

fn build_bls12(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/bls12/llc/mul/bls12_mul.asm",
            "-o",
            "src/rust/bls12/llc/mul/bls12_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/bls12/llc/mul/libbls12_mul.a",
            "src/rust/bls12/llc/mul/bls12_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/bls12/llc-nasm/mul/bls12_mul_nasm.asm",
            "-o",
            "src/rust/bls12/llc-nasm/mul/bls12_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/bls12/llc-nasm/mul/libbls12_mul_nasm.a",
            "src/rust/bls12/llc-nasm/mul/bls12_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/bls12/cryptopt/mul/seed0001746613146277_ratio06057.asm",
        "src/rust/bls12/cryptopt/mul/seed0001746613146277_ratio06057.o",
        "src/rust/bls12/cryptopt/mul/libbls12_mul_CryptOpt.a",
        "bls12_mul_CryptOpt",
        true,   // NASM
        "bls12",
        "mul",
        6,      // field size
        "0xffffffffffffffff"  // loose bound
    );
}

fn build_secp256k1_dettman(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul.asm",
            "-o",
            "src/rust/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/secp256k1_dettman/llc/mul/librust_fiat_secp256k1_dettman_mul.a",
            "src/rust/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_nasm.asm",
            "-o",
            "src/rust/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/secp256k1_dettman/llc-nasm/mul/librust_fiat_secp256k1_dettman_mul_nasm.a",
            "src/rust/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/secp256k1_dettman/cryptopt/mul/seed0001746535350242_ratio10550.asm",
        "src/rust/secp256k1_dettman/cryptopt/mul/seed0001746535350242_ratio10550.o",
        "src/rust/secp256k1_dettman/cryptopt/mul/librust_fiat_secp256k1_dettman_mul_CryptOpt.a",
        "rust_fiat_secp256k1_dettman_mul_CryptOpt",
        true,   // NASM
        "secp256k1_dettman",
        "mul",
        5,      // field size
        "0x1000003d10"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square.asm",
            "-o",
            "src/rust/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/secp256k1_dettman/llc/square/librust_fiat_secp256k1_dettman_square.a",
            "src/rust/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_nasm.asm",
            "-o",
            "src/rust/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/secp256k1_dettman/llc-nasm/square/librust_fiat_secp256k1_dettman_square_nasm.a",
            "src/rust/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/secp256k1_dettman/cryptopt/square/seed0001746537458781_ratio09812.asm",
        "src/rust/secp256k1_dettman/cryptopt/square/seed0001746537458781_ratio09812.o",
        "src/rust/secp256k1_dettman/cryptopt/square/librust_fiat_secp256k1_dettman_square_CryptOpt.a",
        "rust_fiat_secp256k1_dettman_square_CryptOpt",
        true,   // NASM
        "secp256k1_dettman",
        "square",
        5,      // field size
        "0x1000003d10"  // loose bound
    );
}

fn build_rust_ec_secp256k1(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner.asm",
            "-o",
            "src/rust/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/rust_ec_secp256k1/llc/mul/librust_ec_secp256k1_mul_inner.a",
            "src/rust/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_nasm.asm",
            "-o",
            "src/rust/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/rust_ec_secp256k1/llc-nasm/mul/librust_ec_secp256k1_mul_inner_nasm.a",
            "src/rust/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/rust_ec_secp256k1/cryptopt/mul/seed0001746573386443_ratio09947.asm",
        "src/rust/rust_ec_secp256k1/cryptopt/mul/seed0001746573386443_ratio09947.o",
        "src/rust/rust_ec_secp256k1/cryptopt/mul/librust_ec_secp256k1_mul_inner_CryptOpt.a",
        "rust_ec_secp256k1_mul_inner_CryptOpt",
        true,   // NASM
        "rust_ec_secp256k1",
        "mul",
        4,      // field size
        "0xfffffffefffffc30"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square.asm",
            "-o",
            "src/rust/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/rust_ec_secp256k1/llc/square/librust_ec_secp256k1_square.a",
            "src/rust/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_nasm.asm",
            "-o",
            "src/rust/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust/rust_ec_secp256k1/llc-nasm/square/librust_ec_secp256k1_square_nasm.a",
            "src/rust/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/rust/rust_ec_secp256k1/cryptopt/square/seed0001746575048113_ratio08485.asm",
        "src/rust/rust_ec_secp256k1/cryptopt/square/seed0001746575048113_ratio08485.o",
        "src/rust/rust_ec_secp256k1/cryptopt/square/librust_ec_secp256k1_square_CryptOpt.a",
        "rust_ec_secp256k1_square_CryptOpt",
        true,   // NASM
        "rust_ec_secp256k1",
        "square",
        4,      // field size
        "0xfffffffefffffc30"  // loose bound
    );
    
}
// -------------------------------------------------------------------------
fn build_fiat_c_curve25519(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-curve25519/llc/mul/fiat_c_curve25519_carry_mul.asm",
            "-o",
            "src/c/fiat-curve25519/llc/mul/fiat_c_curve25519_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-curve25519/llc/mul/libfiat_c_curve25519_carry_mul.a",
            "src/c/fiat-curve25519/llc/mul/fiat_c_curve25519_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-curve25519/llc-nasm/mul/fiat_c_curve25519_carry_mul_nasm.asm",
            "-o",
                    "src/c/fiat-curve25519/llc-nasm/mul/fiat_c_curve25519_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-curve25519/llc-nasm/mul/libfiat_c_curve25519_carry_mul_nasm.a",
            "src/c/fiat-curve25519/llc-nasm/mul/fiat_c_curve25519_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-curve25519/cryptopt/mul/seed0001746577739851_ratio10864.asm",
        "src/c/fiat-curve25519/cryptopt/mul/seed0001746577739851_ratio10864.o",
        "src/c/fiat-curve25519/cryptopt/mul/libfiat_c_curve25519_carry_mul_CryptOpt.a",
        "fiat_c_curve25519_carry_mul_CryptOpt",
        true,   // NASM
        "curve25519",
        "mul",
        4,      // field size
        "0x18000000000000"  // loose bound
    );
    
    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-curve25519/llc/square/fiat_c_curve25519_carry_square.asm",
            "-o",
            "src/c/fiat-curve25519/llc/square/fiat_c_curve25519_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-curve25519/llc/square/libfiat_c_curve25519_carry_square.a",
            "src/c/fiat-curve25519/llc/square/fiat_c_curve25519_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-curve25519/llc-nasm/square/fiat_c_curve25519_carry_square_nasm.asm",
            "-o",
            "src/c/fiat-curve25519/llc-nasm/square/fiat_c_curve25519_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-curve25519/llc-nasm/square/libfiat_c_curve25519_carry_square_nasm.a",
            "src/c/fiat-curve25519/llc-nasm/square/fiat_c_curve25519_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-curve25519/cryptopt/square/seed0001746579192069_ratio11076.asm",
        "src/c/fiat-curve25519/cryptopt/square/seed0001746579192069_ratio11076.o",
        "src/c/fiat-curve25519/cryptopt/square/libfiat_c_curve25519_carry_square_CryptOpt.a",
        "fiat_c_curve25519_carry_square_CryptOpt",
        true,   // NASM
        "curve25519",
        "square",
        4,      // field size
        "0x18000000000000"  // loose bound
    );
    
    
}

fn build_fiat_c_secp256k1_dettman(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-secp256k1_dettman/llc/mul/fiat_c_secp256k1_dettman_mul.asm",
            "-o",
            "src/c/fiat-secp256k1_dettman/llc/mul/fiat_c_secp256k1_dettman_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-secp256k1_dettman/llc/mul/libfiat_c_secp256k1_dettman_mul.a",
            "src/c/fiat-secp256k1_dettman/llc/mul/fiat_c_secp256k1_dettman_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-secp256k1_dettman/llc-nasm/mul/fiat_c_secp256k1_dettman_mul_nasm.asm",
            "-o",
            "src/c/fiat-secp256k1_dettman/llc-nasm/mul/fiat_c_secp256k1_dettman_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-secp256k1_dettman/llc-nasm/mul/libfiat_c_secp256k1_dettman_mul_nasm.a",
            "src/c/fiat-secp256k1_dettman/llc-nasm/mul/fiat_c_secp256k1_dettman_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-secp256k1_dettman/cryptopt/mul/seed0001746590060287_ratio10115.asm",
        "src/c/fiat-secp256k1_dettman/cryptopt/mul/seed0001746590060287_ratio10115.o",
        "src/c/fiat-secp256k1_dettman/cryptopt/mul/libfiat_c_secp256k1_dettman_mul_CryptOpt.a",
        "fiat_c_secp256k1_dettman_mul_CryptOpt",
        true,   // NASM
        "secp256k1_dettman",
        "mul",
        5,      // field size
        "0x1000003d10"  // loose bound
    );

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-secp256k1_dettman/llc/square/fiat_c_secp256k1_dettman_square.asm",
            "-o",
            "src/c/fiat-secp256k1_dettman/llc/square/fiat_c_secp256k1_dettman_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-secp256k1_dettman/llc/square/libfiat_c_secp256k1_dettman_square.a",
            "src/c/fiat-secp256k1_dettman/llc/square/fiat_c_secp256k1_dettman_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-secp256k1_dettman/llc-nasm/square/fiat_c_secp256k1_dettman_square_nasm.asm",
            "-o",
            "src/c/fiat-secp256k1_dettman/llc-nasm/square/fiat_c_secp256k1_dettman_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-secp256k1_dettman/llc-nasm/square/libfiat_c_secp256k1_dettman_square_nasm.a",
            "src/c/fiat-secp256k1_dettman/llc-nasm/square/fiat_c_secp256k1_dettman_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-secp256k1_dettman/cryptopt/square/seed0001746606684641_ratio09956.asm",
        "src/c/fiat-secp256k1_dettman/cryptopt/square/seed0001746606684641_ratio09956.o",
        "src/c/fiat-secp256k1_dettman/cryptopt/square/libfiat_c_secp256k1_dettman_square_CryptOpt.a",
        "fiat_c_secp256k1_dettman_square_CryptOpt",
        true,   // NASM
        "secp256k1_dettman",
        "square",
        5,      // field size
        "0x1000003d10"  // loose bound
    );
    
}

fn build_fiat_c_poly1305(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-poly1305/llc/mul/fiat_c_poly1305_carry_mul.asm",
            "-o",
            "src/c/fiat-poly1305/llc/mul/fiat_c_poly1305_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-poly1305/llc/mul/libfiat_c_poly1305_carry_mul.a",
            "src/c/fiat-poly1305/llc/mul/fiat_c_poly1305_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-poly1305/llc-nasm/mul/fiat_c_poly1305_carry_mul_nasm.asm",
            "-o",
            "src/c/fiat-poly1305/llc-nasm/mul/fiat_c_poly1305_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-poly1305/llc-nasm/mul/libfiat_c_poly1305_carry_mul_nasm.a",
            "src/c/fiat-poly1305/llc-nasm/mul/fiat_c_poly1305_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-poly1305/cryptopt/mul/seed0001746580132789_ratio11021.asm",
        "src/c/fiat-poly1305/cryptopt/mul/seed0001746580132789_ratio11021.o",
        "src/c/fiat-poly1305/cryptopt/mul/libfiat_c_poly1305_carry_mul_CryptOpt.a",
        "fiat_c_poly1305_carry_mul_CryptOpt",
        true,   // NASM
        "poly1305",
        "mul",
        3,      // field size
        "0x300000000"  // loose bound
    );

    // ---------- SQUARE ---------- 
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-poly1305/llc/square/fiat_c_poly1305_carry_square.asm",
            "-o",
            "src/c/fiat-poly1305/llc/square/fiat_c_poly1305_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar") 
        .args(&[
            "rcs",
            "src/c/fiat-poly1305/llc/square/libfiat_c_poly1305_carry_square.a",
            "src/c/fiat-poly1305/llc/square/fiat_c_poly1305_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-poly1305/llc-nasm/square/fiat_c_poly1305_carry_square_nasm.asm",
            "-o",
            "src/c/fiat-poly1305/llc-nasm/square/fiat_c_poly1305_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-poly1305/llc-nasm/square/libfiat_c_poly1305_carry_square_nasm.a",
            "src/c/fiat-poly1305/llc-nasm/square/fiat_c_poly1305_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-poly1305/cryptopt/square/seed0001746589560845_ratio11265.asm",
        "src/c/fiat-poly1305/cryptopt/square/seed0001746589560845_ratio11265.o",
        "src/c/fiat-poly1305/cryptopt/square/libfiat_c_poly1305_carry_square_CryptOpt.a",
        "fiat_c_poly1305_carry_square_CryptOpt",
        true,   // NASM
        "poly1305",
        "square",
        3,      // field size
        "0x300000000"  // loose bound
    );
}

fn build_fiat_c_p448(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-p448/llc/mul/fiat_c_p448_solinas_carry_mul.asm",
            "-o",
            "src/c/fiat-p448/llc/mul/fiat_c_p448_solinas_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-p448/llc/mul/libfiat_c_p448_solinas_carry_mul.a",
            "src/c/fiat-p448/llc/mul/fiat_c_p448_solinas_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-p448/llc-nasm/mul/fiat_c_p448_solinas_carry_mul_nasm.asm",
            "-o",
            "src/c/fiat-p448/llc-nasm/mul/fiat_c_p448_solinas_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-p448/llc-nasm/mul/libfiat_c_p448_solinas_carry_mul_nasm.a",
            "src/c/fiat-p448/llc-nasm/mul/fiat_c_p448_solinas_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    build_and_validate_with_formal!(
        "src/c/fiat-p448/cryptopt/mul/seed0001746593034063_ratio09458.asm",
        "src/c/fiat-p448/cryptopt/mul/seed0001746593034063_ratio09458.o",
        "src/c/fiat-p448/cryptopt/mul/libfiat_c_p448_carry_mul_CryptOpt.a",
        "fiat_c_p448_carry_mul_CryptOpt",
        true,   // NASM
        "p448",
        "mul",
        8,      // field size
        "0x300000000000000"  // loose bound
    );
    
    // Square
    // LLC version (square) 
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/fiat-p448/llc/square/fiat_c_p448_solinas_carry_square.asm",
            "-o",
            "src/c/fiat-p448/llc/square/fiat_c_p448_solinas_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());
    
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-p448/llc/square/libfiat_c_p448_solinas_carry_square.a",
            "src/c/fiat-p448/llc/square/fiat_c_p448_solinas_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());
    
    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/fiat-p448/llc-nasm/square/fiat_c_p448_solinas_carry_square_nasm.asm",
            "-o",
            "src/c/fiat-p448/llc-nasm/square/fiat_c_p448_solinas_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/fiat-p448/llc-nasm/square/libfiat_c_p448_solinas_carry_square_nasm.a",
            "src/c/fiat-p448/llc-nasm/square/fiat_c_p448_solinas_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
        
    // // CryptOpt version (square)
    build_and_validate_with_formal!(
        "src/c/fiat-p448/cryptopt/square/seed0001745398667315_ratio10358.asm",
        "src/c/fiat-p448/cryptopt/square/seed0001745398667315_ratio10358.o",
        "src/c/fiat-p448/cryptopt/square/libfiat_c_p448_solinas_carry_square_CryptOpt.a",
        "fiat_c_p448_solinas_carry_square_CryptOpt",
        true,   // NASM
        "p448",
        "square",
        8,      // field size
        "0x300000000000000"  // loose bound
    );

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/fiat-p448/cryptopt/square/seed0001746659360708_ratio10853.asm",
        "src/c/fiat-p448/cryptopt/square/seed0001746659360708_ratio10853.o",
        "src/c/fiat-p448/cryptopt/square/libfiat_c_p448_carry_square_CryptOpt.a",
        "fiat_c_p448_carry_square_CryptOpt",
        true,   // NASM
        "p448",
        "square",
        8,      // field size
        "0x300000000000000"  // loose bound
    );
}   

fn build_openssl_p448(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/openssl-p448/llc/mul/openssl_p448_mul_ssa.asm",
            "-o",
            "src/c/openssl-p448/llc/mul/openssl_p448_mul_ssa.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/llc/mul/libopenssl_p448_mul.a",
            "src/c/openssl-p448/llc/mul/openssl_p448_mul_ssa.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-p448/llc-nasm/mul/openssl_p448_mul_ssa_nasm.asm",
            "-o",
            "src/c/openssl-p448/llc-nasm/mul/openssl_p448_mul_ssa_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/llc-nasm/mul/libopenssl_p448_mul_nasm.a",
            "src/c/openssl-p448/llc-nasm/mul/openssl_p448_mul_ssa_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-p448/cryptopt/mul/seed0001754016023536_ratio11739.asm",
            "-o",
            "src/c/openssl-p448/cryptopt/mul/seed0001754016023536_ratio11739.o"
        ])
        .status()
        .unwrap()
        .success());
    
    // Dudect validation for CryptOpt mul
    let dudect_validation_mul = AssemblyValidation {
        asm_file: "src/c/openssl-p448/cryptopt/mul/seed0001754016023536_ratio11739.asm".to_string(),
        function_name: "openssl_p448_mul".to_string(),  // Use the actual function name from the assembly
        curve_name: "openssl_p448".to_string(),
        operation: "mul".to_string(),
        field_size: 8,
        loose_bound: "0x300000000000000".to_string(),
    };
    let dudect_config = DudectConfig::default();
    validate_assembly_constant_time(&dudect_validation_mul, &dudect_config);
    
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-p448/cryptopt/mul/wrapper.asm",
            "-o",
            "src/c/openssl-p448/cryptopt/mul/wrapper.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/cryptopt/mul/libopenssl_p448_mul_CryptOpt.a",
            "src/c/openssl-p448/cryptopt/mul/seed0001754016023536_ratio11739.o",
            "src/c/openssl-p448/cryptopt/mul/wrapper.o"
        ])
        .status()
        .unwrap()
        .success());

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/openssl-p448/llc/square/openssl_p448_square_ssa.asm",
            "-o",
            "src/c/openssl-p448/llc/square/openssl_p448_square_ssa.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/llc/square/libopenssl_p448_square.a",
            "src/c/openssl-p448/llc/square/openssl_p448_square_ssa.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-p448/llc-nasm/square/openssl_p448_square_ssa_nasm.asm",
            "-o",
            "src/c/openssl-p448/llc-nasm/square/openssl_p448_square_ssa_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/llc-nasm/square/libopenssl_p448_square_nasm.a",
            "src/c/openssl-p448/llc-nasm/square/openssl_p448_square_ssa_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-p448/cryptopt/square/seed0001754025746283_ratio11326.asm",
            "-o",
            "src/c/openssl-p448/cryptopt/square/seed0001754025746283_ratio11326.o"
        ])
        .status()
        .unwrap()
        .success());
    
    // Dudect validation for CryptOpt square
    let dudect_validation_square = AssemblyValidation {
        asm_file: "src/c/openssl-p448/cryptopt/square/seed0001754025746283_ratio11326.asm".to_string(),
        function_name: "openssl_p448_square".to_string(),  // Use the actual function name from the assembly
        curve_name: "openssl_p448".to_string(),
        operation: "square".to_string(),
        field_size: 8,
        loose_bound: "0x300000000000000".to_string(),
    };
    let dudect_config = DudectConfig::default();
    validate_assembly_constant_time(&dudect_validation_square, &dudect_config);
    
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-p448/cryptopt/square/wrapper.asm",
            "-o",
            "src/c/openssl-p448/cryptopt/square/wrapper.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-p448/cryptopt/square/libopenssl_p448_square_CryptOpt.a",
            "src/c/openssl-p448/cryptopt/square/seed0001754025746283_ratio11326.o",
            "src/c/openssl-p448/cryptopt/square/wrapper.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn build_openssl_curve25519(){
    // ---------- MUL ----------
    // Hand-optimised mul & square generated from upstream OpenSSL perl
    {
        let perl_script = "src/c/openssl-curve25519/hand-optimised/original_x86_64.pl";
        let xlate_script = "src/c/openssl-curve25519/hand-optimised/x86_64-xlate.pl";
        assert!(std::path::Path::new(xlate_script).exists(),
            "Missing {}, fetch it from OpenSSL's crypto/perlasm/", xlate_script);

        fs::create_dir_all("target").unwrap();
        let generated = "target/openssl_x25519_fe51.asm";
        assert!(Command::new("perl")
            .args(&[perl_script, "gas"])
            .stdout(File::create(generated).unwrap())
            .status().unwrap().success());

        let final_asm = "target/openssl_x25519_with_alias.asm";
        {
            let mut out = File::create(final_asm).unwrap();
            writeln!(out,
                ".globl open_ssl_curve25519_hand_optmised_fe51_mul\n.set open_ssl_curve25519_hand_optmised_fe51_mul,x25519_fe51_mul").unwrap();
            writeln!(out,
                ".globl open_ssl_curve25519_hand_optmised_fe51_square\n.set open_ssl_curve25519_hand_optmised_fe51_square,x25519_fe51_sqr").unwrap();
            out.write_all(&fs::read(generated).unwrap()).unwrap();
        }

        let obj = "target/openssl_x25519_hand_opt.o";
        assert!(Command::new("clang")
            .args(&["-c", final_asm, "-o", obj])
            .status().unwrap().success());

        fs::create_dir_all("src/c/openssl-curve25519/hand-optimised/mul").unwrap();
        fs::create_dir_all("src/c/openssl-curve25519/hand-optimised/square").unwrap();
        assert!(Command::new("ar")
            .args(&["rcs", "src/c/openssl-curve25519/hand-optimised/mul/libopenssl_curve25519_fe51_mul_hand_optimised.a", obj])
            .status().unwrap().success());
        assert!(Command::new("ar")
            .args(&["rcs", "src/c/openssl-curve25519/hand-optimised/square/libopenssl_curve25519_fe51_square_hand_optimised.a", obj])
            .status().unwrap().success());
    }

    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/openssl-curve25519/llc/mul/open_ssl_curve25519_fe51_mul_ssa.asm",
            "-o",
            "src/c/openssl-curve25519/llc/mul/open_ssl_curve25519_fe51_mul_ssa.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/llc/mul/libopenssl_curve25519_fe51_mul.a",
            "src/c/openssl-curve25519/llc/mul/open_ssl_curve25519_fe51_mul_ssa.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-curve25519/llc-nasm/mul/open_ssl_curve25519_fe51_mul_ssa_nasm.asm",
            "-o",
            "src/c/openssl-curve25519/llc-nasm/mul/open_ssl_curve25519_fe51_mul_ssa_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/llc-nasm/mul/libopenssl_curve25519_fe51_mul_nasm.a",
            "src/c/openssl-curve25519/llc-nasm/mul/open_ssl_curve25519_fe51_mul_ssa_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // Hand-optimised NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-curve25519/hand-optimised-nasm/mul/hand_optimised_x86_64_mul_nasm.asm",
            "-o",
            "src/c/openssl-curve25519/hand-optimised-nasm/mul/hand_optimised_x86_64_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/hand-optimised-nasm/mul/libopenssl_curve25519_fe51_mul_hand_optimised_nasm.a",
            "src/c/openssl-curve25519/hand-optimised-nasm/mul/hand_optimised_x86_64_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    build_and_validate_with_formal!(
        "src/c/openssl-curve25519/cryptopt/mul/seed0001751441780944_ratio11932.asm",
        "src/c/openssl-curve25519/cryptopt/mul/seed0001751441780944_ratio11932.o",
        "src/c/openssl-curve25519/cryptopt/mul/libopenssl_curve25519_fe51_mul_CryptOpt.a",
        "open_ssl_curve25519_fe51_mul_CryptOpt",
        true,   // NASM
        "curve25519",
        "mul",
        4,      // field size
        "0x18000000000000"  // loose bound
    );

    // ---------- SQUARE ----------
    // Hand-optimised square handled in the generated block above.

    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/c/openssl-curve25519/llc/square/open_ssl_curve25519_fe51_square_ssa.asm",
            "-o",
            "src/c/openssl-curve25519/llc/square/open_ssl_curve25519_fe51_square_ssa.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/llc/square/libopenssl_curve25519_fe51_square.a",
            "src/c/openssl-curve25519/llc/square/open_ssl_curve25519_fe51_square_ssa.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-curve25519/llc-nasm/square/open_ssl_curve25519_fe51_square_ssa_nasm.asm",
            "-o",
            "src/c/openssl-curve25519/llc-nasm/square/open_ssl_curve25519_fe51_square_ssa_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/llc-nasm/square/libopenssl_curve25519_fe51_square_nasm.a",
            "src/c/openssl-curve25519/llc-nasm/square/open_ssl_curve25519_fe51_square_ssa_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // Hand-optimised NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/c/openssl-curve25519/hand-optimised-nasm/square/hand_optimised_x86_64_square_nasm.asm",
            "-o",
            "src/c/openssl-curve25519/hand-optimised-nasm/square/hand_optimised_x86_64_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/c/openssl-curve25519/hand-optimised-nasm/square/libopenssl_curve25519_fe51_square_hand_optimised_nasm.a",
            "src/c/openssl-curve25519/hand-optimised-nasm/square/hand_optimised_x86_64_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square) CryptOpt paper parameters
    build_and_validate_with_formal!(
        "src/c/openssl-curve25519/cryptopt/square/seed0001751442665031_ratio11816.asm",
        "src/c/openssl-curve25519/cryptopt/square/seed0001751442665031_ratio11816.o",
        "src/c/openssl-curve25519/cryptopt/square/libopenssl_curve25519_fe51_square_CryptOpt.a",
        "open_ssl_curve25519_fe51_square_CryptOpt",
        true,   // NASM
        "curve25519",
        "square",
        4,      // field size
        "0x18000000000000"  // loose bound
    );
}

fn main() {
    // Print validation header if enabled
    print_validation_header();
    
    // Build all curves (both mul and square, if available)
    build_curve25519();
    build_p448();
    build_poly1305();
    build_bls12();
    build_secp256k1_dettman();
    build_curve25519_dalek();
    build_rust_ec_secp256k1();
    build_fiat_c_curve25519();
    build_fiat_c_secp256k1_dettman();
    build_fiat_c_poly1305();
    build_fiat_c_p448();
    build_openssl_curve25519();
    build_openssl_p448();
    // -------------------------------------------------------------------------
    // Add link-search paths for all curves and both operations

    // Curve25519
    println!("cargo:rustc-link-search=native=src/rust/curve25519/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519/cryptopt/square");

    // Curve25519-dalek
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/curve25519-dalek/cryptopt/square");

    // P448 (only mul)
    println!("cargo:rustc-link-search=native=src/rust/p448/llc");
    println!("cargo:rustc-link-search=native=src/rust/p448/llc-nasm");
    println!("cargo:rustc-link-search=native=src/rust/p448/cryptopt");

    // Poly1305
    println!("cargo:rustc-link-search=native=src/rust/poly1305/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/poly1305/cryptopt/square");

    // BLS12
    println!("cargo:rustc-link-search=native=src/rust/bls12/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/bls12/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/bls12/cryptopt/mul");

    // Secp256k1 Dettman
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/secp256k1_dettman/cryptopt/square");

    // Rust EC Secp256k1
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/llc/square");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust/rust_ec_secp256k1/cryptopt/square");


    // Fiat C Curve25519
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/llc/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-curve25519/cryptopt/square");

    // Fiat C Secp256k1 Dettman
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/llc/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-secp256k1_dettman/cryptopt/square");

    // Fiat C Poly1305
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/llc/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-poly1305/cryptopt/square");

    // Fiat C P448
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/llc/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/fiat-p448/cryptopt/square");

    // OpenSSL Curve25519
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/hand-optimised/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/hand-optimised-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/llc/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/hand-optimised/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/hand-optimised-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-curve25519/cryptopt/square");

    // OpenSSL P448
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/llc/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/llc/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/c/openssl-p448/cryptopt/square");


    // -------------------------------------------------------------------------
    // Link libraries for mul and square versions

    // Curve25519 (mul)
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul");
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_mul_CryptOpt");
    // Curve25519 (square)
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_square");
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_square_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_curve25519_carry_square_CryptOpt");

    // Curve25519-dalek (mul)
    println!("cargo:rustc-link-lib=static=curve25519_dalek_mul");
    println!("cargo:rustc-link-lib=static=curve25519_dalek_mul_nasm");
    println!("cargo:rustc-link-lib=static=curve25519_dalek_mul_CryptOpt");
    // Curve25519-dalek (square)
    println!("cargo:rustc-link-lib=static=curve25519_dalek_square");
    println!("cargo:rustc-link-lib=static=curve25519_dalek_square_nasm");
    println!("cargo:rustc-link-lib=static=curve25519_dalek_square_CryptOpt");

    // P448 (mul only)
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul");
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_p448_solinas_carry_mul_CryptOpt");

    // Poly1305 (mul)
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul");
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_mul_CryptOpt");
    // Poly1305 (square)
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_square");
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_square_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_poly1305_carry_square_CryptOpt");

    // BLS12 (mul)
    println!("cargo:rustc-link-lib=static=bls12_mul");
    println!("cargo:rustc-link-lib=static=bls12_mul_nasm");
    println!("cargo:rustc-link-lib=static=bls12_mul_CryptOpt");

    // Secp256k1 Dettman (mul)
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul");
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_mul_CryptOpt");

    // Secp256k1 Dettman (square)
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_square");
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_square_nasm");
    println!("cargo:rustc-link-lib=static=rust_fiat_secp256k1_dettman_square_CryptOpt");

    // Rust EC Secp256k1 (mul)
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_mul_inner");
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_mul_inner_nasm");
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_mul_inner_CryptOpt");

    // Rust EC Secp256k1 (square)
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_square");
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_square_nasm");
    println!("cargo:rustc-link-lib=static=rust_ec_secp256k1_square_CryptOpt");

    // Fiat C Curve25519 (mul)
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_mul");
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_mul_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_mul_CryptOpt");

    // Fiat C Curve25519 (square)
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_square");
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_square_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_curve25519_carry_square_CryptOpt");

    // Fiat C Secp256k1 Dettman (mul)
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_mul");
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_mul_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_mul_CryptOpt");

    // Fiat C Secp256k1 Dettman (square)
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_square");
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_square_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_secp256k1_dettman_square_CryptOpt");

    // Fiat C Poly1305 (mul)
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_mul");
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_mul_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_mul_CryptOpt");

    // Fiat C Poly1305 (square)
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_square");
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_square_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_poly1305_carry_square_CryptOpt");

    // Fiat C P448 (mul)
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_mul");
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_mul_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_p448_carry_mul_CryptOpt");

    // Fiat C P448 (square)
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_square");
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_square_nasm");
    println!("cargo:rustc-link-lib=static=fiat_c_p448_solinas_carry_square_CryptOpt");

    // OpenSSL Curve25519 (mul)
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_nasm");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_hand_optimised");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_hand_optimised_nasm");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_mul_CryptOpt");

    // OpenSSL Curve25519 (square)
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_nasm");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_hand_optimised");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_hand_optimised_nasm");
    println!("cargo:rustc-link-lib=static=openssl_curve25519_fe51_square_CryptOpt");

    // OpenSSL P448 (mul)
    println!("cargo:rustc-link-lib=static=openssl_p448_mul");
    println!("cargo:rustc-link-lib=static=openssl_p448_mul_nasm");
    println!("cargo:rustc-link-lib=static=openssl_p448_mul_CryptOpt");

    // OpenSSL P448 (square)
    println!("cargo:rustc-link-lib=static=openssl_p448_square");
    println!("cargo:rustc-link-lib=static=openssl_p448_square_nasm");
    println!("cargo:rustc-link-lib=static=openssl_p448_square_CryptOpt");

    // -------------------------------------------------------------------------
    // Re-run build.rs if any assembly files change
    println!("cargo:rerun-if-changed=src/rust/curve25519"); 
    println!("cargo:rerun-if-changed=src/rust/curve25519-dalek");
    println!("cargo:rerun-if-changed=src/rust/p448");
    println!("cargo:rerun-if-changed=src/rust/poly1305");
    println!("cargo:rerun-if-changed=src/rust/bls12");
    println!("cargo:rerun-if-changed=src/rust/secp256k1_dettman");
    println!("cargo:rerun-if-changed=src/rust/rust_ec_secp256k1");
    println!("cargo:rerun-if-changed=src/c/fiat-curve25519");
    println!("cargo:rerun-if-changed=src/c/fiat-secp256k1_dettman");
    println!("cargo:rerun-if-changed=src/c/fiat-poly1305");
    println!("cargo:rerun-if-changed=src/c/fiat-p448");
    println!("cargo:rerun-if-changed=src/c/openssl-curve25519");
    println!("cargo:rerun-if-changed=src/c/openssl-p448");
    
    // Run BINSEC verification on all CryptOpt implementations if enabled
    let binsec_config = BinsecConfig::default();
    if binsec_config.enabled {
        if !run_binsec_verification(&binsec_config) {
            // Build failed due to verification errors
            panic!("BINSEC verification failed!");
        }
    }
}