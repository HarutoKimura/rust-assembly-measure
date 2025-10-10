#![cfg(all(feature = "dynamic-api", target_arch = "x86_64"))]

use std::path::Path;
use std::str::FromStr;

use anyhow::{anyhow, Context, Result};

use crate::curve_spec::{BoundSpec, CurveType};
use crate::measure_dyn::{generate_random_bounded_u64, measure_pair, MeasureCfg, MeasureOut};
use crate::runtime_build::{build_shared_object, parse_target_spec, FunctionSignature};

// Default configuration matching legacy method (src/main.rs:113-119)
const DEFAULT_CYCLE_GOAL: u64 = 10_000;
const DEFAULT_INITIAL_BATCH_SIZE: usize = 200;
const DEFAULT_MIN_BATCH_SIZE: usize = 10;
const DEFAULT_MAX_BATCH_SIZE: usize = 5_000;
const DEFAULT_BATCHES: usize = 31;

// Default bound for input generation (Curve25519's LOOSE_BOUND from src/ffi.rs)
// This is the most common bound and provides a safe default
const DEFAULT_INPUT_BOUND: u64 = 0x18000000000000;

pub fn maybe_run_dynamic(args: &[String]) -> Option<Result<()>> {
    if matches!(args.first().map(String::as_str), Some("--dynamic")) {
        Some(run_dynamic_measure(&args[1..]))
    } else {
        None
    }
}

