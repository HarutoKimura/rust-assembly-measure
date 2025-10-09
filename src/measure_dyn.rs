#![cfg(target_arch = "x86_64")]

use std::io;
use std::path::Path;

use anyhow::{ensure, Context, Result};
use rand::{seq::SliceRandom, thread_rng};

use crate::dynload::DynFunc;

pub struct MeasureCfg {
    pub cycle_goal: u64,
    pub initial_batch_size: usize,
    pub min_batch_size: usize,
    pub max_batch_size: usize,
    pub nob: usize,
    pub cpu: Option<usize>,
    pub use_perf: bool,
    pub input_bound: u64,  // Bound for random input generation
}

pub struct MeasureOut {
    pub median_cycles_a: u64,
    pub median_cycles_b: u64,
    pub calibrated_batch_size: usize,
}

pub unsafe fn measure_pair<A: Copy, B: Copy>(
    dso_a: &Path,
    sym_a: &[u8],
    dso_b: &Path,
    sym_b: &[u8],
    cfg: &MeasureCfg,
    call_once: impl Fn(*const ()),
    call_batch: impl Fn(*const (), usize),
) -> Result<MeasureOut> {
    ensure!(cfg.initial_batch_size > 0, "initial batch size must be greater than zero");
    ensure!(cfg.nob > 0, "number of batches must be greater than zero");

    if cfg.use_perf {
        anyhow::bail!("perf-based measurement is not implemented yet; set use_perf = false");
    }

    if let Some(cpu) = cfg.cpu {
        pin_current_thread(cpu).context("failed to pin current thread")?;
    }

    let func_a = DynFunc::<A>::load(dso_a, sym_a).with_context(|| {
        format!(
            "loading candidate symbol '{}'",
            String::from_utf8_lossy(sym_a)
        )
    })?;
    let func_b = DynFunc::<B>::load(dso_b, sym_b).with_context(|| {
        format!(
            "loading baseline symbol '{}'",
            String::from_utf8_lossy(sym_b)
        )
    })?;

    let ptr_a = func_a.as_ptr();
    let ptr_b = func_b.as_ptr();

    // Warmup calls
    call_once(ptr_a);
    call_once(ptr_b);
    
    println!("Functions loaded and warmed up successfully");

    // Calibration phase: determine optimal batch size to hit cycle goal
    // This matches the legacy method's approach in src/measurement.rs
    let batch_size = {
        let calib_bs = cfg.initial_batch_size;
        let start = read_tsc();
        call_batch(ptr_a, calib_bs);
        unsafe {
            core::arch::x86_64::_mm_mfence();
        }
        let calib_cycles = read_tsc().saturating_sub(start);
        
        let calibrated = calculate_optimal_batch_size(
            calib_cycles,
            calib_bs,
            cfg.cycle_goal,
            cfg.min_batch_size,
            cfg.max_batch_size,
        );
        
        let per_call_est = calib_cycles as f64 / calib_bs as f64;
        println!(
            "Calibrated batch size (candidate ref): {} (~{:.2} cycles/call at initial bs={})",
            calibrated,
            per_call_est,
            calib_bs
        );
        println!(
            "  Calibration: {} cycles at batch_size={}, target cycle_goal={}",
            calib_cycles, calib_bs, cfg.cycle_goal
        );
        
        calibrated
    };

    println!("Collecting {} batches with interleaved randomized order...", cfg.nob);

    let mut rng = thread_rng();
    let mut order = [(ptr_a, true), (ptr_b, false)];

    let mut samples_a = Vec::with_capacity(cfg.nob);
    let mut samples_b = Vec::with_capacity(cfg.nob);

    for _ in 0..cfg.nob {
        order.shuffle(&mut rng);
        for &(ptr, is_a) in &order {
            let start = read_tsc();
            call_batch(ptr, batch_size);
            // Memory fence after measurement to match legacy methodology
            unsafe {
                core::arch::x86_64::_mm_mfence();
            }
            let elapsed = read_tsc().saturating_sub(start);
            if is_a {
                samples_a.push(elapsed);
            } else {
                samples_b.push(elapsed);
            }
        }
    }

    let median_cycles_a = median(&mut samples_a);
    let median_cycles_b = median(&mut samples_b);

    Ok(MeasureOut {
        median_cycles_a,
        median_cycles_b,
        calibrated_batch_size: batch_size,
    })
}

fn median(samples: &mut [u64]) -> u64 {
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

/// Dynamic batch size calculation based on measured cycles
/// Matches the implementation in src/precise_timing.rs::calculate_optimal_batch_size
fn calculate_optimal_batch_size(
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

/// Precise timestamp reading with memory barriers
/// Matches the methodology in src/measurement.rs::precise_rdtsc()
/// to ensure fair comparison between dynamic and static linking
#[inline(always)]
fn read_tsc() -> u64 {
    unsafe {
        core::arch::x86_64::_mm_mfence();  // Full memory fence (loads + stores)
        core::arch::x86_64::_mm_lfence();  // Load fence
        core::arch::x86_64::_rdtsc()       // Read timestamp counter
    }
}

fn pin_current_thread(cpu: usize) -> Result<()> {
    unsafe {
        let mut set = std::mem::MaybeUninit::<libc::cpu_set_t>::zeroed().assume_init();
        libc::CPU_ZERO(&mut set);
        libc::CPU_SET(cpu, &mut set);
        let res = libc::sched_setaffinity(0, std::mem::size_of::<libc::cpu_set_t>(), &set);
        if res != 0 {
            return Err(io::Error::last_os_error()).context("sched_setaffinity failed");
        }
    }
    Ok(())
}
