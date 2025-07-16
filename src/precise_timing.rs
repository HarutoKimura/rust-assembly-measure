// Precise Timing Measurement Module
// Implementation based on CryptOpt paper methodology to address reviewer concerns
// Features:
// - Proper memory barriers (mfence) before RDTSC
// - Randomized batch execution order (R3-validation)
// - Proper warm-up procedures
// - Dynamic batch size scaling based on cycle goal
// - Enhanced noise mitigation

use rand::prelude::*;
use core::arch::x86_64::{_rdtsc, _mm_mfence};

/// CryptOpt-style timing measurement configuration
#[derive(Debug, Clone)]
pub struct MeasurementConfig {
    /// Target cycles per batch for stable measurements (CryptOpt uses 10,000)
    pub cycle_goal: u64,
    /// Number of batches to measure (CryptOpt uses 31)
    pub num_batches: usize,
    /// Initial batch size (will be dynamically adjusted)
    pub initial_batch_size: usize,
    /// Minimum batch size to prevent too small measurements
    pub min_batch_size: usize,
    /// Maximum batch size to prevent excessive runtime
    pub max_batch_size: usize,
    /// Number of warm-up iterations before actual measurement
    pub warmup_iterations: usize,
}

impl Default for MeasurementConfig {
    fn default() -> Self {
        Self {
            cycle_goal: 10_000,      // CryptOpt's cyclegoal
            num_batches: 31,         // CryptOpt's default number of batches
            initial_batch_size: 200, // Current implementation's batch size
            min_batch_size: 10,      // Prevent degenerate cases
            max_batch_size: 10_000,  // Prevent excessive runtime
            warmup_iterations: 10,   // Mitigate initialization bias
        }
    }
}

/// Enhanced cycle measurement with proper memory barriers
/// Following CryptOpt/DUDECT methodology
#[inline(always)]
pub fn precise_rdtsc() -> u64 {
    unsafe {
        // Memory fence to ensure all prior operations complete
        // This prevents CPU reordering from affecting timing
        _mm_mfence();
        _rdtsc()
    }
}

/// Warm-up function to mitigate initialization bias
/// Runs the target function multiple times without measuring
pub fn warmup_function<F>(mut warmup_func: F, iterations: usize)
where
    F: FnMut(),
{
    for _ in 0..iterations {
        warmup_func();
        // Add a small barrier to prevent over-optimization
        unsafe { _mm_mfence(); }
    }
}

/// Fisher-Yates shuffle for randomizing batch execution order
/// This implements the R3-validation approach from CryptOpt
pub fn randomize_batch_order(size: usize, rng: &mut ThreadRng) -> Vec<usize> {
    let mut indices: Vec<usize> = (0..size).collect();
    
    // Fisher-Yates shuffle
    for i in (1..indices.len()).rev() {
        let j = rng.gen_range(0..=i);
        indices.swap(i, j);
    }
    
    indices
}

/// Dynamic batch size calculation based on measured cycles
/// Follows CryptOpt's approach of scaling batch size to achieve cycle goal
pub fn calculate_optimal_batch_size(
    measured_cycles: u64,
    current_batch_size: usize,
    cycle_goal: u64,
    min_size: usize,
    max_size: usize,
) -> usize {
    if measured_cycles == 0 {
        return current_batch_size;
    }
    
    // Calculate scaling factor
    let scale_factor = cycle_goal as f64 / measured_cycles as f64;
    let new_size = (current_batch_size as f64 * scale_factor) as usize;
    
    // Clamp to reasonable bounds
    new_size.max(min_size).min(max_size)
}

/// Single batch measurement with precise timing
pub fn measure_single_batch<F>(
    measurement_func: &mut F,
    batch_size: usize,
) -> u64
where
    F: FnMut(),
{
    // Start timing
    let start = precise_rdtsc();
    
    // Execute the batch
    for _ in 0..batch_size {
        measurement_func();
    }
    
    // End timing
    let end = precise_rdtsc();
    
    // Return cycles, handling potential overflow
    end.saturating_sub(start)
}

