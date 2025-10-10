use core::arch::x86_64::{_mm_lfence, _mm_mfence, _rdtsc};
use rand::{seq::SliceRandom, thread_rng, Rng};

use crate::curve_spec::BoundSpec;
use crate::precise_timing::{calculate_optimal_batch_size, MeasurementConfig, MeasurementStats};

pub fn generate_random_loose_input_u64(bounds: BoundSpec, size: usize) -> Vec<u64> {
    let mut rng = thread_rng();
    match bounds {
        BoundSpec::Uniform(bound) => (0..size).map(|_| rng.gen_range(0..=bound)).collect(),
        BoundSpec::PerLimb(limbs) => limbs.iter().map(|&lim| rng.gen_range(0..=lim)).collect(),
    }
}

pub fn generate_random_loose_input_usize(bounds: BoundSpec, size: usize) -> Vec<usize> {
    let mut rng = thread_rng();
    let uniform = bounds
        .as_uniform()
        .expect("usize-based measurement requires uniform bounds");
    (0..size)
        .map(|_| rng.gen_range(0..=uniform) as usize)
        .collect()
}

pub fn calculate_median(mut samples: Vec<u64>) -> u64 {
    if samples.is_empty() {
        return 0;
    }
    samples.sort_unstable();
    let mid = samples.len() / 2;
    if samples.len() % 2 == 0 {
        (samples[mid - 1] + samples[mid]) / 2
    } else {
        samples[mid]
    }
}

fn measure_one_batch_u64_mul_precise(
    func: unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    out: &mut [u64],
    in0: &[u64],
    in1: &[u64],
    batch_size: usize,
) -> u64 {
    let start = precise_rdtsc();
    unsafe {
        for _ in 0..batch_size {
            func(out.as_mut_ptr(), in0.as_ptr(), in1.as_ptr());
        }
        _mm_mfence();
    }
    let end = precise_rdtsc();
    end.saturating_sub(start)
}

fn measure_one_batch_u64_square(
    func: unsafe extern "C" fn(*mut u64, *const u64),
    out: &mut [u64],
    input: &[u64],
    batch_size: usize,
) -> u64 {
    let start = precise_rdtsc();
    unsafe {
        for _ in 0..batch_size {
            func(out.as_mut_ptr(), input.as_ptr());
        }
        _mm_mfence();
    }
    let end = precise_rdtsc();
    end.saturating_sub(start)
}

fn precise_rdtsc() -> u64 {
    unsafe {
        _mm_mfence();
        _mm_lfence();
        _rdtsc()
    }
}

