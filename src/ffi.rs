pub mod curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_curve25519_carry_mul_vec(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_curve25519_carry_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_curve25519_carry_mul_CryptOpt(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn rust_fiat_curve25519_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_curve25519_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_curve25519_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);

    }
}

pub mod curve25519_dalek {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        // Multiply functions
        pub fn curve25519_dalek_mul_vec(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn curve25519_dalek_mul_vec_nasm(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn curve25519_dalek_mul_CryptOpt(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn curve25519_dalek_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn curve25519_dalek_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn curve25519_dalek_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_p448_solinas_carry_mul_vec(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_p448_solinas_carry_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_p448_solinas_carry_mul_CryptOpt(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn rust_fiat_p448_solinas_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_p448_solinas_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_p448_solinas_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod fiat_c_p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_p448_solinas_carry_mul_vec(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_p448_solinas_carry_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_p448_carry_mul_CryptOpt(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn fiat_c_p448_solinas_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_p448_solinas_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_p448_solinas_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod openssl_curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 5;
    extern "C" {
        // Multiply functions
        pub fn open_ssl_curve25519_fe51_mul_vec(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn open_ssl_curve25519_fe51_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn open_ssl_curve25519_hand_optmised_fe51_mul(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn open_ssl_curve25519_hand_optmised_fe51_mul_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn open_ssl_curve25519_fe51_mul_CryptOpt(
            arg0: *mut u64,
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

pub mod openssl_p256 {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn open_ssl_p256_mul_mont(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn open_ssl_p256_sqr_mont(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod fiat_c_curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 4;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_curve25519_carry_mul_vec(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_curve25519_carry_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_curve25519_carry_mul_CryptOpt(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn fiat_c_curve25519_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_curve25519_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_curve25519_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_curve25519_generated {
    pub const LOOSE_BOUND: u64 = 0x18000000000000;
    pub const SIZE: usize = 5;
    extern "C" {
        pub fn fiat_curve25519_carry_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_curve25519_carry_mul_clang(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_curve25519_carry_mul_enhanced(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_curve25519_carry_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_curve25519_carry_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_curve25519_carry_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_curve25519_carry_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_curve25519_solinas {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn fiat_curve25519_solinas_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_curve25519_solinas_mul_clang(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_curve25519_solinas_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_curve25519_solinas_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_curve25519_solinas_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_curve25519_solinas_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_p224 {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn fiat_p224_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p224_mul_clang(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p224_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p224_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p224_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p224_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_p256 {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn fiat_p256_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p256_mul_clang(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p256_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p256_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p256_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p256_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_p384 {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 6;
    extern "C" {
        pub fn fiat_p384_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p384_mul_clang(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p384_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p384_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p384_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p384_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_p434 {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 7;
    extern "C" {
        pub fn fiat_p434_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p434_mul_clang(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p434_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p434_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p434_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p434_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_p448_solinas {
    pub const LOOSE_BOUND: u64 = 0x0300_0000_0000_0000;
    pub const SIZE: usize = 8;
    extern "C" {
        pub fn fiat_p448_solinas_carry_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p448_solinas_carry_mul_clang(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_p448_solinas_carry_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p448_solinas_carry_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p448_solinas_carry_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p448_solinas_carry_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_poly1305 {
    pub const SIZE: usize = 3;
    extern "C" {
        pub fn fiat_poly1305_carry_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_poly1305_carry_mul_clang(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_poly1305_carry_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_poly1305_carry_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_poly1305_carry_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_poly1305_carry_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_p521 {
    pub const SIZE: usize = 9;
    pub const LOOSE_BOUNDS: [u64; SIZE] = [
        0x0c00_0000_0000_0000,
        0x0c00_0000_0000_0000,
        0x0c00_0000_0000_0000,
        0x0c00_0000_0000_0000,
        0x0c00_0000_0000_0000,
        0x0c00_0000_0000_0000,
        0x0c00_0000_0000_0000,
        0x0c00_0000_0000_0000,
        0x0600_0000_0000_0000,
    ];
    extern "C" {
        pub fn fiat_p521_carry_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p521_carry_mul_clang(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p521_carry_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_p521_carry_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p521_carry_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_p521_carry_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod poly1305 {
    pub const SIZE: usize = 3;
    pub const LOOSE_BOUNDS: [u64; SIZE] = [0x0300_0000_0000, 0x0180_0000_0000, 0x0180_0000_0000];
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_poly1305_carry_mul_vec(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_poly1305_carry_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_poly1305_carry_mul_CryptOpt(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn rust_fiat_poly1305_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_poly1305_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_poly1305_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod fiat_c_poly1305 {
    pub const SIZE: usize = 3;
    extern "C" {
        // Multiply functions
        pub fn fiat_c_poly1305_carry_mul_vec(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_poly1305_carry_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_poly1305_carry_mul_CryptOpt(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // Square functions
        pub fn fiat_c_poly1305_carry_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_poly1305_carry_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_poly1305_carry_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_secp256k1_dettman {
    pub const SIZE: usize = 5;
    pub const LOOSE_BOUNDS: [u64; SIZE] = [
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1fffffffffffe,
    ];
    extern "C" {
        pub fn fiat_secp256k1_dettman_mul_gcc(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_secp256k1_dettman_mul_clang(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_secp256k1_dettman_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_secp256k1_dettman_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_secp256k1_dettman_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_secp256k1_dettman_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod cryptopt_fiat_secp256k1_montgomery {
    pub const LOOSE_BOUND: u64 = u64::MAX;
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn fiat_secp256k1_montgomery_mul_gcc(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_secp256k1_montgomery_mul_clang(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_secp256k1_montgomery_mul(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_secp256k1_montgomery_square_gcc(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_secp256k1_montgomery_square_clang(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_secp256k1_montgomery_square(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod secp256k1_dettman {
    pub const SIZE: usize = 5;
    pub const LOOSE_BOUNDS: [u64; SIZE] = [
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1fffffffffffe,
    ];
    extern "C" {
        // Multiply functions
        pub fn rust_fiat_secp256k1_dettman_mul_vec(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_secp256k1_dettman_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_fiat_secp256k1_dettman_mul_CryptOpt(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        // // Square functions
        pub fn rust_fiat_secp256k1_dettman_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_secp256k1_dettman_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_fiat_secp256k1_dettman_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod rust_ec_secp256k1 {
    pub const SIZE: usize = 5;
    pub const LOOSE_BOUNDS: [u64; SIZE] = [
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1fffffffffffe,
    ];
    extern "C" {
        // Multiply functions
        pub fn rust_ec_secp256k1_mul_inner_vec(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_ec_secp256k1_mul_inner_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn rust_ec_secp256k1_mul_inner_CryptOpt(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );

        // Square functions
        pub fn rust_ec_secp256k1_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn rust_ec_secp256k1_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn rust_ec_secp256k1_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod fiat_c_secp256k1_dettman {
    pub const SIZE: usize = 5;
    pub const LOOSE_BOUNDS: [u64; SIZE] = [
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1ffffffffffffe,
        0x1fffffffffffe,
    ];
    extern "C" {
        // Multiply functions
        pub fn fiat_c_secp256k1_dettman_mul_vec(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn fiat_c_secp256k1_dettman_mul_vec_nasm(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );
        pub fn fiat_c_secp256k1_dettman_mul_CryptOpt(
            arg0: *mut u64,
            arg1: *const u64,
            arg2: *const u64,
        );

        // Square functions
        pub fn fiat_c_secp256k1_dettman_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_secp256k1_dettman_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn fiat_c_secp256k1_dettman_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}

pub mod bls12 {
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
pub mod openssl_p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000;
    pub const SIZE: usize = 8;
    extern "C" {
        // Multiply functions
        pub fn openssl_p448_mul_vec(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn openssl_p448_mul_vec_nasm(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        pub fn openssl_p448_mul_CryptOpt(arg0: *mut u64, arg1: *const u64, arg2: *const u64);
        // Square functions
        pub fn openssl_p448_square_vec(arg0: *mut u64, arg1: *const u64);
        pub fn openssl_p448_square_vec_nasm(arg0: *mut u64, arg1: *const u64);
        pub fn openssl_p448_square_CryptOpt(arg0: *mut u64, arg1: *const u64);
    }
}