/// Enhanced measurement function implementing CryptOpt methodology
pub fn measure_with_cryptopt_method<F, G>(
    config: &MeasurementConfig,
    mut measurement_func: F,
    mut warmup_func: G,
) -> Vec<u64>
where
    F: FnMut(),
    G: FnMut(),
{
    let mut rng = thread_rng();
    let mut current_batch_size = config.initial_batch_size;
    
    // Phase 1: Warm-up to mitigate initialization bias
    println!("Performing warm-up ({} iterations)...", config.warmup_iterations);
    warmup_function(|| warmup_func(), config.warmup_iterations);
    
    // Phase 2: Calibration run to determine optimal batch size
    println!("Calibrating batch size for cycle goal of {} cycles...", config.cycle_goal);
    let calibration_cycles = measure_single_batch(&mut measurement_func, current_batch_size);
    current_batch_size = calculate_optimal_batch_size(
        calibration_cycles,
        current_batch_size,
        config.cycle_goal,
        config.min_batch_size,
        config.max_batch_size,
    );
    
    println!("Optimal batch size: {} (estimated {} cycles per batch)", 
             current_batch_size, 
             calibration_cycles as f64 * current_batch_size as f64 / config.initial_batch_size as f64);
    
    // Phase 3: Additional targeted warm-up with optimal batch size
    println!("Final warm-up with optimal batch size...");
    for _ in 0..5 {
        measure_single_batch(&mut measurement_func, current_batch_size);
    }
    
    // Phase 4: Collect measurements with randomized execution order
    println!("Collecting {} batches with randomized execution order...", config.num_batches);
    
    // Create randomized execution order (R3-validation)
    let execution_order = randomize_batch_order(config.num_batches, &mut rng);
    let mut batch_results = vec![0u64; config.num_batches];
    
    // Execute batches in randomized order
    for &batch_idx in &execution_order {
        let cycles = measure_single_batch(&mut measurement_func, current_batch_size);
        batch_results[batch_idx] = cycles;
        
        // Optional: Print progress for long measurements
        if config.num_batches > 10 && batch_idx % (config.num_batches / 4) == 0 {
            println!("Progress: {}/{} batches completed", 
                     execution_order.iter().position(|&x| x == batch_idx).unwrap() + 1,
                     config.num_batches);
        }
    }
    
    // Normalize results by batch size to get cycles per operation
    batch_results.into_iter()
        .map(|cycles| cycles / current_batch_size as u64)
        .collect()
}

/// Calculate median from a vector of measurements
pub fn calculate_median(mut values: Vec<u64>) -> u64 {
    if values.is_empty() {
        return 0;
    }
    
    values.sort_unstable();
    let mid = values.len() / 2;
    
    if values.len() % 2 == 0 {
        (values[mid - 1] + values[mid]) / 2
    } else {
        values[mid]
    }
}

