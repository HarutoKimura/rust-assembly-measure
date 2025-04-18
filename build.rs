use std::process::Command;

// -----------------------------------------------------------------------------
// Build functions for each curve

fn build_curve25519() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/curve25519/llc/mul/rust_fiat_curve25519_carry_mul.asm",
            "-o",
            "src/curve25519/llc/mul/rust_fiat_curve25519_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519/llc/mul/librust_fiat_curve25519_carry_mul.a",
            "src/curve25519/llc/mul/rust_fiat_curve25519_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/curve25519/llc-nasm/mul/rust_fiat_curve25519_carry_mul_nasm.asm",
            "-o",
            "src/curve25519/llc-nasm/mul/rust_fiat_curve25519_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519/llc-nasm/mul/librust_fiat_curve25519_carry_mul_nasm.a",
            "src/curve25519/llc-nasm/mul/rust_fiat_curve25519_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/curve25519/cryptopt/mul/seed0001737611849360_ratio11667.asm",
            "-o",
            "src/curve25519/cryptopt/mul/seed0001737611849360_ratio11667.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519/cryptopt/mul/librust_fiat_curve25519_carry_mul_CryptOpt.a",
            "src/curve25519/cryptopt/mul/seed0001737611849360_ratio11667.o"
        ])
        .status()
        .unwrap()
        .success());

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/curve25519/llc/square/rust_fiat_curve25519_carry_square.asm",
            "-o",
            "src/curve25519/llc/square/rust_fiat_curve25519_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519/llc/square/librust_fiat_curve25519_carry_square.a",
            "src/curve25519/llc/square/rust_fiat_curve25519_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_nasm.asm",
            "-o",
            "src/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519/llc-nasm/square/librust_fiat_curve25519_carry_square_nasm.a",
            "src/curve25519/llc-nasm/square/rust_fiat_curve25519_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/curve25519/cryptopt/square/seed4209879438348476_ratio12581.asm",
            "-o",
            "src/curve25519/cryptopt/square/seed4209879438348476_ratio12581.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519/cryptopt/square/librust_fiat_curve25519_carry_square_CryptOpt.a",
            "src/curve25519/cryptopt/square/seed4209879438348476_ratio12581.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn build_curve25519_dalek() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/curve25519-dalek/llc/mul/curve25519_dalek_mul.asm",
            "-o",
            "src/curve25519-dalek/llc/mul/curve25519_dalek_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519-dalek/llc/mul/libcurve25519_dalek_mul.a",
            "src/curve25519-dalek/llc/mul/curve25519_dalek_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_nasm.asm",
            "-o",
            "src/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519-dalek/llc-nasm/mul/libcurve25519_dalek_mul_nasm.a",
            "src/curve25519-dalek/llc-nasm/mul/curve25519_dalek_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/curve25519-dalek/cryptopt/mul/seed0001744084140826_ratio12380.asm",
            "-o",
            "src/curve25519-dalek/cryptopt/mul/seed0001744084140826_ratio12380.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519-dalek/cryptopt/mul/libcurve25519_dalek_mul_CryptOpt.a",
            "src/curve25519-dalek/cryptopt/mul/seed0001744084140826_ratio12380.o"
        ])
        .status()
        .unwrap()
        .success());

    // ---------- SQUARE ----------
    // LLC version (square) - Assuming file exists
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/curve25519-dalek/llc/square/curve25519_dalek_square.asm", // Assumed path
            "-o",
            "src/curve25519-dalek/llc/square/curve25519_dalek_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519-dalek/llc/square/libcurve25519_dalek_square.a",
            "src/curve25519-dalek/llc/square/curve25519_dalek_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_nasm.asm",
            "-o",
            "src/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519-dalek/llc-nasm/square/libcurve25519_dalek_square_nasm.a",
            "src/curve25519-dalek/llc-nasm/square/curve25519_dalek_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/curve25519-dalek/cryptopt/square/seed0001744701020405_ratio09946.asm",
            "-o",
            "src/curve25519-dalek/cryptopt/square/seed0001744701020405_ratio09946.o"
        ])
        .status()
        .unwrap()
        .success());

    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/curve25519-dalek/cryptopt/square/libcurve25519_dalek_square_CryptOpt.a",
            "src/curve25519-dalek/cryptopt/square/seed0001744701020405_ratio09946.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn build_p448() {
    // (Only MUL is supported for p448 as per current structure)
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/p448/llc/rust_fiat_p448_solinas_carry_mul.asm",
            "-o",
            "src/p448/llc/rust_fiat_p448_solinas_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/p448/llc/librust_fiat_p448_solinas_carry_mul.a",
            "src/p448/llc/rust_fiat_p448_solinas_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.asm",
            "-o",
            "src/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/p448/llc-nasm/librust_fiat_p448_solinas_carry_mul_nasm.a",
            "src/p448/llc-nasm/rust_fiat_p448_solinas_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/p448/cryptopt/seed0001731544914221_ratio15039.asm",
            "-o",
            "src/p448/cryptopt/seed0001731544914221_ratio15039.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/p448/cryptopt/librust_fiat_p448_solinas_carry_mul_CryptOpt.a",
            "src/p448/cryptopt/seed0001731544914221_ratio15039.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn build_poly1305() {
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/poly1305/llc/mul/rust_fiat_poly1305_carry_mul.asm",
            "-o",
            "src/poly1305/llc/mul/rust_fiat_poly1305_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/poly1305/llc/mul/librust_fiat_poly1305_carry_mul.a",
            "src/poly1305/llc/mul/rust_fiat_poly1305_carry_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_nasm.asm",
            "-o",
            "src/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/poly1305/llc-nasm/mul/librust_fiat_poly1305_carry_mul_nasm.a",
            "src/poly1305/llc-nasm/mul/rust_fiat_poly1305_carry_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/poly1305/cryptopt/mul/seed0001731558041395_ratio13486.asm",
            "-o",
            "src/poly1305/cryptopt/mul/seed0001731558041395_ratio13486.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/poly1305/cryptopt/mul/librust_fiat_poly1305_carry_mul_CryptOpt.a",
            "src/poly1305/cryptopt/mul/seed0001731558041395_ratio13486.o"
        ])
        .status()
        .unwrap()
        .success());

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/poly1305/llc/square/rust_fiat_poly1305_carry_square.asm",
            "-o",
            "src/poly1305/llc/square/rust_fiat_poly1305_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/poly1305/llc/square/librust_fiat_poly1305_carry_square.a",
            "src/poly1305/llc/square/rust_fiat_poly1305_carry_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_nasm.asm",
            "-o",
            "src/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/poly1305/llc-nasm/square/librust_fiat_poly1305_carry_square_nasm.a",
            "src/poly1305/llc-nasm/square/rust_fiat_poly1305_carry_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/poly1305/cryptopt/square/seed3303075825488113_ratio14162.asm",
            "-o",
            "src/poly1305/cryptopt/square/seed3303075825488113_ratio14162.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/poly1305/cryptopt/square/librust_fiat_poly1305_carry_square_CryptOpt.a",
            "src/poly1305/cryptopt/square/seed3303075825488113_ratio14162.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn build_bls12(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/bls12/llc/mul/bls12_mul.asm",
            "-o",
            "src/bls12/llc/mul/bls12_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/bls12/llc/mul/libbls12_mul.a",
            "src/bls12/llc/mul/bls12_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/bls12/llc-nasm/mul/bls12_mul_nasm.asm",
            "-o",
            "src/bls12/llc-nasm/mul/bls12_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/bls12/llc-nasm/mul/libbls12_mul_nasm.a",
            "src/bls12/llc-nasm/mul/bls12_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/bls12/cryptopt/mul/seed0001727835929832_ratio11238.asm",
            "-o",
            "src/bls12/cryptopt/mul/seed0001727835929832_ratio11238.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/bls12/cryptopt/mul/libbls12_mul_CryptOpt.a",
            "src/bls12/cryptopt/mul/seed0001727835929832_ratio11238.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn build_secp256k1_dettman(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul.asm",
            "-o",
            "src/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/secp256k1_dettman/llc/mul/librust_fiat_secp256k1_dettman_mul.a",
            "src/secp256k1_dettman/llc/mul/rust_fiat_secp256k1_dettman_mul.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_nasm.asm",
            "-o",
            "src/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/secp256k1_dettman/llc-nasm/mul/librust_fiat_secp256k1_dettman_mul_nasm.a",
            "src/secp256k1_dettman/llc-nasm/mul/rust_fiat_secp256k1_dettman_mul_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/secp256k1_dettman/cryptopt/mul/seed3823874498784910_ratio10849.asm",
            "-o",
            "src/secp256k1_dettman/cryptopt/mul/seed3823874498784910_ratio10849.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/secp256k1_dettman/cryptopt/mul/librust_fiat_secp256k1_dettman_mul_CryptOpt.a",
            "src/secp256k1_dettman/cryptopt/mul/seed3823874498784910_ratio10849.o"
        ])
        .status()
        .unwrap()
        .success());

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square.asm",
            "-o",
            "src/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/secp256k1_dettman/llc/square/librust_fiat_secp256k1_dettman_square.a",
            "src/secp256k1_dettman/llc/square/rust_fiat_secp256k1_dettman_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_nasm.asm",
            "-o",
            "src/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/secp256k1_dettman/llc-nasm/square/librust_fiat_secp256k1_dettman_square_nasm.a",
            "src/secp256k1_dettman/llc-nasm/square/rust_fiat_secp256k1_dettman_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/secp256k1_dettman/cryptopt/square/seed0001742540934006_ratio09462.asm",
            "-o",
            "src/secp256k1_dettman/cryptopt/square/seed0001742540934006_ratio09462.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/secp256k1_dettman/cryptopt/square/librust_fiat_secp256k1_dettman_square_CryptOpt.a",
            "src/secp256k1_dettman/cryptopt/square/seed0001742540934006_ratio09462.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn build_rust_ec_secp256k1(){
    // ---------- MUL ----------
    // LLC version (mul)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner.asm",
            "-o",
            "src/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust_ec_secp256k1/llc/mul/librust_ec_secp256k1_mul_inner.a",
            "src/rust_ec_secp256k1/llc/mul/rust_ec_secp256k1_mul_inner.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_nasm.asm",
            "-o",
            "src/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust_ec_secp256k1/llc-nasm/mul/librust_ec_secp256k1_mul_inner_nasm.a",
            "src/rust_ec_secp256k1/llc-nasm/mul/rust_ec_secp256k1_mul_inner_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (mul)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust_ec_secp256k1/cryptopt/mul/seed0001744091596612_ratio10493.asm",
            "-o",
            "src/rust_ec_secp256k1/cryptopt/mul/seed0001744091596612_ratio10493.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust_ec_secp256k1/cryptopt/mul/librust_ec_secp256k1_mul_inner_CryptOpt.a",
            "src/rust_ec_secp256k1/cryptopt/mul/seed0001744091596612_ratio10493.o"
        ])
        .status()
        .unwrap()
        .success());

    // ---------- SQUARE ----------
    // LLC version (square)
    assert!(Command::new("clang")
        .args(&[
            "-c",
            "src/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square.asm",
            "-o",
            "src/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust_ec_secp256k1/llc/square/librust_ec_secp256k1_square.a",
            "src/rust_ec_secp256k1/llc/square/rust_ec_secp256k1_square.o"
        ])
        .status()
        .unwrap()
        .success());

    // NASM version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_nasm.asm",
            "-o",
            "src/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust_ec_secp256k1/llc-nasm/square/librust_ec_secp256k1_square_nasm.a",
            "src/rust_ec_secp256k1/llc-nasm/square/rust_ec_secp256k1_square_nasm.o"
        ])
        .status()
        .unwrap()
        .success());

    // CryptOpt version (square)
    assert!(Command::new("nasm")
        .args(&[
            "-f", "elf64",
            "src/rust_ec_secp256k1/cryptopt/square/seed0001744939348890_ratio08357.asm",
            "-o",
            "src/rust_ec_secp256k1/cryptopt/square/seed0001744939348890_ratio08357.o"
        ])
        .status()
        .unwrap()
        .success());
    assert!(Command::new("ar")
        .args(&[
            "rcs",
            "src/rust_ec_secp256k1/cryptopt/square/librust_ec_secp256k1_square_CryptOpt.a",
            "src/rust_ec_secp256k1/cryptopt/square/seed0001744939348890_ratio08357.o"
        ])
        .status()
        .unwrap()
        .success());
}

