use rand::Rng;
use rand::thread_rng;
use core::arch::x86_64::_rdtsc;

mod curve25519 {
    pub const LOOSE_BOUND: u64 = 0x18000000000000; // Fiat Curve25519 loose bound
    pub const SIZE: usize = 4;
    extern "C" {
        pub fn rust_fiat_curve25519_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_curve25519_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_curve25519_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
    }
}

mod p448 {
    pub const LOOSE_BOUND: u64 = 0x300000000000000; // Fiat P448 loose bound
    pub const SIZE: usize = 8;
    extern "C" {
        pub fn rust_fiat_p448_solinas_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_p448_solinas_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_p448_solinas_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
    }
}

mod poly1305 {
    pub const LOOSE_BOUND: u64 = 0x180000000000; // Fiat Poly1305 loose bound
    pub const SIZE: usize = 3;
    extern "C" {
        pub fn rust_fiat_poly1305_carry_mul(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_poly1305_carry_mul_nasm(arg0: *const u64, arg1: *const u64, arg2: *const u64);
        pub fn rust_fiat_poly1305_carry_mul_CryptOpt(arg0: *const u64, arg1: *const u64, arg2: *const u64);
    }
}

mod secp256k1_dettman {
    pub const LOOSE_BOUND: u64 = 0x1ffffffffffffe; // Fiat Secp256k1 loose bound
    pub const SIZE: usize = 5;
    extern "C" {
        pub fn rust_fiat_secp256k1_dettman_mul(out0: *const u64, in0: *const u64, in1: *const u64);
        pub fn rust_fiat_secp256k1_dettman_mul_nasm(out0: *const u64, in0: *const u64, in1: *const u64);
        pub fn rust_fiat_secp256k1_dettman_mul_CryptOpt(out0: *const u64, in0: *const u64, in1: *const u64);
    }
}

mod bls12 {
    pub const LOOSE_BOUND: u64 = 0x10000000000000; // 2^52 I am not sure what is the exact loose bound for BLS12
    pub const SIZE: usize = 6;
    extern "C" {
        pub fn bls12_mul(out0: *mut usize, out0_len: usize,
                         in0: *const usize, in0_len: usize,
                         in1: *const usize, in1_len: usize);
        pub fn bls12_mul_nasm(out0: *mut usize, out0_len: usize,
                              in0: *const usize, in0_len: usize,
                              in1: *const usize, in1_len: usize);
        pub fn bls12_mul_CryptOpt(out0: *mut usize, out0_len: usize,
                                  in0: *const usize, in0_len: usize,
                                  in1: *const usize, in1_len: usize);
    }
}

#[derive(Debug, PartialEq)]
enum CurveType {
    Curve25519,
    P448,
    Poly1305,
    Secp256k1Dettman,
    Bls12,
}

enum Function {
    U64(
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64),
        unsafe extern "C" fn(*const u64, *const u64, *const u64)
    ),
    Usize(
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
        unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize)
    ),
}

impl CurveType {
    fn get_params(&self) -> (u64, usize) {
        match self {
            CurveType::Curve25519 => (curve25519::LOOSE_BOUND, curve25519::SIZE),
            CurveType::P448 => (p448::LOOSE_BOUND, p448::SIZE),
            CurveType::Poly1305 => (poly1305::LOOSE_BOUND, poly1305::SIZE),
            CurveType::Secp256k1Dettman => (secp256k1_dettman::LOOSE_BOUND, secp256k1_dettman::SIZE),
            CurveType::Bls12 => (bls12::LOOSE_BOUND, bls12::SIZE),
        }
    }

    fn get_functions(&self) -> Function {
        match self {
            CurveType::Curve25519 => Function::U64(
                curve25519::rust_fiat_curve25519_carry_mul,
                curve25519::rust_fiat_curve25519_carry_mul_nasm,
                curve25519::rust_fiat_curve25519_carry_mul_CryptOpt
            ),
            CurveType::P448 => Function::U64(
                p448::rust_fiat_p448_solinas_carry_mul,
                p448::rust_fiat_p448_solinas_carry_mul_nasm,
                p448::rust_fiat_p448_solinas_carry_mul_CryptOpt
            ),
            CurveType::Poly1305 => Function::U64(
                poly1305::rust_fiat_poly1305_carry_mul,
                poly1305::rust_fiat_poly1305_carry_mul_nasm,
                poly1305::rust_fiat_poly1305_carry_mul_CryptOpt
            ),
            CurveType::Secp256k1Dettman => Function::U64(
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_nasm,
                secp256k1_dettman::rust_fiat_secp256k1_dettman_mul_CryptOpt
            ),
            CurveType::Bls12 => Function::Usize(
                bls12::bls12_mul,
                bls12::bls12_mul_nasm,
                bls12::bls12_mul_CryptOpt
            ),
        }
    }
}