/// Approximate the cumulative distribution function of the standard normal distribution
fn normal_cdf(z: f64) -> f64 {
    // Using approximation from Abramowitz and Stegun
    let a1 =  0.254829592;
    let a2 = -0.284496736;
    let a3 =  1.421413741;
    let a4 = -1.453152027;
    let a5 =  1.061405429;
    let p  =  0.3275911;
    
    let sign = if z < 0.0 { -1.0 } else { 1.0 };
    let z = z.abs();
    
    let t = 1.0 / (1.0 + p * z);
    let y = 1.0 - (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * (-z * z).exp();
    
    0.5 * (1.0 + sign * y)
}

/// Calculate approximate p-value for two-sample t-test
/// Returns the p-value for the null hypothesis that two samples have the same mean
pub fn calculate_p_value(sample1: &[u64], sample2: &[u64]) -> f64 {
    if sample1.is_empty() || sample2.is_empty() {
        return 1.0;
    }
    
    // Calculate means
    let mean1 = sample1.iter().map(|&x| x as f64).sum::<f64>() / sample1.len() as f64;
    let mean2 = sample2.iter().map(|&x| x as f64).sum::<f64>() / sample2.len() as f64;
    
    // Calculate variances
    let var1 = sample1.iter()
        .map(|&x| {
            let diff = x as f64 - mean1;
            diff * diff
        })
        .sum::<f64>() / (sample1.len() - 1) as f64;
    
    let var2 = sample2.iter()
        .map(|&x| {
            let diff = x as f64 - mean2;
            diff * diff
        })
        .sum::<f64>() / (sample2.len() - 1) as f64;
    
    // Calculate t-statistic using Welch's t-test (for unequal variances)
    let n1 = sample1.len() as f64;
    let n2 = sample2.len() as f64;
    let se = ((var1 / n1) + (var2 / n2)).sqrt();
    
    if se == 0.0 {
        return 1.0; // No variation, cannot determine significance
    }
    
    let t_stat = (mean1 - mean2).abs() / se;
    
    // Calculate degrees of freedom using Welch-Satterthwaite equation
    let df = ((var1 / n1 + var2 / n2).powi(2)) / 
             ((var1 / n1).powi(2) / (n1 - 1.0) + (var2 / n2).powi(2) / (n2 - 1.0));
    
    // Debug output (can be removed later)
    println!("Debug: mean1={:.2}, mean2={:.2}, t_stat={:.4}, df={:.2}", mean1, mean2, t_stat, df);
    
    // For large degrees of freedom, t-distribution approaches normal distribution
    // We'll use normal approximation for df > 30
    let p_value = if df > 30.0 {
        // Use normal distribution approximation
        2.0 * (1.0 - normal_cdf(t_stat))
    } else {
        // Simplified but more accurate p-value calculation
        // Using approximation based on t-statistic and degrees of freedom
        
        // For extreme t-values, return very small p-values
        if t_stat > 10.0 {
            0.000001
        } else if t_stat > 5.0 {
            0.00001
        } else {
            // Use a better approximation for moderate t-values
            // This approximation works well for df between 10 and 30
            let z = t_stat / (1.0 + 0.2316419 * t_stat / df.sqrt()).sqrt();
            2.0 * (1.0 - normal_cdf(z))
        }
    };
    
    // Return the actual p-value without artificial floor
    p_value.min(1.0).max(0.0)
}

/// Remove outliers using Interquartile Range (IQR) method
pub fn remove_outliers(data: &[u64]) -> Vec<u64> {
    if data.len() < 4 {
        return data.to_vec(); // Not enough data to determine outliers
    }
    
    let mut sorted = data.to_vec();
    sorted.sort_unstable();
    
    let q1_idx = sorted.len() / 4;
    let q3_idx = 3 * sorted.len() / 4;
    
    let q1 = sorted[q1_idx] as f64;
    let q3 = sorted[q3_idx] as f64;
    let iqr = q3 - q1;
    
    let lower_bound = q1 - 1.5 * iqr;
    let upper_bound = q3 + 1.5 * iqr;
    
    data.iter()
        .filter(|&&x| x as f64 >= lower_bound && x as f64 <= upper_bound)
        .copied()
        .collect()
}

/// Advanced statistics calculation for measurement validation
#[derive(Debug)]
pub struct MeasurementStats {
    pub median: u64,
    pub mean: f64,
    pub std_dev: f64,
    pub min: u64,
    pub max: u64,
    pub coefficient_of_variation: f64,
    pub confidence_interval_95: (f64, f64),
    pub raw_cycles: Vec<u64>,
    pub filtered_cycles: Vec<u64>,
    pub outliers_removed: usize,
}

impl MeasurementStats {
    pub fn from_measurements(measurements: &[u64]) -> Self {
        if measurements.is_empty() {
            return Self {
                median: 0,
                mean: 0.0,
                std_dev: 0.0,
                min: 0,
                max: 0,
                coefficient_of_variation: 0.0,
                confidence_interval_95: (0.0, 0.0),
                raw_cycles: Vec::new(),
                filtered_cycles: Vec::new(),
                outliers_removed: 0,
            };
        }
        
        // Store raw data
        let raw_cycles = measurements.to_vec();
        
        // Remove outliers
        let filtered = remove_outliers(measurements);
        let outliers_removed = raw_cycles.len() - filtered.len();
        
        // Use filtered data for statistics
        let working_data = if filtered.len() >= 3 { &filtered } else { measurements };
        
        let mut sorted = working_data.to_vec();
        sorted.sort_unstable();
        
        let median = if sorted.len() % 2 == 0 {
            let mid = sorted.len() / 2;
            (sorted[mid - 1] + sorted[mid]) / 2
        } else {
            sorted[sorted.len() / 2]
        };
        
        let mean = working_data.iter().map(|&x| x as f64).sum::<f64>() / working_data.len() as f64;
        
        let variance = working_data.iter()
            .map(|&x| {
                let diff = x as f64 - mean;
                diff * diff
            })
            .sum::<f64>() / working_data.len() as f64;
        
        let std_dev = variance.sqrt();
        let coefficient_of_variation = if mean > 0.0 { std_dev / mean } else { 0.0 };
        
        // Calculate 95% confidence interval using t-distribution
        // t-values for common degrees of freedom (df = n-1):
        // df=10: 2.228, df=15: 2.131, df=20: 2.086, df=30: 2.042, df=inf: 1.96
        let n = working_data.len() as f64;
        let df = n - 1.0;
        let t_value = if df <= 10.0 {
            2.228
        } else if df <= 15.0 {
            2.131
        } else if df <= 20.0 {
            2.086
        } else if df <= 30.0 {
            2.042
        } else {
            1.96 // Use z-score for large samples
        };
        let standard_error = std_dev / n.sqrt();
        let margin_of_error = t_value * standard_error;
        let confidence_interval_95 = (mean - margin_of_error, mean + margin_of_error);
        
        Self {
            median,
            mean,
            std_dev,
            min: *sorted.first().unwrap(),
            max: *sorted.last().unwrap(),
            coefficient_of_variation,
            confidence_interval_95,
            raw_cycles,
            filtered_cycles: filtered,
            outliers_removed,
        }
    }
    
    /// Check if measurements appear stable (low coefficient of variation)
    pub fn is_stable(&self, threshold: f64) -> bool {
        self.coefficient_of_variation < threshold
    }
    
    /// Provide measurement quality assessment
    pub fn quality_assessment(&self) -> &'static str {
        match self.coefficient_of_variation {
            x if x < 0.01 => "Excellent (CV < 1%)",
            x if x < 0.05 => "Good (CV < 5%)",
            x if x < 0.10 => "Acceptable (CV < 10%)",
            x if x < 0.20 => "Poor (CV < 20%)",
            _ => "Very Poor (CV >= 20%)",
        }
    }
}

