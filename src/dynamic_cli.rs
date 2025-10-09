#![cfg(all(feature = "dynamic-api", target_arch = "x86_64"))]

use std::path::Path;
use std::str::FromStr;

use anyhow::{anyhow, Context, Result};

use crate::measure_dyn::{measure_pair, MeasureCfg, MeasureOut};
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
               --cpu CORE             Pin to specific CPU core",
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
    use rand::{thread_rng, Rng};
    type MulFn = unsafe extern "C" fn(*mut u64, *const u64, *const u64);

    let so_candidate = candidate.so_path.as_path();
    let so_baseline = baseline.so_path.as_path();

    // Output verification before measurement (matches legacy behavior)
    println!("Verifying both functions produce identical outputs...");
    let lib_a = unsafe { libloading::Library::new(so_candidate) }
        .map_err(|e| anyhow!("loading candidate library for verification: {}", e))?;
    let lib_b = unsafe { libloading::Library::new(so_baseline) }
        .map_err(|e| anyhow!("loading baseline library for verification: {}", e))?;
    
    let verified = unsafe {
        let func_a: MulFn = std::mem::transmute(
            lib_a.get::<MulFn>(candidate.symbol.as_bytes())
                .map_err(|e| anyhow!("getting candidate symbol for verification: {}", e))?
                .as_ptr()
        );
        let func_b: MulFn = std::mem::transmute(
            lib_b.get::<MulFn>(baseline.symbol.as_bytes())
                .map_err(|e| anyhow!("getting baseline symbol for verification: {}", e))?
                .as_ptr()
        );
        
        let mut rng = thread_rng();
        let mut mismatches = 0;
        const VERIFICATION_SAMPLES: usize = 100;
        
        for _ in 0..VERIFICATION_SAMPLES {
            let lhs: [u64; 16] = core::array::from_fn(|_| rng.gen());
            let rhs: [u64; 16] = core::array::from_fn(|_| rng.gen());
            let mut out_a = [0u64; 16];
            let mut out_b = [0u64; 16];
            
            func_a(out_a.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
            func_b(out_b.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
            
            if out_a != out_b {
                mismatches += 1;
                if mismatches == 1 {
                    eprintln!("⚠️  Output mismatch detected!");
                    eprintln!("  Candidate output: {:?}", &out_a[..4]);
                    eprintln!("  Baseline output:  {:?}", &out_b[..4]);
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
        measure_pair::<MulFn, MulFn>(
            so_candidate,
            candidate.symbol.as_bytes(),
            so_baseline,
            baseline.symbol.as_bytes(),
            cfg,
            |ptr| {
                // Warmup with fixed inputs
                let func: MulFn = std::mem::transmute(ptr);
                let mut out = [0u64; 16];
                let lhs = [1u64; 16];
                let rhs = [2u64; 16];
                func(out.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
            },
            |ptr, bs| {
                // Measurement with random inputs (matches legacy behavior)
                let func: MulFn = std::mem::transmute(ptr);
                let mut rng = thread_rng();
                let mut out = [0u64; 16];
                
                // Generate random inputs for this batch
                let lhs: [u64; 16] = core::array::from_fn(|_| rng.gen());
                let rhs: [u64; 16] = core::array::from_fn(|_| rng.gen());
                
                for _ in 0..bs {
                    func(out.as_mut_ptr(), lhs.as_ptr(), rhs.as_ptr());
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

fn measure_square_pair(
    candidate: &crate::runtime_build::BuildArtifacts,
    baseline: &crate::runtime_build::BuildArtifacts,
    cfg: &MeasureCfg,
) -> Result<()> {
    use rand::{thread_rng, Rng};
    type SquareFn = unsafe extern "C" fn(*mut u64, *const u64);

    let so_candidate = candidate.so_path.as_path();
    let so_baseline = baseline.so_path.as_path();

    // Output verification before measurement (matches legacy behavior)
    println!("Verifying both functions produce identical outputs...");
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
        
        let mut rng = thread_rng();
        let mut mismatches = 0;
        const VERIFICATION_SAMPLES: usize = 100;
        
        for _ in 0..VERIFICATION_SAMPLES {
            let input: [u64; 16] = core::array::from_fn(|_| rng.gen());
            let mut out_a = [0u64; 16];
            let mut out_b = [0u64; 16];
            
            func_a(out_a.as_mut_ptr(), input.as_ptr());
            func_b(out_b.as_mut_ptr(), input.as_ptr());
            
            if out_a != out_b {
                mismatches += 1;
                if mismatches == 1 {
                    eprintln!("⚠️  Output mismatch detected!");
                    eprintln!("  Candidate output: {:?}", &out_a[..4]);
                    eprintln!("  Baseline output:  {:?}", &out_b[..4]);
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
                // Warmup with fixed inputs
                let func: SquareFn = std::mem::transmute(ptr);
                let mut out = [0u64; 16];
                let input = [1u64; 16];
                func(out.as_mut_ptr(), input.as_ptr());
            },
            |ptr, bs| {
                // Measurement with random inputs (matches legacy behavior)
                let func: SquareFn = std::mem::transmute(ptr);
                let mut rng = thread_rng();
                let mut out = [0u64; 16];
                
                // Generate random inputs for this batch
                let input: [u64; 16] = core::array::from_fn(|_| rng.gen());
                
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
    let speedup = (per_call_baseline - per_call_candidate) / per_call_baseline * 100.0;
    println!(
        "  Speedup: {:.2}% (ratio baseline/candidate: {:.3})",
        speedup,
        per_call_baseline / per_call_candidate
    );
}