fn generate_random_loose_input_u64(bound: u64, size: usize) -> Vec<u64> {
    let mut rng = rand::thread_rng();
    let mut input = vec![0u64; size];
    for i in 0..size {
        input[i] = rng.gen_range(0..bound);
    }
    input
}

fn generate_random_loose_input_usize(bound: u64, size: usize) -> Vec<usize> {
    let mut rng = rand::thread_rng();
    let mut input = vec![0usize; size];
    for i in 0..size {
        input[i] = rng.gen_range(0..bound) as usize;
    }
    input
}

fn measure_one_batch_u64(
    func: unsafe extern "C" fn(*const u64, *const u64, *const u64),
    out: &mut [u64],
    in0: &[u64],
    in1: &[u64],
    batch_size: usize,
) -> u64 {
    unsafe {
        // Warmup read
        _rdtsc();
        let start = _rdtsc();
        for _ in 0..batch_size {
            func(out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
        }
        let end = _rdtsc();
        end - start
    }
}

/// Compute the median of a list of cycle counts.
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

/// Measure three functions (LLC, NASM, CryptOpt) in the `U64` case in randomized order.
/// Returns the *median cycle count* for each function.
fn measure_three_functions_u64(
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

    let mut out0 = vec![0u64; size];
    let mut out0_llc = vec![0u64; size];
    let mut out0_nasm = vec![0u64; size];
    let mut out0_cryptopt = vec![0u64; size];

    let mut funcs = vec![llc_func, nasm_func, cryptopt_func];
    let mut rng = thread_rng();

    for _ in 0..nob {
        // Randomly shuffle the execution order each batch
        for i in (1..funcs.len()).rev() {
            let j = rng.gen_range(0..=i);
            funcs.swap(i, j);
        }
        // println!("Shuffled: {:?}", funcs);// check alright

        // Generate random inputs
        let in0 = generate_random_loose_input_u64(bound, size);
        let in1 = generate_random_loose_input_u64(bound, size);

        // Measure each function in the chosen order
        for &f in &funcs {
            let c = measure_one_batch_u64(f, &mut out0, &in0, &in1, batch_size);
            if f as usize == llc_func as usize {
                cycles_llc.push(c);
                out0_llc.copy_from_slice(&out0);
            } else if f as usize == nasm_func as usize {
                cycles_nasm.push(c);
                out0_nasm.copy_from_slice(&out0);
            } else {
                cycles_cryptopt.push(c);
                out0_cryptopt.copy_from_slice(&out0);
            }
        }

        // check correctness
        if out0_llc != out0_nasm || out0_llc != out0_cryptopt {
            println!(
                "WARNING: Outputs do not match!\nLLC: {:?}\nNASM: {:?}\nCryptOpt: {:?}",
                out0_llc, out0_nasm, out0_cryptopt
            );
            panic!("Output mismatch detected");
        }
    }

    // Return the median cycle counts for each function
    let llc_median = median(&cycles_llc);
    let nasm_median = median(&cycles_nasm);
    let cryptopt_median = median(&cycles_cryptopt);

    (llc_median, nasm_median, cryptopt_median)
}

// --------------------- USIZE version (for BLS12, etc.) --------------------- //
fn measure_one_batch_usize(
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

fn measure_three_functions_usize(
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

    let mut out0 = vec![0usize; size];
    let mut out0_llc = vec![0usize; size];
    let mut out0_nasm = vec![0usize; size];
    let mut out0_cryptopt = vec![0usize; size];

    let mut funcs = vec![llc_func, nasm_func, cryptopt_func];
    let mut rng = thread_rng();

    for _ in 0..nob {
        // Shuffle order
        for i in (1..funcs.len()).rev() {
            let j = rng.gen_range(0..=i);
            funcs.swap(i, j);
            // println!("Shuffled: {:?}", funcs);// check alright
        }

        let in0 = generate_random_loose_input_usize(bound, size);
        let in1 = generate_random_loose_input_usize(bound, size);

        for &f in &funcs {
            let c = measure_one_batch_usize(f, &mut out0, &in0, &in1, batch_size);
            if f as usize == llc_func as usize {
                cycles_llc.push(c);
                out0_llc.copy_from_slice(&out0);
            } else if f as usize == nasm_func as usize {
                cycles_nasm.push(c);
                out0_nasm.copy_from_slice(&out0);
            } else {
                cycles_cryptopt.push(c);
                out0_cryptopt.copy_from_slice(&out0);
            }
        }

        // check correctness
        if out0_llc != out0_nasm || out0_llc != out0_cryptopt {
            println!(
                "WARNING: Outputs do not match!\nLLC: {:?}\nNASM: {:?}\nCryptOpt: {:?}",
                out0_llc, out0_nasm, out0_cryptopt
            );
            panic!("Output mismatch detected");
        }
    }

    (
        median(&cycles_llc),
        median(&cycles_nasm),
        median(&cycles_cryptopt),
    )
}

// ---------------------------------------------------------------------------
//  FUNCTION: measure_cryptopt_once(curve: &CurveType) -> (u64, u64, u64)
//  This is just the old "run_measurement_with_crypt_opt_method" except it
//  RETURNS the triple of medians, instead of printing them immediately.
// ---------------------------------------------------------------------------
fn measure_cryptopt_once(curve: &CurveType) -> (u64, u64, u64) {
    let batch_size = 200; // from CryptOpt
    let nob = 31;         // from CryptOpt

    let (bound, size) = curve.get_params();
    let functions = curve.get_functions();

    match functions {
        Function::U64(llc_func, nasm_func, cryptopt_func) => {
            let (llc_median, nasm_median, cryptopt_median) = measure_three_functions_u64(
                bound,
                size,
                llc_func,
                nasm_func,
                cryptopt_func,
                batch_size,
                nob,
            );
            (llc_median, nasm_median, cryptopt_median)
        }
        Function::Usize(llc_func, nasm_func, cryptopt_func) => {
            let (llc_median, nasm_median, cryptopt_median) = measure_three_functions_usize(
                bound,
                size,
                llc_func,
                nasm_func,
                cryptopt_func,
                batch_size,
                nob,
            );
            (llc_median, nasm_median, cryptopt_median)
        }
    }
}

// ---------------------------------------------------------------------------
//  FUNCTION: run_repeated_measurements
//  Repeats measure_cryptopt_once(...) 'repeats' times and collects results.
// ---------------------------------------------------------------------------
fn run_repeated_measurements(curve: &CurveType, repeats: usize) {
    let mut llc_results = Vec::with_capacity(repeats);
    let mut nasm_results = Vec::with_capacity(repeats);
    let mut cryptopt_results = Vec::with_capacity(repeats);

    for _ in 0..repeats {
        let (llc_median, nasm_median, cryptopt_median) = measure_cryptopt_once(curve);
        llc_results.push(llc_median);
        nasm_results.push(nasm_median);
        cryptopt_results.push(cryptopt_median);
    }

    // Now compute median-of-medians
    let llc_mom = median(&llc_results);
    let nasm_mom = median(&nasm_results);
    let cryptopt_mom = median(&cryptopt_results);

    // Print them out
    println!(
        "\n=== Final 'Median of Medians' after {} full runs ===",
        repeats
    );
    println!("GAS format ASM: {:?}", llc_mom);
    println!("NASM format ASM: {:?}", nasm_mom);
    println!("CryptOpt format ASM: {:?}", cryptopt_mom);

    let diff_llc =
        ((cryptopt_mom as f64 - llc_mom as f64) / llc_mom as f64) * 100.0;
    let diff_nasm =
        ((cryptopt_mom as f64 - nasm_mom as f64) / nasm_mom as f64) * 100.0;

    let (faster_llc, slower_llc) = if diff_llc > 0.0 {
        ("GAS", "CryptOpt")
    } else {
        ("CryptOpt", "GAS")
    };
    println!(
        "{} is {:.2}% faster than {} (median-of-medians).",
        faster_llc,
        diff_llc.abs(),
        slower_llc
    );

    let (faster_nasm, slower_nasm) = if diff_nasm > 0.0 {
        ("NASM", "CryptOpt")
    } else {
        ("CryptOpt", "NASM")
    };
    println!(
        "{} is {:.2}% faster than {} (median-of-medians).",
        faster_nasm,
        diff_nasm.abs(),
        slower_nasm
    );
}

// --------------------- main() --------------------- //
fn main() {
    use std::env;
    let args: Vec<String> = env::args().collect();

    // 1) <curve_name>
    // 2) optional <repeat_count>
    if args.len() < 2 || args.len() > 3 {
        println!("Usage: cargo run <curve_name> [repeat_count]");
        println!("Available curves: curve25519, p448, poly1305, secp256k1_dettman, bls12");
        println!("Examples:");
        println!("  cargo run curve25519           (runs once)");
        println!("  cargo run curve25519 100       (repeat 100 times)");
        return;
    }

    let curve_type = match args[1].as_str() {
        "curve25519" => CurveType::Curve25519,
        "p448" => CurveType::P448,
        "poly1305" => CurveType::Poly1305,
        "secp256k1_dettman" => CurveType::Secp256k1Dettman,
        "bls12" => CurveType::Bls12,
        _ => {
            println!("Unknown curve: {}. Available curves: curve25519, p448, poly1305, secp256k1_dettman, bls12", args[1]);
            return;
        }
    };

    // NEW: parse repeats (or default to 1)
    let repeats: usize = if args.len() == 3 {
        args[2].parse().unwrap_or_else(|_| {
            eprintln!("Could not parse repeat_count. Defaulting to 1.");
            1
        })
    } else {
        1
    };

    println!("Measuring {:?} with CryptOpt approach...", curve_type);
    println!(
        "We will do the 'batch=200, nBatches=31' measurement {} time(s)\n",
        repeats
    );

    // Now I run repeated measurements
    run_repeated_measurements(&curve_type, repeats);
}