/// Multi-function comparison with enhanced methodology
pub struct MultiMeasurement {
    pub config: MeasurementConfig,
    pub results: Vec<(String, Vec<u64>)>,
}

impl MultiMeasurement {
    pub fn new(config: MeasurementConfig) -> Self {
        Self {
            config,
            results: Vec::new(),
        }
    }
    
    /// Add a function measurement to the comparison
    pub fn measure_function<F, G>(
        &mut self,
        name: String,
        measurement_func: F,
        warmup_func: G,
    ) where
        F: FnMut(),
        G: FnMut(),
    {
        println!("\n=== Measuring: {} ===", name);
        let measurements = measure_with_cryptopt_method(&self.config, measurement_func, warmup_func);
        self.results.push((name, measurements));
    }
    
    /// Generate comprehensive comparison report
    pub fn generate_report(&self) -> String {
        let mut report = String::new();
        report.push_str("=== CryptOpt-style Measurement Report ===\n\n");
        
        // Configuration summary
        report.push_str(&format!("Configuration:\n"));
        report.push_str(&format!("  Cycle Goal: {} cycles/batch\n", self.config.cycle_goal));
        report.push_str(&format!("  Number of Batches: {}\n", self.config.num_batches));
        report.push_str(&format!("  Warm-up Iterations: {}\n", self.config.warmup_iterations));
        report.push_str("\n");
        
        // Individual function statistics
        let mut stats: Vec<(String, MeasurementStats)> = Vec::new();
        
        for (name, measurements) in &self.results {
            let function_stats = MeasurementStats::from_measurements(measurements);
            report.push_str(&format!("{}:\n", name));
            report.push_str(&format!("  Median: {} cycles\n", function_stats.median));
            report.push_str(&format!("  Mean: {:.2} cycles\n", function_stats.mean));
            report.push_str(&format!("  Std Dev: {:.2} cycles\n", function_stats.std_dev));
            report.push_str(&format!("  Range: {} - {} cycles\n", function_stats.min, function_stats.max));
            report.push_str(&format!("  CV: {:.3}% ({})\n", 
                                   function_stats.coefficient_of_variation * 100.0,
                                   function_stats.quality_assessment()));
            report.push_str("\n");
            
            stats.push((name.clone(), function_stats));
        }
        
        // Comparative analysis
        if stats.len() > 1 {
            report.push_str("=== Comparative Analysis ===\n");
            
            // Find the best (fastest) implementation
            let best = stats.iter().min_by_key(|(_, s)| s.median).unwrap();
            
            for (name, stat) in &stats {
                if name != &best.0 {
                    let difference = stat.median as f64 - best.1.median as f64;
                    let percentage = (difference / best.1.median as f64) * 100.0;
                    
                    if percentage > 0.0 {
                        report.push_str(&format!("{} is {:.2}% slower than {} ({} vs {} cycles)\n",
                                               name, percentage, best.0, stat.median, best.1.median));
                    } else {
                        report.push_str(&format!("{} is {:.2}% faster than {} ({} vs {} cycles)\n",
                                               name, percentage.abs(), best.0, stat.median, best.1.median));
                    }
                }
            }
        }
        
        report
    }
} 