fn run_dynamic_measure(args: &[String]) -> Result<()> {
    use std::env;
    
    // Enable output verification by default (matches legacy behavior)
    if env::var("CHECK_OUTPUTS").is_err() {
        env::set_var("CHECK_OUTPUTS", "1");
    }
    
    if args.len() < 2 {
        return Err(anyhow!(
            "dynamic mode expects: --dynamic <candidate> <baseline> [OPTIONS]\n\
             Options:\n\
               --cycle-goal N         Target cycles per batch (default: {})\n\
               --initial-batch-size N Starting batch size (default: {})\n\
               --min-batch-size N     Minimum batch size (default: {})\n\
               --max-batch-size N     Maximum batch size (default: {})\n\
               --batches N            Number of batches (default: {})\n\
               --input-bound N        Upper bound for random inputs (default: {:#x})\n\
               --curve CURVE_NAME     Use bounds/size from a known curve spec\n\
               --cpu CORE             Pin to specific CPU core\n\
             \n\
             Note: --curve takes precedence over --input-bound. Available curves:\n\
               curve25519, p448, poly1305, secp256k1_dettman, etc.",
            DEFAULT_CYCLE_GOAL, DEFAULT_INITIAL_BATCH_SIZE, DEFAULT_MIN_BATCH_SIZE,
            DEFAULT_MAX_BATCH_SIZE, DEFAULT_BATCHES, DEFAULT_INPUT_BOUND
        ));
    }

    let manifest_dir = Path::new(env!("CARGO_MANIFEST_DIR"));

    let mut positional = Vec::new();
    let mut cfg = MeasureCfg {
        cycle_goal: DEFAULT_CYCLE_GOAL,
        initial_batch_size: DEFAULT_INITIAL_BATCH_SIZE,
        min_batch_size: DEFAULT_MIN_BATCH_SIZE,
        max_batch_size: DEFAULT_MAX_BATCH_SIZE,
        nob: DEFAULT_BATCHES,
        cpu: None,
        use_perf: false,
        input_bound: DEFAULT_INPUT_BOUND,
        bounds: BoundSpec::Uniform(DEFAULT_INPUT_BOUND),
        field_size: 16,  // Default max size
    };

    let mut idx = 0;
    while idx < args.len() {
        match args[idx].as_str() {
            "--cycle-goal" => {
                idx += 1;
                let value = args
                    .get(idx)
                    .ok_or_else(|| anyhow!("--cycle-goal requires a value"))?;
                cfg.cycle_goal = u64::from_str(value)
                    .with_context(|| format!("failed to parse cycle goal '{}'", value))?;
            }
            "--initial-batch-size" => {
                idx += 1;
                let value = args
                    .get(idx)
                    .ok_or_else(|| anyhow!("--initial-batch-size requires a value"))?;
                cfg.initial_batch_size = usize::from_str(value)
                    .with_context(|| format!("failed to parse initial batch size '{}'", value))?;
            }
            "--min-batch-size" => {
                idx += 1;
                let value = args
                    .get(idx)
                    .ok_or_else(|| anyhow!("--min-batch-size requires a value"))?;
                cfg.min_batch_size = usize::from_str(value)
                    .with_context(|| format!("failed to parse min batch size '{}'", value))?;
            }
            "--max-batch-size" => {
                idx += 1;
                let value = args
                    .get(idx)
                    .ok_or_else(|| anyhow!("--max-batch-size requires a value"))?;
                cfg.max_batch_size = usize::from_str(value)
                    .with_context(|| format!("failed to parse max batch size '{}'", value))?;
            }
            "--batches" => {
                idx += 1;
                let value = args
                    .get(idx)
                    .ok_or_else(|| anyhow!("--batches requires a value"))?;
                cfg.nob = usize::from_str(value)
                    .with_context(|| format!("failed to parse batch count '{}'", value))?;
            }
            "--cpu" => {
                idx += 1;
                let value = args
                    .get(idx)
                    .ok_or_else(|| anyhow!("--cpu requires a value"))?;
                let core = usize::from_str(value)
                    .with_context(|| format!("failed to parse cpu core '{}'", value))?;
                cfg.cpu = Some(core);
            }
            "--input-bound" => {
                idx += 1;
                let value = args
                    .get(idx)
                    .ok_or_else(|| anyhow!("--input-bound requires a value"))?;
                // Support hex notation
                cfg.input_bound = if value.starts_with("0x") || value.starts_with("0X") {
                    u64::from_str_radix(&value[2..], 16)
                        .with_context(|| format!("failed to parse input bound '{}'", value))?
                } else {
                    u64::from_str(value)
                        .with_context(|| format!("failed to parse input bound '{}'", value))?
                };
                cfg.bounds = BoundSpec::Uniform(cfg.input_bound);
            }
            "--curve" => {
                idx += 1;
                let curve_name = args
                    .get(idx)
                    .ok_or_else(|| anyhow!("--curve requires a value"))?;
                let curve = CurveType::from_name(curve_name)
                    .ok_or_else(|| anyhow!("unknown curve '{}'", curve_name))?;
                cfg.bounds = curve.bounds();
                cfg.field_size = curve.size();
                // Update input_bound for display purposes (use first bound if PerLimb)
                cfg.input_bound = match cfg.bounds {
                    BoundSpec::Uniform(b) => b,
                    BoundSpec::PerLimb(limbs) => limbs.first().copied().unwrap_or(DEFAULT_INPUT_BOUND),
                };
                println!("Using curve '{}' with size={} limbs", curve_name, cfg.field_size);
            }
            other if other.starts_with("--") => {
                return Err(anyhow!("unrecognised flag '{other}'"));
            }
            value => {
                positional.push(value.to_string());
            }
        }
        idx += 1;
    }

    if positional.len() != 2 {
        return Err(anyhow!(
            "dynamic mode expects exactly two positional arguments: <candidate> <baseline>"
        ));
    }

    let candidate_spec = parse_target_spec(&positional[0], manifest_dir)
        .with_context(|| format!("while parsing candidate '{}'", positional[0]))?;
    let baseline_spec = parse_target_spec(&positional[1], manifest_dir)
        .with_context(|| format!("while parsing baseline '{}'", positional[1]))?;

    if candidate_spec.signature != baseline_spec.signature {
        return Err(anyhow!(
            "candidate uses {:?} signature but baseline uses {:?}; signatures must match",
            candidate_spec.signature,
            baseline_spec.signature
        ));
    }

    let candidate_artifacts = build_shared_object(&candidate_spec, "candidate")
        .context("failed to build candidate shared object")?;
    let baseline_artifacts = build_shared_object(&baseline_spec, "baseline")
        .context("failed to build baseline shared object")?;

    match candidate_artifacts.signature {
        FunctionSignature::U64Mul => {
            measure_mul_pair(&candidate_artifacts, &baseline_artifacts, &cfg)?
        }
        FunctionSignature::U64Square => {
            measure_square_pair(&candidate_artifacts, &baseline_artifacts, &cfg)?
        }
    }

    Ok(())
}

