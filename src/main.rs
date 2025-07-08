use rand::Rng;
use rand::thread_rng;
use core::arch::x86_64::_rdtsc;
use std::env;

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
        // // Square functions
        // pub fn rust_fiat_p448_solinas_carry_square(arg0: *mut u64, arg1: *const u64);
        // pub fn rust_fiat_p448_solinas_carry_square_nasm(arg0: *mut u64, arg1: *const u64);
        // pub fn rust_fiat_p448_solinas_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

mod fiat_c_p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_p448_solinas_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_p448_solinas_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_p448_solinas_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
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
}

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
                fiat_c_p448::fiat_c_p448_solinas_carry_mul_CryptOpt
            ),
            CurveType::OpenSSLCurve25519 => Function::U64MulFive(
                openssl_curve25519::open_ssl_curve25519_fe51_mul,
                openssl_curve25519::open_ssl_curve25519_fe51_mul_nasm,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul,
                openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul_nasm,
                openssl_curve25519::open_ssl_curve25519_fe51_mul_CryptOpt
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
            // CurveType::P448 => Function::U64Square(
            //     p448::rust_fiat_p448_solinas_carry_square,
            //     p448::rust_fiat_p448_solinas_carry_square_nasm,
            //     p448::rust_fiat_p448_solinas_carry_square_CryptOpt
            // ),
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
// Measurement functions for U64 multiplication
fn measure_one_batch_u64_mul(
    func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    out: &mut [u64],
    in0: &[u64],
    in1: &[u64],
    batch_size: usize,
) -> u64 {
    unsafe {
        _rdtsc();
        let start = _rdtsc();
        for _ in 0..batch_size {
            func(out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
        }
        let end = _rdtsc();
        end - start
    }
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
    unsafe {
        _rdtsc();
        let start = _rdtsc();
        for _ in 0..batch_size {
            func(out.as_mut_ptr(), input.as_ptr());
        }
        let end = _rdtsc();
        end - start
    }
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
            let llc_mom = median(&llc_results);
            let nasm_mom = median(&nasm_results);
            let cryptopt_mom = median(&cryptopt_results);
            println!("\n=== Final 'Median of Medians' (multiply) after {} runs ===", repeats);
            println!("GAS format ASM: {:?}", llc_mom);
            println!("NASM format ASM: {:?}", nasm_mom);
            println!("CryptOpt format ASM: {:?}", cryptopt_mom);
            let diff_cryptopt_llc = ((llc_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (median-of-medians).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (median-of-medians).", diff_cryptopt_llc.abs());
            }
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (median-of-medians).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (median-of-medians).", diff_cryptopt_nasm.abs());
            }
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
            let llc_mom = median(&llc_results);
            let nasm_mom = median(&nasm_results);
            let hand_optmised_mom = median(&hand_optmised_results);
            let cryptopt_mom = median(&cryptopt_results);
            println!("\n=== Final 'Median of Medians' (multiply) after {} runs ===", repeats);
            println!("GAS format ASM: {:?}", llc_mom);
            println!("NASM format ASM: {:?}", nasm_mom);
            println!("Hand-optimised ASM: {:?}", hand_optmised_mom);
            println!("CryptOpt format ASM: {:?}", cryptopt_mom);
            
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_hand = ((hand_optmised_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (median-of-medians).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (median-of-medians).", diff_cryptopt_llc.abs());
            }
            
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (median-of-medians).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (median-of-medians).", diff_cryptopt_nasm.abs());
            }
            
            if diff_cryptopt_hand > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised (median-of-medians).", diff_cryptopt_hand);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised (median-of-medians).", diff_cryptopt_hand.abs());
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
            let llc_mom = median(&llc_results);
            let nasm_mom = median(&nasm_results);
            let hand_optmised_mom = median(&hand_optmised_results);
            let hand_optmised_nasm_mom = median(&hand_optmised_nasm_results);
            let cryptopt_mom = median(&cryptopt_results);
            println!("\n=== Final 'Median of Medians' (multiply) after {} runs ===", repeats);
            println!("GAS format ASM: {:?}", llc_mom);
            println!("NASM format ASM: {:?}", nasm_mom);
            println!("Hand-optimised ASM: {:?}", hand_optmised_mom);
            println!("Hand-optimised NASM ASM: {:?}", hand_optmised_nasm_mom);
            println!("CryptOpt format ASM: {:?}", cryptopt_mom);
            
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_hand = ((hand_optmised_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_hand_nasm = ((hand_optmised_nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (median-of-medians).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (median-of-medians).", diff_cryptopt_llc.abs());
            }
            
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (median-of-medians).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (median-of-medians).", diff_cryptopt_nasm.abs());
            }
            
            if diff_cryptopt_hand > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised (median-of-medians).", diff_cryptopt_hand);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised (median-of-medians).", diff_cryptopt_hand.abs());
            }
            
            if diff_cryptopt_hand_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised NASM (median-of-medians).", diff_cryptopt_hand_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised NASM (median-of-medians).", diff_cryptopt_hand_nasm.abs());
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
            let llc_mom = median(&llc_results);
            let nasm_mom = median(&nasm_results);
            let cryptopt_mom = median(&cryptopt_results);
            println!("\n=== Final 'Median of Medians' (square) after {} runs ===", repeats);
            println!("GAS format ASM: {:?}", llc_mom);
            println!("NASM format ASM: {:?}", nasm_mom);
            println!("CryptOpt format ASM: {:?}", cryptopt_mom);
            let diff_cryptopt_llc = ((llc_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (median-of-medians).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (median-of-medians).", diff_cryptopt_llc.abs());
            }
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (median-of-medians).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (median-of-medians).", diff_cryptopt_nasm.abs());
            }
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
            let llc_mom = median(&llc_results);
            let nasm_mom = median(&nasm_results);
            let hand_optmised_mom = median(&hand_optmised_results);
            let cryptopt_mom = median(&cryptopt_results);
            println!("\n=== Final 'Median of Medians' (square) after {} runs ===", repeats);
            println!("GAS format ASM: {:?}", llc_mom);
            println!("NASM format ASM: {:?}", nasm_mom);
            println!("Hand-optimised ASM: {:?}", hand_optmised_mom);
            println!("CryptOpt format ASM: {:?}", cryptopt_mom);
            
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_hand = ((hand_optmised_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (median-of-medians).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (median-of-medians).", diff_cryptopt_llc.abs());
            }
            
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (median-of-medians).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (median-of-medians).", diff_cryptopt_nasm.abs());
            }
            
            if diff_cryptopt_hand > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised (median-of-medians).", diff_cryptopt_hand);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised (median-of-medians).", diff_cryptopt_hand.abs());
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
            let llc_mom = median(&llc_results);
            let nasm_mom = median(&nasm_results);
            let hand_optmised_mom = median(&hand_optmised_results);
            let hand_optmised_nasm_mom = median(&hand_optmised_nasm_results);
            let cryptopt_mom = median(&cryptopt_results);
            println!("\n=== Final 'Median of Medians' (square) after {} runs ===", repeats);
            println!("GAS format ASM: {:?}", llc_mom);
            println!("NASM format ASM: {:?}", nasm_mom);
            println!("Hand-optimised ASM: {:?}", hand_optmised_mom);
            println!("Hand-optimised NASM ASM: {:?}", hand_optmised_nasm_mom);
            println!("CryptOpt format ASM: {:?}", cryptopt_mom);
            
            // Compare all relative to CryptOpt
            let diff_cryptopt_llc = ((llc_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_hand = ((hand_optmised_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            let diff_cryptopt_hand_nasm = ((hand_optmised_nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
            
            if diff_cryptopt_llc > 0.0 {
                println!("CryptOpt is {:.2}% faster than GAS (median-of-medians).", diff_cryptopt_llc);
            } else {
                println!("CryptOpt is {:.2}% slower than GAS (median-of-medians).", diff_cryptopt_llc.abs());
            }
            
            if diff_cryptopt_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than NASM (median-of-medians).", diff_cryptopt_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than NASM (median-of-medians).", diff_cryptopt_nasm.abs());
            }
            
            if diff_cryptopt_hand > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised (median-of-medians).", diff_cryptopt_hand);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised (median-of-medians).", diff_cryptopt_hand.abs());
            }
            
            if diff_cryptopt_hand_nasm > 0.0 {
                println!("CryptOpt is {:.2}% faster than Hand-optimised NASM (median-of-medians).", diff_cryptopt_hand_nasm);
            } else {
                println!("CryptOpt is {:.2}% slower than Hand-optimised NASM (median-of-medians).", diff_cryptopt_hand_nasm.abs());
            }
        }
    }
}