pub fn measure_u64_mul_functions_interleaved_enhanced(
    bounds: BoundSpec,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    config: &MeasurementConfig,
    labels: (&str, &str, &str),
) -> (MeasurementStats, MeasurementStats, MeasurementStats) {
    let mut rng = thread_rng();
    let (label_llc, _, _) = labels;

    let mut batch_size = config.initial_batch_size;
    {
        let in0 = generate_random_loose_input_u64(bounds, size);
        let in1 = generate_random_loose_input_u64(bounds, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_c = vec![0u64; size];
        let calib_bs = batch_size;
        let cg = measure_one_batch_u64_mul_precise(llc_func, &mut out_g, &in0, &in1, calib_bs);
        let _ = measure_one_batch_u64_mul_precise(nasm_func, &mut out_n, &in0, &in1, calib_bs);
        let _ = measure_one_batch_u64_mul_precise(cryptopt_func, &mut out_c, &in0, &in1, calib_bs);
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
        let in0 = generate_random_loose_input_u64(bounds, size);
        let in1 = generate_random_loose_input_u64(bounds, size);
        let mut out_gas = vec![0u64; size];
        let mut out_nasm = vec![0u64; size];
        let mut out_crypt = vec![0u64; size];

        let mut order = [0usize, 1usize, 2usize];
        order.shuffle(&mut rng);

        used_bs[b] = batch_size;
        for &which in &order {
            match which {
                0 => {
                    gas_batches[b] = measure_one_batch_u64_mul_precise(
                        llc_func,
                        &mut out_gas,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                1 => {
                    nasm_batches[b] = measure_one_batch_u64_mul_precise(
                        nasm_func,
                        &mut out_nasm,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                2 => {
                    crypt_batches[b] = measure_one_batch_u64_mul_precise(
                        cryptopt_func,
                        &mut out_crypt,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                _ => unreachable!(),
            }
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_gas != out_nasm || out_gas != out_crypt {
                eprintln!("Output mismatch detected in batch {} (mul)", b + 1);
            }
        }

        let baseline_cycles = gas_batches[b];
        let next = if baseline_cycles > 0 {
            ((config.cycle_goal as f64 / baseline_cycles as f64) * batch_size as f64).ceil()
                as usize
        } else {
            batch_size
        };
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let to_per_call = |v: Vec<u64>| -> Vec<u64> {
        v.iter()
            .zip(&used_bs)
            .map(|(&cycles, &bs)| cycles / bs as u64)
            .collect()
    };

    let gas_stats = MeasurementStats::from_measurements(&to_per_call(gas_batches));
    let nasm_stats = MeasurementStats::from_measurements(&to_per_call(nasm_batches));
    let crypt_stats = MeasurementStats::from_measurements(&to_per_call(crypt_batches));

    (gas_stats, nasm_stats, crypt_stats)
}

pub fn measure_u64_mul_functions_interleaved_enhanced_four(
    bounds: BoundSpec,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    enhanced_func: unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64, *const u64),
    config: &MeasurementConfig,
    labels: (&str, &str, &str, &str),
) -> (
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
) {
    let mut rng = thread_rng();
    let (label_llc, _, _, _) = labels;

    let mut batch_size = config.initial_batch_size;
    {
        let in0 = generate_random_loose_input_u64(bounds, size);
        let in1 = generate_random_loose_input_u64(bounds, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_e = vec![0u64; size];
        let mut out_c = vec![0u64; size];
        let calib_bs = batch_size;
        let cg = measure_one_batch_u64_mul_precise(llc_func, &mut out_g, &in0, &in1, calib_bs);
        let _ = measure_one_batch_u64_mul_precise(nasm_func, &mut out_n, &in0, &in1, calib_bs);
        let _ = measure_one_batch_u64_mul_precise(enhanced_func, &mut out_e, &in0, &in1, calib_bs);
        let _ = measure_one_batch_u64_mul_precise(cryptopt_func, &mut out_c, &in0, &in1, calib_bs);
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
    }

    println!(
        "Collecting {} batches with interleaved randomized order...",
        config.num_batches
    );

    let mut gas_batches = vec![0u64; config.num_batches];
    let mut nasm_batches = vec![0u64; config.num_batches];
    let mut enhanced_batches = vec![0u64; config.num_batches];
    let mut crypt_batches = vec![0u64; config.num_batches];
    let mut used_bs = vec![0usize; config.num_batches];

    for b in 0..config.num_batches {
        let in0 = generate_random_loose_input_u64(bounds, size);
        let in1 = generate_random_loose_input_u64(bounds, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_e = vec![0u64; size];
        let mut out_c = vec![0u64; size];

        let mut order = [0usize, 1usize, 2usize, 3usize];
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
                    enhanced_batches[b] = measure_one_batch_u64_mul_precise(
                        enhanced_func,
                        &mut out_e,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                3 => {
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
            if out_g != out_n || out_g != out_e || out_g != out_c {
                eprintln!("Output mismatch detected in batch {} (four mul)", b + 1);
            }
        }

        let baseline_cycles = gas_batches[b];
        let next = if baseline_cycles > 0 {
            ((config.cycle_goal as f64 / baseline_cycles as f64) * batch_size as f64).ceil()
                as usize
        } else {
            batch_size
        };
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let to_per_call = |v: Vec<u64>| -> Vec<u64> {
        v.iter()
            .zip(&used_bs)
            .map(|(&cycles, &bs)| cycles / bs as u64)
            .collect()
    };

    let gas_stats = MeasurementStats::from_measurements(&to_per_call(gas_batches));
    let nasm_stats = MeasurementStats::from_measurements(&to_per_call(nasm_batches));
    let enhanced_stats = MeasurementStats::from_measurements(&to_per_call(enhanced_batches));
    let crypt_stats = MeasurementStats::from_measurements(&to_per_call(crypt_batches));

    (gas_stats, nasm_stats, enhanced_stats, crypt_stats)
}

pub fn measure_usize_mul_functions_interleaved_enhanced(
    bounds: BoundSpec,
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
    let mut rng = thread_rng();

    let mut batch_size = config.initial_batch_size;
    {
        let in0 = generate_random_loose_input_usize(bounds, size);
        let in1 = generate_random_loose_input_usize(bounds, size);
        let mut out_g = vec![0usize; size];
        let mut out_n = vec![0usize; size];
        let mut out_c = vec![0usize; size];
        let calib_bs = batch_size;
        let cg = measure_one_batch_usize_mul_precise(llc_func, &mut out_g, &in0, &in1, calib_bs);
        let _ = measure_one_batch_usize_mul_precise(nasm_func, &mut out_n, &in0, &in1, calib_bs);
        let _ =
            measure_one_batch_usize_mul_precise(cryptopt_func, &mut out_c, &in0, &in1, calib_bs);
        batch_size = calculate_optimal_batch_size(
            cg,
            calib_bs,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
    }

    println!(
        "Collecting {} batches with interleaved randomized order (usize mul)...",
        config.num_batches
    );

    let mut gas_batches = vec![0u64; config.num_batches];
    let mut nasm_batches = vec![0u64; config.num_batches];
    let mut crypt_batches = vec![0u64; config.num_batches];
    let mut used_bs = vec![0usize; config.num_batches];

    for b in 0..config.num_batches {
        let in0 = generate_random_loose_input_usize(bounds, size);
        let in1 = generate_random_loose_input_usize(bounds, size);
        let mut out_gas = vec![0usize; size];
        let mut out_nasm = vec![0usize; size];
        let mut out_crypt = vec![0usize; size];

        let mut order = [0usize, 1usize, 2usize];
        order.shuffle(&mut rng);
        used_bs[b] = batch_size;

        for &which in &order {
            match which {
                0 => {
                    gas_batches[b] = measure_one_batch_usize_mul_precise(
                        llc_func,
                        &mut out_gas,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                1 => {
                    nasm_batches[b] = measure_one_batch_usize_mul_precise(
                        nasm_func,
                        &mut out_nasm,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                2 => {
                    crypt_batches[b] = measure_one_batch_usize_mul_precise(
                        cryptopt_func,
                        &mut out_crypt,
                        &in0,
                        &in1,
                        batch_size,
                    );
                }
                _ => unreachable!(),
            }
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_gas != out_nasm || out_gas != out_crypt {
                eprintln!("Output mismatch detected in batch {} (usize mul)", b + 1);
            }
        }

        let baseline_cycles = gas_batches[b];
        let next = if baseline_cycles > 0 {
            ((config.cycle_goal as f64 / baseline_cycles as f64) * batch_size as f64).ceil()
                as usize
        } else {
            batch_size
        };
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let to_per_call = |v: Vec<u64>| -> Vec<u64> {
        v.iter()
            .zip(&used_bs)
            .map(|(&cycles, &bs)| cycles / bs as u64)
            .collect()
    };

    let gas_stats = MeasurementStats::from_measurements(&to_per_call(gas_batches));
    let nasm_stats = MeasurementStats::from_measurements(&to_per_call(nasm_batches));
    let crypt_stats = MeasurementStats::from_measurements(&to_per_call(crypt_batches));

    (gas_stats, nasm_stats, crypt_stats)
}

fn measure_one_batch_usize_mul_precise(
    func: unsafe extern "C" fn(*mut usize, usize, *const usize, usize, *const usize, usize),
    out: &mut [usize],
    in0: &[usize],
    in1: &[usize],
    batch_size: usize,
) -> u64 {
    let start = precise_rdtsc();
    unsafe {
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
        _mm_mfence();
    }
    precise_rdtsc().saturating_sub(start)
}

pub fn measure_u64_mul_functions_interleaved_enhanced_five(
    bounds: BoundSpec,
    size: usize,
    funcs: [unsafe extern "C" fn(*mut u64, *const u64, *const u64); 5],
    config: &MeasurementConfig,
    labels: (&str, &str, &str, &str, &str),
) -> (
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
) {
    let mut rng = thread_rng();
    let (label_baseline, _, _, _, _) = labels;

    let mut batch_size = config.initial_batch_size;
    {
        let in0 = generate_random_loose_input_u64(bounds, size);
        let in1 = generate_random_loose_input_u64(bounds, size);
        let mut outs: Vec<Vec<u64>> = (0..5).map(|_| vec![0u64; size]).collect();
        let calib_bs = batch_size;
        let baseline_cycles =
            measure_one_batch_u64_mul_precise(funcs[0], &mut outs[0], &in0, &in1, calib_bs);
        for idx in 1..5 {
            let _ =
                measure_one_batch_u64_mul_precise(funcs[idx], &mut outs[idx], &in0, &in1, calib_bs);
        }
        batch_size = calculate_optimal_batch_size(
            baseline_cycles,
            calib_bs,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
        let per_call_est = baseline_cycles as f64 / calib_bs as f64;
        println!(
            "Calibrated shared batch size ({} ref): {} ({} batch cycles: {}, ~{:.2} cycles/call at bs={})",
            label_baseline, batch_size, label_baseline, baseline_cycles, per_call_est, calib_bs
        );
    }

    println!(
        "Collecting {} batches with interleaved randomized order...",
        config.num_batches
    );

    let mut all_batches = vec![vec![0u64; config.num_batches]; 5];
    let mut used_bs = vec![0usize; config.num_batches];

    for b in 0..config.num_batches {
        let in0 = generate_random_loose_input_u64(bounds, size);
        let in1 = generate_random_loose_input_u64(bounds, size);
        let mut outputs: Vec<Vec<u64>> = (0..5).map(|_| vec![0u64; size]).collect();

        let mut order = [0usize, 1usize, 2usize, 3usize, 4usize];
        order.shuffle(&mut rng);
        used_bs[b] = batch_size;

        for &which in &order {
            all_batches[which][b] = measure_one_batch_u64_mul_precise(
                funcs[which],
                &mut outputs[which],
                &in0,
                &in1,
                batch_size,
            );
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            for idx in 1..5 {
                if outputs[0] != outputs[idx] {
                    eprintln!("Output mismatch detected in batch {} (five mul)", b + 1);
                    break;
                }
            }
            
        }

        let baseline_cycles = all_batches[0][b];
        let next = if baseline_cycles > 0 {
            ((config.cycle_goal as f64 / baseline_cycles as f64) * batch_size as f64).ceil()
                as usize
        } else {
            batch_size
        };
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let mut stats_vec = Vec::with_capacity(5);
    for cycles in all_batches.into_iter() {
        let per_call: Vec<u64> = cycles
            .iter()
            .zip(&used_bs)
            .map(|(&total, &bs)| total / bs as u64)
            .collect();
        stats_vec.push(MeasurementStats::from_measurements(&per_call));
    }

    let mut iter = stats_vec.into_iter();
    (
        iter.next().unwrap(),
        iter.next().unwrap(),
        iter.next().unwrap(),
        iter.next().unwrap(),
        iter.next().unwrap(),
    )
}

pub fn measure_u64_square_functions_interleaved_enhanced(
    bounds: BoundSpec,
    size: usize,
    llc_func: unsafe extern "C" fn(*mut u64, *const u64),
    nasm_func: unsafe extern "C" fn(*mut u64, *const u64),
    cryptopt_func: unsafe extern "C" fn(*mut u64, *const u64),
    config: &MeasurementConfig,
    labels: (&str, &str, &str),
) -> (MeasurementStats, MeasurementStats, MeasurementStats) {
    let mut rng = thread_rng();
    let (label_llc, _, _) = labels;

    let mut batch_size = config.initial_batch_size;
    {
        let input = generate_random_loose_input_u64(bounds, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_c = vec![0u64; size];
        let calib_bs = batch_size;
        let cg = measure_one_batch_u64_square(llc_func, &mut out_g, &input, calib_bs);
        let _ = measure_one_batch_u64_square(nasm_func, &mut out_n, &input, calib_bs);
        let _ = measure_one_batch_u64_square(cryptopt_func, &mut out_c, &input, calib_bs);
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
        let input = generate_random_loose_input_u64(bounds, size);
        let mut out_g = vec![0u64; size];
        let mut out_n = vec![0u64; size];
        let mut out_c = vec![0u64; size];

        let mut order = [0usize, 1usize, 2usize];
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
                    crypt_batches[b] =
                        measure_one_batch_u64_square(cryptopt_func, &mut out_c, &input, batch_size);
                }
                _ => unreachable!(),
            }
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            if out_g != out_n || out_g != out_c {
                eprintln!("Output mismatch detected in batch {} (square)", b + 1);
            }
        }

        let baseline_cycles = gas_batches[b];
        let next = if baseline_cycles > 0 {
            ((config.cycle_goal as f64 / baseline_cycles as f64) * batch_size as f64).ceil()
                as usize
        } else {
            batch_size
        };
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let to_per_call = |v: Vec<u64>| -> Vec<u64> {
        v.iter()
            .zip(&used_bs)
            .map(|(&cycles, &bs)| cycles / bs as u64)
            .collect()
    };

    let gas_stats = MeasurementStats::from_measurements(&to_per_call(gas_batches));
    let nasm_stats = MeasurementStats::from_measurements(&to_per_call(nasm_batches));
    let crypt_stats = MeasurementStats::from_measurements(&to_per_call(crypt_batches));

    (gas_stats, nasm_stats, crypt_stats)
}

pub fn measure_u64_square_functions_interleaved_enhanced_four(
    bounds: BoundSpec,
    size: usize,
    funcs: [unsafe extern "C" fn(*mut u64, *const u64); 4],
    config: &MeasurementConfig,
    labels: (&str, &str, &str, &str),
) -> (
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
    MeasurementStats,
) {
    let mut rng = thread_rng();
    let (label_baseline, _, _, _) = labels;

    let mut batch_size = config.initial_batch_size;
    {
        let input = generate_random_loose_input_u64(bounds, size);
        let mut outs: Vec<Vec<u64>> = (0..4).map(|_| vec![0u64; size]).collect();
        let calib_bs = batch_size;
        let baseline_cycles =
            measure_one_batch_u64_square(funcs[0], &mut outs[0], &input, calib_bs);
        for idx in 1..4 {
            let _ = measure_one_batch_u64_square(funcs[idx], &mut outs[idx], &input, calib_bs);
        }
        batch_size = calculate_optimal_batch_size(
            baseline_cycles,
            calib_bs,
            config.cycle_goal,
            config.min_batch_size,
            config.max_batch_size,
        );
        let per_call_est = baseline_cycles as f64 / calib_bs as f64;
        println!(
            "Calibrated shared batch size ({} ref): {} ({} batch cycles: {}, ~{:.2} cycles/call at bs={})",
            label_baseline, batch_size, label_baseline, baseline_cycles, per_call_est, calib_bs
        );
    }

    println!(
        "Collecting {} batches with interleaved randomized order...",
        config.num_batches
    );

    let mut all_batches = vec![vec![0u64; config.num_batches]; 4];
    let mut used_bs = vec![0usize; config.num_batches];

    for b in 0..config.num_batches {
        let input = generate_random_loose_input_u64(bounds, size);
        let mut outputs: Vec<Vec<u64>> = (0..4).map(|_| vec![0u64; size]).collect();

        let mut order = [0usize, 1usize, 2usize, 3usize];
        order.shuffle(&mut rng);
        used_bs[b] = batch_size;

        for &which in &order {
            all_batches[which][b] =
                measure_one_batch_u64_square(funcs[which], &mut outputs[which], &input, batch_size);
        }

        if std::env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1") {
            for idx in 1..4 {
                if outputs[0] != outputs[idx] {
                    eprintln!("Output mismatch detected in batch {} (four square)", b + 1);
                    break;
                }
            }
        }

        let baseline_cycles = all_batches[0][b];
        let next = if baseline_cycles > 0 {
            ((config.cycle_goal as f64 / baseline_cycles as f64) * batch_size as f64).ceil()
                as usize
        } else {
            batch_size
        };
        batch_size = next.max(config.min_batch_size).min(config.max_batch_size);
    }

    let mut stats_vec = Vec::with_capacity(4);
    for cycles in all_batches.into_iter() {
        let per_call: Vec<u64> = cycles
            .iter()
            .zip(&used_bs)
            .map(|(&total, &bs)| total / bs as u64)
            .collect();
        stats_vec.push(MeasurementStats::from_measurements(&per_call));
    }

    let mut iter = stats_vec.into_iter();
    (
        iter.next().unwrap(),
        iter.next().unwrap(),
        iter.next().unwrap(),
        iter.next().unwrap(),
    )
}

pub fn measure_u64_square_functions_interleaved_enhanced_five(
    bounds: BoundSpec,
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
    let mut rng = thread_rng();

    let mut batch_size = config.initial_batch_size;
    {
        let input = generate_random_loose_input_u64(bounds, size);
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
        let input = generate_random_loose_input_u64(bounds, size);
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
                eprintln!("Output mismatch detected in batch {} (square five)", b + 1);
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
            .map(|(&cycles, &bs)| cycles / bs as u64)
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