fn measure_mul_pair(
    candidate: &crate::runtime_build::BuildArtifacts,
    baseline: &crate::runtime_build::BuildArtifacts,
    cfg: &MeasureCfg,
) -> Result<()> {
    use std::env;
    type MulFn = unsafe extern "C" fn(*mut u64, *const u64, *const u64);

    let so_candidate = candidate.so_path.as_path();
    let so_baseline = baseline.so_path.as_path();
    let field_size = cfg.field_size;

    // Check if output verification is enabled (matches legacy behavior)
    let check_outputs = env::var("CHECK_OUTPUTS").ok().as_deref() == Some("1");
    
    println!("Configuration:");
    println!("  Field size: {} limbs", field_size);
    match cfg.bounds {
        BoundSpec::Uniform(b) => println!("  Uniform bound: {:#x}", b),
        BoundSpec::PerLimb(limbs) => println!("  Per-limb bounds: {:?}", &limbs[..field_size.min(limbs.len())]),
    }
    println!("  Output verification: {}", if check_outputs { "enabled (CHECK_OUTPUTS=1)" } else { "disabled" });

    let result: MeasureOut = unsafe {
        measure_pair_with_verification::<MulFn>(
            so_candidate,
            candidate.symbol.as_bytes(),
            so_baseline,
            baseline.symbol.as_bytes(),
            cfg,
            field_size,
            check_outputs,
        )?
    };


    report_results(cfg, &candidate.symbol, &baseline.symbol, result);
    Ok(())
}

fn measure_square_pair(
    candidate: &crate::runtime_build::BuildArtifacts,
    baseline: &crate::runtime_build::BuildArtifacts,
    cfg: &MeasureCfg,
) -> Result<()> {
    type SquareFn = unsafe extern "C" fn(*mut u64, *const u64);

    let so_candidate = candidate.so_path.as_path();
    let so_baseline = baseline.so_path.as_path();
    let field_size = cfg.field_size;

    // Output verification before measurement (matches legacy behavior)
    println!("Verifying both functions produce identical outputs...");
    println!("  Using field size: {} limbs", field_size);
    match cfg.bounds {
        BoundSpec::Uniform(b) => println!("  Using uniform bound: {:#x}", b),
        BoundSpec::PerLimb(limbs) => println!("  Using per-limb bounds: {:?}", &limbs[..field_size.min(limbs.len())]),
    }
    
    let lib_a = unsafe { libloading::Library::new(so_candidate) }
        .map_err(|e| anyhow!("loading candidate library for verification: {}", e))?;
    let lib_b = unsafe { libloading::Library::new(so_baseline) }
        .map_err(|e| anyhow!("loading baseline library for verification: {}", e))?;
    
    let verified = unsafe {
        let func_a: SquareFn = std::mem::transmute(
            lib_a.get::<SquareFn>(candidate.symbol.as_bytes())
                .map_err(|e| anyhow!("getting candidate symbol for verification: {}", e))?
                .as_ptr()
        );
        let func_b: SquareFn = std::mem::transmute(
            lib_b.get::<SquareFn>(baseline.symbol.as_bytes())
                .map_err(|e| anyhow!("getting baseline symbol for verification: {}", e))?
                .as_ptr()
        );
        
        let mut mismatches = 0;
        const VERIFICATION_SAMPLES: usize = 100;
        
        for _ in 0..VERIFICATION_SAMPLES {
            let input = generate_random_bounded_u64(cfg.bounds, field_size);
            let mut out_a = vec![0u64; field_size];
            let mut out_b = vec![0u64; field_size];
            
            func_a(out_a.as_mut_ptr(), input.as_ptr());
            func_b(out_b.as_mut_ptr(), input.as_ptr());
            
            if out_a != out_b {
                mismatches += 1;
                if mismatches == 1 {
                    eprintln!("⚠️  Output mismatch detected!");
                    eprintln!("  Candidate output: {:?}", &out_a[..field_size.min(4)]);
                    eprintln!("  Baseline output:  {:?}", &out_b[..field_size.min(4)]);
                }
            }
        }
        
        if mismatches > 0 {
            eprintln!("❌ Found {} mismatches out of {} verification samples", mismatches, VERIFICATION_SAMPLES);
            eprintln!("   WARNING: Functions produce different results - measurements may be invalid!");
        } else {
            println!("✅ Output verification passed ({} samples)", VERIFICATION_SAMPLES);
        }
        
        mismatches == 0
    };

    let result: MeasureOut = unsafe {
        measure_pair::<SquareFn, SquareFn>(
            so_candidate,
            candidate.symbol.as_bytes(),
            so_baseline,
            baseline.symbol.as_bytes(),
            cfg,
            |ptr| {
                // Warmup with fixed inputs (all ones, within bounds)
                let func: SquareFn = std::mem::transmute(ptr);
                let mut out = vec![0u64; field_size];
                let input = vec![1u64; field_size];
                func(out.as_mut_ptr(), input.as_ptr());
            },
            |ptr, bs| {
                // Measurement with random bounded inputs (matches legacy behavior)
                let func: SquareFn = std::mem::transmute(ptr);
                let mut out = vec![0u64; field_size];
                
                // Generate random bounded inputs for this batch
                let input = generate_random_bounded_u64(cfg.bounds, field_size);
                
                for _ in 0..bs {
                    func(out.as_mut_ptr(), input.as_ptr());
                }
            },
        )?
    };

    if !verified {
        eprintln!("\n⚠️  WARNING: Measurement completed but output verification failed!");
        eprintln!("    The functions produce different results - comparison may be invalid.");
    }

    report_results(cfg, &candidate.symbol, &baseline.symbol, result);
    Ok(())
}

