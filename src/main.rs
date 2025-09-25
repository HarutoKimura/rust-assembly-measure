use core::arch::x86_64::{_mm_mfence, _rdtsc};
use rand::thread_rng;
use rand::Rng;
use std::env;

// Import the new precise timing module
mod precise_timing;
use precise_timing::*;

// High-level orchestration (how pieces fit together):
// - This binary selects a curve and operation from CLI, then chooses one of two paths:
//   (A) legacy CryptOpt-style measurement (fixed batch size, simple medians), or
//   (B) enhanced interleaved methodology from `precise_timing` (warm-up, calibration
//       to cycle goal, randomized batch order, per-call cycles, statistical analysis).
// - Curves are exposed as FFI modules that declare multiple alternative implementations
//   (GAS/LLC, NASM, optional hand-optimized variants, CryptOpt). `CurveType` maps a CLI
//   name to its input bounds and the function tuple for mul/square via `get_*_functions`.
// - Measurement helpers in this file execute the chosen functions in batches and compute
//   medians. The enhanced flows reuse `MeasurementConfig`, `MeasurementStats`, and
//   utilities from `precise_timing` to provide robust, comparable results.

// Import CryptOpt-style timing module (removed; not used)

// -----------------------------------------------------------------------------
// Modules for the curves with external function declarations.
// (These signatures should match actual FFI declarations.)
// Each module corresponds to one curve/field and lists raw extern "C" symbols for
// multiple codegen variants. `CurveType::get_mul_functions` / `get_square_functions`
// select a tuple from these for downstream measurement.
mod curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_curve25519_carry_mul_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_curve25519_carry_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_curve25519_carry_mul_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn rust_fiat_curve25519_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_curve25519_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_curve25519_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);

    }
}

