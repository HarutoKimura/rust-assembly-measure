use rand::Rng;
use rand::thread_rng;
use core::arch::x86_64::{_rdtsc, _mm_mfence};
use std::env;

// Import the new precise timing module
mod precise_timing;
use precise_timing::*;

// Import CryptOpt-style timing module (removed; not used)

// -----------------------------------------------------------------------------
// Modules for the curves with external function declarations.
// (These signatures should match actual FFI declarations.)
mod curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_curve25519_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_curve25519_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_curve25519_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn rust_fiat_curve25519_carry_square(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_curve25519_carry_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_curve25519_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);

    }
}

mod curve25519_dalek {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        // Multiply functions
        pub fn curve25519_dalek_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn curve25519_dalek_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn curve25519_dalek_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn curve25519_dalek_square(arg0: *mut u64, arg1: *const u64);
        pub fn curve25519_dalek_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn curve25519_dalek_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_p448_solinas_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_p448_solinas_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_p448_solinas_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn rust_fiat_p448_solinas_carry_square(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_p448_solinas_carry_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_p448_solinas_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod fiat_c_p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_p448_solinas_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_p448_solinas_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_p448_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn fiat_c_p448_solinas_carry_square(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_p448_solinas_carry_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_p448_solinas_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod openssl_curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn open_ssl_curve25519_fe51_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn open_ssl_curve25519_fe51_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn open_ssl_curve25519_hand_optmised_fe51_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn open_ssl_curve25519_hand_optmised_fe51_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn open_ssl_curve25519_fe51_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn open_ssl_curve25519_fe51_square(arg0: *mut u64, arg1: *const u64);
        pub fn open_ssl_curve25519_fe51_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn open_ssl_curve25519_hand_optmised_fe51_square(arg0: *mut u64, arg1: *const u64);
        pub fn open_ssl_curve25519_hand_optmised_fe51_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn open_ssl_curve25519_fe51_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod fiat_c_curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_curve25519_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_curve25519_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_curve25519_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn fiat_c_curve25519_carry_square(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_curve25519_carry_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_curve25519_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod poly1305 {
    pub const LOOSE_BOUND: u64 = 0x180000000000;
    pub const SIZE: usize = 3;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_poly1305_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_poly1305_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_poly1305_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn rust_fiat_poly1305_carry_square(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_poly1305_carry_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_poly1305_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod fiat_c_poly1305 {
    pub const LOOSE_BOUND: u64 = 0x180000000000;
    pub const SIZE: usize = 3;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_poly1305_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_poly1305_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_poly1305_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn fiat_c_poly1305_carry_square(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_poly1305_carry_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_poly1305_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}


mod secp256k1_dettman {
    pub const LOOSE_BOUND: u64 = 0x1ffffffffffffe;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_secp256k1_dettman_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_secp256k1_dettman_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_secp256k1_dettman_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // // Square functions
        pub fn rust_fiat_secp256k1_dettman_square(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_secp256k1_dettman_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_secp256k1_dettman_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod rust_ec_secp256k1 {
    pub const LOOSE_BOUND: u64 = 0x1ffffffffffffe;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn rust_ec_secp256k1_mul_inner(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_ec_secp256k1_mul_inner_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_ec_secp256k1_mul_inner_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);

        // Square functions
        pub fn rust_ec_secp256k1_square(arg0: *mut u64, arg1: *const u64);
        pub fn rust_ec_secp256k1_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_ec_secp256k1_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod fiat_c_secp256k1_dettman {
    pub const LOOSE_BOUND: u64 = 0x1ffffffffffffe;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_secp256k1_dettman_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_secp256k1_dettman_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_secp256k1_dettman_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);

        // Square functions
        pub fn fiat_c_secp256k1_dettman_square(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_secp256k1_dettman_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_secp256k1_dettman_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}




mod bls12 {
    pub const LOOSE_BOUND: u64 = 0x10000000000000;
    pub const SIZE: usize = 6;
    extern "C" {
        // Multiply functions (using usize)
        pub fn bls12_mul(out0: *mut usize, out0_len: usize,
                         in0: *const usize, in0_len: usize,
                         in1: *const usize, in1_len: usize);
        pub fn bls12_mul_nasm(out0: *mut usize, out0_len: usize,
                              in0: *const usize, in0_len: usize,
                              in1: *const usize, in1_len: usize);
        pub fn bls12_mul_CryptOpt(out0: *mut usize, out0_len: usize,
                                  in0: *const usize, in0_len: usize,
                                  in1: *const usize, in1_len: usize);
        // // Square functions (using usize)
        // pub fn bls12_square(out0: *mut usize, out0_len: usize,
        //                     in0: *const usize, in0_len: usize);
        // pub fn bls12_square_nasm(out0: *mut usize, out0_len: usize,
        //                          in0: *const usize, in0_len: usize);
        // pub fn bls12_square_CryptOpt(out0: *mut usize, out0_len: usize,
        //                              in0: *const usize, in0_len: usize);
    }
}
mod openssl_p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn openssl_p448_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn openssl_p448_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn openssl_p448_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn openssl_p448_square(arg0: *mut u64, arg1: *const u64);
        pub fn openssl_p448_square_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn openssl_p448_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

// -----------------------------------------------------------------------------
// Enum definitions for curves and the functions.
#[derive(Debug)]
enum CurveType {
    Curve25519,
    Curve25519Dalek,
    P448,
    Poly1305,
    Secp256k1Dettman,
    Secp256k1RustEc,
    Bls12,
    FiatCCurve25519,
    FiatCSecp256k1Dettman,
    FiatCPoly1305,
    FiatCP448,
    OpenSSLCurve25519,
    OpenSSLP448,
}

#[allow(dead_code)]
enum Function {
    U64Mul(
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64)
    ),
    U64Square(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64)
    ),
    UsizeMul(
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize)
    ),
    U64MulFour(
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64)
    ),
    U64SquareFour(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64)
    ),
    U64MulFive(
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64)
    ),
    U64SquareFive(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64)
    ),
    // UsizeSquare(
    //     unsafe extern "C" fn(*mut usize, usize, *const usize, usize),
    //     unsafe extern "C" fn(*mut usize, usize, *const usize, usize),
    //     unsafe extern "C" fn(*mut usize, usize, *const usize, usize)
    // ),
}

impl CurveType {
    fn get_params(&self) -> (u64, usize) {
        match self {
            CurveType::Curve25519 => (curve25519::LOOSE_BOUND, curve25519::SIZE),
            CurveType::Curve25519Dalek => (curve25519_dalek::LOOSE_BOUND, curve25519_dalek::SIZE),
            CurveType::P448 => (p448::LOOSE_BOUND, p448::SIZE),
            CurveType::Poly1305 => (poly1305::LOOSE_BOUND, poly1305::SIZE),
            CurveType::Secp256k1Dettman => (secp256k1_dettman::LOOSE_BOUND, secp256k1_dettman::SIZE),
            CurveType::Secp256k1RustEc => (rust_ec_secp256k1::LOOSE_BOUND, rust_ec_secp256k1::SIZE),
            CurveType::Bls12 => (bls12::LOOSE_BOUND, bls12::SIZE),
            CurveType::FiatCCurve25519 => (fiat_c_curve25519::LOOSE_BOUND, fiat_c_curve25519::SIZE),
            CurveType::FiatCSecp256k1Dettman => (fiat_c_secp256k1_dettman::LOOSE_BOUND, fiat_c_secp256k1_dettman::SIZE),
            CurveType::FiatCPoly1305 => (fiat_c_poly1305::LOOSE_BOUND, fiat_c_poly1305::SIZE),
            CurveType::FiatCP448 => (fiat_c_p448::LOOSE_BOUND, fiat_c_p448::SIZE),
            CurveType::OpenSSLCurve25519 => (openssl_curve25519::LOOSE_BOUND, openssl_curve25519::SIZE),
            CurveType::OpenSSLP448 => (openssl_p448::LOOSE_BOUND, openssl_p448::SIZE),
        }
    }

    fn get_mul_functions(&self) -> Function {
        match self {
            CurveType::Curve25519 => Function::U64Mul(
                curve25519::rust_fiat_curve25519_carry_mul,
                curve25519::rust_fiat_curve25519_carry_mul_nasm,
                curve25519::rust_fiat_curve25519_carry_mul_CryptOpt
            ),
            CurveType::Curve25519Dalek => Function::U64Mul(
                curve25519_dalek::curve25519_dalek_mul,
                curve25519_dalek::curve25519_dalek_mul_nasm,
                curve25519_dalek::curve25519_dalek_mul_CryptOpt
            ),
            CurveType::P448 => Function::U64Mul(
                p448::rust_fiat_p448_solinas_carry_mul,
                p448::rust_fiat_p448_solinas_carry_mul_nasm,
                p448::rust_fiat_p448_solinas_carry_mul_CryptOpt
            ),
            CurveType::Poly1305 => Function::U64Mul(
                poly1305::rust_fiat_poly1305_carry_mul,
                poly1305::rust_fiat_poly1305_carry_mul_nasm,
                poly1305::rust_fiat_poly1305_carry_mul_CryptOpt
            ),
            CurveType::Secp256k1Dettman => Function::U64Mul(
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_nasm,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_CryptOpt
            ),
            CurveType::Secp256k1RustEc => Function::U64Mul(
                rust_ec_secp256k1::rust_ec_secp256k1_mul_inner,
                rust_ec_secp256k1::rust_ec_secp256k1_mul_inner_nasm,
                rust_ec_secp256k1::rust_ec_secp256k1_mul_inner_CryptOpt
            ),
            CurveType::Bls12 => Function::UsizeMul(
                bls12::bls12_mul,
                bls12::bls12_mul_nasm,
                bls12::bls12_mul_CryptOpt
            ),
            CurveType::FiatCCurve25519 => Function::U64Mul(
                fiat_c_curve25519::fiat_c_curve25519_carry_mul,
                fiat_c_curve25519::fiat_c_curve25519_carry_mul_nasm,
                fiat_c_curve25519::fiat_c_curve25519_carry_mul_CryptOpt
            ),
            CurveType::FiatCSecp256k1Dettman => Function::U64Mul(
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul,
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul_nasm,
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul_CryptOpt
            ),
            CurveType::FiatCPoly1305 => Function::U64Mul(
                fiat_c_poly1305::fiat_c_poly1305_carry_mul,
                fiat_c_poly1305::fiat_c_poly1305_carry_mul_nasm,
                fiat_c_poly1305::fiat_c_poly1305_carry_mul_CryptOpt
            ),
            CurveType::FiatCP448 => Function::U64Mul(
                fiat_c_p448::fiat_c_p448_solinas_carry_mul,
                fiat_c_p448::fiat_c_p448_solinas_carry_mul_nasm,
                fiat_c_p448::fiat_c_p448_carry_mul_CryptOpt
            ),
            CurveType::OpenSSLCurve25519 => Function::U64MulFive(
                openssl_curve25519::open_ssl_curve25519_fe51_mul,
                openssl_curve25519::open_ssl_curve25519_fe51_mul_nasm,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul_nasm,
                openssl_curve25519::open_ssl_curve25519_fe51_mul_CryptOpt
            ),
            CurveType::OpenSSLP448 => Function::U64Mul(
                openssl_p448::openssl_p448_mul,
                openssl_p448::openssl_p448_mul_nasm,
                openssl_p448::openssl_p448_mul_CryptOpt
            ),
        }
    }

    fn get_square_functions(&self) -> Function {
        match self {
            CurveType::Curve25519 => Function::U64Square(
                curve25519::rust_fiat_curve25519_carry_square,
                curve25519::rust_fiat_curve25519_carry_square_nasm,
                curve25519::rust_fiat_curve25519_carry_square_CryptOpt
            ),
            CurveType::P448 => Function::U64Square(
                p448::rust_fiat_p448_solinas_carry_square,
                p448::rust_fiat_p448_solinas_carry_square_nasm,
                p448::rust_fiat_p448_solinas_carry_square_CryptOpt
            ),
            CurveType::Poly1305 => Function::U64Square(
                poly1305::rust_fiat_poly1305_carry_square,
                poly1305::rust_fiat_poly1305_carry_square_nasm,
                poly1305::rust_fiat_poly1305_carry_square_CryptOpt
            ),
            CurveType::Secp256k1Dettman => Function::U64Square(
                secp256k1_dettman::rust_fiat_secp256k1_dettman_square,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_square_nasm,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_square_CryptOpt
            ),
            CurveType::Curve25519Dalek => Function::U64Square(
                curve25519_dalek::curve25519_dalek_square,
                curve25519_dalek::curve25519_dalek_square_nasm,
                curve25519_dalek::curve25519_dalek_square_CryptOpt
            ),
            CurveType::Secp256k1RustEc => Function::U64Square(
                rust_ec_secp256k1::rust_ec_secp256k1_square,
                rust_ec_secp256k1::rust_ec_secp256k1_square_nasm,
                rust_ec_secp256k1::rust_ec_secp256k1_square_CryptOpt
            ),
            CurveType::FiatCCurve25519 => Function::U64Square(
                fiat_c_curve25519::fiat_c_curve25519_carry_square,
                fiat_c_curve25519::fiat_c_curve25519_carry_square_nasm,
                fiat_c_curve25519::fiat_c_curve25519_carry_square_CryptOpt
            ),
            CurveType::FiatCSecp256k1Dettman => Function::U64Square(
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square,
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square_nasm,
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square_CryptOpt
            ),
            CurveType::FiatCPoly1305 => Function::U64Square(
                fiat_c_poly1305::fiat_c_poly1305_carry_square,
                fiat_c_poly1305::fiat_c_poly1305_carry_square_nasm,
                fiat_c_poly1305::fiat_c_poly1305_carry_square_CryptOpt
            ),
            CurveType::FiatCP448 => Function::U64Square(
                fiat_c_p448::fiat_c_p448_solinas_carry_square,
                fiat_c_p448::fiat_c_p448_solinas_carry_square_nasm,
                fiat_c_p448::fiat_c_p448_solinas_carry_square_CryptOpt
            ),
            CurveType::OpenSSLCurve25519 => Function::U64SquareFive(
                openssl_curve25519::open_ssl_curve25519_fe51_square,
                openssl_curve25519::open_ssl_curve25519_fe51_square_nasm,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_square,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_square_nasm,
                openssl_curve25519::open_ssl_curve25519_fe51_square_CryptOpt
            ),
            CurveType::OpenSSLP448 => Function::U64Square(
                openssl_p448::openssl_p448_square,
                openssl_p448::openssl_p448_square_nasm,
                openssl_p448::openssl_p448_square_CryptOpt
            ),

            &CurveType::P448 | &CurveType::Bls12  => todo!(),
            // CurveType::Bls12 => Function::UsizeSquare(
            //     bls12::bls12_square,
            //     bls12::bls12_square_nasm,
            //     bls12::bls12_square_CryptOpt
            // ),
        }
    }
}

// -----------------------------------------------------------------------------
// Utility functions

fn generate_random_loose_input_u64(bound: u64, size: usize) -> Vec<u64> {
    let mut rng = thread_rng();
    (0..size).map(|_| rng.gen_range(0..bound)).collect()
}

fn generate_random_loose_input_usize(bound: u64, size: usize) -> Vec<usize> {
    let mut rng = thread_rng();
    (0..size).map(|_| rng.gen_range(0..bound) as usize).collect()
}

fn median(cycles: &[u64]) -> u64 {
    let mut sorted = cycles.to_vec();
    sorted.sort_unstable();
    let mid = sorted.len() / 2;
    if sorted.len() % 2 == 0 {
        (sorted[mid - 1] + sorted[mid]) / 2
    } else {
        sorted[mid]
    }
}

// -----------------------------------------------------------------------------
// Enhanced measurement functions using CryptOpt methodology

/// Improved U64 multiplication measurement with proper timing
fn measure_one_batch_u64_mul_precise(
    func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    out: &mut [u64],
    in0: &[u64],
    in1: &[u64],
    batch_size: usize,
) -> u64 {
    // Use precise timing with memory barriers
    let start = precise_rdtsc();
    
    unsafe {
        for _ in 0..batch_size {
            func(out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
        }
    }
    
    let end = precise_rdtsc();
    end.saturating_sub(start)
}

// Legacy function maintained for compatibility
fn measure_one_batch_u64_mul(
    func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    out: &mut [u64],
    in0: &[u64],
    in1: &[u64],
    batch_size: usize,
) -> u64 {
    measure_one_batch_u64_mul_precise(func, out, in0, in1, batch_size)
}

fn measure_three_functions_u64_mul(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    nasm_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    batch_size: usize,
    nob: usize,
) -> (u64, u64, u64) {
    let mut cycles_llc = Vec::with_capacity(nob);
    let mut cycles_nasm = Vec::with_capacity(nob);
    let mut cycles_cryptopt = Vec::with_capacity(nob);
    let mut out = vec![0u64; size];
    for _ in 0..nob {
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);
        let c_llc = measure_one_batch_u64_mul(llc_func, &mut out, &in0, &in1, batch_size);
        let c_nasm = measure_one_batch_u64_mul(nasm_func, &mut out, &in0, &in1, batch_size);
        let c_cryptopt = measure_one_batch_u64_mul(cryptopt_func, &mut out, &in0, &in1, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_cryptopt.push(c_cryptopt);
    }
    (median(&cycles_llc), median(&cycles_nasm), median(&cycles_cryptopt))
}

fn measure_four_functions_u64_mul(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    nasm_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    hand_optmised_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    batch_size: usize,
    nob: usize,
) -> (u64, u64, u64, u64) {
    let mut cycles_llc = Vec::with_capacity(nob);
    let mut cycles_nasm = Vec::with_capacity(nob);
    let mut cycles_hand_optmised = Vec::with_capacity(nob);
    let mut cycles_cryptopt = Vec::with_capacity(nob);
    let mut out = vec![0u64; size];
    for _ in 0..nob {
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);
        let c_llc = measure_one_batch_u64_mul(llc_func, &mut out, &in0, &in1, batch_size);
        let c_nasm = measure_one_batch_u64_mul(nasm_func, &mut out, &in0, &in1, batch_size);
        let c_hand_optmised = measure_one_batch_u64_mul(hand_optmised_func, &mut out, &in0, &in1, batch_size);
        let c_cryptopt = measure_one_batch_u64_mul(cryptopt_func, &mut out, &in0, &in1, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_hand_optmised.push(c_hand_optmised);
        cycles_cryptopt.push(c_cryptopt);
    }
    (median(&cycles_llc), median(&cycles_nasm), median(&cycles_hand_optmised), median(&cycles_cryptopt))
}

fn measure_five_functions_u64_mul(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    nasm_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    hand_optmised_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    hand_optmised_nasm_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    batch_size: usize,
    nob: usize,
) -> (u64, u64, u64, u64, u64) {
    let mut cycles_llc = Vec::with_capacity(nob);
    let mut cycles_nasm = Vec::with_capacity(nob);
    let mut cycles_hand_optmised = Vec::with_capacity(nob);
    let mut cycles_hand_optmised_nasm = Vec::with_capacity(nob);
    let mut cycles_cryptopt = Vec::with_capacity(nob);
    let mut out = vec![0u64; size];
    for _ in 0..nob {
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);
        let c_llc = measure_one_batch_u64_mul(llc_func, &mut out, &in0, &in1, batch_size);
        let c_nasm = measure_one_batch_u64_mul(nasm_func, &mut out, &in0, &in1, batch_size);
        let c_hand_optmised = measure_one_batch_u64_mul(hand_optmised_func, &mut out, &in0, &in1, batch_size);
        let c_hand_optmised_nasm = measure_one_batch_u64_mul(hand_optmised_nasm_func, &mut out, &in0, &in1, batch_size);
        let c_cryptopt = measure_one_batch_u64_mul(cryptopt_func, &mut out, &in0, &in1, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_hand_optmised.push(c_hand_optmised);
        cycles_hand_optmised_nasm.push(c_hand_optmised_nasm);
        cycles_cryptopt.push(c_cryptopt);
    }
    (median(&cycles_llc), median(&cycles_nasm), median(&cycles_hand_optmised), median(&cycles_hand_optmised_nasm), median(&cycles_cryptopt))
}

// -----------------------------------------------------------------------------
// Measurement functions for U64 square
fn measure_one_batch_u64_square(
    func: unsafe extern "C" fn(*mut u64, *const u64),
    out: &mut [u64],
    input: &[u64],
    batch_size: usize,
) -> u64 {
    // Precise timing with fences to match enhanced methodology
    let start = precise_rdtsc();
    unsafe {
        for _ in 0..batch_size {
            func(out.as_mut_ptr(), input.as_ptr());
        }
    }
    let end = precise_rdtsc();
    end.saturating_sub(start)
}

fn measure_three_functions_u64_square(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64),
    batch_size: usize,
    nob: usize,
) -> (u64, u64, u64) {
    let mut cycles_llc = Vec::with_capacity(nob);
    let mut cycles_nasm = Vec::with_capacity(nob);
    let mut cycles_cryptopt = Vec::with_capacity(nob);
    let mut out = vec![0u64; size];
    for _ in 0..nob {
        let input = generate_random_loose_input_u64(bound, size);
        let c_llc = measure_one_batch_u64_square(llc_func, &mut out, &input, batch_size);
        let c_nasm = measure_one_batch_u64_square(nasm_func, &mut out, &input, batch_size);
        let c_cryptopt = measure_one_batch_u64_square(cryptopt_func, &mut out, &input, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_cryptopt.push(c_cryptopt);
    }
    (median(&cycles_llc), median(&cycles_nasm), median(&cycles_cryptopt))
}

fn measure_four_functions_u64_square(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    hand_optmised_func: unsafe extern "C" fn(*mut u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64),
    batch_size: usize,
    nob: usize,
) -> (u64, u64, u64, u64) {
    let mut cycles_llc = Vec::with_capacity(nob);
    let mut cycles_nasm = Vec::with_capacity(nob);
    let mut cycles_hand_optmised = Vec::with_capacity(nob);
    let mut cycles_cryptopt = Vec::with_capacity(nob);
    let mut out = vec![0u64; size];
    for _ in 0..nob {
        let input = generate_random_loose_input_u64(bound, size);
        let c_llc = measure_one_batch_u64_square(llc_func, &mut out, &input, batch_size);
        let c_nasm = measure_one_batch_u64_square(nasm_func, &mut out, &input, batch_size);
        let c_hand_optmised = measure_one_batch_u64_square(hand_optmised_func, &mut out, &input, batch_size);
        let c_cryptopt = measure_one_batch_u64_square(cryptopt_func, &mut out, &input, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_hand_optmised.push(c_hand_optmised);
        cycles_cryptopt.push(c_cryptopt);
    }
    (median(&cycles_llc), median(&cycles_nasm), median(&cycles_hand_optmised), median(&cycles_cryptopt))
}

fn measure_five_functions_u64_square(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    hand_optmised_func: unsafe extern "C" fn(*mut u64, *const u64),
    hand_optmised_nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64),
    batch_size: usize,
    nob: usize,
) -> (u64, u64, u64, u64, u64) {
    let mut cycles_llc = Vec::with_capacity(nob);
    let mut cycles_nasm = Vec::with_capacity(nob);
    let mut cycles_hand_optmised = Vec::with_capacity(nob);
    let mut cycles_hand_optmised_nasm = Vec::with_capacity(nob);
    let mut cycles_cryptopt = Vec::with_capacity(nob);
    let mut out = vec![0u64; size];
    for _ in 0..nob {
        let input = generate_random_loose_input_u64(bound, size);
        let c_llc = measure_one_batch_u64_square(llc_func, &mut out, &input, batch_size);
        let c_nasm = measure_one_batch_u64_square(nasm_func, &mut out, &input, batch_size);
        let c_hand_optmised = measure_one_batch_u64_square(hand_optmised_func, &mut out, &input, batch_size);
        let c_hand_optmised_nasm = measure_one_batch_u64_square(hand_optmised_nasm_func, &mut out, &input, batch_size);
        let c_cryptopt = measure_one_batch_u64_square(cryptopt_func, &mut out, &input, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_hand_optmised.push(c_hand_optmised);
        cycles_hand_optmised_nasm.push(c_hand_optmised_nasm);
        cycles_cryptopt.push(c_cryptopt);
    }
    (median(&cycles_llc), median(&cycles_nasm), median(&cycles_hand_optmised), median(&cycles_hand_optmised_nasm), median(&cycles_cryptopt))
}

// -----------------------------------------------------------------------------
// Measurement functions for Usize multiplication (used by Bls12)
fn measure_one_batch_usize_mul(
    func: unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    out: &mut [usize],
    in0: &[usize],
    in1: &[usize],
    batch_size: usize,
) -> u64 {
    unsafe {
        _rdtsc();
        let start = _rdtsc();
        for _ in 0..batch_size {
            func(out.as_mut_ptr(), out.len(), in0.as_ptr(), in0.len(), in1.as_ptr(), in1.len());
        }
        let end = _rdtsc();
        end - start
    }
}

fn measure_three_functions_usize_mul(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    nasm_func: unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    cryptopt_func: unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    batch_size: usize,
    nob: usize,
) -> (u64, u64, u64) {
    let mut cycles_llc = Vec::with_capacity(nob);
    let mut cycles_nasm = Vec::with_capacity(nob);
    let mut cycles_cryptopt = Vec::with_capacity(nob);
    let mut out = vec![0usize; size];
    for _ in 0..nob {
        let in0 = generate_random_loose_input_usize(bound, size);
        let in1 = generate_random_loose_input_usize(bound, size);
        let c_llc = measure_one_batch_usize_mul(llc_func, &mut out, &in0, &in1, batch_size);
        let c_nasm = measure_one_batch_usize_mul(nasm_func, &mut out, &in0, &in1, batch_size);
        let c_cryptopt = measure_one_batch_usize_mul(cryptopt_func, &mut out, &in0, &in1, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_cryptopt.push(c_cryptopt);
    }
    (median(&cycles_llc), median(&cycles_nasm), median(&cycles_cryptopt))
}

// -----------------------------------------------------------------------------
// Enhanced measurement using CryptOpt methodology

/// Enhanced U64 multiplication measurement with full CryptOpt methodology
fn measure_u64_mul_functions_enhanced(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    nasm_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    config: &MeasurementConfig,
) -> (MeasurementStats, MeasurementStats, MeasurementStats) {
    
    // Prepare shared input data (regenerated for each measurement to prevent cache effects)
    let generate_inputs = || -> (Vec<u64>, Vec<u64>) {
        let mut rng = thread_rng();
        let in0: Vec<u64> = (0..size).map(|_| rng.gen_range(0..bound)).collect();
        let in1: Vec<u64> = (0..size).map(|_| rng.gen_range(0..bound)).collect();
        (in0, in1)
    };
    
    // Global warm-up: Exercise all three functions to warm up the system
    println!("Global warm-up: warming up all functions...");
    let mut warmup_out = vec![0u64; size];
    for _ in 0..config.warmup_iterations {
        let (in0, in1) = generate_inputs();
        unsafe {
            llc_func(warmup_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
            nasm_func(warmup_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
            cryptopt_func(warmup_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
        }
        unsafe { _mm_mfence(); } // Prevent over-optimization
    }
    
    let mut multi_measurement = MultiMeasurement::new(config.clone());
    
    // Measure GAS format function
    {
        multi_measurement.measure_function(
            "GAS Format".to_string(),
            || {
                let (in0, in1) = generate_inputs();
                let mut gas_out = vec![0u64; size];
                unsafe {
                    llc_func(gas_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                }
            },
            || {
                let (in0, in1) = generate_inputs();
                let mut gas_out = vec![0u64; size];
                unsafe {
                    llc_func(gas_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                }
            }
        );
    }
    
    // Measure NASM format function
    {
        multi_measurement.measure_function(
            "NASM Format".to_string(),
            || {
                let (in0, in1) = generate_inputs();
                let mut nasm_out = vec![0u64; size];
                unsafe {
                    nasm_func(nasm_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                }
            },
            || {
                let (in0, in1) = generate_inputs();
                let mut nasm_out = vec![0u64; size];
                unsafe {
                    nasm_func(nasm_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                }
            }
        );
    }
    
    // Measure CryptOpt function
    {
        multi_measurement.measure_function(
            "CryptOpt Format".to_string(),
            || {
                let (in0, in1) = generate_inputs();
                let mut cryptopt_out = vec![0u64; size];
                unsafe {
                    cryptopt_func(cryptopt_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                }
            },
            || {
                let (in0, in1) = generate_inputs();
                let mut cryptopt_out = vec![0u64; size];
                unsafe {
                    cryptopt_func(cryptopt_out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                }
            }
        );
    }
    
    // Extract statistics for return
    let gas_stats = MeasurementStats::from_measurements(&multi_measurement.results[0].1);
    let nasm_stats = MeasurementStats::from_measurements(&multi_measurement.results[1].1);
    let cryptopt_stats = MeasurementStats::from_measurements(&multi_measurement.results[2].1);
    
    (gas_stats, nasm_stats, cryptopt_stats)
}

/// Interleaved enhanced measurement matching CryptOpt Algorithm 3 semantics
/// - Per-run global warm-up
/// - Per-function warm-up (20), calibration to cycle goal, final warm-up (5)
/// - Interleave batches across implementations with Fisher–Yates randomization
/// - Reuse inputs/output within each batch (no RNG/alloc inside the timed loop)
fn measure_u64_mul_functions_interleaved_enhanced(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    nasm_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    config: &MeasurementConfig,
) -> (MeasurementStats, MeasurementStats, MeasurementStats) {
    use rand::seq::SliceRandom;

    let mut rng = thread_rng();

    // Global warm-up across all functions
    println!("Global warm-up: warming up all functions...");
    {
        let mut warmout = vec![0u64; size];
        for _ in 0..config.warmup_iterations {
            let in0 = generate_random_loose_input_u64(bound, size);
            let in1 = generate_random_loose_input_u64(bound, size);
            unsafe {
                llc_func(warmout.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                nasm_func(warmout.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                cryptopt_func(warmout.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
            }
            unsafe { _mm_mfence(); }
        }
    }

    // Per-function warm-up (no measurement), shared batch size approach
    for &f in &[llc_func, nasm_func, cryptopt_func] {
        let mut out = vec![0u64; size];
        for _ in 0..config.warmup_iterations {
            let in0 = generate_random_loose_input_u64(bound, size);
            let in1 = generate_random_loose_input_u64(bound, size);
            unsafe { f(out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr()); }
            unsafe { _mm_mfence(); }
        }
    }

    // Initial shared batch size and calibration round using median of three
    let mut batch_size = config.initial_batch_size;
    {
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_c = vec![0u64; size];
        let cg = measure_one_batch_u64_mul_precise(llc_func, &mut out_g, &in0, &in1, batch_size);
        let cn = measure_one_batch_u64_mul_precise(nasm_func, &mut out_n, &in0, &in1, batch_size);
        let cc = measure_one_batch_u64_mul_precise(cryptopt_func, &mut out_c, &in0, &in1, batch_size);
        // Use GAS cycles as the baseline reference (shared batch size)
        batch_size = calculate_optimal_batch_size(
            cg,
            batch_size,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
        println!("Calibrated shared batch size (GAS ref): {} (GAS cycles: {})", batch_size, cg);
        // Final warm-up with shared batch size (5 rounds across functions)
        for _ in 0..5 {
            let _ = measure_one_batch_u64_mul_precise(llc_func, &mut out_g, &in0, &in1, batch_size);
            let _ = measure_one_batch_u64_mul_precise(nasm_func, &mut out_n, &in0, &in1, batch_size);
            let _ = measure_one_batch_u64_mul_precise(cryptopt_func, &mut out_c, &in0, &in1, batch_size);
        }
    }

    println!("Collecting {} batches with interleaved randomized order...", config.num_batches);

    // Collect cycles per batch (raw cycles, not per-call yet)
    let mut gas_batches = vec![0u64; config.num_batches];
    let mut nasm_batches = vec![0u64; config.num_batches];
    let mut crypt_batches = vec![0u64; config.num_batches];
    let mut used_bs = vec![0usize; config.num_batches];

    // Interleave across implementations per batch index
    for b in 0..config.num_batches {
        // Shared inputs per batch for correctness checks and fairness
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);
        let mut out_gas = vec![0u64; size];
        let mut out_nasm = vec![0u64; size];
        let mut out_crypt = vec![0u64; size];

        // Define order [0,1,2] → shuffle each batch
        let mut order = [0usize, 1usize, 2usize];
        order.shuffle(&mut rng);

        used_bs[b] = batch_size;
        for &which in &order {
            match which {
                0 => {
                    let cycles = measure_one_batch_u64_mul_precise(
                        llc_func, &mut out_gas, &in0, &in1, batch_size,
                    );
                    gas_batches[b] = cycles;
                }
                1 => {
                    let cycles = measure_one_batch_u64_mul_precise(
                        nasm_func, &mut out_nasm, &in0, &in1, batch_size,
                    );
                    nasm_batches[b] = cycles;
                }
                2 => {
                    let cycles = measure_one_batch_u64_mul_precise(
                        cryptopt_func, &mut out_crypt, &in0, &in1, batch_size,
                    );
                    crypt_batches[b] = cycles;
                }
                _ => unreachable!(),
            }
        }

        // Optional correctness check: compare outputs if enabled
        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_gas != out_nasm || out_gas != out_crypt {
                eprintln!("Output mismatch detected in batch {}", b + 1);
            }
        }

        // Shared batch size adjustment based on GAS cycles (baseline)
        let gas_cycles = gas_batches[b];
        let next = ((config.cycle_goal as f64 / gas_cycles as f64) * batch_size as f64).ceil() as usize;
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    // Convert to per-call cycles
    let gas_per_call: Vec<u64> = gas_batches.iter().zip(&used_bs).map(|(&c, &bs)| c / bs as u64).collect();
    let nasm_per_call: Vec<u64> = nasm_batches.iter().zip(&used_bs).map(|(&c, &bs)| c / bs as u64).collect();
    let crypt_per_call: Vec<u64> = crypt_batches.iter().zip(&used_bs).map(|(&c, &bs)| c / bs as u64).collect();

    let gas_stats = MeasurementStats::from_measurements(&gas_per_call);
    let nasm_stats = MeasurementStats::from_measurements(&nasm_per_call);
    let crypt_stats = MeasurementStats::from_measurements(&crypt_per_call);

    (gas_stats, nasm_stats, crypt_stats)
}

/// Interleaved enhanced measurement for U64 square (shared batch size, GAS baseline)
fn measure_u64_square_functions_interleaved_enhanced(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64),
    config: &MeasurementConfig,
) -> (MeasurementStats, MeasurementStats, MeasurementStats) {
    use rand::seq::SliceRandom;

    let mut rng = thread_rng();

    // Global warm-up
    println!("Global warm-up: warming up all functions...");
    {
        let mut warmout = vec![0u64; size];
        for _ in 0..config.warmup_iterations {
            let input = generate_random_loose_input_u64(bound, size);
            unsafe {
                llc_func(warmout.as_mut_ptr(), input.as_ptr());
                nasm_func(warmout.as_mut_ptr(), input.as_ptr());
                cryptopt_func(warmout.as_mut_ptr(), input.as_ptr());
            }
            unsafe { _mm_mfence(); }
        }
    }

    // Per-function warm-up (no timing)
    for &f in &[llc_func, nasm_func, cryptopt_func] {
        let mut out = vec![0u64; size];
        for _ in 0..config.warmup_iterations {
            let input = generate_random_loose_input_u64(bound, size);
            unsafe { f(out.as_mut_ptr(), input.as_ptr()); }
            unsafe { _mm_mfence(); }
        }
    }

    // Shared batch size calibration using GAS cycles
    let mut batch_size = config.initial_batch_size;
    {
        let input = generate_random_loose_input_u64(bound, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_c = vec![0u64; size];
        let cg = measure_one_batch_u64_square(llc_func, &mut out_g, &input, batch_size);
        let _cn = measure_one_batch_u64_square(nasm_func, &mut out_n, &input, batch_size);
        let _cc = measure_one_batch_u64_square(cryptopt_func, &mut out_c, &input, batch_size);
        batch_size = calculate_optimal_batch_size(
            cg,
            batch_size,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
        println!("Calibrated shared batch size (GAS ref): {} (GAS cycles: {})", batch_size, cg);
        for _ in 0..5 {
            let _ = measure_one_batch_u64_square(llc_func, &mut out_g, &input, batch_size);
            let _ = measure_one_batch_u64_square(nasm_func, &mut out_n, &input, batch_size);
            let _ = measure_one_batch_u64_square(cryptopt_func, &mut out_c, &input, batch_size);
        }
    }

    println!("Collecting {} batches with interleaved randomized order...", config.num_batches);
    let mut gas_batches = vec![0u64; config.num_batches];
    let mut nasm_batches = vec![0u64; config.num_batches];
    let mut crypt_batches = vec![0u64; config.num_batches];
    let mut used_bs = vec![0usize; config.num_batches];

    for b in 0..config.num_batches {
        let input = generate_random_loose_input_u64(bound, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_c = vec![0u64; size];

        let mut order = [0usize, 1usize, 2usize];
        order.shuffle(&mut rng);

        used_bs[b] = batch_size;
        for &which in &order {
            match which {
                0 => {
                    let cycles = measure_one_batch_u64_square(llc_func, &mut out_g, &input, batch_size);
                    gas_batches[b] = cycles;
                }
                1 => {
                    let cycles = measure_one_batch_u64_square(nasm_func, &mut out_n, &input, batch_size);
                    nasm_batches[b] = cycles;
                }
                2 => {
                    let cycles = measure_one_batch_u64_square(cryptopt_func, &mut out_c, &input, batch_size);
                    crypt_batches[b] = cycles;
                }
                _ => unreachable!(),
            }
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_g != out_n || out_g != out_c {
                eprintln!("Output mismatch detected in batch {} (square)", b + 1);
            }
        }

        // GAS as baseline for shared bs update
        let gas_cycles = gas_batches[b];
        let next = ((config.cycle_goal as f64 / gas_cycles as f64) * batch_size as f64).ceil() as usize;
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let gas_per_call: Vec<u64> = gas_batches.iter().zip(&used_bs).map(|(&c, &bs)| c / bs as u64).collect();
    let nasm_per_call: Vec<u64> = nasm_batches.iter().zip(&used_bs).map(|(&c, &bs)| c / bs as u64).collect();
    let crypt_per_call: Vec<u64> = crypt_batches.iter().zip(&used_bs).map(|(&c, &bs)| c / bs as u64).collect();

    let gas_stats = MeasurementStats::from_measurements(&gas_per_call);
    let nasm_stats = MeasurementStats::from_measurements(&nasm_per_call);
    let crypt_stats = MeasurementStats::from_measurements(&crypt_per_call);

    (gas_stats, nasm_stats, crypt_stats)
}
// -----------------------------------------------------------------------------
// Top-level measurement functions for a single run (multiply version)
fn measure_cryptopt_once_mul(curve: &CurveType) -> Result<(u64, u64, u64), Result<(u64, u64, u64, u64), (u64, u64, u64, u64, u64)>> {
    let batch_size = 200;
    let nob = 31;
    let (bound, size) = curve.get_params();
    let functions = curve.get_mul_functions();
    match functions {
        Function::U64Mul(llc_func, nasm_func, cryptopt_func) => {
            Ok(measure_three_functions_u64_mul(bound, size, llc_func, nasm_func, cryptopt_func, batch_size, nob))
        },
        Function::UsizeMul(llc_func, nasm_func, cryptopt_func) => {
            Ok(measure_three_functions_usize_mul(bound, size, llc_func, nasm_func, cryptopt_func, batch_size, nob))
        },
        Function::U64MulFour(llc_func, nasm_func, hand_optmised_func, cryptopt_func) => {
            Err(Ok(measure_four_functions_u64_mul(bound, size, llc_func, nasm_func, hand_optmised_func, cryptopt_func, batch_size, nob)))
        },
        Function::U64MulFive(llc_func, nasm_func, hand_optmised_func, hand_optmised_nasm_func, cryptopt_func) => {
            Err(Err(measure_five_functions_u64_mul(bound, size, llc_func, nasm_func, hand_optmised_func, hand_optmised_nasm_func, cryptopt_func, batch_size, nob)))
        },
        _ => panic!("Multiply function not implemented for this curve"),
    }
}

// Top-level measurement function for a single run (square version)
fn measure_cryptopt_once_square(curve: &CurveType) -> Result<(u64, u64, u64), Result<(u64, u64, u64, u64), (u64, u64, u64, u64, u64)>> {
    let batch_size = 200;
    let nob = 31;
    let (bound, size) = curve.get_params();
    let functions = curve.get_square_functions();
    match functions {
        Function::U64Square(llc_func, nasm_func, cryptopt_func) => {
            Ok(measure_three_functions_u64_square(bound, size, llc_func, nasm_func, cryptopt_func, batch_size, nob))
        },
        Function::U64SquareFour(llc_func, nasm_func, hand_optmised_func, cryptopt_func) => {
            Err(Ok(measure_four_functions_u64_square(bound, size, llc_func, nasm_func, hand_optmised_func, cryptopt_func, batch_size, nob)))
        },
        Function::U64SquareFive(llc_func, nasm_func, hand_optmised_func, hand_optmised_nasm_func, cryptopt_func) => {
            Err(Err(measure_five_functions_u64_square(bound, size, llc_func, nasm_func, hand_optmised_func, hand_optmised_nasm_func, cryptopt_func, batch_size, nob)))
        },
        // Function::UsizeSquare(_llc_func, _nasm_func, _cryptopt_func) => {
        //     // Implement a UsizeSquare measurement if needed.
        //     panic!("UsizeSquare measurement not implemented")
        // },
        _ => panic!("Square function not implemented for this curve"),
    }
}

// -----------------------------------------------------------------------------
// Helper function to print performance statistics
fn print_performance_stats(name: &str, stats: &MeasurementStats) {
    println!("\n{}:", name);
    println!("  Raw cycle counts: {:?}", stats.raw_cycles);
    if stats.outliers_removed > 0 {
        println!("  Outliers removed: {} (using IQR method)", stats.outliers_removed);
        println!("  Filtered cycle counts: {:?}", stats.filtered_cycles);
    }
    println!("  Mean: {:.2} cycles", stats.mean);
    println!("  Median: {} cycles", stats.median);
    println!("  Std Dev: {:.2} cycles", stats.std_dev);
    println!("  95% CI: [{:.2}, {:.2}] cycles", stats.confidence_interval_95.0, stats.confidence_interval_95.1);
}

// -----------------------------------------------------------------------------
// Run repeated measurements for multiplication
fn run_repeated_measurements_mul(curve: &CurveType, repeats: usize) {
    // Check if this is a 3, 4, or 5-function case
    match measure_cryptopt_once_mul(curve) {
        Ok(_) => {
            // Regular 3-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Ok((llc, nasm, cryptopt)) = measure_cryptopt_once_mul(curve) {
                    llc_results.push(llc);
                    nasm_results.push(nasm);
                    cryptopt_results.push(cryptopt);
                }
            }
            
            // Calculate comprehensive statistics
            let llc_stats = MeasurementStats::from_measurements(&llc_results);
            let nasm_stats = MeasurementStats::from_measurements(&nasm_results);
            let cryptopt_stats = MeasurementStats::from_measurements(&cryptopt_results);
            
            println!("\n=== Performance Statistics (multiply) after {} runs ===", repeats);
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);
            
            println!("\n=== Comparative Analysis ===");
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (based on median).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (based on median).", diff_cryptopt_llc.abs());
            }
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (based on median).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (based on median).", diff_cryptopt_nasm.abs());
            }
            
            // Test for statistical significance using confidence intervals and p-values
            println!("\n=== Statistical Significance ===");
            
            // Calculate p-values using filtered data if available
            let gas_data = if llc_stats.filtered_cycles.len() >= 3 { &llc_stats.filtered_cycles } else { &llc_stats.raw_cycles };
            let nasm_data = if nasm_stats.filtered_cycles.len() >= 3 { &nasm_stats.filtered_cycles } else { &nasm_stats.raw_cycles };
            let cryptopt_data = if cryptopt_stats.filtered_cycles.len() >= 3 { &cryptopt_stats.filtered_cycles } else { &cryptopt_stats.raw_cycles };
            
            let p_gas_cryptopt = calculate_p_value(gas_data, cryptopt_data);
            let p_nasm_cryptopt = calculate_p_value(nasm_data, cryptopt_data);
            
            // GAS vs CryptOpt
            let p_gas_str = if p_gas_cryptopt < 1e-10 {
                format!("{:.2e}", p_gas_cryptopt)  // Scientific notation for very small values
            } else if p_gas_cryptopt < 0.000001 { 
                format!("< 0.000001")
            } else { 
                format!("{:.6}", p_gas_cryptopt) 
            };
            
            if llc_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
                println!("GAS is significantly faster than CryptOpt (95% CI non-overlapping, p = {})", p_gas_str);
            } else if cryptopt_stats.confidence_interval_95.1 < llc_stats.confidence_interval_95.0 {
                println!("CryptOpt is significantly faster than GAS (95% CI non-overlapping, p = {})", p_gas_str);
            } else {
                println!("No significant difference between GAS and CryptOpt (95% CI overlapping, p = {})", p_gas_str);
            }
            
            // NASM vs CryptOpt
            let p_nasm_str = if p_nasm_cryptopt < 1e-10 {
                format!("{:.2e}", p_nasm_cryptopt)  // Scientific notation for very small values
            } else if p_nasm_cryptopt < 0.000001 { 
                format!("< 0.000001")
            } else { 
                format!("{:.6}", p_nasm_cryptopt) 
            };
            
            if nasm_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
                println!("NASM is significantly faster than CryptOpt (95% CI non-overlapping, p = {})", p_nasm_str);
            } else if cryptopt_stats.confidence_interval_95.1 < nasm_stats.confidence_interval_95.0 {
                println!("CryptOpt is significantly faster than NASM (95% CI non-overlapping, p = {})", p_nasm_str);
            } else {
                println!("No significant difference between NASM and CryptOpt (95% CI overlapping, p = {})", p_nasm_str);
            }
            
            println!("\nNote: p-values < 0.05 indicate statistically significant differences at the 95% confidence level.");
        },
        Err(Ok(_)) => {
            // 4-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut hand_optmised_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Err(Ok((llc, nasm, hand_optmised, cryptopt))) = measure_cryptopt_once_mul(curve) {
                    llc_results.push(llc);
                    nasm_results.push(nasm);
                    hand_optmised_results.push(hand_optmised);
                    cryptopt_results.push(cryptopt);
                }
            }
            
            // Calculate comprehensive statistics
            let llc_stats = MeasurementStats::from_measurements(&llc_results);
            let nasm_stats = MeasurementStats::from_measurements(&nasm_results);
            let hand_stats = MeasurementStats::from_measurements(&hand_optmised_results);
            let cryptopt_stats = MeasurementStats::from_measurements(&cryptopt_results);
            
            println!("\n=== Performance Statistics (multiply) after {} runs ===", repeats);
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("Hand-optimised ASM", &hand_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);
            
            println!("\n=== Comparative Analysis ===");
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_hand = ((hand_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (based on median).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (based on median).", diff_cryptopt_llc.abs());
            }
            
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (based on median).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (based on median).", diff_cryptopt_nasm.abs());
            }
            
            if diff_cryptopt_hand > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised (based on median).", diff_cryptopt_hand);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised (based on median).", diff_cryptopt_hand.abs());
            }
        },
        Err(Err(_)) => {
            // 5-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut hand_optmised_results = Vec::with_capacity(repeats);
            let mut hand_optmised_nasm_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Err(Err((llc, nasm, hand_optmised, hand_optmised_nasm, cryptopt))) = measure_cryptopt_once_mul(curve) {
                    llc_results.push(llc);
                    nasm_results.push(nasm);
                    hand_optmised_results.push(hand_optmised);
                    hand_optmised_nasm_results.push(hand_optmised_nasm);
                    cryptopt_results.push(cryptopt);
                }
            }
            // Calculate comprehensive statistics
            let llc_stats = MeasurementStats::from_measurements(&llc_results);
            let nasm_stats = MeasurementStats::from_measurements(&nasm_results);
            let hand_stats = MeasurementStats::from_measurements(&hand_optmised_results);
            let hand_nasm_stats = MeasurementStats::from_measurements(&hand_optmised_nasm_results);
            let cryptopt_stats = MeasurementStats::from_measurements(&cryptopt_results);
            
            println!("\n=== Performance Statistics (multiply) after {} runs ===", repeats);
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("Hand-optimised ASM", &hand_stats);
            print_performance_stats("Hand-optimised NASM ASM", &hand_nasm_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);
            
            println!("\n=== Comparative Analysis ===");
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_hand = ((hand_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_hand_nasm = ((hand_nasm_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (based on median).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (based on median).", diff_cryptopt_llc.abs());
            }
            
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (based on median).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (based on median).", diff_cryptopt_nasm.abs());
            }
            
            if diff_cryptopt_hand > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised (based on median).", diff_cryptopt_hand);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised (based on median).", diff_cryptopt_hand.abs());
            }
            
            if diff_cryptopt_hand_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised NASM (based on median).", diff_cryptopt_hand_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised NASM (based on median).", diff_cryptopt_hand_nasm.abs());
            }
        }
    }
}

// Run repeated measurements for square
fn run_repeated_measurements_square(curve: &CurveType, repeats: usize) {
    // Check if this is a 3, 4, or 5-function case
    match measure_cryptopt_once_square(curve) {
        Ok(_) => {
            // Regular 3-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Ok((llc, nasm, cryptopt)) = measure_cryptopt_once_square(curve) {
                    llc_results.push(llc);
                    nasm_results.push(nasm);
                    cryptopt_results.push(cryptopt);
                }
            }
            // Calculate comprehensive statistics
            let llc_stats = MeasurementStats::from_measurements(&llc_results);
            let nasm_stats = MeasurementStats::from_measurements(&nasm_results);
            let cryptopt_stats = MeasurementStats::from_measurements(&cryptopt_results);
            
            println!("\n=== Performance Statistics (square) after {} runs ===", repeats);
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);
            
            println!("\n=== Comparative Analysis ===");
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (based on median).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (based on median).", diff_cryptopt_llc.abs());
            }
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (based on median).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (based on median).", diff_cryptopt_nasm.abs());
            }
            
            // Test for statistical significance using confidence intervals and p-values
            println!("\n=== Statistical Significance ===");
            
            // Calculate p-values using filtered data if available
            let gas_data = if llc_stats.filtered_cycles.len() >= 3 { &llc_stats.filtered_cycles } else { &llc_stats.raw_cycles };
            let nasm_data = if nasm_stats.filtered_cycles.len() >= 3 { &nasm_stats.filtered_cycles } else { &nasm_stats.raw_cycles };
            let cryptopt_data = if cryptopt_stats.filtered_cycles.len() >= 3 { &cryptopt_stats.filtered_cycles } else { &cryptopt_stats.raw_cycles };
            
            let p_gas_cryptopt = calculate_p_value(gas_data, cryptopt_data);
            let p_nasm_cryptopt = calculate_p_value(nasm_data, cryptopt_data);
            
            // GAS vs CryptOpt
            let p_gas_str = if p_gas_cryptopt < 1e-10 {
                format!("{:.2e}", p_gas_cryptopt)  // Scientific notation for very small values
            } else if p_gas_cryptopt < 0.000001 { 
                format!("< 0.000001")
            } else { 
                format!("{:.6}", p_gas_cryptopt) 
            };
            
            if llc_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
                println!("GAS is significantly faster than CryptOpt (95% CI non-overlapping, p = {})", p_gas_str);
            } else if cryptopt_stats.confidence_interval_95.1 < llc_stats.confidence_interval_95.0 {
                println!("CryptOpt is significantly faster than GAS (95% CI non-overlapping, p = {})", p_gas_str);
            } else {
                println!("No significant difference between GAS and CryptOpt (95% CI overlapping, p = {})", p_gas_str);
            }
            
            // NASM vs CryptOpt
            let p_nasm_str = if p_nasm_cryptopt < 1e-10 {
                format!("{:.2e}", p_nasm_cryptopt)  // Scientific notation for very small values
            } else if p_nasm_cryptopt < 0.000001 { 
                format!("< 0.000001")
            } else { 
                format!("{:.6}", p_nasm_cryptopt) 
            };
            
            if nasm_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
                println!("NASM is significantly faster than CryptOpt (95% CI non-overlapping, p = {})", p_nasm_str);
            } else if cryptopt_stats.confidence_interval_95.1 < nasm_stats.confidence_interval_95.0 {
                println!("CryptOpt is significantly faster than NASM (95% CI non-overlapping, p = {})", p_nasm_str);
            } else {
                println!("No significant difference between NASM and CryptOpt (95% CI overlapping, p = {})", p_nasm_str);
            }
            
            println!("\nNote: p-values < 0.05 indicate statistically significant differences at the 95% confidence level.");
        },
        Err(Ok(_)) => {
            // 4-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut hand_optmised_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Err(Ok((llc, nasm, hand_optmised, cryptopt))) = measure_cryptopt_once_square(curve) {
                    llc_results.push(llc);
                    nasm_results.push(nasm);
                    hand_optmised_results.push(hand_optmised);
                    cryptopt_results.push(cryptopt);
                }
            }
            // Calculate comprehensive statistics
            let llc_stats = MeasurementStats::from_measurements(&llc_results);
            let nasm_stats = MeasurementStats::from_measurements(&nasm_results);
            let hand_stats = MeasurementStats::from_measurements(&hand_optmised_results);
            let cryptopt_stats = MeasurementStats::from_measurements(&cryptopt_results);
            
