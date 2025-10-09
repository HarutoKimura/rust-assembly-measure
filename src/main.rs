#[cfg(all(feature = "dynamic-api", target_arch = "x86_64"))]
use rust_assembly_measure::dynamic_cli;
use std::env;
#[cfg(all(feature = "dynamic-api", target_arch = "x86_64"))]
use std::process;

mod curve_spec;
mod ffi;
mod measurement;
mod precise_timing;

use crate::curve_spec::{CurveType, Function, FunctionLabels, ALL_CURVES};
use crate::measurement::{
    calculate_median, measure_u64_mul_functions_interleaved_enhanced,
    measure_u64_mul_functions_interleaved_enhanced_five,
    measure_u64_mul_functions_interleaved_enhanced_four,
    measure_u64_square_functions_interleaved_enhanced,
    measure_u64_square_functions_interleaved_enhanced_five,
    measure_u64_square_functions_interleaved_enhanced_four,
    measure_usize_mul_functions_interleaved_enhanced,
};
use crate::precise_timing::{MeasurementConfig, MeasurementStats};

fn main() {
    let args: Vec<String> = env::args().collect();

    #[cfg(all(feature = "dynamic-api", target_arch = "x86_64"))]
    {
        if let Some(result) = dynamic_cli::maybe_run_dynamic(&args[1..]) {
            match result {
                Ok(()) => return,
                Err(err) => {
                    eprintln!("dynamic measurement failed: {err}");
                    process::exit(1);
                }
            }
        }
    }

    run_legacy(&args);
}

fn run_legacy(args: &[String]) {
    // Enable output verification by default unless explicitly disabled.
    if env::var("CHECK_OUTPUTS").is_err() {
        env::set_var("CHECK_OUTPUTS", "1");
    }

    if args.len() < 3 || args.len() > 4 {
        print_usage();
        return;
    }

    let curve_name = &args[1];
    let operation = args[2].as_str();

    let curve = match CurveType::from_name(curve_name) {
        Some(curve) => curve,
        None => {
            eprintln!(
                "Unknown curve: {}. Available curves: {}",
                curve_name,
                available_curves()
            );
            return;
        }
    };

    if operation != "mul" && operation != "square" {
        eprintln!(
            "Unknown operation: {}. Available operations: mul, square",
            operation
        );
        return;
    }

    let repeats = if args.len() == 4 {
        args[3].parse().unwrap_or_else(|_| {
            eprintln!("Could not parse repeat_count. Defaulting to 1.");
            1
        })
    } else {
        1
    };

    println!(
        "Measuring {} for operation '{}' using enhanced methodology...",
        curve.name(),
        operation
    );
    println!(
        "Features: Memory barriers, randomized batching, cycle-goal calibration, statistical analysis\n"
    );

    run_measurements(curve, operation, repeats);
}

fn print_usage() {
    println!("Usage: cargo run <curve_name> <operation> [repeat_count]");
    println!("Available curves: {}", available_curves());
    println!("Available operations: mul, square");
}

fn available_curves() -> String {
    ALL_CURVES
        .iter()
        .map(|curve| curve.name())
        .collect::<Vec<_>>()
        .join(", ")
}

