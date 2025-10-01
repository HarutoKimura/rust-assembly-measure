use crate::ffi::{
    bls12, cryptopt_fiat_curve25519_generated, cryptopt_fiat_curve25519_solinas,
    cryptopt_fiat_p224, cryptopt_fiat_p256, cryptopt_fiat_p384, cryptopt_fiat_p434,
    cryptopt_fiat_p448_solinas, cryptopt_fiat_p521, cryptopt_fiat_poly1305,
    cryptopt_fiat_secp256k1_dettman, cryptopt_fiat_secp256k1_montgomery, curve25519,
    curve25519_dalek, fiat_c_curve25519, fiat_c_p448, fiat_c_poly1305, fiat_c_secp256k1_dettman,
    openssl_curve25519, openssl_p256, openssl_p448, p448, poly1305, rust_ec_secp256k1,
    secp256k1_dettman,
};

#[derive(Clone, Copy)]
pub enum BoundSpec {
    Uniform(u64),
    PerLimb(&'static [u64]),
}

impl BoundSpec {
    pub fn as_uniform(&self) -> Option<u64> {
        match self {
            BoundSpec::Uniform(b) => Some(*b),
            BoundSpec::PerLimb(_) => None,
        }
    }
}

#[derive(Clone, Copy)]
pub enum Function {
    U64Mul(
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    ),
    #[allow(dead_code)]
    U64MulFour(
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    ),
    U64Square(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
    ),
    U64SquareFour(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
    ),
    UsizeMul(
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    ),
    U64MulFive(
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    ),
    U64SquareFive(
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
        unsafe extern "C" fn(*mut u64, *const u64),
    ),
}

#[derive(Clone, Copy)]
pub struct FunctionLabels {
    display: [&'static str; 5],
    short: [&'static str; 5],
    len: usize,
}

impl FunctionLabels {
    pub const fn new3(
        display: (&'static str, &'static str, &'static str),
        short: (&'static str, &'static str, &'static str),
    ) -> Self {
        Self {
            display: [display.0, display.1, display.2, "", ""],
            short: [short.0, short.1, short.2, "", ""],
            len: 3,
        }
    }

    pub const fn new4(
        display: (&'static str, &'static str, &'static str, &'static str),
        short: (&'static str, &'static str, &'static str, &'static str),
    ) -> Self {
        Self {
            display: [display.0, display.1, display.2, display.3, ""],
            short: [short.0, short.1, short.2, short.3, ""],
            len: 4,
        }
    }

    pub const fn new5(
        display: (
            &'static str,
            &'static str,
            &'static str,
            &'static str,
            &'static str,
        ),
        short: (
            &'static str,
            &'static str,
            &'static str,
            &'static str,
            &'static str,
        ),
    ) -> Self {
        Self {
            display: [display.0, display.1, display.2, display.3, display.4],
            short: [short.0, short.1, short.2, short.3, short.4],
            len: 5,
        }
    }

    pub const fn len(&self) -> usize {
        self.len
    }

    pub const fn display(&self, idx: usize) -> &'static str {
        self.display[idx]
    }

    pub const fn short(&self, idx: usize) -> &'static str {
        self.short[idx]
    }

    pub const DEFAULT: Self = Self::new3(
        ("GAS Format", "NASM Format", "CryptOpt Format"),
        ("GAS", "NASM", "CryptOpt"),
    );
}

#[derive(Clone, Copy)]
pub struct CurveSpec {
    pub size: usize,
    pub bounds: BoundSpec,
    pub mul: Function,
    pub square: Option<Function>,
    pub mul_labels: FunctionLabels,
    pub square_labels: FunctionLabels,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum CurveType {
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
    CryptoptFiatP256,
    CryptoptFiatP384,
    CryptoptFiatP434,
    CryptoptFiatP448Solinas,
    CryptoptFiatSecp256k1Dettman,
    CryptoptFiatSecp256k1Montgomery,
    CryptoptFiatPoly1305,
    CryptoptFiatP521,
    FiatCSecp256k1Dettman,
    FiatCPoly1305,
    FiatCP448,
    OpenSSLCurve25519,
    OpenSSLP448,
}

const DEFAULT_LABELS: FunctionLabels = FunctionLabels::DEFAULT;
const BASELINE_SHORT: (&'static str, &'static str, &'static str) = ("Clang", "GCC", "CryptOpt");

const fn baseline_labels(
    clang: &'static str,
    gcc: &'static str,
    cryptopt: &'static str,
) -> FunctionLabels {
    FunctionLabels::new3((clang, gcc, cryptopt), BASELINE_SHORT)
}

impl CurveType {
    pub fn name(&self) -> &'static str {
        match self {
            CurveType::Curve25519 => "curve25519",
            CurveType::Curve25519Dalek => "curve25519_dalek",
            CurveType::P448 => "p448",
            CurveType::Poly1305 => "poly1305",
            CurveType::Secp256k1Dettman => "secp256k1_dettman",
            CurveType::Secp256k1RustEc => "secp256k1_rust_ec",
            CurveType::Bls12 => "bls12",
            CurveType::FiatCCurve25519 => "fiat_c_curve25519",
            CurveType::CryptoptFiatCurve25519 => "cryptopt_fiat_curve25519",
            CurveType::CryptoptFiatCurve25519Solinas => "cryptopt_fiat_curve25519_solinas",
            CurveType::CryptoptFiatP224 => "cryptopt_fiat_p224",
            CurveType::CryptoptFiatP256 => "cryptopt_fiat_p256",
            CurveType::CryptoptFiatP384 => "cryptopt_fiat_p384",
            CurveType::CryptoptFiatP434 => "cryptopt_fiat_p434",
            CurveType::CryptoptFiatP448Solinas => "cryptopt_fiat_p448_solinas",
            CurveType::CryptoptFiatSecp256k1Dettman => "cryptopt_fiat_secp256k1_dettman",
            CurveType::CryptoptFiatSecp256k1Montgomery => "cryptopt_fiat_secp256k1_montgomery",
            CurveType::CryptoptFiatPoly1305 => "cryptopt_fiat_poly1305",
            CurveType::CryptoptFiatP521 => "cryptopt_fiat_p521",
            CurveType::FiatCSecp256k1Dettman => "fiat_c_secp256k1_dettman",
            CurveType::FiatCPoly1305 => "fiat_c_poly1305",
            CurveType::FiatCP448 => "fiat_c_p448",
            CurveType::OpenSSLCurve25519 => "openssl_curve25519",
            CurveType::OpenSSLP448 => "openssl_p448",
        }
    }

    pub fn spec(&self) -> CurveSpec {
        match self {
            CurveType::Curve25519 => CurveSpec {
                size: curve25519::SIZE,
                bounds: BoundSpec::Uniform(curve25519::LOOSE_BOUND),
                mul: Function::U64Mul(
                    curve25519::rust_fiat_curve25519_carry_mul_vec,
                    curve25519::rust_fiat_curve25519_carry_mul_vec_nasm,
                    curve25519::rust_fiat_curve25519_carry_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    curve25519::rust_fiat_curve25519_carry_square_vec,
                    curve25519::rust_fiat_curve25519_carry_square_vec_nasm,
                    curve25519::rust_fiat_curve25519_carry_square_CryptOpt,
                )),
                mul_labels: FunctionLabels::new5(
                    (
                        "GAS Format",
                        "NASM Format",
                        "Hand-Optimised GAS",
                        "Hand-Optimised NASM",
                        "CryptOpt Format",
                    ),
                    ("GAS", "NASM", "Hand", "Hand-NASM", "CryptOpt"),
                ),
                square_labels: FunctionLabels::new5(
                    (
                        "GAS Format",
                        "NASM Format",
                        "Hand-Optimised GAS",
                        "Hand-Optimised NASM",
                        "CryptOpt Format",
                    ),
                    ("GAS", "NASM", "Hand", "Hand-NASM", "CryptOpt"),
                ),
            },
            CurveType::Curve25519Dalek => CurveSpec {
                size: curve25519_dalek::SIZE,
                bounds: BoundSpec::Uniform(curve25519_dalek::LOOSE_BOUND),
                mul: Function::U64Mul(
                    curve25519_dalek::curve25519_dalek_mul_vec,
                    curve25519_dalek::curve25519_dalek_mul_vec_nasm,
                    curve25519_dalek::curve25519_dalek_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    curve25519_dalek::curve25519_dalek_square_vec,
                    curve25519_dalek::curve25519_dalek_square_vec_nasm,
                    curve25519_dalek::curve25519_dalek_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::P448 => CurveSpec {
                size: p448::SIZE,
                bounds: BoundSpec::Uniform(p448::LOOSE_BOUND),
                mul: Function::U64Mul(
                    p448::rust_fiat_p448_solinas_carry_mul_vec,
                    p448::rust_fiat_p448_solinas_carry_mul_vec_nasm,
                    p448::rust_fiat_p448_solinas_carry_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    p448::rust_fiat_p448_solinas_carry_square_vec,
                    p448::rust_fiat_p448_solinas_carry_square_vec_nasm,
                    p448::rust_fiat_p448_solinas_carry_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::Poly1305 => CurveSpec {
                size: poly1305::SIZE,
                bounds: BoundSpec::PerLimb(&poly1305::LOOSE_BOUNDS),
                mul: Function::U64Mul(
                    poly1305::rust_fiat_poly1305_carry_mul_vec,
                    poly1305::rust_fiat_poly1305_carry_mul_vec_nasm,
                    poly1305::rust_fiat_poly1305_carry_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    poly1305::rust_fiat_poly1305_carry_square_vec,
                    poly1305::rust_fiat_poly1305_carry_square_vec_nasm,
                    poly1305::rust_fiat_poly1305_carry_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::Secp256k1Dettman => CurveSpec {
                size: secp256k1_dettman::SIZE,
                bounds: BoundSpec::PerLimb(&secp256k1_dettman::LOOSE_BOUNDS),
                mul: Function::U64Mul(
                    secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_vec,
                    secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_vec_nasm,
                    secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    secp256k1_dettman::rust_fiat_secp256k1_dettman_square_vec,
                    secp256k1_dettman::rust_fiat_secp256k1_dettman_square_vec_nasm,
                    secp256k1_dettman::rust_fiat_secp256k1_dettman_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::Secp256k1RustEc => CurveSpec {
                size: rust_ec_secp256k1::SIZE,
                bounds: BoundSpec::PerLimb(&rust_ec_secp256k1::LOOSE_BOUNDS),
                mul: Function::U64Mul(
                    rust_ec_secp256k1::rust_ec_secp256k1_mul_inner_vec,
                    rust_ec_secp256k1::rust_ec_secp256k1_mul_inner_vec_nasm,
                    rust_ec_secp256k1::rust_ec_secp256k1_mul_inner_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    rust_ec_secp256k1::rust_ec_secp256k1_square_vec,
                    rust_ec_secp256k1::rust_ec_secp256k1_square_vec_nasm,
                    rust_ec_secp256k1::rust_ec_secp256k1_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::Bls12 => CurveSpec {
                size: bls12::SIZE,
                bounds: BoundSpec::Uniform(bls12::LOOSE_BOUND),
                mul: Function::UsizeMul(
                    bls12::bls12_mul_vec,
                    bls12::bls12_mul_vec_nasm,
                    bls12::bls12_mul_CryptOpt,
                ),
                square: None,
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::FiatCCurve25519 => CurveSpec {
                size: fiat_c_curve25519::SIZE,
                bounds: BoundSpec::Uniform(fiat_c_curve25519::LOOSE_BOUND),
                mul: Function::U64Mul(
                    fiat_c_curve25519::fiat_c_curve25519_carry_mul_vec,
                    fiat_c_curve25519::fiat_c_curve25519_carry_mul_vec_nasm,
                    fiat_c_curve25519::fiat_c_curve25519_carry_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    fiat_c_curve25519::fiat_c_curve25519_carry_square_vec,
                    fiat_c_curve25519::fiat_c_curve25519_carry_square_vec_nasm,
                    fiat_c_curve25519::fiat_c_curve25519_carry_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::CryptoptFiatCurve25519 => CurveSpec {
                size: cryptopt_fiat_curve25519_generated::SIZE,
                bounds: BoundSpec::Uniform(cryptopt_fiat_curve25519_generated::LOOSE_BOUND),
                mul: Function::U64MulFive(
                    cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_mul_clang,
                    cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_mul_gcc,
                    openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul,
                    cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_mul_enhanced,
                    cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_mul,
                ),
                square: Some(Function::U64SquareFour(
                    cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_square_clang,
                    cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_square_gcc,
                    openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_square,
                    cryptopt_fiat_curve25519_generated::fiat_curve25519_carry_square,
                )),
                mul_labels: FunctionLabels::new5(
                    (
                        "Clang Baseline",
                        "GCC Baseline",
                        "OpenSSL Hand-Optimised",
                        "CryptOpt Enhanced",
                        "CryptOpt Ratio12750",
                    ),
                    ("Clang", "GCC", "Hand", "Enhanced", "CryptOpt"),
                ),
                square_labels: FunctionLabels::new4(
                    (
                        "Clang Baseline",
                        "GCC Baseline",
                        "OpenSSL Hand-Optimised",
                        "CryptOpt Ratio12993",
                    ),
                    ("Clang", "GCC", "Hand", "CryptOpt"),
                ),
            },
            CurveType::CryptoptFiatCurve25519Solinas => CurveSpec {
                size: cryptopt_fiat_curve25519_solinas::SIZE,
                bounds: BoundSpec::Uniform(cryptopt_fiat_curve25519_solinas::LOOSE_BOUND),
                mul: Function::U64Mul(
                    cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_mul_clang,
                    cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_mul_gcc,
                    cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_square_clang,
                    cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_square_gcc,
                    cryptopt_fiat_curve25519_solinas::fiat_curve25519_solinas_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio18494",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio15409",
                ),
            },
            CurveType::CryptoptFiatP224 => CurveSpec {
                size: cryptopt_fiat_p224::SIZE,
                bounds: BoundSpec::Uniform(cryptopt_fiat_p224::LOOSE_BOUND),
                mul: Function::U64Mul(
                    cryptopt_fiat_p224::fiat_p224_mul_clang,
                    cryptopt_fiat_p224::fiat_p224_mul_gcc,
                    cryptopt_fiat_p224::fiat_p224_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_p224::fiat_p224_square_clang,
                    cryptopt_fiat_p224::fiat_p224_square_gcc,
                    cryptopt_fiat_p224::fiat_p224_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio16447",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio14731",
                ),
            },
            CurveType::CryptoptFiatP256 => CurveSpec {
                size: cryptopt_fiat_p256::SIZE,
                bounds: BoundSpec::Uniform(cryptopt_fiat_p256::LOOSE_BOUND),
                mul: Function::U64MulFour(
                    cryptopt_fiat_p256::fiat_p256_mul_clang,
                    cryptopt_fiat_p256::fiat_p256_mul_gcc,
                    openssl_p256::open_ssl_p256_mul_mont,
                    cryptopt_fiat_p256::fiat_p256_mul,
                ),
                square: Some(Function::U64SquareFour(
                    cryptopt_fiat_p256::fiat_p256_square_clang,
                    cryptopt_fiat_p256::fiat_p256_square_gcc,
                    openssl_p256::open_ssl_p256_sqr_mont,
                    cryptopt_fiat_p256::fiat_p256_square,
                )),
                mul_labels: FunctionLabels::new4(
                    (
                        "Clang Baseline",
                        "GCC Baseline",
                        "OpenSSL Hand-Optimised",
                        "CryptOpt Ratio17527",
                    ),
                    ("Clang", "GCC", "Hand", "CryptOpt"),
                ),
                square_labels: FunctionLabels::new4(
                    (
                        "Clang Baseline",
                        "GCC Baseline",
                        "OpenSSL Hand-Optimised",
                        "CryptOpt Ratio17019",
                    ),
                    ("Clang", "GCC", "Hand", "CryptOpt"),
                ),
            },
            CurveType::CryptoptFiatP384 => CurveSpec {
                size: cryptopt_fiat_p384::SIZE,
                bounds: BoundSpec::Uniform(cryptopt_fiat_p384::LOOSE_BOUND),
                mul: Function::U64Mul(
                    cryptopt_fiat_p384::fiat_p384_mul_clang,
                    cryptopt_fiat_p384::fiat_p384_mul_gcc,
                    cryptopt_fiat_p384::fiat_p384_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_p384::fiat_p384_square_clang,
                    cryptopt_fiat_p384::fiat_p384_square_gcc,
                    cryptopt_fiat_p384::fiat_p384_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio17232",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio16784",
                ),
            },
            CurveType::CryptoptFiatP434 => CurveSpec {
                size: cryptopt_fiat_p434::SIZE,
                bounds: BoundSpec::Uniform(cryptopt_fiat_p434::LOOSE_BOUND),
                mul: Function::U64Mul(
                    cryptopt_fiat_p434::fiat_p434_mul_clang,
                    cryptopt_fiat_p434::fiat_p434_mul_gcc,
                    cryptopt_fiat_p434::fiat_p434_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_p434::fiat_p434_square_clang,
                    cryptopt_fiat_p434::fiat_p434_square_gcc,
                    cryptopt_fiat_p434::fiat_p434_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio19146",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio18549",
                ),
            },
            CurveType::CryptoptFiatP448Solinas => CurveSpec {
                size: cryptopt_fiat_p448_solinas::SIZE,
                bounds: BoundSpec::Uniform(cryptopt_fiat_p448_solinas::LOOSE_BOUND),
                mul: Function::U64Mul(
                    cryptopt_fiat_p448_solinas::fiat_p448_solinas_carry_mul_clang,
                    cryptopt_fiat_p448_solinas::fiat_p448_solinas_carry_mul_gcc,
                    cryptopt_fiat_p448_solinas::fiat_p448_solinas_carry_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_p448_solinas::fiat_p448_solinas_carry_square_clang,
                    cryptopt_fiat_p448_solinas::fiat_p448_solinas_carry_square_gcc,
                    cryptopt_fiat_p448_solinas::fiat_p448_solinas_carry_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio13296",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio11436",
                ),
            },
            CurveType::CryptoptFiatSecp256k1Dettman => CurveSpec {
                size: cryptopt_fiat_secp256k1_dettman::SIZE,
                bounds: BoundSpec::PerLimb(&cryptopt_fiat_secp256k1_dettman::LOOSE_BOUNDS),
                mul: Function::U64Mul(
                    cryptopt_fiat_secp256k1_dettman::fiat_secp256k1_dettman_mul_clang,
                    cryptopt_fiat_secp256k1_dettman::fiat_secp256k1_dettman_mul_gcc,
                    cryptopt_fiat_secp256k1_dettman::fiat_secp256k1_dettman_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_secp256k1_dettman::fiat_secp256k1_dettman_square_clang,
                    cryptopt_fiat_secp256k1_dettman::fiat_secp256k1_dettman_square_gcc,
                    cryptopt_fiat_secp256k1_dettman::fiat_secp256k1_dettman_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio11508",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio11258",
                ),
            },
            CurveType::CryptoptFiatSecp256k1Montgomery => CurveSpec {
                size: cryptopt_fiat_secp256k1_montgomery::SIZE,
                bounds: BoundSpec::Uniform(cryptopt_fiat_secp256k1_montgomery::LOOSE_BOUND),
                mul: Function::U64Mul(
                    cryptopt_fiat_secp256k1_montgomery::fiat_secp256k1_montgomery_mul_clang,
                    cryptopt_fiat_secp256k1_montgomery::fiat_secp256k1_montgomery_mul_gcc,
                    cryptopt_fiat_secp256k1_montgomery::fiat_secp256k1_montgomery_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_secp256k1_montgomery::fiat_secp256k1_montgomery_square_clang,
                    cryptopt_fiat_secp256k1_montgomery::fiat_secp256k1_montgomery_square_gcc,
                    cryptopt_fiat_secp256k1_montgomery::fiat_secp256k1_montgomery_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio18998",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio17679",
                ),
            },
            CurveType::CryptoptFiatPoly1305 => CurveSpec {
                size: cryptopt_fiat_poly1305::SIZE,
                bounds: BoundSpec::PerLimb(&poly1305::LOOSE_BOUNDS),
                mul: Function::U64Mul(
                    cryptopt_fiat_poly1305::fiat_poly1305_carry_mul_clang,
                    cryptopt_fiat_poly1305::fiat_poly1305_carry_mul_gcc,
                    cryptopt_fiat_poly1305::fiat_poly1305_carry_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_poly1305::fiat_poly1305_carry_square_clang,
                    cryptopt_fiat_poly1305::fiat_poly1305_carry_square_gcc,
                    cryptopt_fiat_poly1305::fiat_poly1305_carry_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio12222",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio12095",
                ),
            },
            CurveType::CryptoptFiatP521 => CurveSpec {
                size: cryptopt_fiat_p521::SIZE,
                bounds: BoundSpec::PerLimb(&cryptopt_fiat_p521::LOOSE_BOUNDS),
                mul: Function::U64Mul(
                    cryptopt_fiat_p521::fiat_p521_carry_mul_clang,
                    cryptopt_fiat_p521::fiat_p521_carry_mul_gcc,
                    cryptopt_fiat_p521::fiat_p521_carry_mul,
                ),
                square: Some(Function::U64Square(
                    cryptopt_fiat_p521::fiat_p521_carry_square_clang,
                    cryptopt_fiat_p521::fiat_p521_carry_square_gcc,
                    cryptopt_fiat_p521::fiat_p521_carry_square,
                )),
                mul_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio13969",
                ),
                square_labels: baseline_labels(
                    "Clang Baseline",
                    "GCC Baseline",
                    "CryptOpt Ratio15398",
                ),
            },
            CurveType::FiatCSecp256k1Dettman => CurveSpec {
                size: fiat_c_secp256k1_dettman::SIZE,
                bounds: BoundSpec::PerLimb(&fiat_c_secp256k1_dettman::LOOSE_BOUNDS),
                mul: Function::U64Mul(
                    fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul_vec,
                    fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul_vec_nasm,
                    fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square_vec,
                    fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square_vec_nasm,
                    fiat_c_secp256k1_dettman::fiat_c_secp256k1_dettman_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::FiatCPoly1305 => CurveSpec {
                size: fiat_c_poly1305::SIZE,
                bounds: BoundSpec::PerLimb(&poly1305::LOOSE_BOUNDS),
                mul: Function::U64Mul(
                    fiat_c_poly1305::fiat_c_poly1305_carry_mul_vec,
                    fiat_c_poly1305::fiat_c_poly1305_carry_mul_vec_nasm,
                    fiat_c_poly1305::fiat_c_poly1305_carry_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    fiat_c_poly1305::fiat_c_poly1305_carry_square_vec,
                    fiat_c_poly1305::fiat_c_poly1305_carry_square_vec_nasm,
                    fiat_c_poly1305::fiat_c_poly1305_carry_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::FiatCP448 => CurveSpec {
                size: fiat_c_p448::SIZE,
                bounds: BoundSpec::Uniform(fiat_c_p448::LOOSE_BOUND),
                mul: Function::U64Mul(
                    fiat_c_p448::fiat_c_p448_solinas_carry_mul_vec,
                    fiat_c_p448::fiat_c_p448_solinas_carry_mul_vec_nasm,
                    fiat_c_p448::fiat_c_p448_carry_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    fiat_c_p448::fiat_c_p448_solinas_carry_square_vec,
                    fiat_c_p448::fiat_c_p448_solinas_carry_square_vec_nasm,
                    fiat_c_p448::fiat_c_p448_solinas_carry_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
            CurveType::OpenSSLCurve25519 => CurveSpec {
                size: openssl_curve25519::SIZE,
                bounds: BoundSpec::Uniform(openssl_curve25519::LOOSE_BOUND),
                mul: Function::U64MulFive(
                    openssl_curve25519::open_ssl_curve25519_fe51_mul_vec,
                    openssl_curve25519::open_ssl_curve25519_fe51_mul_vec_nasm,
                    openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul,
                    openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_mul_nasm,
                    openssl_curve25519::open_ssl_curve25519_fe51_mul_CryptOpt,
                ),
                square: Some(Function::U64SquareFive(
                    openssl_curve25519::open_ssl_curve25519_fe51_square_vec,
                    openssl_curve25519::open_ssl_curve25519_fe51_square_vec_nasm,
                    openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_square,
                    openssl_curve25519::open_ssl_curve25519_hand_optmised_fe51_square_nasm,
                    openssl_curve25519::open_ssl_curve25519_fe51_square_CryptOpt,
                )),
                mul_labels: FunctionLabels::new5(
                    (
                        "GAS Format",
                        "NASM Format",
                        "Hand-Optimised GAS",
                        "Hand-Optimised NASM",
                        "CryptOpt Format",
                    ),
                    ("GAS", "NASM", "Hand", "Hand-NASM", "CryptOpt"),
                ),
                square_labels: FunctionLabels::new5(
                    (
                        "GAS Format",
                        "NASM Format",
                        "Hand-Optimised GAS",
                        "Hand-Optimised NASM",
                        "CryptOpt Format",
                    ),
                    ("GAS", "NASM", "Hand", "Hand-NASM", "CryptOpt"),
                ),
            },
            CurveType::OpenSSLP448 => CurveSpec {
                size: openssl_p448::SIZE,
                bounds: BoundSpec::Uniform(openssl_p448::LOOSE_BOUND),
                mul: Function::U64Mul(
                    openssl_p448::openssl_p448_mul_vec,
                    openssl_p448::openssl_p448_mul_vec_nasm,
                    openssl_p448::openssl_p448_mul_CryptOpt,
                ),
                square: Some(Function::U64Square(
                    openssl_p448::openssl_p448_square_vec,
                    openssl_p448::openssl_p448_square_vec_nasm,
                    openssl_p448::openssl_p448_square_CryptOpt,
                )),
                mul_labels: DEFAULT_LABELS,
                square_labels: DEFAULT_LABELS,
            },
        }
    }

    pub fn size(&self) -> usize {
        self.spec().size
    }

    pub fn bounds(&self) -> BoundSpec {
        self.spec().bounds
    }

    pub fn mul_function(&self) -> Function {
        self.spec().mul
    }

    pub fn square_function(&self) -> Option<Function> {
        self.spec().square
    }

    pub fn mul_labels(&self) -> FunctionLabels {
        self.spec().mul_labels
    }

    pub fn square_labels(&self) -> FunctionLabels {
        self.spec().square_labels
    }

    pub fn from_name(name: &str) -> Option<Self> {
        ALL_CURVES
            .iter()
            .copied()
            .find(|curve| curve.name() == name)
    }
}

pub const ALL_CURVES: &[CurveType] = &[
    CurveType::Curve25519,
    CurveType::Curve25519Dalek,
    CurveType::P448,
    CurveType::Poly1305,
    CurveType::Secp256k1Dettman,
    CurveType::Secp256k1RustEc,
    CurveType::Bls12,
    CurveType::FiatCCurve25519,
    CurveType::CryptoptFiatCurve25519,
    CurveType::CryptoptFiatCurve25519Solinas,
    CurveType::CryptoptFiatP224,
    CurveType::CryptoptFiatP256,
    CurveType::CryptoptFiatP384,
    CurveType::CryptoptFiatP434,
    CurveType::CryptoptFiatP448Solinas,
    CurveType::CryptoptFiatSecp256k1Dettman,
    CurveType::CryptoptFiatSecp256k1Montgomery,
    CurveType::CryptoptFiatPoly1305,
    CurveType::CryptoptFiatP521,
    CurveType::FiatCSecp256k1Dettman,
    CurveType::FiatCPoly1305,
    CurveType::FiatCP448,
    CurveType::OpenSSLCurve25519,
    CurveType::OpenSSLP448,
];