            println!("\n=== Performance Statistics (square) after {} runs ===", repeats);
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("Hand-optimised ASM", &hand_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);
            
            println!("\n=== Comparative Analysis ===");
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_hand = ((hand_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (based on median).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (based on median).", diff_cryptopt_llc.abs());
            }
            
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (based on median).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (based on median).", diff_cryptopt_nasm.abs());
            }
            
            if diff_cryptopt_hand > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised (based on median).", diff_cryptopt_hand);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised (based on median).", diff_cryptopt_hand.abs());
            }
        },
        Err(Err(_)) => {
            // 5-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut hand_optmised_results = Vec::with_capacity(repeats);
            let mut hand_optmised_nasm_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Err(Err((llc, nasm, hand_optmised, hand_optmised_nasm, cryptopt))) = measure_cryptopt_once_square(curve) {
                    llc_results.push(llc);
                    nasm_results.push(nasm);
                    hand_optmised_results.push(hand_optmised);
                    hand_optmised_nasm_results.push(hand_optmised_nasm);
                    cryptopt_results.push(cryptopt);
                }
            }
            // Calculate comprehensive statistics
            let llc_stats = MeasurementStats::from_measurements(&llc_results);
            let nasm_stats = MeasurementStats::from_measurements(&nasm_results);
            let hand_stats = MeasurementStats::from_measurements(&hand_optmised_results);
            let hand_nasm_stats = MeasurementStats::from_measurements(&hand_optmised_nasm_results);
            let cryptopt_stats = MeasurementStats::from_measurements(&cryptopt_results);
            
            println!("\n=== Performance Statistics (square) after {} runs ===", repeats);
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("Hand-optimised ASM", &hand_stats);
            print_performance_stats("Hand-optimised NASM ASM", &hand_nasm_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);
            
            println!("\n=== Comparative Analysis ===");
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_hand = ((hand_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            let diff_cryptopt_hand_nasm = ((hand_nasm_stats.median as f64 - cryptopt_stats.median as f64) / cryptopt_stats.median as f64) * 100.0;
            
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (based on median).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (based on median).", diff_cryptopt_llc.abs());
            }
            
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (based on median).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (based on median).", diff_cryptopt_nasm.abs());
            }
            
            if diff_cryptopt_hand > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised (based on median).", diff_cryptopt_hand);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised (based on median).", diff_cryptopt_hand.abs());
            }
            
            if diff_cryptopt_hand_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised NASM (based on median).", diff_cryptopt_hand_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised NASM (based on median).", diff_cryptopt_hand_nasm.abs());
            }
        }
    }
}

