## Legacy vs. Enhanced Benchmarking

This note documents the practical differences between the legacy (default) and enhanced benchmarking modes in this repository, so you can reproduce results consistently.

### Quick reference
- **Legacy mode (default)**: simpler, faster, less rigorous; results comparable to older outputs.
- **Enhanced mode (recommended)**: rigorous methodology (warm-up, calibration, randomization, pinning), better reproducibility.

### How to run (example: `p448 mul 100`)
- **Legacy mode** (no pinning, no explicit warm-up):
```bash
cargo run --release p448 mul 100
```

- **Enhanced mode** (with CPU pinning and rigorous warm-up):
```bash
ENHANCED_MEASUREMENT=1 ./run_benchmark_pinned.sh cargo run --release p448 mul 100
```

If not already done for this session, prepare the environment first:
```bash
./setup_benchmark_environment.sh
./verify_benchmark_environment.sh
```

### Detailed differences
- **CPU pinning**
  - Legacy: not pinned; OS may migrate the process across cores.
  - Enhanced: pinned via `taskset` using `run_benchmark_pinned.sh` for lower variance.

- **Warm-up strategy**
  - Legacy: none.
  - Enhanced: per run → (1) global warm-up across all functions for `warmup_iterations`; then per function → (2) 20 warm-up iterations; (3) 1 calibration iteration to set batch size targeting ~10,000 cycles; (4) 5 final warm-up iterations. Only after this are batches recorded.

- **Batch size**
  - Legacy: fixed `batch_size = 200`.
  - Enhanced: dynamically calibrated per function to meet the cycle goal (~10,000 cycles per batch), clamped to `[min_batch_size, max_batch_size]`. With current settings, calibration often lands at the minimum (10), which is why logs frequently show `Optimal batch size: 10`.

- **Number of batches**
  - Both: 31 batches per function.
  - Enhanced: batch execution order is randomized (Fisher–Yates / R3-validation).

- **Measured work inside a batch**
  - Legacy: inputs are generated once per batch, then the function is called in a tight loop → closer to pure function timing.
  - Enhanced: inputs are regenerated each iteration inside the measured loop, and a fresh output buffer is used → includes some RNG/allocation overhead that is shared across implementations and can reduce observed relative gaps.

- **Timing method**
  - Both: cycle counting with appropriate fencing (e.g., `mfence` + `rdtsc`).

- **Output format and unit**
  - Legacy: compact per-run summaries, prints arrays of per-batch cycles and statistics (mean/median/CI), plus significance checks. Values are effectively per-batch (fixed 200 calls).
  - Enhanced: verbose per-run logs including warm-up, calibration, batch progress, per-run medians and quality (CV), and a final median-of-medians report. Reported medians are per-call cycles derived from the calibrated batch size.

### Implications for results
- Absolute cycle numbers differ because the unit differs (per-batch with 200 calls vs per-call from calibrated batches) and because enhanced mode includes extra overhead in the inner loop.
- Relative performance gaps can shrink in enhanced mode because overhead shared across variants (RNG/alloc) masks some pure function differences.

### Recommendations
- For papers and reproducible reporting: use the enhanced mode with environment setup and pinning.
- For apples-to-apples with legacy ratios: either run legacy mode, or adapt the enhanced measurement to generate inputs once per batch and reuse the output buffer inside the measured loop.