fn run_measurements(curve: CurveType, operation: &str, repeats: usize) {
    let config = MeasurementConfig {
        cycle_goal: 10_000,
        num_batches: 31,
        initial_batch_size: 200,
        min_batch_size: 10,
        max_batch_size: 5_000,
    };

    println!("Enhanced Measurement Configuration:");
    println!("  Cycle Goal: {} cycles/batch", config.cycle_goal);
    println!("  Number of Batches: {}", config.num_batches);
    println!("  Repeats: {} (median-of-medians)", repeats);
    println!(
        "  Features: Memory barriers, Fisher-Yates randomization, dynamic batch sizing
"
    );

    let bounds = curve.bounds();
    let size = curve.size();

    if operation == "square" && curve.square_function().is_none() {
        println!(
            "Square operation is not available for curve '{}'.",
            curve.name()
        );
        return;
    }

    let mut summary_labels = if operation == "square" {
        curve.square_labels()
    } else {
        curve.mul_labels()
    };

    let mut variant_medians: Vec<Vec<u64>> = (0..summary_labels.len())
        .map(|_| Vec::with_capacity(repeats))
        .collect();

    let mut record_run = |labels: FunctionLabels, stats: Vec<MeasurementStats>, run: usize| {
        if variant_medians.len() != stats.len() {
            if run == 1 {
                variant_medians = (0..stats.len())
                    .map(|_| Vec::with_capacity(repeats))
                    .collect();
            } else {
                panic!(
                    "variant count changed between runs ({} -> {})",
                    variant_medians.len(),
                    stats.len()
                );
            }
        }

        let cycle_line = stats
            .iter()
            .enumerate()
            .map(|(idx, stat)| format!("{}: {} cycles", labels.display(idx), stat.median))
            .collect::<Vec<_>>()
            .join(", ");
        println!("Run {} - {}", run, cycle_line);

        let quality_line = stats
            .iter()
            .enumerate()
            .map(|(idx, stat)| format!("{}: {}", labels.display(idx), stat.quality_assessment()))
            .collect::<Vec<_>>()
            .join(", ");
        println!("Quality - {}", quality_line);

        for (idx, stat) in stats.iter().enumerate() {
            variant_medians[idx].push(stat.median);
        }

        summary_labels = labels;
    };

    for run in 1..=repeats {
        println!("=== Run {}/{} ===", run, repeats);

        match operation {
            "mul" => {
                let functions = curve.mul_function();
                match functions {
                    Function::U64Mul(llc_func, nasm_func, cryptopt_func) => {
                        let labels = curve.mul_labels();
                        let label_tuple = (labels.display(0), labels.display(1), labels.display(2));
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_u64_mul_functions_interleaved_enhanced(
                                bounds,
                                size,
                                llc_func,
                                nasm_func,
                                cryptopt_func,
                                &config,
                                label_tuple,
                            );
                        record_run(labels, vec![gas_stats, nasm_stats, cryptopt_stats], run);
                    }
                    Function::U64MulFour(llc_func, nasm_func, enhanced_func, cryptopt_func) => {
                        let labels = curve.mul_labels();
                        let label_tuple = (
                            labels.display(0),
                            labels.display(1),
                            labels.display(2),
                            labels.display(3),
                        );
                        let (gcc_stats, clang_stats, enhanced_stats, cryptopt_stats) =
                            measure_u64_mul_functions_interleaved_enhanced_four(
                                bounds,
                                size,
                                llc_func,
                                nasm_func,
                                enhanced_func,
                                cryptopt_func,
                                &config,
                                label_tuple,
                            );
                        record_run(
                            labels,
                            vec![gcc_stats, clang_stats, enhanced_stats, cryptopt_stats],
                            run,
                        );
                    }
                    Function::U64MulFive(
                        llc_func,
                        nasm_func,
                        hand_func,
                        hand_nasm_func,
                        cryptopt_func,
                    ) => {
                        let labels = curve.mul_labels();
                        let label_tuple = (
                            labels.display(0),
                            labels.display(1),
                            labels.display(2),
                            labels.display(3),
                            labels.display(4),
                        );
                        let functions = [
                            llc_func,
                            nasm_func,
                            hand_func,
                            hand_nasm_func,
                            cryptopt_func,
                        ];
                        let (baseline_stats, second_stats, third_stats, fourth_stats, fifth_stats) =
                            measure_u64_mul_functions_interleaved_enhanced_five(
                                bounds,
                                size,
                                functions,
                                &config,
                                label_tuple,
                            );
                        record_run(
                            labels,
                            vec![
                                baseline_stats,
                                second_stats,
                                third_stats,
                                fourth_stats,
                                fifth_stats,
                            ],
                            run,
                        );
                    }
                    Function::UsizeMul(llc_func, nasm_func, cryptopt_func) => {
                        let labels = curve.mul_labels();
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_usize_mul_functions_interleaved_enhanced(
                                bounds,
                                size,
                                llc_func,
                                nasm_func,
                                cryptopt_func,
                                &config,
                            );
                        record_run(labels, vec![gas_stats, nasm_stats, cryptopt_stats], run);
                    }
                    _ => {
                        println!(
                            "Enhanced mul measurement not yet implemented for this curve's function type"
                        );
                        return;
                    }
                }
            }
            "square" => {
                let functions = curve.square_function().unwrap();
                match functions {
                    Function::U64Square(llc_func, nasm_func, cryptopt_func) => {
                        let labels = curve.square_labels();
                        let label_tuple = (labels.display(0), labels.display(1), labels.display(2));
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_u64_square_functions_interleaved_enhanced(
                                bounds,
                                size,
                                llc_func,
                                nasm_func,
                                cryptopt_func,
                                &config,
                                label_tuple,
                            );
                        record_run(labels, vec![gas_stats, nasm_stats, cryptopt_stats], run);
                    }
                    Function::U64SquareFour(llc_func, nasm_func, hand_func, cryptopt_func) => {
                        let labels = curve.square_labels();
                        let label_tuple = (
                            labels.display(0),
                            labels.display(1),
                            labels.display(2),
                            labels.display(3),
                        );
                        let functions = [llc_func, nasm_func, hand_func, cryptopt_func];
                        let (baseline_stats, second_stats, third_stats, fourth_stats) =
                            measure_u64_square_functions_interleaved_enhanced_four(
                                bounds,
                                size,
                                functions,
                                &config,
                                label_tuple,
                            );
                        record_run(
                            labels,
                            vec![baseline_stats, second_stats, third_stats, fourth_stats],
                            run,
                        );
                    }
                    Function::U64SquareFive(
                        llc_func,
                        nasm_func,
                        hand_func,
                        hand_nasm_func,
                        cryptopt_func,
                    ) => {
                        let labels = curve.square_labels();
                        let (gas_stats, nasm_stats, hand_stats, hand_nasm_stats, cryptopt_stats) =
                            measure_u64_square_functions_interleaved_enhanced_five(
                                bounds,
                                size,
                                llc_func,
                                nasm_func,
                                hand_func,
                                hand_nasm_func,
                                cryptopt_func,
                                &config,
                            );
                        record_run(
                            labels,
                            vec![
                                gas_stats,
                                nasm_stats,
                                hand_stats,
                                hand_nasm_stats,
                                cryptopt_stats,
                            ],
                            run,
                        );
                    }
                    _ => {
                        println!(
                            "Enhanced square measurement not yet implemented for this curve's function type"
                        );
                        return;
                    }
                }
            }
            _ => unreachable!(),
        }

        println!();
    }

    let medians_of_medians: Vec<u64> = (0..summary_labels.len())
        .map(|idx| calculate_median(variant_medians[idx].clone()))
        .collect();

    println!("=== Summary Across {} Run(s) ===", repeats);
    for idx in 0..summary_labels.len() {
        println!(
            "  Median of medians - {}: {} cycles",
            summary_labels.display(idx),
            medians_of_medians[idx]
        );
    }

    println!();
    println!("Relative speedups:");
    let cryptopt_idx = summary_labels.len() - 1;
    let cryptopt_mom = medians_of_medians[cryptopt_idx];
    for idx in 0..cryptopt_idx {
        let diff =
            ((medians_of_medians[idx] as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
        println!(
            "  {} vs {}: {:+.2}% ({} vs {} cycles)",
            summary_labels.short(cryptopt_idx),
            summary_labels.short(idx),
            diff,
            cryptopt_mom,
            medians_of_medians[idx]
        );
    }

    println!();
    println!("Measurement Stability Analysis:");
    let final_stats: Vec<MeasurementStats> = variant_medians
        .iter()
        .map(|values| MeasurementStats::from_measurements(values))
        .collect();
    for idx in 0..summary_labels.len() {
        let stats = &final_stats[idx];
        println!(
            "  {}: CV = {:.3}% ({})",
            summary_labels.display(idx),
            stats.coefficient_of_variation * 100.0,
            stats.quality_assessment()
        );
    }

    println!();
    println!("Detailed Statistics (across {} runs):", repeats);
    for idx in 0..summary_labels.len() {
        let stats = &final_stats[idx];
        println!("  {}:", summary_labels.display(idx));
        println!("    Mean: {:.2} cycles", stats.mean);
        println!("    Median: {} cycles", stats.median);
        println!("    Std Dev: {:.2} cycles", stats.std_dev);
        println!(
            "    95% CI: [{:.2}, {:.2}] cycles",
            stats.confidence_interval_95.0, stats.confidence_interval_95.1
        );
    }

    println!();
    println!("Statistical Significance Assessment:");
    let cryptopt_stats = &final_stats[cryptopt_idx];
    for idx in 0..cryptopt_idx {
        let baseline_stats = &final_stats[idx];
        if baseline_stats.confidence_interval_95.1 < cryptopt_stats.confidence_interval_95.0 {
            println!(
                "  {} faster than {} (95% CI non-overlapping)",
                summary_labels.short(idx),
                summary_labels.short(cryptopt_idx)
            );
        } else if cryptopt_stats.confidence_interval_95.1 < baseline_stats.confidence_interval_95.0
        {
            println!(
                "  {} is faster than {} (95% CI non-overlapping)",
                summary_labels.short(cryptopt_idx),
                summary_labels.short(idx)
            );
        } else {
            println!(
                "  No significant difference between {} and {} (95% CI overlapping)",
                summary_labels.short(idx),
                summary_labels.short(cryptopt_idx)
            );
        }
    }

    println!();
    println!("Note: This enhanced methodology addresses reviewer concerns about:");
    println!("  ✓ Memory barriers (mfence before rdtsc)");
    println!("  ✓ Randomized batch execution order (Fisher-Yates)");
    println!("  ✓ Statistical analysis with coefficient of variation");
    println!("  ✓ Dynamic batch sizing based on cycle goals");
    println!("  • CPU pinning and frequency control: Use setup_benchmark_environment.sh");
}
