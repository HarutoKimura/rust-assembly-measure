// Precise Timing Measurement Utilities
// These helpers provide configuration and statistics shared by the enhanced
// measurement routines in `measurement.rs`.

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
}

impl Default for MeasurementConfig {
    fn default() -> Self {
        Self {
            cycle_goal: 10_000,      // CryptOpt's cyclegoal
            num_batches: 31,         // CryptOpt's default number of batches
            initial_batch_size: 200, // Current implementation's batch size
            min_batch_size: 10,      // Prevent degenerate cases
            max_batch_size: 10_000,  // Prevent excessive runtime
        }
    }
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

    let scale_factor = cycle_goal as f64 / measured_cycles as f64;
    let new_size = (current_batch_size as f64 * scale_factor) as usize;

    new_size.max(min_size).min(max_size)
}

fn remove_outliers(data: &[u64]) -> Vec<u64> {
    if data.len() < 4 {
        return data.to_vec();
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

/// Statistics describing a set of per-call measurements
#[derive(Debug, Clone)]
pub struct MeasurementStats {
    pub median: u64,
    pub mean: f64,
    pub std_dev: f64,
    pub coefficient_of_variation: f64,
    pub confidence_interval_95: (f64, f64),
}

impl MeasurementStats {
    pub fn from_measurements(measurements: &[u64]) -> Self {
        if measurements.is_empty() {
            return Self {
                median: 0,
                mean: 0.0,
                std_dev: 0.0,
                coefficient_of_variation: 0.0,
                confidence_interval_95: (0.0, 0.0),
            };
        }

        let filtered = remove_outliers(measurements);
        let working_data = if filtered.len() >= 3 {
            filtered
        } else {
            measurements.to_vec()
        };

        let mut sorted = working_data.clone();
        sorted.sort_unstable();

        let median = if sorted.len() % 2 == 0 {
            let mid = sorted.len() / 2;
            (sorted[mid - 1] + sorted[mid]) / 2
        } else {
            sorted[sorted.len() / 2]
        };

        let mean = working_data.iter().map(|&x| x as f64).sum::<f64>() / working_data.len() as f64;

        let variance = working_data
            .iter()
            .map(|&x| {
                let diff = x as f64 - mean;
                diff * diff
            })
            .sum::<f64>()
            / working_data.len() as f64;

        let std_dev = variance.sqrt();
        let coefficient_of_variation = if mean > 0.0 { std_dev / mean } else { 0.0 };

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
            1.96
        };
        let standard_error = std_dev / n.sqrt();
        let margin_of_error = t_value * standard_error;
        let confidence_interval_95 = (mean - margin_of_error, mean + margin_of_error);

        Self {
            median,
            mean,
            std_dev,
            coefficient_of_variation,
            confidence_interval_95,
        }
    }

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