fn main() {
    // Build all curves (both mul and square, if available)
    build_curve25519();
    build_p448();
    build_poly1305();
    build_bls12();
    build_secp256k1_dettman();
    build_curve25519_dalek();
    build_rust_ec_secp256k1();

    // -------------------------------------------------------------------------
    // Add link-search paths for all curves and both operations

    // Curve25519
    println!("cargo:rustc-link-search=native=src/curve25519/llc/mul");
    println!("cargo:rustc-link-search=native=src/curve25519/llc/square");
    println!("cargo:rustc-link-search=native=src/curve25519/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/curve25519/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/curve25519/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/curve25519/cryptopt/square");

    // Curve25519-dalek
    println!("cargo:rustc-link-search=native=src/curve25519-dalek/llc/mul");
    println!("cargo:rustc-link-search=native=src/curve25519-dalek/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/curve25519-dalek/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/curve25519-dalek/llc/square");
    println!("cargo:rustc-link-search=native=src/curve25519-dalek/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/curve25519-dalek/cryptopt/square");

    // P448 (only mul)
    println!("cargo:rustc-link-search=native=src/p448/llc");
    println!("cargo:rustc-link-search=native=src/p448/llc-nasm");
    println!("cargo:rustc-link-search=native=src/p448/cryptopt");

    // Poly1305
    println!("cargo:rustc-link-search=native=src/poly1305/llc/mul");
    println!("cargo:rustc-link-search=native=src/poly1305/llc/square");
    println!("cargo:rustc-link-search=native=src/poly1305/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/poly1305/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/poly1305/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/poly1305/cryptopt/square");

    // BLS12
    println!("cargo:rustc-link-search=native=src/bls12/llc/mul");
    println!("cargo:rustc-link-search=native=src/bls12/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/bls12/cryptopt/mul");

    // Secp256k1 Dettman
    println!("cargo:rustc-link-search=native=src/secp256k1_dettman/llc/mul");
    println!("cargo:rustc-link-search=native=src/secp256k1_dettman/llc/square");
    println!("cargo:rustc-link-search=native=src/secp256k1_dettman/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/secp256k1_dettman/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/secp256k1_dettman/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/secp256k1_dettman/cryptopt/square");

    // Rust EC Secp256k1
    println!("cargo:rustc-link-search=native=src/rust_ec_secp256k1/llc/mul");
    println!("cargo:rustc-link-search=native=src/rust_ec_secp256k1/llc-nasm/mul");
    println!("cargo:rustc-link-search=native=src/rust_ec_secp256k1/cryptopt/mul");
    println!("cargo:rustc-link-search=native=src/rust_ec_secp256k1/llc/square");
    println!("cargo:rustc-link-search=native=src/rust_ec_secp256k1/llc-nasm/square");
    println!("cargo:rustc-link-search=native=src/rust_ec_secp256k1/cryptopt/square");


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

    // -------------------------------------------------------------------------
    // Re-run build.rs if any assembly files change
    println!("cargo:rerun-if-changed=src/curve25519");
    println!("cargo:rerun-if-changed=src/curve25519-dalek");
    println!("cargo:rerun-if-changed=src/p448");
    println!("cargo:rerun-if-changed=src/poly1305");
    println!("cargo:rerun-if-changed=src/bls12");
    println!("cargo:rerun-if-changed=src/secp256k1_dettman");
    println!("cargo:rerun-if-changed=src/rust_ec_secp256k1");
}