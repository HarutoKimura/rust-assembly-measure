// CryptOpt-style dynamic batch size timing implementation
// Following the exact methodology from the CryptOpt paper

use rand::prelude::*;
use core::arch::x86_64::{_rdtsc, _mm_mfence};

/// CryptOpt measurement configuration
#[derive(Debug, Clone)]
pub struct CryptOptConfig {
    /// Target cycles per batch (CryptOpt uses 10,000)
    pub cycle_goal: u64,
    /// Initial batch size (CryptOpt uses 200)
    pub initial_batch_size: usize,
    /// Minimum batch size (CryptOpt uses 5)
    pub min_batch_size: usize,
    /// Maximum batch size (CryptOpt uses 10,000)
    pub max_batch_size: usize,
    /// Number of batches to measure (CryptOpt uses 31)
    pub num_batches: usize,
}

impl Default for CryptOptConfig {
    fn default() -> Self {
        Self {
            cycle_goal: 10_000,      // CryptOpt's cyclegoal
            initial_batch_size: 200, // CryptOpt's initial bs
            min_batch_size: 5,       // CryptOpt's minimum
            max_batch_size: 10_000,  // CryptOpt's maximum
            num_batches: 31,         // CryptOpt's nob
        }
    }
}

/// Precise cycle measurement with memory barrier
#[inline(always)]
pub fn rdtsc_with_fence() -> u64 {
    unsafe {
        _mm_mfence();
        _rdtsc()
    }
}

/// Measure cycles for a single batch
#[inline(never)]
pub fn measure_batch<F>(func: &mut F, batch_size: usize) -> u64
where
    F: FnMut(),
{
    let start = rdtsc_with_fence();
    
    for _ in 0..batch_size {
        func();
    }
    
    let end = rdtsc_with_fence();
    end.saturating_sub(start)
}

/// Calculate new batch size following CryptOpt's formula
/// bs ← ⌈cyclegoal / PC × bs⌉
fn adjust_batch_size(
    current_bs: usize,
    measured_cycles: u64,
    cycle_goal: u64,
    min_bs: usize,
    max_bs: usize,
) -> usize {
    if measured_cycles == 0 {
        return current_bs;
    }
    
    // Calculate new batch size: bs ← ⌈cyclegoal / PC × bs⌉
    let new_bs = ((cycle_goal as f64 / measured_cycles as f64) * current_bs as f64).ceil() as usize;
    
    // Clip to [min_bs, max_bs] range
    // bs ← argmin(10000, argmax(5, bs))
    new_bs.max(min_bs).min(max_bs)
}

/// CryptOpt's measurement function with dynamic batch size adjustment
pub fn measure_cryptopt_style<F, G, H>(
    config: &CryptOptConfig,
    mut gas_func: F,
    mut nasm_func: G,
    mut cryptopt_func: H,
) -> (Vec<u64>, Vec<u64>, Vec<u64>)
where
    F: FnMut(),
    G: FnMut(),
    H: FnMut(),
{
    let mut rng = thread_rng();
    
    // Initialize batch sizes for each function
    let mut bs_gas = config.initial_batch_size;
    let mut bs_nasm = config.initial_batch_size;
    let mut bs_cryptopt = config.initial_batch_size;
    
    // Results storage
    let mut cycles_gas = Vec::with_capacity(config.num_batches);
    let mut cycles_nasm = Vec::with_capacity(config.num_batches);
    let mut cycles_cryptopt = Vec::with_capacity(config.num_batches);
    
    // Main measurement loop
    for i in 0..config.num_batches {
        // Create random execution order for this batch
        let mut order = vec![0, 1, 2]; // 0=gas, 1=nasm, 2=cryptopt
        order.shuffle(&mut rng);
        
        // Temporary storage for this iteration
        let mut temp_cycles = [0u64; 3];
        
        // Execute in randomized order
        for &func_idx in &order {
            match func_idx {
                0 => {
                    // Measure GAS
                    let cycles = measure_batch(&mut gas_func, bs_gas);
                    temp_cycles[0] = cycles;
                    
                    // Adjust batch size for next iteration
                    bs_gas = adjust_batch_size(
                        bs_gas,
                        cycles,
                        config.cycle_goal,
                        config.min_batch_size,
                        config.max_batch_size,
                    );
                }
                1 => {
                    // Measure NASM
                    let cycles = measure_batch(&mut nasm_func, bs_nasm);
                    temp_cycles[1] = cycles;
                    
                    // Adjust batch size for next iteration
                    bs_nasm = adjust_batch_size(
                        bs_nasm,
                        cycles,
                        config.cycle_goal,
                        config.min_batch_size,
                        config.max_batch_size,
                    );
                }
                2 => {
                    // Measure CryptOpt
                    let cycles = measure_batch(&mut cryptopt_func, bs_cryptopt);
                    temp_cycles[2] = cycles;
                    
                    // Adjust batch size for next iteration
                    bs_cryptopt = adjust_batch_size(
                        bs_cryptopt,
                        cycles,
                        config.cycle_goal,
                        config.min_batch_size,
                        config.max_batch_size,
                    );
                }
                _ => unreachable!(),
            }
        }
        
        // Store normalized cycles (cycles per operation)
        cycles_gas.push(temp_cycles[0] / bs_gas as u64);
        cycles_nasm.push(temp_cycles[1] / bs_nasm as u64);
        cycles_cryptopt.push(temp_cycles[2] / bs_cryptopt as u64);
        
        // Optional progress reporting
        if i % 10 == 0 && i > 0 {
            println!("Progress: {}/{} batches completed", i, config.num_batches);
            println!("  Current batch sizes - GAS: {}, NASM: {}, CryptOpt: {}", 
                     bs_gas, bs_nasm, bs_cryptopt);
        }
    }
    
    (cycles_gas, cycles_nasm, cycles_cryptopt)
}

/// Median calculation
pub fn median(mut values: Vec<u64>) -> u64 {
    values.sort_unstable();
    let mid = values.len() / 2;
    if values.len() % 2 == 0 {
        (values[mid - 1] + values[mid]) / 2
    } else {
        values[mid]
    }
}

/// Full measurement with repetitions (Algorithm 2 from paper)
pub fn run_repeated_measurements<F, G, H>(
    config: &CryptOptConfig,
    gas_func: F,
    nasm_func: G,
    cryptopt_func: H,
    repeats: usize,
) -> (u64, u64, u64)
where
    F: FnMut() + Clone,
    G: FnMut() + Clone,
    H: FnMut() + Clone,
{
    let mut gas_medians = Vec::with_capacity(repeats);
    let mut nasm_medians = Vec::with_capacity(repeats);
    let mut cryptopt_medians = Vec::with_capacity(repeats);
    
    for rep in 0..repeats {
        println!("\n=== Repetition {}/{} ===", rep + 1, repeats);
        
        let (gas_cycles, nasm_cycles, cryptopt_cycles) = measure_cryptopt_style(
            config,
            gas_func.clone(),
            nasm_func.clone(),
            cryptopt_func.clone(),
        );
        
        // Calculate medians for this repetition
        gas_medians.push(median(gas_cycles));
        nasm_medians.push(median(nasm_cycles));
        cryptopt_medians.push(median(cryptopt_cycles));
        
        println!("Repetition {} medians - GAS: {}, NASM: {}, CryptOpt: {}", 
                 rep + 1, gas_medians.last().unwrap(), 
                 nasm_medians.last().unwrap(), 
                 cryptopt_medians.last().unwrap());
    }
    
    // Return median of medians
    (median(gas_medians), median(nasm_medians), median(cryptopt_medians))
}