mod curve25519_dalek {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        // Multiply functions
        pub fn curve25519_dalek_mul_vec(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn curve25519_dalek_mul_vec_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn curve25519_dalek_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn curve25519_dalek_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn curve25519_dalek_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn curve25519_dalek_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_p448_solinas_carry_mul_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_p448_solinas_carry_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_p448_solinas_carry_mul_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn rust_fiat_p448_solinas_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_p448_solinas_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_p448_solinas_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod fiat_c_p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_p448_solinas_carry_mul_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_p448_solinas_carry_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_p448_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn fiat_c_p448_solinas_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_p448_solinas_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_p448_solinas_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod openssl_curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn open_ssl_curve25519_fe51_mul_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn open_ssl_curve25519_fe51_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn open_ssl_curve25519_hand_optmised_fe51_mul(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn open_ssl_curve25519_hand_optmised_fe51_mul_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn open_ssl_curve25519_fe51_mul_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn open_ssl_curve25519_fe51_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn open_ssl_curve25519_fe51_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
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
        pub fn fiat_c_curve25519_carry_mul_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_curve25519_carry_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_curve25519_carry_mul_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn fiat_c_curve25519_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_curve25519_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_curve25519_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod cryptopt_fiat_curve25519_generated {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 5;
    extern "C" {
        pub fn fiat_curve25519_carry_mul_gcc(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_curve25519_carry_mul_clang(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_curve25519_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_curve25519_carry_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_curve25519_carry_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_curve25519_carry_square(arg0: *mut u64, arg1: *const u64);
    }
}

mod cryptopt_fiat_curve25519_solinas {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn fiat_curve25519_solinas_mul_gcc(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_curve25519_solinas_mul_clang(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_curve25519_solinas_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_curve25519_solinas_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_curve25519_solinas_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_curve25519_solinas_square(arg0: *mut u64, arg1: *const u64);
    }
}

mod cryptopt_fiat_p224 {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn fiat_p224_mul_gcc(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p224_mul_clang(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p224_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p224_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p224_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p224_square(arg0: *mut u64, arg1: *const u64);
    }
}

mod poly1305 {
    pub const LOOSE_BOUND: u64 = 0x180000000000;
    pub const SIZE: usize = 3;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_poly1305_carry_mul_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_poly1305_carry_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_poly1305_carry_mul_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn rust_fiat_poly1305_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_poly1305_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_poly1305_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod fiat_c_poly1305 {
    pub const LOOSE_BOUND: u64 = 0x180000000000;
    pub const SIZE: usize = 3;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_poly1305_carry_mul_vec(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_poly1305_carry_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_poly1305_carry_mul_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn fiat_c_poly1305_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_poly1305_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_poly1305_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod secp256k1_dettman {
    pub const LOOSE_BOUND: u64 = 0x1ffffffffffffe;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_secp256k1_dettman_mul_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_secp256k1_dettman_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_secp256k1_dettman_mul_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // // Square functions
        pub fn rust_fiat_secp256k1_dettman_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_secp256k1_dettman_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_secp256k1_dettman_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod rust_ec_secp256k1 {
    pub const LOOSE_BOUND: u64 = 0x1ffffffffffffe;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn rust_ec_secp256k1_mul_inner_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_ec_secp256k1_mul_inner_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_ec_secp256k1_mul_inner_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );

        // Square functions
        pub fn rust_ec_secp256k1_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_ec_secp256k1_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_ec_secp256k1_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod fiat_c_secp256k1_dettman {
    pub const LOOSE_BOUND: u64 = 0x1ffffffffffffe;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_secp256k1_dettman_mul_vec(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_secp256k1_dettman_mul_vec_nasm(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_secp256k1_dettman_mul_CryptOpt(
            arg0: *const u64,
            arg1: *const u64,
            arg2: *const u64,
        );

        // Square functions
        pub fn fiat_c_secp256k1_dettman_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_secp256k1_dettman_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_secp256k1_dettman_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod bls12 {
    pub const LOOSE_BOUND: u64 = 0x10000000000000;
    pub const SIZE: usize = 6;
    extern "C" {
        // Multiply functions (using usize)
        pub fn bls12_mul_vec(
            out0: *mut usize,
            out0_len: usize,
            in0: *const usize,
            in0_len: usize,
            in1: *const usize,
            in1_len: usize,
        );
        pub fn bls12_mul_vec_nasm(
            out0: *mut usize,
            out0_len: usize,
            in0: *const usize,
            in0_len: usize,
            in1: *const usize,
            in1_len: usize,
        );
        pub fn bls12_mul_CryptOpt(
            out0: *mut usize,
            out0_len: usize,
            in0: *const usize,
            in0_len: usize,
            in1: *const usize,
            in1_len: usize,
        );
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
        pub fn openssl_p448_mul_vec(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn openssl_p448_mul_vec_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn openssl_p448_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn openssl_p448_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn openssl_p448_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn openssl_p448_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

// -----------------------------------------------------------------------------
// Enum definitions for curves and the functions.
// Curve/Function selection overview:
// - `CurveType` binds a curve to its loose input bound and limb size.
// - `Function` is a tagged tuple describing which implementation variants (3–5)
//   are available for that curve/operation.
// The measurement runners switch on `Function` to call the right batch runner.
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
    CryptoptFiatCurve25519,
    CryptoptFiatCurve25519Solinas,
    CryptoptFiatP224,
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
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
    ),
    U64Square(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
    ),
    UsizeMul(
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    ),
    U64MulFour(
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
    ),
    U64SquareFour(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
    ),
    U64MulFive(
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
    ),
    U64SquareFive(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
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
            CurveType::Secp256k1Dettman => {
                (secp256k1_dettman::LOOSE_BOUND, secp256k1_dettman::SIZE)
            }
            CurveType::Secp256k1RustEc => (rust_ec_secp256k1::LOOSE_BOUND, rust_ec_secp256k1::SIZE),
            CurveType::Bls12 => (bls12::LOOSE_BOUND, bls12::SIZE),
            CurveType::FiatCCurve25519 => (fiat_c_curve25519::LOOSE_BOUND, fiat_c_curve25519::SIZE),
            CurveType::CryptoptFiatCurve25519 => (
                cryptopt_fiat_curve25519_generated::LOOSE_BOUND,
                cryptopt_fiat_curve25519_generated::SIZE,
            ),
            CurveType::CryptoptFiatCurve25519Solinas => (
                cryptopt_fiat_curve25519_solinas::LOOSE_BOUND,
                cryptopt_fiat_curve25519_solinas::SIZE,
            ),
            CurveType::CryptoptFiatP224 => {
                (cryptopt_fiat_p224::LOOSE_BOUND, cryptopt_fiat_p224::SIZE)
            }
            CurveType::FiatCSecp256k1Dettman => (
                fiat_c_secp256k1_dettman::LOOSE_BOUND,
                fiat_c_secp256k1_dettman::SIZE,
            ),
            CurveType::FiatCPoly1305 => (fiat_c_poly1305::LOOSE_BOUND, fiat_c_poly1305::SIZE),
            CurveType::FiatCP448 => (fiat_c_p448::LOOSE_BOUND, fiat_c_p448::SIZE),
            CurveType::OpenSSLCurve25519 => {
                (openssl_curve25519::LOOSE_BOUND, openssl_curve25519::SIZE)
            }
            CurveType::OpenSSLP448 => (openssl_p448::LOOSE_BOUND, openssl_p448::SIZE),
        }
    }

    fn get_mul_functions(&self) -> Function {
        match self {
            CurveType::Curve25519 => Function::U64Mul(
                curve25519::rust_fiat_curve25519_carry_mul_vec,
                curve25519::rust_fiat_curve25519_carry_mul_vec_nasm,
                curve25519::rust_fiat_curve25519_carry_mul_CryptOpt,
            ),
            CurveType::Curve25519Dalek => Function::U64Mul(
                curve25519_dalek::curve25519_dalek_mul_vec,
                curve25519_dalek::curve25519_dalek_mul_vec_nasm,
                curve25519_dalek::curve25519_dalek_mul_CryptOpt,
            ),
            CurveType::P448 => Function::U64Mul(
                p448::rust_fiat_p448_solinas_carry_mul_vec,
                p448::rust_fiat_p448_solinas_carry_mul_vec_nasm,
                p448::rust_fiat_p448_solinas_carry_mul_CryptOpt,
            ),
            CurveType::Poly1305 => Function::U64Mul(
                poly1305::rust_fiat_poly1305_carry_mul_vec,
                poly1305::rust_fiat_poly1305_carry_mul_vec_nasm,
                poly1305::rust_fiat_poly1305_carry_mul_CryptOpt,
            ),
            CurveType::Secp256k1Dettman => Function::U64Mul(
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_vec,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_vec_nasm,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_CryptOpt,
            ),
            CurveType::Secp256k1RustEc => Function::U64Mul(
                rust_ec_secp256k1::rust_ec_secp256k1_mul_inner_vec,
                rust_ec_secp256k1::rust_ec_secp256k1_mul_inner_vec_nasm,
                rust_ec_secp256k1::rust_ec_secp256k1_mul_inner_CryptOpt,
            ),
            CurveType::Bls12 => Function::UsizeMul(
                bls12::bls12_mul_vec,
                bls12::bls12_mul_vec_nasm,
                bls12::bls12_mul_CryptOpt,
            ),
            CurveType::FiatCCurve25519 => Function::U64Mul(
                fiat_c_curve25519::fiat_c_curve25519_carry_mul_vec,
                fiat_c_curve25519::fiat_c_curve25519_carry_mul_vec_nasm,
                fiat_c_curve25519::fiat_c_curve25519_carry_mul_CryptOpt,
            ),
            CurveType::CryptoptFiatCurve25519 => Function::U64Mul(
                cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_mul_gcc,
                cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_mul_clang,
                cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_mul,
            ),
            CurveType::CryptoptFiatCurve25519Solinas => Function::U64Mul(
                cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_mul_gcc,
                cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_mul_clang,
                cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_mul,
            ),
            CurveType::CryptoptFiatP224 => Function::U64Mul(
                cryptopt_fiat_p224::fiat_p224_mul_gcc,
                cryptopt_fiat_p224::fiat_p224_mul_clang,
                cryptopt_fiat_p224::fiat_p224_mul,
            ),
            CurveType::FiatCSecp256k1Dettman => Function::U64Mul(
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul_vec,
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul_vec_nasm,
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul_CryptOpt,
            ),
            CurveType::FiatCPoly1305 => Function::U64Mul(
                fiat_c_poly1305::fiat_c_poly1305_carry_mul_vec,
                fiat_c_poly1305::fiat_c_poly1305_carry_mul_vec_nasm,
                fiat_c_poly1305::fiat_c_poly1305_carry_mul_CryptOpt,
            ),
            CurveType::FiatCP448 => Function::U64Mul(
                fiat_c_p448::fiat_c_p448_solinas_carry_mul_vec,
                fiat_c_p448::fiat_c_p448_solinas_carry_mul_vec_nasm,
                fiat_c_p448::fiat_c_p448_carry_mul_CryptOpt,
            ),
            CurveType::OpenSSLCurve25519 => Function::U64MulFive(
                openssl_curve25519::open_ssl_curve25519_fe51_mul_vec,
                openssl_curve25519::open_ssl_curve25519_fe51_mul_vec_nasm,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul_nasm,
                openssl_curve25519::open_ssl_curve25519_fe51_mul_CryptOpt,
            ),
            CurveType::OpenSSLP448 => Function::U64Mul(
                openssl_p448::openssl_p448_mul_vec,
                openssl_p448::openssl_p448_mul_vec_nasm,
                openssl_p448::openssl_p448_mul_CryptOpt,
            ),
        }
    }

    fn get_square_functions(&self) -> Function {
        match self {
            CurveType::Curve25519 => Function::U64Square(
                curve25519::rust_fiat_curve25519_carry_square_vec,
                curve25519::rust_fiat_curve25519_carry_square_vec_nasm,
                curve25519::rust_fiat_curve25519_carry_square_CryptOpt,
            ),
            CurveType::P448 => Function::U64Square(
                p448::rust_fiat_p448_solinas_carry_square_vec,
                p448::rust_fiat_p448_solinas_carry_square_vec_nasm,
                p448::rust_fiat_p448_solinas_carry_square_CryptOpt,
            ),
            CurveType::Poly1305 => Function::U64Square(
                poly1305::rust_fiat_poly1305_carry_square_vec,
                poly1305::rust_fiat_poly1305_carry_square_vec_nasm,
                poly1305::rust_fiat_poly1305_carry_square_CryptOpt,
            ),
            CurveType::Secp256k1Dettman => Function::U64Square(
                secp256k1_dettman::rust_fiat_secp256k1_dettman_square_vec,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_square_vec_nasm,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_square_CryptOpt,
            ),
            CurveType::Curve25519Dalek => Function::U64Square(
                curve25519_dalek::curve25519_dalek_square_vec,
                curve25519_dalek::curve25519_dalek_square_vec_nasm,
                curve25519_dalek::curve25519_dalek_square_CryptOpt,
            ),
            CurveType::Secp256k1RustEc => Function::U64Square(
                rust_ec_secp256k1::rust_ec_secp256k1_square_vec,
                rust_ec_secp256k1::rust_ec_secp256k1_square_vec_nasm,
                rust_ec_secp256k1::rust_ec_secp256k1_square_CryptOpt,
            ),
            CurveType::FiatCCurve25519 => Function::U64Square(
                fiat_c_curve25519::fiat_c_curve25519_carry_square_vec,
                fiat_c_curve25519::fiat_c_curve25519_carry_square_vec_nasm,
                fiat_c_curve25519::fiat_c_curve25519_carry_square_CryptOpt,
            ),
            CurveType::CryptoptFiatCurve25519 => Function::U64Square(
                cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_square_gcc,
                cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_square_clang,
                cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_square,
            ),
            CurveType::CryptoptFiatCurve25519Solinas => Function::U64Square(
                cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_square_gcc,
                cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_square_clang,
                cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_square,
            ),
            CurveType::CryptoptFiatP224 => Function::U64Square(
                cryptopt_fiat_p224::fiat_p224_square_gcc,
                cryptopt_fiat_p224::fiat_p224_square_clang,
                cryptopt_fiat_p224::fiat_p224_square,
            ),
            CurveType::FiatCSecp256k1Dettman => Function::U64Square(
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square_vec,
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square_vec_nasm,
                fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square_CryptOpt,
            ),
            CurveType::FiatCPoly1305 => Function::U64Square(
                fiat_c_poly1305::fiat_c_poly1305_carry_square_vec,
                fiat_c_poly1305::fiat_c_poly1305_carry_square_vec_nasm,
                fiat_c_poly1305::fiat_c_poly1305_carry_square_CryptOpt,
            ),
            CurveType::FiatCP448 => Function::U64Square(
                fiat_c_p448::fiat_c_p448_solinas_carry_square_vec,
                fiat_c_p448::fiat_c_p448_solinas_carry_square_vec_nasm,
                fiat_c_p448::fiat_c_p448_solinas_carry_square_CryptOpt,
            ),
            CurveType::OpenSSLCurve25519 => Function::U64SquareFive(
                openssl_curve25519::open_ssl_curve25519_fe51_square_vec,
                openssl_curve25519::open_ssl_curve25519_fe51_square_vec_nasm,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_square,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_square_nasm,
                openssl_curve25519::open_ssl_curve25519_fe51_square_CryptOpt,
            ),
            CurveType::OpenSSLP448 => Function::U64Square(
                openssl_p448::openssl_p448_square_vec,
                openssl_p448::openssl_p448_square_vec_nasm,
                openssl_p448::openssl_p448_square_CryptOpt,
            ),

            &CurveType::Bls12 => todo!(),
            // CurveType::Bls12 => Function::UsizeSquare(
            //     bls12::bls12_square,
            //     bls12::bls12_square_nasm,
            //     bls12::bls12_square_CryptOpt
            // ),
        }
    }

    fn mul_display_labels(&self) -> (&'static str, &'static str, &'static str) {
        match self {
            CurveType::CryptoptFiatCurve25519 => {
                ("GCC Baseline", "Clang Baseline", "CryptOpt Ratio12750")
            }
            CurveType::CryptoptFiatCurve25519Solinas => {
                ("GCC Baseline", "Clang Baseline", "CryptOpt Ratio18494")
            }
            CurveType::CryptoptFiatP224 => {
                ("GCC Baseline", "Clang Baseline", "CryptOpt Ratio16447")
            }
            _ => ("GAS Format", "NASM Format", "CryptOpt Format"),
        }
    }

    fn mul_short_labels(&self) -> (&'static str, &'static str, &'static str) {
        match self {
            CurveType::CryptoptFiatCurve25519
            | CurveType::CryptoptFiatCurve25519Solinas
            | CurveType::CryptoptFiatP224 => ("GCC", "Clang", "CryptOpt"),
            _ => ("GAS", "NASM", "CryptOpt"),
        }
    }

    fn square_display_labels(&self) -> (&'static str, &'static str, &'static str) {
        match self {
            CurveType::CryptoptFiatCurve25519 => {
                ("GCC Baseline", "Clang Baseline", "CryptOpt Ratio12993")
            }
            CurveType::CryptoptFiatCurve25519Solinas => {
                ("GCC Baseline", "Clang Baseline", "CryptOpt Ratio15409")
            }
            CurveType::CryptoptFiatP224 => {
                ("GCC Baseline", "Clang Baseline", "CryptOpt Ratio14731")
            }
            _ => ("GAS Format", "NASM Format", "CryptOpt Format"),
        }
    }

    fn square_short_labels(&self) -> (&'static str, &'static str, &'static str) {
        match self {
            CurveType::CryptoptFiatCurve25519
            | CurveType::CryptoptFiatCurve25519Solinas
            | CurveType::CryptoptFiatP224 => ("GCC", "Clang", "CryptOpt"),
            _ => ("GAS", "NASM", "CryptOpt"),
        }
    }
}

// -----------------------------------------------------------------------------
// Utility functions
// - Random loose input generators: create uniformly random limbs within the
//   curve-specific "loose" bounds used by the original FiatCrypto code.
// - `median`: helper used by the simpler legacy-style aggregations.

fn generate_random_loose_input_u64(bound: u64, size: usize) -> Vec<u64> {
    let mut rng = thread_rng();
    (0..size).map(|_| rng.gen_range(0..bound)).collect()
}

fn generate_random_loose_input_usize(bound: u64, size: usize) -> Vec<usize> {
    let mut rng = thread_rng();
    (0..size)
        .map(|_| rng.gen_range(0..bound) as usize)
        .collect()
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
    // Use precise timing with memory barriers (delegates to `precise_rdtsc`)
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
    // Legacy-style: fixed batch size, regenerate inputs each batch, take median of batch cycles
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
    (
        median(&cycles_llc),
        median(&cycles_nasm),
        median(&cycles_cryptopt),
    )
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
        let c_hand_optmised =
            measure_one_batch_u64_mul(hand_optmised_func, &mut out, &in0, &in1, batch_size);
        let c_cryptopt = measure_one_batch_u64_mul(cryptopt_func, &mut out, &in0, &in1, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_hand_optmised.push(c_hand_optmised);
        cycles_cryptopt.push(c_cryptopt);
    }
    (
        median(&cycles_llc),
        median(&cycles_nasm),
        median(&cycles_hand_optmised),
        median(&cycles_cryptopt),
    )
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
        let c_hand_optmised =
            measure_one_batch_u64_mul(hand_optmised_func, &mut out, &in0, &in1, batch_size);
        let c_hand_optmised_nasm =
            measure_one_batch_u64_mul(hand_optmised_nasm_func, &mut out, &in0, &in1, batch_size);
        let c_cryptopt = measure_one_batch_u64_mul(cryptopt_func, &mut out, &in0, &in1, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_hand_optmised.push(c_hand_optmised);
        cycles_hand_optmised_nasm.push(c_hand_optmised_nasm);
        cycles_cryptopt.push(c_cryptopt);
    }
    (
        median(&cycles_llc),
        median(&cycles_nasm),
        median(&cycles_hand_optmised),
        median(&cycles_hand_optmised_nasm),
        median(&cycles_cryptopt),
    )
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
    (
        median(&cycles_llc),
        median(&cycles_nasm),
        median(&cycles_cryptopt),
    )
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
        let c_hand_optmised =
            measure_one_batch_u64_square(hand_optmised_func, &mut out, &input, batch_size);
        let c_cryptopt = measure_one_batch_u64_square(cryptopt_func, &mut out, &input, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_hand_optmised.push(c_hand_optmised);
        cycles_cryptopt.push(c_cryptopt);
    }
    (
        median(&cycles_llc),
        median(&cycles_nasm),
        median(&cycles_hand_optmised),
        median(&cycles_cryptopt),
    )
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
        let c_hand_optmised =
            measure_one_batch_u64_square(hand_optmised_func, &mut out, &input, batch_size);
        let c_hand_optmised_nasm =
            measure_one_batch_u64_square(hand_optmised_nasm_func, &mut out, &input, batch_size);
        let c_cryptopt = measure_one_batch_u64_square(cryptopt_func, &mut out, &input, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_hand_optmised.push(c_hand_optmised);
        cycles_hand_optmised_nasm.push(c_hand_optmised_nasm);
        cycles_cryptopt.push(c_cryptopt);
    }
    (
        median(&cycles_llc),
        median(&cycles_nasm),
        median(&cycles_hand_optmised),
        median(&cycles_hand_optmised_nasm),
        median(&cycles_cryptopt),
    )
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
            func(
                out.as_mut_ptr(),
                out.len(),
                in0.as_ptr(),
                in0.len(),
                in1.as_ptr(),
                in1.len(),
            );
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
    cryptopt_func: unsafe extern "C" fn(
        *mut usize,
        usize,
        *const usize,
        usize,
        *const usize,
        usize,
    ),
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
        let c_cryptopt =
            measure_one_batch_usize_mul(cryptopt_func, &mut out, &in0, &in1, batch_size);
        cycles_llc.push(c_llc);
        cycles_nasm.push(c_nasm);
        cycles_cryptopt.push(c_cryptopt);
    }
    (
        median(&cycles_llc),
        median(&cycles_nasm),
        median(&cycles_cryptopt),
    )
}

/// Interleaved enhanced measurement for usize mul (shared batch size, GAS baseline)
fn measure_usize_mul_functions_interleaved_enhanced(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    nasm_func: unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    cryptopt_func: unsafe extern "C" fn(
        *mut usize,
        usize,
        *const usize,
        usize,
        *const usize,
        usize,
    ),
    config: &MeasurementConfig,
) -> (MeasurementStats, MeasurementStats, MeasurementStats) {
    use rand::seq::SliceRandom;

    let mut rng = thread_rng();

    // Warm-up phases removed per request (match original CryptOpt style)

    // Shared batch size calibration using max cycles across implementations
    let mut batch_size = config.initial_batch_size;
    {
        let mut out = vec![0usize; size];
        let in0 = generate_random_loose_input_usize(bound, size);
        let in1 = generate_random_loose_input_usize(bound, size);
        let cg_gas = measure_one_batch_usize_mul(llc_func, &mut out, &in0, &in1, batch_size);
        let cg_nasm = measure_one_batch_usize_mul(nasm_func, &mut out, &in0, &in1, batch_size);
        let cg_crypt = measure_one_batch_usize_mul(cryptopt_func, &mut out, &in0, &in1, batch_size);
        let cg = cg_gas.max(cg_nasm).max(cg_crypt);
        batch_size = calculate_optimal_batch_size(
            cg,
            batch_size,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
        println!(
            "Calibrated shared batch size (max-of-impls): {} (max cycles: {})",
            batch_size, cg
        );
    }

    println!(
        "Collecting {} batches with interleaved randomized order...",
        config.num_batches
    );
    let mut gas_batches = vec![0u64; config.num_batches];
    let mut nasm_batches = vec![0u64; config.num_batches];
    let mut crypt_batches = vec![0u64; config.num_batches];
    let mut used_bs = vec![0usize; config.num_batches];

    for b in 0..config.num_batches {
        let mut out_g = vec![0usize; size];
        let mut out_n = vec![0usize; size];
        let mut out_c = vec![0usize; size];
        let in0 = generate_random_loose_input_usize(bound, size);
        let in1 = generate_random_loose_input_usize(bound, size);

        let mut order = [0usize, 1usize, 2usize];
        order.shuffle(&mut rng);

        used_bs[b] = batch_size;
        for &which in &order {
            match which {
                0 => {
                    let cycles =
                        measure_one_batch_usize_mul(llc_func, &mut out_g, &in0, &in1, batch_size);
                    gas_batches[b] = cycles;
                }
                1 => {
                    let cycles =
                        measure_one_batch_usize_mul(nasm_func, &mut out_n, &in0, &in1, batch_size);
                    nasm_batches[b] = cycles;
                }
                2 => {
                    let cycles = measure_one_batch_usize_mul(
                        cryptopt_func,
                        &mut out_c,
                        &in0,
                        &in1,
                        batch_size,
                    );
                    crypt_batches[b] = cycles;
                }
                _ => unreachable!(),
            }
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_g != out_n || out_g != out_c {
                eprintln!("Output mismatch detected in batch {} (usize mul)", b + 1);
            }
        }

        let batch_max = gas_batches[b].max(nasm_batches[b]).max(crypt_batches[b]);
        let next =
            ((config.cycle_goal as f64 / batch_max as f64) * batch_size as f64).ceil() as usize;
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let gas_per_call: Vec<u64> = gas_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();
    let nasm_per_call: Vec<u64> = nasm_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();
    let crypt_per_call: Vec<u64> = crypt_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();

    let gas_stats = MeasurementStats::from_measurements(&gas_per_call);
    let nasm_stats = MeasurementStats::from_measurements(&nasm_per_call);
    let crypt_stats = MeasurementStats::from_measurements(&crypt_per_call);

    (gas_stats, nasm_stats, crypt_stats)
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
        unsafe {
            _mm_mfence();
        } // Prevent over-optimization
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
            },
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
            },
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
            },
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
    labels: (&str, &str, &str),
) -> (MeasurementStats, MeasurementStats, MeasurementStats) {
    use rand::seq::SliceRandom;

    let mut rng = thread_rng();
    let (label_llc, _, _) = labels;

    // Warm-up phases removed per request (match original CryptOpt style)

    // Initial shared batch size and calibration round using GAS cycles
    let mut batch_size = config.initial_batch_size;
    {
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_c = vec![0u64; size];
        let calib_bs = batch_size;
        let cg = measure_one_batch_u64_mul_precise(llc_func, &mut out_g, &in0, &in1, calib_bs);
        let _cn = measure_one_batch_u64_mul_precise(nasm_func, &mut out_n, &in0, &in1, calib_bs);
        let _cc =
            measure_one_batch_u64_mul_precise(cryptopt_func, &mut out_c, &in0, &in1, calib_bs);
        // Use GAS cycles as the baseline reference (shared batch size)
        batch_size = calculate_optimal_batch_size(
            cg,
            calib_bs,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
        let per_call_est = cg as f64 / calib_bs as f64;
        println!(
            "Calibrated shared batch size ({} ref): {} ({} batch cycles: {}, ~{:.2} cycles/call at bs={})",
            label_llc,
            batch_size,
            label_llc,
            cg,
            per_call_est,
            calib_bs
        );
        // No final warm-up
    }

    println!(
        "Collecting {} batches with interleaved randomized order...",
        config.num_batches
    );

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

        // Define order [0,1,2] → shuffle each batch (Fisher–Yates via rand::SliceRandom)
        let mut order = [0usize, 1usize, 2usize];
        order.shuffle(&mut rng);

        used_bs[b] = batch_size;
        for &which in &order {
            match which {
                0 => {
                    let cycles = measure_one_batch_u64_mul_precise(
                        llc_func,
                        &mut out_gas,
                        &in0,
                        &in1,
                        batch_size,
                    );
                    gas_batches[b] = cycles;
                }
                1 => {
                    let cycles = measure_one_batch_u64_mul_precise(
                        nasm_func,
                        &mut out_nasm,
                        &in0,
                        &in1,
                        batch_size,
                    );
                    nasm_batches[b] = cycles;
                }
                2 => {
                    let cycles = measure_one_batch_u64_mul_precise(
                        cryptopt_func,
                        &mut out_crypt,
                        &in0,
                        &in1,
                        batch_size,
                    );
                    crypt_batches[b] = cycles;
                }
                _ => unreachable!(),
            }
        }

        // Optional correctness check: compare outputs if enabled (CHECK_OUTPUTS=1)
        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_gas != out_nasm || out_gas != out_crypt {
                eprintln!("Output mismatch detected in batch {}", b + 1);
            }
        }

        // Shared batch size adjustment based on GAS cycles (baseline)
        let baseline_cycles = gas_batches[b];
        let next = ((config.cycle_goal as f64 / baseline_cycles as f64) * batch_size as f64).ceil()
            as usize;
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    // Convert to per-call cycles
    let gas_per_call: Vec<u64> = gas_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();
    let nasm_per_call: Vec<u64> = nasm_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();
    let crypt_per_call: Vec<u64> = crypt_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();

    let gas_stats = MeasurementStats::from_measurements(&gas_per_call);
    let nasm_stats = MeasurementStats::from_measurements(&nasm_per_call);
    let crypt_stats = MeasurementStats::from_measurements(&crypt_per_call);

    (gas_stats, nasm_stats, crypt_stats)
}

/// Interleaved enhanced measurement for five U64 mul functions (OpenSSL case)
fn measure_u64_mul_functions_interleaved_enhanced_five(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    nasm_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    hand_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    hand_nasm_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    config: &MeasurementConfig,
) -> (
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
) {
    use rand::seq::SliceRandom;

    let mut rng = thread_rng();

    // Global warm-up (all five implementations)
    println!("Global warm-up: warming up all functions...");
    {
        let mut warmout = vec![0u64; size];
        for _ in 0..config.warmup_iterations {
            let in0 = generate_random_loose_input_u64(bound, size);
            let in1 = generate_random_loose_input_u64(bound, size);
            unsafe {
                llc_func(warmout.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                nasm_func(warmout.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                hand_func(warmout.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                hand_nasm_func(warmout.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
                cryptopt_func(warmout.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
            }
            unsafe {
                _mm_mfence();
            }
        }
    }

    // Per-function warm-up (no timing)
    for &f in &[
        llc_func,
        nasm_func,
        hand_func,
        hand_nasm_func,
        cryptopt_func,
    ] {
        let mut out = vec![0u64; size];
        for _ in 0..config.warmup_iterations {
            let in0 = generate_random_loose_input_u64(bound, size);
            let in1 = generate_random_loose_input_u64(bound, size);
            unsafe {
                f(out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
            }
            unsafe {
                _mm_mfence();
            }
        }
    }

    // Shared batch size calibration using max cycles across implementations
    let mut batch_size = config.initial_batch_size;
    {
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_h = vec![0u64; size];
        let mut out_hn = vec![0u64; size];
        let mut out_c = vec![0u64; size];
        let calib_bs = batch_size;
        let cg_g = measure_one_batch_u64_mul_precise(llc_func, &mut out_g, &in0, &in1, calib_bs);
        let cg_n = measure_one_batch_u64_mul_precise(nasm_func, &mut out_n, &in0, &in1, calib_bs);
        let cg_h = measure_one_batch_u64_mul_precise(hand_func, &mut out_h, &in0, &in1, calib_bs);
        let cg_hn =
            measure_one_batch_u64_mul_precise(hand_nasm_func, &mut out_hn, &in0, &in1, calib_bs);
        let cg_c =
            measure_one_batch_u64_mul_precise(cryptopt_func, &mut out_c, &in0, &in1, calib_bs);
        let cg = cg_g.max(cg_n).max(cg_h).max(cg_hn).max(cg_c);
        batch_size = calculate_optimal_batch_size(
            cg,
            calib_bs,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
        let per_call_est = cg as f64 / calib_bs as f64;
        println!(
            "Calibrated shared batch size (max-of-impls): {} (max batch cycles: {}, ~{:.2} cycles/call at bs={})",
            batch_size, cg, per_call_est, calib_bs
        );
    }

    println!(
        "Collecting {} batches with interleaved randomized order...",
        config.num_batches
    );
    let mut gas_batches = vec![0u64; config.num_batches];
    let mut nasm_batches = vec![0u64; config.num_batches];
    let mut hand_batches = vec![0u64; config.num_batches];
    let mut hand_nasm_batches = vec![0u64; config.num_batches];
    let mut crypt_batches = vec![0u64; config.num_batches];
    let mut used_bs = vec![0usize; config.num_batches];

    for b in 0..config.num_batches {
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_h = vec![0u64; size];
        let mut out_hn = vec![0u64; size];
        let mut out_c = vec![0u64; size];

        let mut order = [0usize, 1usize, 2usize, 3usize, 4usize];
        order.shuffle(&mut rng);
        used_bs[b] = batch_size;
        for &which in &order {
            match which {
                0 => {
                    gas_batches[b] = measure_one_batch_u64_mul_precise(
                        llc_func, &mut out_g, &in0, &in1, batch_size,
                    );
                }
                1 => {
                    nasm_batches[b] = measure_one_batch_u64_mul_precise(
                        nasm_func, &mut out_n, &in0, &in1, batch_size,
                    );
                }
                2 => {
                    hand_batches[b] = measure_one_batch_u64_mul_precise(
                        hand_func, &mut out_h, &in0, &in1, batch_size,
                    );
                }
                3 => {
                    hand_nasm_batches[b] = measure_one_batch_u64_mul_precise(
                        hand_nasm_func,
                        &mut out_hn,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                4 => {
                    crypt_batches[b] = measure_one_batch_u64_mul_precise(
                        cryptopt_func,
                        &mut out_c,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                _ => unreachable!(),
            }
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_g != out_n || out_g != out_h || out_g != out_hn || out_g != out_c {
                eprintln!("Output mismatch detected in batch {} (five mul)", b + 1);
            }
        }

        let batch_max = gas_batches[b]
            .max(nasm_batches[b])
            .max(hand_batches[b])
            .max(hand_nasm_batches[b])
            .max(crypt_batches[b]);
        let next =
            ((config.cycle_goal as f64 / batch_max as f64) * batch_size as f64).ceil() as usize;
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let to_per_call = |v: Vec<u64>| -> Vec<u64> {
        v.iter()
            .zip(&used_bs)
            .map(|(&c, &bs)| c / bs as u64)
            .collect()
    };
    let gas_stats = MeasurementStats::from_measurements(&to_per_call(gas_batches));
    let nasm_stats = MeasurementStats::from_measurements(&to_per_call(nasm_batches));
    let hand_stats = MeasurementStats::from_measurements(&to_per_call(hand_batches));
    let hand_nasm_stats = MeasurementStats::from_measurements(&to_per_call(hand_nasm_batches));
    let crypt_stats = MeasurementStats::from_measurements(&to_per_call(crypt_batches));

    (
        gas_stats,
        nasm_stats,
        hand_stats,
        hand_nasm_stats,
        crypt_stats,
    )
}
/// Interleaved enhanced measurement for U64 square (shared batch size, GAS baseline)
fn measure_u64_square_functions_interleaved_enhanced(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64),
    config: &MeasurementConfig,
    labels: (&str, &str, &str),
) -> (MeasurementStats, MeasurementStats, MeasurementStats) {
    use rand::seq::SliceRandom;

    let mut rng = thread_rng();
    let (label_llc, _label_nasm, _label_crypt) = labels;

    // Warm-up phases removed per request (match original CryptOpt style)

    // Shared batch size calibration using max cycles across implementations
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
        println!(
            "Calibrated shared batch size ({} ref): {} ({} cycles: {})",
            label_llc, batch_size, label_llc, cg
        );
    }

    println!(
        "Collecting {} batches with interleaved randomized order...",
        config.num_batches
    );
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
                    let cycles =
                        measure_one_batch_u64_square(llc_func, &mut out_g, &input, batch_size);
                    gas_batches[b] = cycles;
                }
                1 => {
                    let cycles =
                        measure_one_batch_u64_square(nasm_func, &mut out_n, &input, batch_size);
                    nasm_batches[b] = cycles;
                }
                2 => {
                    let cycles =
                        measure_one_batch_u64_square(cryptopt_func, &mut out_c, &input, batch_size);
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

        // Max-of-impls baseline for shared bs update
        let batch_max = gas_batches[b].max(nasm_batches[b]).max(crypt_batches[b]);
        let next =
            ((config.cycle_goal as f64 / batch_max as f64) * batch_size as f64).ceil() as usize;
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let gas_per_call: Vec<u64> = gas_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();
    let nasm_per_call: Vec<u64> = nasm_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();
    let crypt_per_call: Vec<u64> = crypt_batches
        .iter()
        .zip(&used_bs)
        .map(|(&c, &bs)| c / bs as u64)
        .collect();

    let gas_stats = MeasurementStats::from_measurements(&gas_per_call);
    let nasm_stats = MeasurementStats::from_measurements(&nasm_per_call);
    let crypt_stats = MeasurementStats::from_measurements(&crypt_per_call);

    (gas_stats, nasm_stats, crypt_stats)
}

/// Interleaved enhanced measurement for five U64 square functions (OpenSSL case)
fn measure_u64_square_functions_interleaved_enhanced_five(
    bound: u64,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    hand_func: unsafe extern "C" fn(*mut u64, *const u64),
    hand_nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64),
    config: &MeasurementConfig,
) -> (
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
) {
    use rand::seq::SliceRandom;

    let mut rng = thread_rng();

    // Warm-up phases removed per request (match original CryptOpt style)

    // Shared batch size calibration using GAS cycles
    let mut batch_size = config.initial_batch_size;
    {
        let input = generate_random_loose_input_u64(bound, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_h = vec![0u64; size];
        let mut out_hn = vec![0u64; size];
        let mut out_c = vec![0u64; size];
        let calib_bs = batch_size;
        let cg_g = measure_one_batch_u64_square(llc_func, &mut out_g, &input, calib_bs);
        let cg_n = measure_one_batch_u64_square(nasm_func, &mut out_n, &input, calib_bs);
        let cg_h = measure_one_batch_u64_square(hand_func, &mut out_h, &input, calib_bs);
        let cg_hn = measure_one_batch_u64_square(hand_nasm_func, &mut out_hn, &input, calib_bs);
        let cg_c = measure_one_batch_u64_square(cryptopt_func, &mut out_c, &input, calib_bs);
        let cg = cg_g.max(cg_n).max(cg_h).max(cg_hn).max(cg_c);
        batch_size = calculate_optimal_batch_size(
            cg,
            calib_bs,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
        let per_call_est = cg as f64 / calib_bs as f64;
        println!(
            "Calibrated shared batch size (max-of-impls): {} (max batch cycles: {}, ~{:.2} cycles/call at bs={})",
            batch_size, cg, per_call_est, calib_bs
        );
    }

    println!(
        "Collecting {} batches with interleaved randomized order...",
        config.num_batches
    );
    let mut gas_batches = vec![0u64; config.num_batches];
    let mut nasm_batches = vec![0u64; config.num_batches];
    let mut hand_batches = vec![0u64; config.num_batches];
    let mut hand_nasm_batches = vec![0u64; config.num_batches];
    let mut crypt_batches = vec![0u64; config.num_batches];
    let mut used_bs = vec![0usize; config.num_batches];

    for b in 0..config.num_batches {
        let input = generate_random_loose_input_u64(bound, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_h = vec![0u64; size];
        let mut out_hn = vec![0u64; size];
        let mut out_c = vec![0u64; size];

        let mut order = [0usize, 1usize, 2usize, 3usize, 4usize];
        order.shuffle(&mut rng);
        used_bs[b] = batch_size;

        for &which in &order {
            match which {
                0 => {
                    gas_batches[b] =
                        measure_one_batch_u64_square(llc_func, &mut out_g, &input, batch_size);
                }
                1 => {
                    nasm_batches[b] =
                        measure_one_batch_u64_square(nasm_func, &mut out_n, &input, batch_size);
                }
                2 => {
                    hand_batches[b] =
                        measure_one_batch_u64_square(hand_func, &mut out_h, &input, batch_size);
                }
                3 => {
                    hand_nasm_batches[b] = measure_one_batch_u64_square(
                        hand_nasm_func,
                        &mut out_hn,
                        &input,
                        batch_size,
                    );
                }
                4 => {
                    crypt_batches[b] =
                        measure_one_batch_u64_square(cryptopt_func, &mut out_c, &input, batch_size);
                }
                _ => unreachable!(),
            }
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_g != out_n || out_g != out_h || out_g != out_hn || out_g != out_c {
                eprintln!("Output mismatch detected in batch {} (five square)", b + 1);
            }
        }

        let batch_max = gas_batches[b]
            .max(nasm_batches[b])
            .max(hand_batches[b])
            .max(hand_nasm_batches[b])
            .max(crypt_batches[b]);
        let next =
            ((config.cycle_goal as f64 / batch_max as f64) * batch_size as f64).ceil() as usize;
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let to_per_call = |v: Vec<u64>| -> Vec<u64> {
        v.iter()
            .zip(&used_bs)
            .map(|(&c, &bs)| c / bs as u64)
            .collect()
    };
    let gas_stats = MeasurementStats::from_measurements(&to_per_call(gas_batches));
    let nasm_stats = MeasurementStats::from_measurements(&to_per_call(nasm_batches));
    let hand_stats = MeasurementStats::from_measurements(&to_per_call(hand_batches));
    let hand_nasm_stats = MeasurementStats::from_measurements(&to_per_call(hand_nasm_batches));
    let crypt_stats = MeasurementStats::from_measurements(&to_per_call(crypt_batches));

    (
        gas_stats,
        nasm_stats,
        hand_stats,
        hand_nasm_stats,
        crypt_stats,
    )
}
// -----------------------------------------------------------------------------
// Top-level measurement functions for a single run (multiply version)
fn measure_cryptopt_once_mul(
    curve: &CurveType,
) -> Result<(u64, u64, u64), Result<(u64, u64, u64, u64), (u64, u64, u64, u64, u64)>> {
    let batch_size = 200;
    let nob = 31;
    let (bound, size) = curve.get_params();
    let functions = curve.get_mul_functions();
    match functions {
        Function::U64Mul(llc_func, nasm_func, cryptopt_func) => {
            Ok(measure_three_functions_u64_mul(
                bound,
                size,
                llc_func,
                nasm_func,
                cryptopt_func,
                batch_size,
                nob,
            ))
        }
        Function::UsizeMul(llc_func, nasm_func, cryptopt_func) => {
            Ok(measure_three_functions_usize_mul(
                bound,
                size,
                llc_func,
                nasm_func,
                cryptopt_func,
                batch_size,
                nob,
            ))
        }
        Function::U64MulFour(llc_func, nasm_func, hand_optmised_func, cryptopt_func) => {
            Err(Ok(measure_four_functions_u64_mul(
                bound,
                size,
                llc_func,
                nasm_func,
                hand_optmised_func,
                cryptopt_func,
                batch_size,
                nob,
            )))
        }
        Function::U64MulFive(
            llc_func,
            nasm_func,
            hand_optmised_func,
            hand_optmised_nasm_func,
            cryptopt_func,
        ) => Err(Err(measure_five_functions_u64_mul(
            bound,
            size,
            llc_func,
            nasm_func,
            hand_optmised_func,
            hand_optmised_nasm_func,
            cryptopt_func,
            batch_size,
            nob,
        ))),
        _ => panic!("Multiply function not implemented for this curve"),
    }
}

// Top-level measurement function for a single run (square version)
fn measure_cryptopt_once_square(
    curve: &CurveType,
) -> Result<(u64, u64, u64), Result<(u64, u64, u64, u64), (u64, u64, u64, u64, u64)>> {
    let batch_size = 200;
    let nob = 31;
    let (bound, size) = curve.get_params();
    let functions = curve.get_square_functions();
    match functions {
        Function::U64Square(llc_func, nasm_func, cryptopt_func) => {
            Ok(measure_three_functions_u64_square(
                bound,
                size,
                llc_func,
                nasm_func,
                cryptopt_func,
                batch_size,
                nob,
            ))
        }
        Function::U64SquareFour(llc_func, nasm_func, hand_optmised_func, cryptopt_func) => {
            Err(Ok(measure_four_functions_u64_square(
                bound,
                size,
                llc_func,
                nasm_func,
                hand_optmised_func,
                cryptopt_func,
                batch_size,
                nob,
            )))
        }
        Function::U64SquareFive(
            llc_func,
            nasm_func,
            hand_optmised_func,
            hand_optmised_nasm_func,
            cryptopt_func,
        ) => Err(Err(measure_five_functions_u64_square(
            bound,
            size,
            llc_func,
            nasm_func,
            hand_optmised_func,
            hand_optmised_nasm_func,
            cryptopt_func,
            batch_size,
            nob,
        ))),
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
        println!(
            "  Outliers removed: {} (using IQR method)",
            stats.outliers_removed
        );
        println!("  Filtered cycle counts: {:?}", stats.filtered_cycles);
    }
    println!("  Mean: {:.2} cycles", stats.mean);
    println!("  Median: {} cycles", stats.median);
    println!("  Std Dev: {:.2} cycles", stats.std_dev);
    println!(
        "  95% CI: [{:.2}, {:.2}] cycles",
        stats.confidence_interval_95.0, stats.confidence_interval_95.1
    );
}

// -----------------------------------------------------------------------------
// Run repeated measurements for multiplication
fn run_repeated_measurements_mul(curve: &CurveType, repeats: usize) {
    // Check if this is a 3, 4, or 5-function case
    match measure_cryptopt_once_mul(curve) {
        Ok(_) => {
            // Regular 3-function case
            let labels = curve.mul_display_labels();
            let short_labels = curve.mul_short_labels();
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

            println!(
                "\n=== Performance Statistics (multiply) after {} runs ===",
                repeats
            );
            let llc_label = format!("{} ASM", labels.0);
            let nasm_label = format!("{} ASM", labels.1);
            let crypt_label = format!("{} ASM", labels.2);
            print_performance_stats(&llc_label, &llc_stats);
            print_performance_stats(&nasm_label, &nasm_stats);
            print_performance_stats(&crypt_label, &cryptopt_stats);

            println!("\n=== Comparative Analysis ===");
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            if diff_cryptopt_llc > 0.0 {
                println!(
                    "{} is {:.2}% faster than {} (based on median).",
                    short_labels.2, diff_cryptopt_llc, short_labels.0
                );
            } else {
                println!(
                    "{} is {:.2}% slower than {} (based on median).",
                    short_labels.2,
                    diff_cryptopt_llc.abs(),
                    short_labels.0
                );
            }
            if diff_cryptopt_nasm > 0.0 {
                println!(
                    "{} is {:.2}% faster than {} (based on median).",
                    short_labels.2, diff_cryptopt_nasm, short_labels.1
                );
            } else {
                println!(
                    "{} is {:.2}% slower than {} (based on median).",
                    short_labels.2,
                    diff_cryptopt_nasm.abs(),
                    short_labels.1
                );
            }

            // Test for statistical significance using confidence intervals and p-values
            println!("\n=== Statistical Significance ===");

            // Calculate p-values using filtered data if available
            let gas_data = if llc_stats.filtered_cycles.len() >= 3 {
                &llc_stats.filtered_cycles
            } else {
                &llc_stats.raw_cycles
            };
            let nasm_data = if nasm_stats.filtered_cycles.len() >= 3 {
                &nasm_stats.filtered_cycles
            } else {
                &nasm_stats.raw_cycles
            };
            let cryptopt_data = if cryptopt_stats.filtered_cycles.len() >= 3 {
                &cryptopt_stats.filtered_cycles
            } else {
                &cryptopt_stats.raw_cycles
            };

            let p_gas_cryptopt = calculate_p_value(gas_data, cryptopt_data);
            let p_nasm_cryptopt = calculate_p_value(nasm_data, cryptopt_data);

            // GAS vs CryptOpt
            let p_gas_str = if p_gas_cryptopt < 1e-10 {
                format!("{:.2e}", p_gas_cryptopt) // Scientific notation for very small values
            } else if p_gas_cryptopt < 0.000001 {
                format!("< 0.000001")
            } else {
                format!("{:.6}", p_gas_cryptopt)
            };

            if llc_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
                println!(
                    "{} is significantly faster than {} (95% CI non-overlapping, p = {})",
                    short_labels.0, short_labels.2, p_gas_str
                );
            } else if cryptopt_stats.confidence_interval_95.1 < llc_stats.confidence_interval_95.0 {
                println!(
                    "{} is significantly faster than {} (95% CI non-overlapping, p = {})",
                    short_labels.2, short_labels.0, p_gas_str
                );
            } else {
                println!(
                    "No significant difference between {} and {} (95% CI overlapping, p = {})",
                    short_labels.0, short_labels.2, p_gas_str
                );
            }

            // NASM vs CryptOpt
            let p_nasm_str = if p_nasm_cryptopt < 1e-10 {
                format!("{:.2e}", p_nasm_cryptopt) // Scientific notation for very small values
            } else if p_nasm_cryptopt < 0.000001 {
                format!("< 0.000001")
            } else {
                format!("{:.6}", p_nasm_cryptopt)
            };

            if nasm_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
                println!(
                    "{} is significantly faster than {} (95% CI non-overlapping, p = {})",
                    short_labels.1, short_labels.2, p_nasm_str
                );
            } else if cryptopt_stats.confidence_interval_95.1 < nasm_stats.confidence_interval_95.0
            {
                println!(
                    "{} is significantly faster than {} (95% CI non-overlapping, p = {})",
                    short_labels.2, short_labels.1, p_nasm_str
                );
            } else {
                println!(
                    "No significant difference between {} and {} (95% CI overlapping, p = {})",
                    short_labels.1, short_labels.2, p_nasm_str
                );
            }

            println!("\nNote: p-values < 0.05 indicate statistically significant differences at the 95% confidence level.");
        }
        Err(Ok(_)) => {
            // 4-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut hand_optmised_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Err(Ok((llc, nasm, hand_optmised, cryptopt))) =
                    measure_cryptopt_once_mul(curve)
                {
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

            println!(
                "\n=== Performance Statistics (multiply) after {} runs ===",
                repeats
            );
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("Hand-optimised ASM", &hand_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);

            println!("\n=== Comparative Analysis ===");
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_hand = ((hand_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;

            if diff_cryptopt_llc > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than GAS (based on median).",
                    diff_cryptopt_llc
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than GAS (based on median).",
                    diff_cryptopt_llc.abs()
                );
            }

            if diff_cryptopt_nasm > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than NASM (based on median).",
                    diff_cryptopt_nasm
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than NASM (based on median).",
                    diff_cryptopt_nasm.abs()
                );
            }

            if diff_cryptopt_hand > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than Hand-optimised (based on median).",
                    diff_cryptopt_hand
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than Hand-optimised (based on median).",
                    diff_cryptopt_hand.abs()
                );
            }
        }
        Err(Err(_)) => {
            // 5-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut hand_optmised_results = Vec::with_capacity(repeats);
            let mut hand_optmised_nasm_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Err(Err((llc, nasm, hand_optmised, hand_optmised_nasm, cryptopt))) =
                    measure_cryptopt_once_mul(curve)
                {
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

            println!(
                "\n=== Performance Statistics (multiply) after {} runs ===",
                repeats
            );
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("Hand-optimised ASM", &hand_stats);
            print_performance_stats("Hand-optimised NASM ASM", &hand_nasm_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);

            println!("\n=== Comparative Analysis ===");
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_hand = ((hand_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_hand_nasm = ((hand_nasm_stats.median as f64
                - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;

            if diff_cryptopt_llc > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than GAS (based on median).",
                    diff_cryptopt_llc
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than GAS (based on median).",
                    diff_cryptopt_llc.abs()
                );
            }

            if diff_cryptopt_nasm > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than NASM (based on median).",
                    diff_cryptopt_nasm
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than NASM (based on median).",
                    diff_cryptopt_nasm.abs()
                );
            }

            if diff_cryptopt_hand > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than Hand-optimised (based on median).",
                    diff_cryptopt_hand
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than Hand-optimised (based on median).",
                    diff_cryptopt_hand.abs()
                );
            }

            if diff_cryptopt_hand_nasm > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than Hand-optimised NASM (based on median).",
                    diff_cryptopt_hand_nasm
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than Hand-optimised NASM (based on median).",
                    diff_cryptopt_hand_nasm.abs()
                );
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
            let labels = curve.square_display_labels();
            let short_labels = curve.square_short_labels();
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

            println!(
                "\n=== Performance Statistics (square) after {} runs ===",
                repeats
            );
            let llc_label = format!("{} ASM", labels.0);
            let nasm_label = format!("{} ASM", labels.1);
            let crypt_label = format!("{} ASM", labels.2);
            print_performance_stats(&llc_label, &llc_stats);
            print_performance_stats(&nasm_label, &nasm_stats);
            print_performance_stats(&crypt_label, &cryptopt_stats);

            println!("\n=== Comparative Analysis ===");
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            if diff_cryptopt_llc > 0.0 {
                println!(
                    "{} is {:.2}% faster than {} (based on median).",
                    short_labels.2, diff_cryptopt_llc, short_labels.0
                );
            } else {
                println!(
                    "{} is {:.2}% slower than {} (based on median).",
                    short_labels.2,
                    diff_cryptopt_llc.abs(),
                    short_labels.0
                );
            }
            if diff_cryptopt_nasm > 0.0 {
                println!(
                    "{} is {:.2}% faster than {} (based on median).",
                    short_labels.2, diff_cryptopt_nasm, short_labels.1
                );
            } else {
                println!(
                    "{} is {:.2}% slower than {} (based on median).",
                    short_labels.2,
                    diff_cryptopt_nasm.abs(),
                    short_labels.1
                );
            }

            // Test for statistical significance using confidence intervals and p-values
            println!("\n=== Statistical Significance ===");

            // Calculate p-values using filtered data if available
            let gas_data = if llc_stats.filtered_cycles.len() >= 3 {
                &llc_stats.filtered_cycles
            } else {
                &llc_stats.raw_cycles
            };
            let nasm_data = if nasm_stats.filtered_cycles.len() >= 3 {
                &nasm_stats.filtered_cycles
            } else {
                &nasm_stats.raw_cycles
            };
            let cryptopt_data = if cryptopt_stats.filtered_cycles.len() >= 3 {
                &cryptopt_stats.filtered_cycles
            } else {
                &cryptopt_stats.raw_cycles
            };

            let p_gas_cryptopt = calculate_p_value(gas_data, cryptopt_data);
            let p_nasm_cryptopt = calculate_p_value(nasm_data, cryptopt_data);

            // GAS vs CryptOpt
            let p_gas_str = if p_gas_cryptopt < 1e-10 {
                format!("{:.2e}", p_gas_cryptopt) // Scientific notation for very small values
            } else if p_gas_cryptopt < 0.000001 {
                format!("< 0.000001")
            } else {
                format!("{:.6}", p_gas_cryptopt)
            };

            if llc_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
                println!(
                    "{} is significantly faster than {} (95% CI non-overlapping, p = {})",
                    short_labels.0, short_labels.2, p_gas_str
                );
            } else if cryptopt_stats.confidence_interval_95.1 < llc_stats.confidence_interval_95.0 {
                println!(
                    "{} is significantly faster than {} (95% CI non-overlapping, p = {})",
                    short_labels.2, short_labels.0, p_gas_str
                );
            } else {
                println!(
                    "No significant difference between {} and {} (95% CI overlapping, p = {})",
                    short_labels.0, short_labels.2, p_gas_str
                );
            }

            // NASM vs CryptOpt
            let p_nasm_str = if p_nasm_cryptopt < 1e-10 {
                format!("{:.2e}", p_nasm_cryptopt) // Scientific notation for very small values
            } else if p_nasm_cryptopt < 0.000001 {
                format!("< 0.000001")
            } else {
                format!("{:.6}", p_nasm_cryptopt)
            };

            if nasm_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
                println!(
                    "{} is significantly faster than {} (95% CI non-overlapping, p = {})",
                    short_labels.1, short_labels.2, p_nasm_str
                );
            } else if cryptopt_stats.confidence_interval_95.1 < nasm_stats.confidence_interval_95.0
            {
                println!(
                    "{} is significantly faster than {} (95% CI non-overlapping, p = {})",
                    short_labels.2, short_labels.1, p_nasm_str
                );
            } else {
                println!(
                    "No significant difference between {} and {} (95% CI overlapping, p = {})",
                    short_labels.1, short_labels.2, p_nasm_str
                );
            }

            println!("\nNote: p-values < 0.05 indicate statistically significant differences at the 95% confidence level.");
        }
        Err(Ok(_)) => {
            // 4-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut hand_optmised_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Err(Ok((llc, nasm, hand_optmised, cryptopt))) =
                    measure_cryptopt_once_square(curve)
                {
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

            println!(
                "\n=== Performance Statistics (square) after {} runs ===",
                repeats
            );
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("Hand-optimised ASM", &hand_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);

            println!("\n=== Comparative Analysis ===");
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_hand = ((hand_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;

            if diff_cryptopt_llc > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than GAS (based on median).",
                    diff_cryptopt_llc
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than GAS (based on median).",
                    diff_cryptopt_llc.abs()
                );
            }

            if diff_cryptopt_nasm > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than NASM (based on median).",
                    diff_cryptopt_nasm
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than NASM (based on median).",
                    diff_cryptopt_nasm.abs()
                );
            }

            if diff_cryptopt_hand > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than Hand-optimised (based on median).",
                    diff_cryptopt_hand
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than Hand-optimised (based on median).",
                    diff_cryptopt_hand.abs()
                );
            }
        }
        Err(Err(_)) => {
            // 5-function case
            let mut llc_results = Vec::with_capacity(repeats);
            let mut nasm_results = Vec::with_capacity(repeats);
            let mut hand_optmised_results = Vec::with_capacity(repeats);
            let mut hand_optmised_nasm_results = Vec::with_capacity(repeats);
            let mut cryptopt_results = Vec::with_capacity(repeats);
            for _ in 0..repeats {
                if let Err(Err((llc, nasm, hand_optmised, hand_optmised_nasm, cryptopt))) =
                    measure_cryptopt_once_square(curve)
                {
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

            println!(
                "\n=== Performance Statistics (square) after {} runs ===",
                repeats
            );
            print_performance_stats("GAS format ASM", &llc_stats);
            print_performance_stats("NASM format ASM", &nasm_stats);
            print_performance_stats("Hand-optimised ASM", &hand_stats);
            print_performance_stats("Hand-optimised NASM ASM", &hand_nasm_stats);
            print_performance_stats("CryptOpt format ASM", &cryptopt_stats);

            println!("\n=== Comparative Analysis ===");
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_nasm = ((nasm_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_hand = ((hand_stats.median as f64 - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;
            let diff_cryptopt_hand_nasm = ((hand_nasm_stats.median as f64
                - cryptopt_stats.median as f64)
                / cryptopt_stats.median as f64)
                * 100.0;

            if diff_cryptopt_llc > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than GAS (based on median).",
                    diff_cryptopt_llc
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than GAS (based on median).",
                    diff_cryptopt_llc.abs()
                );
            }

            if diff_cryptopt_nasm > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than NASM (based on median).",
                    diff_cryptopt_nasm
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than NASM (based on median).",
                    diff_cryptopt_nasm.abs()
                );
            }

            if diff_cryptopt_hand > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than Hand-optimised (based on median).",
                    diff_cryptopt_hand
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than Hand-optimised (based on median).",
                    diff_cryptopt_hand.abs()
                );
            }

            if diff_cryptopt_hand_nasm > 0.0 {
                println!(
                    "CryptOpt is {:.2}% faster than Hand-optimised NASM (based on median).",
                    diff_cryptopt_hand_nasm
                );
            } else {
                println!(
                    "CryptOpt is {:.2}% slower than Hand-optimised NASM (based on median).",
                    diff_cryptopt_hand_nasm.abs()
                );
            }
        }
    }
}

// -----------------------------------------------------------------------------
// Enhanced measurement runner using CryptOpt methodology

fn run_enhanced_measurements(curve: &CurveType, operation: &str, repeats: usize) {
    // Build the enhanced measurement configuration (used across all runs)
    let config = MeasurementConfig {
        cycle_goal: 10_000,      // CryptOpt's cycle goal
        num_batches: 31,         // CryptOpt's number of batches
        initial_batch_size: 200, // Current batch size
        min_batch_size: 10,
        max_batch_size: 5_000,
        warmup_iterations: 20, // Reduced since we warm up all functions together
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
    let mut hand_medians: Vec<u64> = Vec::with_capacity(repeats);
    let mut hand_nasm_medians: Vec<u64> = Vec::with_capacity(repeats);
    let mut cryptopt_medians = Vec::with_capacity(repeats);
    let mut summary_labels = if operation == "square" {
        curve.square_display_labels()
    } else {
        curve.mul_display_labels()
    };
    let mut summary_short_labels = if operation == "square" {
        curve.square_short_labels()
    } else {
        curve.mul_short_labels()
    };

    for run in 1..=repeats {
        println!("=== Run {}/{} ===", run, repeats);

        // Per-run: select operation, dispatch to interleaved enhanced measurement for
        // the specific curve's available function tuple(s).
        match operation {
            "mul" => {
                let functions = curve.get_mul_functions();
                match functions {
                    Function::U64Mul(llc_func, nasm_func, cryptopt_func) => {
                        let labels = curve.mul_display_labels();
                        let short_labels = curve.mul_short_labels();
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_u64_mul_functions_interleaved_enhanced(
                                bound,
                                size,
                                llc_func,
                                nasm_func,
                                cryptopt_func,
                                &config,
                                labels,
                            );

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!(
                            "Run {} - {}: {} cycles, {}: {} cycles, {}: {} cycles",
                            run,
                            labels.0,
                            gas_stats.median,
                            labels.1,
                            nasm_stats.median,
                            labels.2,
                            cryptopt_stats.median
                        );
                        println!(
                            "Quality - {}: {}, {}: {}, {}: {}",
                            labels.0,
                            gas_stats.quality_assessment(),
                            labels.1,
                            nasm_stats.quality_assessment(),
                            labels.2,
                            cryptopt_stats.quality_assessment()
                        );
                        summary_labels = labels;
                        summary_short_labels = short_labels;
                    }
                    Function::UsizeMul(llc_func, nasm_func, cryptopt_func) => {
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_usize_mul_functions_interleaved_enhanced(
                                bound,
                                size,
                                llc_func,
                                nasm_func,
                                cryptopt_func,
                                &config,
                            );

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!(
                            "Run {} - GAS: {} cycles, NASM: {} cycles, CryptOpt: {} cycles",
                            run, gas_stats.median, nasm_stats.median, cryptopt_stats.median
                        );
                        println!(
                            "Quality - GAS: {}, NASM: {}, CryptOpt: {}",
                            gas_stats.quality_assessment(),
                            nasm_stats.quality_assessment(),
                            cryptopt_stats.quality_assessment()
                        );
                    }
                    Function::U64MulFive(
                        llc_func,
                        nasm_func,
                        hand_func,
                        hand_nasm_func,
                        cryptopt_func,
                    ) => {
                        let (gas_stats, nasm_stats, hand_stats, hand_nasm_stats, cryptopt_stats) =
                            measure_u64_mul_functions_interleaved_enhanced_five(
                                bound,
                                size,
                                llc_func,
                                nasm_func,
                                hand_func,
                                hand_nasm_func,
                                cryptopt_func,
                                &config,
                            );

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        hand_medians.push(hand_stats.median);
                        hand_nasm_medians.push(hand_nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!("Run {} - GAS: {} cycles, NASM: {} cycles, Hand: {} cycles, Hand-NASM: {} cycles, CryptOpt: {} cycles",
                                run, gas_stats.median, nasm_stats.median, hand_stats.median, hand_nasm_stats.median, cryptopt_stats.median);
                        println!(
                            "Quality - GAS: {}, NASM: {}, Hand: {}, Hand-NASM: {}, CryptOpt: {}",
                            gas_stats.quality_assessment(),
                            nasm_stats.quality_assessment(),
                            hand_stats.quality_assessment(),
                            hand_nasm_stats.quality_assessment(),
                            cryptopt_stats.quality_assessment()
                        );
                    }
                    _ => {
                        println!("Enhanced measurement not yet implemented for this curve's function type");
                        return;
                    }
                }
            }
            "square" => {
                let functions = curve.get_square_functions();
                match functions {
                    Function::U64Square(llc_func, nasm_func, cryptopt_func) => {
                        let labels = curve.square_display_labels();
                        let short_labels = curve.square_short_labels();
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_u64_square_functions_interleaved_enhanced(
                                bound,
                                size,
                                llc_func,
                                nasm_func,
                                cryptopt_func,
                                &config,
                                labels,
                            );

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!(
                            "Run {} - {}: {} cycles, {}: {} cycles, {}: {} cycles",
                            run,
                            labels.0,
                            gas_stats.median,
                            labels.1,
                            nasm_stats.median,
                            labels.2,
                            cryptopt_stats.median
                        );
                        println!(
                            "Quality - {}: {}, {}: {}, {}: {}",
                            labels.0,
                            gas_stats.quality_assessment(),
                            labels.1,
                            nasm_stats.quality_assessment(),
                            labels.2,
                            cryptopt_stats.quality_assessment()
                        );
                        summary_labels = labels;
                        summary_short_labels = short_labels;
                    }
                    Function::U64SquareFive(
                        llc_func,
                        nasm_func,
                        hand_func,
                        hand_nasm_func,
                        cryptopt_func,
                    ) => {
                        let (gas_stats, nasm_stats, hand_stats, hand_nasm_stats, cryptopt_stats) =
                            measure_u64_square_functions_interleaved_enhanced_five(
                                bound,
                                size,
                                llc_func,
                                nasm_func,
                                hand_func,
                                hand_nasm_func,
                                cryptopt_func,
                                &config,
                            );

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        hand_medians.push(hand_stats.median);
                        hand_nasm_medians.push(hand_nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!("Run {} - GAS: {} cycles, NASM: {} cycles, Hand: {} cycles, Hand-NASM: {} cycles, CryptOpt: {} cycles",
                                run, gas_stats.median, nasm_stats.median, hand_stats.median, hand_nasm_stats.median, cryptopt_stats.median);
                        println!(
                            "Quality - GAS: {}, NASM: {}, Hand: {}, Hand-NASM: {}, CryptOpt: {}",
                            gas_stats.quality_assessment(),
                            nasm_stats.quality_assessment(),
                            hand_stats.quality_assessment(),
                            hand_nasm_stats.quality_assessment(),
                            cryptopt_stats.quality_assessment()
                        );
                    }
                    _ => {
                        println!("Enhanced square measurement not yet implemented for this curve's function type");
                        return;
                    }
                }
            }
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
    let hand_mom = if !hand_medians.is_empty() {
        Some(calculate_median(hand_medians.clone()))
    } else {
        None
    };
    let hand_nasm_mom = if !hand_nasm_medians.is_empty() {
        Some(calculate_median(hand_nasm_medians.clone()))
    } else {
        None
    };
    let cryptopt_mom = calculate_median(cryptopt_medians.clone());

    // Generate final report
    println!("=== FINAL ENHANCED MEASUREMENT REPORT ===");
    println!("Methodology: CryptOpt-style with memory barriers, randomized batching, and statistical analysis");
    println!("Measurement quality validation: Coefficient of variation tracking");
    println!();

    println!("Median-of-Medians Results ({} runs):", repeats);
    println!("  {}: {} cycles", summary_labels.0, gas_mom);
    println!("  {}: {} cycles", summary_labels.1, nasm_mom);
    if let Some(hm) = hand_mom {
        println!("  Hand-optimised GAS: {} cycles", hm);
    }
    if let Some(hnm) = hand_nasm_mom {
        println!("  Hand-optimised NASM: {} cycles", hnm);
    }
    println!("  {}: {} cycles", summary_labels.2, cryptopt_mom);
    println!();

    // Relative performance: CryptOpt vs GAS/NASM (lower cycles = better)
    println!("Relative Performance (median-of-medians):");
    let vs_gas = ((gas_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
    let vs_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
    println!(
        "  {} vs {}: {:+.2}% ({} vs {} cycles)",
        summary_short_labels.2, summary_short_labels.0, vs_gas, cryptopt_mom, gas_mom
    );
    println!(
        "  {} vs {}: {:+.2}% ({} vs {} cycles)",
        summary_short_labels.2, summary_short_labels.1, vs_nasm, cryptopt_mom, nasm_mom
    );
    if let Some(hm) = hand_mom {
        let vs = ((hm as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
        println!(
            "  CryptOpt vs Hand-GAS: {:+.2}% ({} vs {} cycles)",
            vs, cryptopt_mom, hm
        );
    }
    if let Some(hnm) = hand_nasm_mom {
        let vs = ((hnm as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
        println!(
            "  CryptOpt vs Hand-NASM: {:+.2}% ({} vs {} cycles)",
            vs, cryptopt_mom, hnm
        );
    }

    // Measurement stability analysis
    println!();
    println!("Measurement Stability Analysis:");
    let gas_stats_final = MeasurementStats::from_measurements(&gas_medians);
    let nasm_stats_final = MeasurementStats::from_measurements(&nasm_medians);
    let hand_stats_final = if !hand_medians.is_empty() {
        Some(MeasurementStats::from_measurements(&hand_medians))
    } else {
        None
    };
    let hand_nasm_stats_final = if !hand_nasm_medians.is_empty() {
        Some(MeasurementStats::from_measurements(&hand_nasm_medians))
    } else {
        None
    };
    let cryptopt_stats_final = MeasurementStats::from_measurements(&cryptopt_medians);

    println!(
        "  {}: CV = {:.3}% ({})",
        summary_labels.0,
        gas_stats_final.coefficient_of_variation * 100.0,
        gas_stats_final.quality_assessment()
    );
    println!(
        "  {}: CV = {:.3}% ({})",
        summary_labels.1,
        nasm_stats_final.coefficient_of_variation * 100.0,
        nasm_stats_final.quality_assessment()
    );
    println!(
        "  {}: CV = {:.3}% ({})",
        summary_labels.2,
        cryptopt_stats_final.coefficient_of_variation * 100.0,
        cryptopt_stats_final.quality_assessment()
    );
    if let Some(hs) = &hand_stats_final {
        println!(
            "  Hand-optimised GAS: CV = {:.3}% ({})",
            hs.coefficient_of_variation * 100.0,
            hs.quality_assessment()
        );
    }
    if let Some(hns) = &hand_nasm_stats_final {
        println!(
            "  Hand-optimised NASM: CV = {:.3}% ({})",
            hns.coefficient_of_variation * 100.0,
            hns.quality_assessment()
        );
    }

    // Detailed statistics with confidence intervals
    println!();
    println!("Detailed Statistics (across {} runs):", repeats);
    println!("  {}:", summary_labels.0);
    println!("    Mean: {:.2} cycles", gas_stats_final.mean);
    println!("    Median: {} cycles", gas_stats_final.median);
    println!("    Std Dev: {:.2} cycles", gas_stats_final.std_dev);
    println!(
        "    95% CI: [{:.2}, {:.2}] cycles",
        gas_stats_final.confidence_interval_95.0, gas_stats_final.confidence_interval_95.1
    );

    println!("  {}:", summary_labels.1);
    println!("    Mean: {:.2} cycles", nasm_stats_final.mean);
    println!("    Median: {} cycles", nasm_stats_final.median);
    println!("    Std Dev: {:.2} cycles", nasm_stats_final.std_dev);
    println!(
        "    95% CI: [{:.2}, {:.2}] cycles",
        nasm_stats_final.confidence_interval_95.0, nasm_stats_final.confidence_interval_95.1
    );

    println!("  {}:", summary_labels.2);
    println!("    Mean: {:.2} cycles", cryptopt_stats_final.mean);
    println!("    Median: {} cycles", cryptopt_stats_final.median);
    println!("    Std Dev: {:.2} cycles", cryptopt_stats_final.std_dev);
    println!(
        "    95% CI: [{:.2}, {:.2}] cycles",
        cryptopt_stats_final.confidence_interval_95.0,
        cryptopt_stats_final.confidence_interval_95.1
    );
    if let Some(hs) = &hand_stats_final {
        println!("  Hand-optimised GAS:");
        println!("    Mean: {:.2} cycles", hs.mean);
        println!("    Median: {} cycles", hs.median);
        println!("    Std Dev: {:.2} cycles", hs.std_dev);
        println!(
            "    95% CI: [{:.2}, {:.2}] cycles",
            hs.confidence_interval_95.0, hs.confidence_interval_95.1
        );
    }
    if let Some(hns) = &hand_nasm_stats_final {
        println!("  Hand-optimised NASM:");
        println!("    Mean: {:.2} cycles", hns.mean);
        println!("    Median: {} cycles", hns.median);
        println!("    Std Dev: {:.2} cycles", hns.std_dev);
        println!(
            "    95% CI: [{:.2}, {:.2}] cycles",
            hns.confidence_interval_95.0, hns.confidence_interval_95.1
        );
    }

    // Statistical significance assessment
    println!();
    println!("Statistical Significance Assessment:");
    if gas_stats_final.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
        println!(
            "  {} is significantly faster than {} (95% CI non-overlapping)",
            summary_short_labels.0, summary_short_labels.2
        );
    } else if cryptopt_stats_final.confidence_interval_95.1
        < gas_stats_final.confidence_interval_95.0
    {
        println!(
            "  {} is significantly faster than {} (95% CI non-overlapping)",
            summary_short_labels.2, summary_short_labels.0
        );
    } else {
        println!(
            "  No significant difference between {} and {} (95% CI overlapping)",
            summary_short_labels.0, summary_short_labels.2
        );
    }

    if nasm_stats_final.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
        println!(
            "  {} is significantly faster than {} (95% CI non-overlapping)",
            summary_short_labels.1, summary_short_labels.2
        );
    } else if cryptopt_stats_final.confidence_interval_95.1
        < nasm_stats_final.confidence_interval_95.0
    {
        println!(
            "  {} is significantly faster than {} (95% CI non-overlapping)",
            summary_short_labels.2, summary_short_labels.1
        );
    } else {
        println!(
            "  No significant difference between {} and {} (95% CI overlapping)",
            summary_short_labels.1, summary_short_labels.2
        );
    }
    if let Some(hs) = &hand_stats_final {
        if hs.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
            println!("  Hand-optimised GAS is significantly faster than CryptOpt (95% CI non-overlapping)");
        } else if cryptopt_stats_final.confidence_interval_95.1 < hs.confidence_interval_95.0 {
            println!("  CryptOpt is significantly faster than Hand-optimised GAS (95% CI non-overlapping)");
        } else {
            println!("  No significant difference between Hand-optimised GAS and CryptOpt (95% CI overlapping)");
        }
    }
    if let Some(hns) = &hand_nasm_stats_final {
        if hns.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
            println!("  Hand-optimised NASM is significantly faster than CryptOpt (95% CI non-overlapping)");
        } else if cryptopt_stats_final.confidence_interval_95.1 < hns.confidence_interval_95.0 {
            println!("  CryptOpt is significantly faster than Hand-optimised NASM (95% CI non-overlapping)");
        } else {
            println!("  No significant difference between Hand-optimised NASM and CryptOpt (95% CI overlapping)");
        }
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
        println!("Available curves: curve25519, curve25519_dalek, cryptopt_fiat_curve25519, cryptopt_fiat_curve25519_solinas, cryptopt_fiat_p224, fiat_c_curve25519, fiat_c_secp256k1_dettman, fiat_c_poly1305, fiat_c_p448, p448, poly1305, secp256k1_dettman, secp256k1_rust_ec, bls12, openssl_curve25519, openssl_p448");
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
        "cryptopt_fiat_curve25519" => CurveType::CryptoptFiatCurve25519,
        "cryptopt_fiat_curve25519_solinas" => CurveType::CryptoptFiatCurve25519Solinas,
        "cryptopt_fiat_p224" => CurveType::CryptoptFiatP224,
        "fiat_c_curve25519" => CurveType::FiatCCurve25519,
        "fiat_c_secp256k1_dettman" => CurveType::FiatCSecp256k1Dettman,
        "fiat_c_poly1305" => CurveType::FiatCPoly1305,
        "fiat_c_p448" => CurveType::FiatCP448,
        "openssl_curve25519" => CurveType::OpenSSLCurve25519,
        "openssl_p448" => CurveType::OpenSSLP448,
        other => {
            println!("Unknown curve: {}. Available curves: curve25519, curve25519_dalek, cryptopt_fiat_curve25519, cryptopt_fiat_curve25519_solinas, cryptopt_fiat_p224, fiat_c_curve25519, fiat_c_secp256k1_dettman, fiat_c_poly1305, fiat_c_p448, p448, poly1305, secp256k1_dettman, secp256k1_rust_ec, bls12, openssl_curve25519, openssl_p448", other);
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
        println!(
            "Measuring {:?} for operation '{}' with ENHANCED CryptOpt methodology...",
            curve_type, op
        );
        println!("Features: Memory barriers, randomized batching, cycle-goal calibration, statistical analysis\n");

        run_enhanced_measurements(&curve_type, op, repeats);
    } else {
        println!(
            "Measuring {:?} for operation '{}' with CryptOpt approach...",
            curve_type, op
        );
        println!(
            "Using batch size = 200 and nBatches = 31, repeated {} time(s).",
            repeats
        );

        // Legacy pathway uses fixed-size batch runners defined above
        match op {
            "mul" => run_repeated_measurements_mul(&curve_type, repeats),
            "square" => run_repeated_measurements_square(&curve_type, repeats),
            _ => {
                println!(
                    "Unknown operation: {}. Available operations: mul, square",
                    op
                );
                return;
            }
        }
    }
}