// -----------------------------------------------------------------------------
// Enhanced measurement runner using CryptOpt methodology

fn run_enhanced_measurements(curve: &CurveType, operation: &str, repeats: usize) {
    let config = MeasurementConfig {
        cycle_goal: 10_000,     // CryptOpt's cycle goal
        num_batches: 31,        // CryptOpt's number of batches
        initial_batch_size: 200, // Current batch size
        min_batch_size: 10,
        max_batch_size: 5_000,
        warmup_iterations: 20,   // Reduced since we warm up all functions together
    };
    
    println!("Enhanced Measurement Configuration:");
    println!("  Cycle Goal: {} cycles/batch", config.cycle_goal);
    println!("  Number of Batches: {}", config.num_batches);
    println!("  Warm-up Iterations: {}", config.warmup_iterations);
    println!("  Repeats: {} (median-of-medians)", repeats);
    println!("  Features: Memory barriers, Fisher-Yates randomization, dynamic batch sizing\n");
    
    let (bound, size) = curve.get_params();
    
    // Collect results from multiple runs for median-of-medians
    let mut gas_medians = Vec::with_capacity(repeats);
    let mut nasm_medians = Vec::with_capacity(repeats);
    let mut cryptopt_medians = Vec::with_capacity(repeats);
    
    for run in 1..=repeats {
        println!("=== Run {}/{} ===", run, repeats);
        
        match operation {
            "mul" => {
                let functions = curve.get_mul_functions();
                match functions {
                    Function::U64Mul(llc_func, nasm_func, cryptopt_func) => {
                        let (gas_stats, nasm_stats, cryptopt_stats) = 
                            measure_u64_mul_functions_interleaved_enhanced(bound, size, llc_func, nasm_func, cryptopt_func, &config);
                        
                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);
                        
                        println!("Run {} - GAS: {} cycles, NASM: {} cycles, CryptOpt: {} cycles",
                                run, gas_stats.median, nasm_stats.median, cryptopt_stats.median);
                        println!("Quality - GAS: {}, NASM: {}, CryptOpt: {}",
                                gas_stats.quality_assessment(),
                                nasm_stats.quality_assessment(),
                                cryptopt_stats.quality_assessment());
                    },
                    _ => {
                        println!("Enhanced measurement not yet implemented for this curve's function type");
                        return;
                    }
                }
            },
            "square" => {
                let functions = curve.get_square_functions();
                match functions {
                    Function::U64Square(llc_func, nasm_func, cryptopt_func) => {
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_u64_square_functions_interleaved_enhanced(bound, size, llc_func, nasm_func, cryptopt_func, &config);

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!("Run {} - GAS: {} cycles, NASM: {} cycles, CryptOpt: {} cycles",
                                run, gas_stats.median, nasm_stats.median, cryptopt_stats.median);
                        println!("Quality - GAS: {}, NASM: {}, CryptOpt: {}",
                                gas_stats.quality_assessment(),
                                nasm_stats.quality_assessment(),
                                cryptopt_stats.quality_assessment());
                    },
                    _ => {
                        println!("Enhanced square measurement not yet implemented for this curve's function type");
                        return;
                    }
                }
            },
            _ => {
                println!("Unknown operation: {}", operation);
                return;
            }
        }
        
        println!();
    }
    
    // Calculate median-of-medians
    let gas_mom = calculate_median(gas_medians.clone());
    let nasm_mom = calculate_median(nasm_medians.clone());
    let cryptopt_mom = calculate_median(cryptopt_medians.clone());
    
    // Generate final report
    println!("=== FINAL ENHANCED MEASUREMENT REPORT ===");
    println!("Methodology: CryptOpt-style with memory barriers, randomized batching, and statistical analysis");
    println!("Measurement quality validation: Coefficient of variation tracking");
    println!();
    
    println!("Median-of-Medians Results ({} runs):", repeats);
    println!("  GAS Format:     {} cycles", gas_mom);
    println!("  NASM Format:    {} cycles", nasm_mom);
    println!("  CryptOpt Format: {} cycles", cryptopt_mom);
    println!();
    
    // Relative performance: CryptOpt vs GAS/NASM (lower cycles = better)
    println!("Relative Performance (median-of-medians):");
    let vs_gas = ((gas_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
    let vs_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
    if vs_gas >= 0.0 {
        println!("  CryptOpt vs GAS: +{:.2}% faster ({} vs {} cycles)", vs_gas, cryptopt_mom, gas_mom);
    } else {
        println!("  CryptOpt vs GAS: -{:.2}% slower ({} vs {} cycles)", vs_gas.abs(), cryptopt_mom, gas_mom);
    }
    if vs_nasm >= 0.0 {
        println!("  CryptOpt vs NASM: +{:.2}% faster ({} vs {} cycles)", vs_nasm, cryptopt_mom, nasm_mom);
    } else {
        println!("  CryptOpt vs NASM: -{:.2}% slower ({} vs {} cycles)", vs_nasm.abs(), cryptopt_mom, nasm_mom);
    }
    
    // Measurement stability analysis
    println!();
    println!("Measurement Stability Analysis:");
    let gas_stats_final = MeasurementStats::from_measurements(&gas_medians);
    let nasm_stats_final = MeasurementStats::from_measurements(&nasm_medians);
    let cryptopt_stats_final = MeasurementStats::from_measurements(&cryptopt_medians);
    
    println!("  GAS Format:     CV = {:.3}% ({})", 
             gas_stats_final.coefficient_of_variation * 100.0,
             gas_stats_final.quality_assessment());
    println!("  NASM Format:    CV = {:.3}% ({})", 
             nasm_stats_final.coefficient_of_variation * 100.0,
             nasm_stats_final.quality_assessment());
    println!("  CryptOpt Format: CV = {:.3}% ({})", 
             cryptopt_stats_final.coefficient_of_variation * 100.0,
             cryptopt_stats_final.quality_assessment());
    
    // Detailed statistics with confidence intervals
    println!();
    println!("Detailed Statistics (across {} runs):", repeats);
    println!("  GAS Format:");
    println!("    Mean: {:.2} cycles", gas_stats_final.mean);
    println!("    Median: {} cycles", gas_stats_final.median);
    println!("    Std Dev: {:.2} cycles", gas_stats_final.std_dev);
    println!("    95% CI: [{:.2}, {:.2}] cycles", gas_stats_final.confidence_interval_95.0, gas_stats_final.confidence_interval_95.1);
    
    println!("  NASM Format:");
    println!("    Mean: {:.2} cycles", nasm_stats_final.mean);
    println!("    Median: {} cycles", nasm_stats_final.median);
    println!("    Std Dev: {:.2} cycles", nasm_stats_final.std_dev);
    println!("    95% CI: [{:.2}, {:.2}] cycles", nasm_stats_final.confidence_interval_95.0, nasm_stats_final.confidence_interval_95.1);
    
    println!("  CryptOpt Format:");
    println!("    Mean: {:.2} cycles", cryptopt_stats_final.mean);
    println!("    Median: {} cycles", cryptopt_stats_final.median);
    println!("    Std Dev: {:.2} cycles", cryptopt_stats_final.std_dev);
    println!("    95% CI: [{:.2}, {:.2}] cycles", cryptopt_stats_final.confidence_interval_95.0, cryptopt_stats_final.confidence_interval_95.1);
    
    // Statistical significance assessment
    println!();
    println!("Statistical Significance Assessment:");
    if gas_stats_final.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
        println!("  GAS is significantly faster than CryptOpt (95% CI non-overlapping)");
    } else if cryptopt_stats_final.confidence_interval_95.1 < gas_stats_final.confidence_interval_95.0 {
        println!("  CryptOpt is significantly faster than GAS (95% CI non-overlapping)");
    } else {
        println!("  No significant difference between GAS and CryptOpt (95% CI overlapping)");
    }
    
    if nasm_stats_final.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
        println!("  NASM is significantly faster than CryptOpt (95% CI non-overlapping)");
    } else if cryptopt_stats_final.confidence_interval_95.1 < nasm_stats_final.confidence_interval_95.0 {
        println!("  CryptOpt is significantly faster than NASM (95% CI non-overlapping)");
    } else {
        println!("  No significant difference between NASM and CryptOpt (95% CI overlapping)");
    }
    
    println!();
    println!("Note: This enhanced methodology addresses reviewer concerns about:");
    println!("  ✓ Memory barriers (mfence before rdtsc)");
    println!("  ✓ Randomized batch execution order (Fisher-Yates)");
    println!("  ✓ Proper warm-up procedures");
    println!("  ✓ Statistical analysis with coefficient of variation");
    println!("  ✓ Dynamic batch sizing based on cycle goals");
    println!("  • CPU pinning and frequency control: Use setup_benchmark_environment.sh");
}