/// Measure mul pair with per-batch output verification
unsafe fn measure_pair_with_verification<F>(
    so_candidate: &std::path::Path,
    sym_candidate: &[u8],
    so_baseline: &std::path::Path,
    sym_baseline: &[u8],
    cfg: &MeasureCfg,
    field_size: usize,
    check_outputs: bool,
) -> Result<MeasureOut>
where
    F: Copy,
{
    type MulFn = unsafe extern "C" fn(*mut u64, *const u64, *const u64);
    
    let lib_a = libloading::Library::new(so_candidate)
        .map_err(|e| anyhow!("loading candidate library: {}", e))?;
    let lib_b = libloading::Library::new(so_baseline)
        .map_err(|e| anyhow!("loading baseline library: {}", e))?;
    
    let func_a: MulFn = std::mem::transmute(
        lib_a.get::<MulFn>(sym_candidate)
            .map_err(|e| anyhow!("getting candidate symbol: {}", e))?
            .as_ptr()
    );
    let func_b: MulFn = std::mem::transmute(
        lib_b.get::<MulFn>(sym_baseline)
            .map_err(|e| anyhow!("getting baseline symbol: {}", e))?
            .as_ptr()
    );
    
    // Warmup (matches legacy calibration phase)
    let lhs = vec![1u64; field_size];
    let rhs = vec![2u64; field_size];
    let mut out_a = vec![0u64; field_size];
    let mut out_b = vec![0u64; field_size];
    func_a(out_a.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
    func_b(out_b.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
    
    println!("Functions loaded and warmed up successfully");

    // Calibration phase
    let batch_size = {
        let calib_bs = cfg.initial_batch_size;
        let lhs = generate_random_bounded_u64(cfg.bounds, field_size);
        let rhs = generate_random_bounded_u64(cfg.bounds, field_size);
        let mut out = vec![0u64; field_size];
        
        let start = crate::measure_dyn::read_tsc();
        for _ in 0..calib_bs {
            func_a(out.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
        }
        unsafe { std::arch::x86_64::_mm_mfence(); }
        let calib_cycles = crate::measure_dyn::read_tsc().saturating_sub(start);
        
        let calibrated = crate::measure_dyn::calculate_optimal_batch_size(
            calib_cycles,
            calib_bs,
            cfg.cycle_goal,
            cfg.min_batch_size,
            cfg.max_batch_size,
        );
        
        let per_call_est = calib_cycles as f64 / calib_bs as f64;
        println!(
            "Calibrated batch size (candidate ref): {} (~{:.2} cycles/call at initial bs={})",
            calibrated, per_call_est, calib_bs
        );
        println!(
            "  Calibration: {} cycles at batch_size={}, target cycle_goal={}",
            calib_cycles, calib_bs, cfg.cycle_goal
        );
        
        calibrated
    };

    println!("Collecting {} batches with interleaved randomized order...", cfg.nob);

    use rand::{seq::SliceRandom, thread_rng};
    let mut rng = thread_rng();
    let mut order = [true, false]; // true=candidate, false=baseline

    let mut samples_a = Vec::with_capacity(cfg.nob);
    let mut samples_b = Vec::with_capacity(cfg.nob);
    let mut mismatches = 0;

    for batch_idx in 0..cfg.nob {
        // Generate random inputs for this batch
        let lhs = generate_random_bounded_u64(cfg.bounds, field_size);
        let rhs = generate_random_bounded_u64(cfg.bounds, field_size);
        let mut out_a = vec![0u64; field_size];
        let mut out_b = vec![0u64; field_size];
        
        order.shuffle(&mut rng);
        
        for &is_candidate in &order {
            let start = crate::measure_dyn::read_tsc();
            if is_candidate {
                for _ in 0..batch_size {
                    func_a(out_a.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
                }
            } else {
                for _ in 0..batch_size {
                    func_b(out_b.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
                }
            }
            unsafe { std::arch::x86_64::_mm_mfence(); }
            let elapsed = crate::measure_dyn::read_tsc().saturating_sub(start);
            
            if is_candidate {
                samples_a.push(elapsed);
            } else {
                samples_b.push(elapsed);
            }
        }
        
        // Check outputs for this batch (matches legacy behavior)
        if check_outputs && out_a != out_b {
            eprintln!("⚠️  Output mismatch detected in batch {} (mul)", batch_idx + 1);
            if mismatches == 0 {
                eprintln!("  Candidate output: {:?}", &out_a[..field_size.min(4)]);
                eprintln!("  Baseline output:  {:?}", &out_b[..field_size.min(4)]);
            }
            mismatches += 1;
        }
    }
    
    if check_outputs {
        if mismatches > 0 {
            eprintln!("\n❌ Found {} output mismatches out of {} batches", mismatches, cfg.nob);
            eprintln!("   WARNING: Functions produce different results - measurements may be invalid!");
        } else {
            println!("✅ Output verification passed ({} batches checked)", cfg.nob);
        }
    }

    let median_cycles_a = crate::measure_dyn::median(&mut samples_a);
    let median_cycles_b = crate::measure_dyn::median(&mut samples_b);

    Ok(MeasureOut {
        median_cycles_a,
        median_cycles_b,
        calibrated_batch_size: batch_size,
    })
}

fn report_results(cfg: &MeasureCfg, candidate_name: &str, baseline_name: &str, out: MeasureOut) {
    println!(
        "\nDynamic measurement complete (calibrated batch size {}, batches {})",
        out.calibrated_batch_size, cfg.nob
    );
    println!(
        "  Configuration: cycle_goal={}, initial_batch_size={}, input_bound={:#x}",
        cfg.cycle_goal, cfg.initial_batch_size, cfg.input_bound
    );
    let per_call_candidate = out.median_cycles_a as f64 / out.calibrated_batch_size as f64;
    let per_call_baseline = out.median_cycles_b as f64 / out.calibrated_batch_size as f64;
    println!(
        "  Candidate ({}): {:.2} cycles/call (median batch {})",
        candidate_name, per_call_candidate, out.median_cycles_a
    );
    println!(
        "  Baseline  ({}): {:.2} cycles/call (median batch {})",
        baseline_name, per_call_baseline, out.median_cycles_b
    );
    
    // Calculate ratio like CryptOpt: baseline_cycles / candidate_cycles
    // Ratio > 1.0 means candidate is faster than baseline
    // Ratio < 1.0 means candidate is slower than baseline
    let ratio = per_call_baseline / per_call_candidate;
    println!("  Ratio (baseline/candidate): {:.5}", ratio);
}