// -----------------------------------------------------------------------------
// Main entry point: parse command-line arguments.
// Usage: cargo run <curve_name> <operation> [repeat_count]
// where <operation> is either "mul" or "square"
fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 || args.len() > 4 {
        println!("Usage: cargo run <curve_name> <operation> [repeat_count]");
        println!("Available curves: curve25519, curve25519_dalek, fiat_c_curve25519, fiat_c_secp256k1_dettman, fiat_c_poly1305, fiat_c_p448, p448, poly1305, secp256k1_dettman, secp256k1_rust_ec, bls12, openssl_curve25519");
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
        other => {
            println!("Unknown curve: {}. Available curves: curve25519, curve25519_dalek, fiat_c_curve25519, fiat_c_secp256k1_dettman, fiat_c_poly1305, fiat_c_p448, p448, poly1305, secp256k1_dettman, secp256k1_rust_ec, bls12, openssl_curve25519", other);
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

    println!("Measuring {:?} for operation '{}' with CryptOpt approach...", curve_type, op);
    println!("Using batch size = 200 and nBatches = 31, repeated {} time(s).\n", repeats);

    match op {
        "mul" => run_repeated_measurements_mul(&curve_type, repeats),
        "square" => run_repeated_measurements_square(&curve_type, repeats),
        _ => {
            println!("Unknown operation: {}. Available operations: mul, square", op);
            return;
        }
    }
}