// -----------------------------------------------------------------------------
// Main entry point: parse command-line arguments.
// Usage: cargo run <curve_name> <operation> [repeat_count]
// where <operation> is either "mul" or "square"
fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 || args.len() > 4 {
        println!("Usage: cargo run <curve_name> <operation> [repeat_count]");
        println!("Available curves: curve25519, curve25519_dalek, fiat_c_curve25519, fiat_c_secp256k1_dettman, fiat_c_poly1305, fiat_c_p448, p448, poly1305, secp256k1_dettman, secp256k1_rust_ec, bls12, openssl_curve25519, openssl_p448");
        println!("Available operations: mul, square");
        return;
    }

    let curve_type = match args[1].as_str() {
        "curve25519" => CurveType::Curve25519,
        "curve25519_dalek" => CurveType::Curve25519Dalek,
        "p448" => CurveType::P448,
        "poly1305" => CurveType::Poly1305,
        "secp256k1_dettman" => CurveType::Secp256k1Dettman,
        "secp256k1_rust_ec" => CurveType::Secp256k1RustEc,
        "bls12" => CurveType::Bls12, 
        "fiat_c_curve25519" => CurveType::FiatCCurve25519,
        "fiat_c_secp256k1_dettman" => CurveType::FiatCSecp256k1Dettman,
        "fiat_c_poly1305" => CurveType::FiatCPoly1305,
        "fiat_c_p448" => CurveType::FiatCP448,
        "openssl_curve25519" => CurveType::OpenSSLCurve25519,
        "openssl_p448" => CurveType::OpenSSLP448,
        other => {
            println!("Unknown curve: {}. Available curves: curve25519, curve25519_dalek, fiat_c_curve25519, fiat_c_secp256k1_dettman, fiat_c_poly1305, fiat_c_p448, p448, poly1305, secp256k1_dettman, secp256k1_rust_ec, bls12, openssl_curve25519, openssl_p448", other);
            return;
        }
    };

    let op = args[2].as_str();
    let repeats: usize = if args.len() == 4 {
        args[3].parse().unwrap_or_else(|_| {
            eprintln!("Could not parse repeat_count. Defaulting to 1.");
            1
        })
    } else {
        1
    };

    // Check for enhanced measurement mode
    let use_enhanced = std::env::var("ENHANCED_MEASUREMENT").is_ok();
    
    if use_enhanced {
        println!("Measuring {:?} for operation '{}' with ENHANCED CryptOpt methodology...", curve_type, op);
        println!("Features: Memory barriers, randomized batching, proper warm-up, statistical analysis\n");
        
        run_enhanced_measurements(&curve_type, op, repeats);
    } else {
        println!("Measuring {:?} for operation '{}' with CryptOpt approach...", curve_type, op);
        println!("Using batch size = 200 and nBatches = 31, repeated {} time(s).", repeats);

        match op {
            "mul" => run_repeated_measurements_mul(&curve_type, repeats),
            "square" => run_repeated_measurements_square(&curve_type, repeats),
            _ => {
                println!("Unknown operation: {}. Available operations: mul, square", op);
                return;
            }
        }
    }
}
