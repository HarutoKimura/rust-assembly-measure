use std::env;

mod curve_spec;
mod ffi;
mod measurement;
mod precise_timing;

use crate::curve_spec::{CurveType, Function, ALL_CURVES};
use crate::measurement::{
    calculate_median, measure_u64_mul_functions_interleaved_enhanced,
    measure_u64_mul_functions_interleaved_enhanced_five,
    measure_u64_square_functions_interleaved_enhanced,
    measure_u64_square_functions_interleaved_enhanced_five,
    measure_usize_mul_functions_interleaved_enhanced,
};
use crate::precise_timing::{MeasurementConfig, MeasurementStats};

fn main() {
    // Enable output verification by default unless explicitly disabled.
    if env::var("CHECK_OUTPUTS").is_err() {
        env::set_var("CHECK_OUTPUTS", "1");
    }

    let args: Vec<String> = env::args().collect();
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
    println!("  Features: Memory barriers, Fisher-Yates randomization, dynamic batch sizing\n");

    let bounds = curve.bounds();
    let size = curve.size();

    if operation == "square" && curve.square_function().is_none() {
        println!(
            "Square operation is not available for curve '{}'.",
            curve.name()
        );
        return;
    }

    let mut gas_medians = Vec::with_capacity(repeats);
    let mut nasm_medians = Vec::with_capacity(repeats);
    let mut hand_medians = Vec::with_capacity(repeats);
    let mut hand_nasm_medians = Vec::with_capacity(repeats);
    let mut cryptopt_medians = Vec::with_capacity(repeats);

    let mut summary_labels = if operation == "square" {
        curve.square_labels()
    } else {
        curve.mul_labels()
    };

    for run in 1..=repeats {
        println!("=== Run {}/{} ===", run, repeats);

        match operation {
            "mul" => {
                let functions = curve.mul_function();
                match functions {
                    Function::U64Mul(llc_func, nasm_func, cryptopt_func) => {
                        let labels = curve.mul_labels();
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_u64_mul_functions_interleaved_enhanced(
                                bounds,
                                size,
                                llc_func,
                                nasm_func,
                                cryptopt_func,
                                &config,
                                labels.display,
                            );

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!(
                            "Run {} - {}: {} cycles, {}: {} cycles, {}: {} cycles",
                            run,
                            labels.display.0,
                            gas_stats.median,
                            labels.display.1,
                            nasm_stats.median,
                            labels.display.2,
                            cryptopt_stats.median
                        );
                        println!(
                            "Quality - {}: {}, {}: {}, {}: {}",
                            labels.display.0,
                            gas_stats.quality_assessment(),
                            labels.display.1,
                            nasm_stats.quality_assessment(),
                            labels.display.2,
                            cryptopt_stats.quality_assessment()
                        );
                        summary_labels = labels;
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

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!(
                            "Run {} - {}: {} cycles, {}: {} cycles, {}: {} cycles",
                            run,
                            labels.display.0,
                            gas_stats.median,
                            labels.display.1,
                            nasm_stats.median,
                            labels.display.2,
                            cryptopt_stats.median
                        );
                        println!(
                            "Quality - {}: {}, {}: {}, {}: {}",
                            labels.display.0,
                            gas_stats.quality_assessment(),
                            labels.display.1,
                            nasm_stats.quality_assessment(),
                            labels.display.2,
                            cryptopt_stats.quality_assessment()
                        );
                        summary_labels = labels;
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
                                bounds,
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
                        println!(
                            "Enhanced measurement not yet implemented for this curve's mul function type"
                        );
                        return;
                    }
                }
            }
            "square" => {
                let functions = curve
                    .square_function()
                    .expect("square function checked above");
                match functions {
                    Function::U64Square(llc_func, nasm_func, cryptopt_func) => {
                        let labels = curve.square_labels();
                        let (gas_stats, nasm_stats, cryptopt_stats) =
                            measure_u64_square_functions_interleaved_enhanced(
                                bounds,
                                size,
                                llc_func,
                                nasm_func,
                                cryptopt_func,
                                &config,
                                labels.display,
                            );

                        gas_medians.push(gas_stats.median);
                        nasm_medians.push(nasm_stats.median);
                        cryptopt_medians.push(cryptopt_stats.median);

                        println!(
                            "Run {} - {}: {} cycles, {}: {} cycles, {}: {} cycles",
                            run,
                            labels.display.0,
                            gas_stats.median,
                            labels.display.1,
                            nasm_stats.median,
                            labels.display.2,
                            cryptopt_stats.median
                        );
                        println!(
                            "Quality - {}: {}, {}: {}, {}: {}",
                            labels.display.0,
                            gas_stats.quality_assessment(),
                            labels.display.1,
                            nasm_stats.quality_assessment(),
                            labels.display.2,
                            cryptopt_stats.quality_assessment()
                        );
                        summary_labels = labels;
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
                                bounds,
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

    println!("=== Summary Across {} Run(s) ===", repeats);
    println!(
        "  Median of medians - {}: {} cycles",
        summary_labels.display.0, gas_mom
    );
    println!(
        "  Median of medians - {}: {} cycles",
        summary_labels.display.1, nasm_mom
    );
    println!(
        "  Median of medians - {}: {} cycles",
        summary_labels.display.2, cryptopt_mom
    );
    if let Some(hm) = hand_mom {
        println!("  Median of medians - Hand: {} cycles", hm);
    }
    if let Some(hnm) = hand_nasm_mom {
        println!("  Median of medians - Hand-NASM: {} cycles", hnm);
    }

    println!();
    println!("Relative speedups:");
    let diff_gas = ((gas_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
    let diff_nasm = ((nasm_mom as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
    println!(
        "  CryptOpt vs {}: {:+.2}% ({} vs {} cycles)",
        summary_labels.short.0, diff_gas, cryptopt_mom, gas_mom
    );
    println!(
        "  CryptOpt vs {}: {:+.2}% ({} vs {} cycles)",
        summary_labels.short.1, diff_nasm, cryptopt_mom, nasm_mom
    );
    if let Some(hm) = hand_mom {
        let diff_hand = ((hm as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
        println!(
            "  CryptOpt vs Hand: {:+.2}% ({} vs {} cycles)",
            diff_hand, cryptopt_mom, hm
        );
    }
    if let Some(hnm) = hand_nasm_mom {
        let diff_hand_nasm = ((hnm as f64 - cryptopt_mom as f64) / cryptopt_mom as f64) * 100.0;
        println!(
            "  CryptOpt vs Hand-NASM: {:+.2}% ({} vs {} cycles)",
            diff_hand_nasm, cryptopt_mom, hnm
        );
    }

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
        summary_labels.display.0,
        gas_stats_final.coefficient_of_variation * 100.0,
        gas_stats_final.quality_assessment()
    );
    println!(
        "  {}: CV = {:.3}% ({})",
        summary_labels.display.1,
        nasm_stats_final.coefficient_of_variation * 100.0,
        nasm_stats_final.quality_assessment()
    );
    println!(
        "  {}: CV = {:.3}% ({})",
        summary_labels.display.2,
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

    println!();
    println!("Detailed Statistics (across {} runs):", repeats);
    println!("  {}:", summary_labels.display.0);
    println!("    Mean: {:.2} cycles", gas_stats_final.mean);
    println!("    Median: {} cycles", gas_stats_final.median);
    println!("    Std Dev: {:.2} cycles", gas_stats_final.std_dev);
    println!(
        "    95% CI: [{:.2}, {:.2}] cycles",
        gas_stats_final.confidence_interval_95.0, gas_stats_final.confidence_interval_95.1
    );
    println!("  {}:", summary_labels.display.1);
    println!("    Mean: {:.2} cycles", nasm_stats_final.mean);
    println!("    Median: {} cycles", nasm_stats_final.median);
    println!("    Std Dev: {:.2} cycles", nasm_stats_final.std_dev);
    println!(
        "    95% CI: [{:.2}, {:.2}] cycles",
        nasm_stats_final.confidence_interval_95.0, nasm_stats_final.confidence_interval_95.1
    );
    println!("  {}:", summary_labels.display.2);
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

    println!();
    println!("Statistical Significance Assessment:");
    if gas_stats_final.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
        println!(
            "  {} faster than {} (95% CI non-overlapping)",
            summary_labels.short.0, summary_labels.short.2
        );
    } else if cryptopt_stats_final.confidence_interval_95.1
        < gas_stats_final.confidence_interval_95.0
    {
        println!(
            "  {} is faster than {} (95% CI non-overlapping)",
            summary_labels.short.2, summary_labels.short.0
        );
    } else {
        println!(
            "  No significant difference between {} and {} (95% CI overlapping)",
            summary_labels.short.0, summary_labels.short.2
        );
    }

    if nasm_stats_final.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
        println!(
            "  {} is faster than {} (95% CI non-overlapping)",
            summary_labels.short.1, summary_labels.short.2
        );
    } else if cryptopt_stats_final.confidence_interval_95.1
        < nasm_stats_final.confidence_interval_95.0
    {
        println!(
            "  {} is faster than {} (95% CI non-overlapping)",
            summary_labels.short.2, summary_labels.short.1
        );
    } else {
        println!(
            "  No difference between {} and {} (95% CI overlapping)",
            summary_labels.short.1, summary_labels.short.2
        );
    }

    if let Some(hs) = &hand_stats_final {
        if hs.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
            println!(
                "  Hand-optimised GAS is faster than CryptOpt (95% CI non-overlapping)"
            );
        } else if cryptopt_stats_final.confidence_interval_95.1 < hs.confidence_interval_95.0 {
            println!(
                "  CryptOpt is faster than Hand-optimised GAS (95% CI non-overlapping)"
            );
        } else {
            println!(
                "  No difference between Hand-optimised GAS and CryptOpt (95% CI overlapping)"
            );
        }
    }
    if let Some(hns) = &hand_nasm_stats_final {
        if hns.confidence_interval_95.1 < cryptopt_stats_final.confidence_interval_95.0 {
            println!(
                "  Hand-optimised NASM is faster than CryptOpt (95% CI non-overlapping)"
            );
        } else if cryptopt_stats_final.confidence_interval_95.1 < hns.confidence_interval_95.0 {
            println!(
                "  CryptOpt is faster than Hand-optimised NASM (95% CI non-overlapping)"
            );
        } else {
            println!(
                "  No difference between Hand-optimised NASM and CryptOpt (95% CI overlapping)"
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
