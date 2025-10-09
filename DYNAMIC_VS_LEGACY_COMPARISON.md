# Comparison: Dynamic-API vs Legacy Cargo Build Measurement Methods

## Executive Summary

This document compares the dynamic-API measurement method with the legacy cargo build method to ensure fair comparison. The key difference should only be **static linking (.a) vs dynamic linking (.so)**, but several other differences exist that may affect fairness.

## Critical Differences Found

### 🔴 **1. TIMING METHODOLOGY - UNFAIR DIFFERENCE**

#### Legacy Method (`src/measurement.rs:73-79`)
```rust
fn precise_rdtsc() -> u64 {
    unsafe {
        _mm_mfence();  // ← Memory fence BEFORE lfence
        _mm_lfence();  // ← Load fence
        _rdtsc()       // ← Read timestamp counter
    }
}
```

#### Dynamic Method (`src/measure_dyn.rs:104-112`)
```rust
#[inline(always)]
fn read_tsc() -> u64 {
    unsafe {
        core::arch::x86_64::_mm_lfence();  // ← Load fence only
        let t = core::arch::x86_64::_rdtsc();  // ← Read timestamp counter
        core::arch::x86_64::_mm_lfence();  // ← Load fence again
        t
    }
}
```

**Impact**: The legacy method uses `_mm_mfence()` before rdtsc, which ensures all prior memory operations (loads AND stores) complete before reading the timestamp. The dynamic method only uses `_mm_lfence()`, which only serializes load operations. This is a **methodological inconsistency** that could lead to unfair comparisons.

**Note**: Legacy also uses `_mm_mfence()` AFTER the measured code block (lines 50, 67 in measurement.rs).

---

### 🟡 **2. COMPILATION FLAGS - MOSTLY FAIR**

#### For NASM Assembly Files

**Legacy (build.rs:441-449)**:
```bash
nasm -f elf64 <input.asm> -o <output.o>
```

**Dynamic (runtime_build.rs:132-142)**:
```bash
nasm -f elf64 -DPIC <input.asm> -o <output.o>
```

**Difference**: Dynamic method adds `-DPIC` flag for position-independent code.
**Impact**: Minor - PIC is typically needed for .so files. This is fair.

#### For GAS Assembly Files

**Legacy (build.rs:454)**:
```bash
clang -c -fPIC <input.asm> -o <output.o>
```

**Dynamic (runtime_build.rs:144-151)**:
```bash
clang -c -fPIC <input.asm> -o <output.o>
```

**Difference**: None - identical compilation
**Impact**: Fair

#### For C Source Files

**Legacy (build.rs:489-500)**:
```bash
clang -c -fPIC -O3 -march=native -fno-semantic-interposition -std=c11 <input.c> -o <output.o>
```

**Dynamic (runtime_build.rs:105-116)**:
```bash
clang -c -fPIC -O3 -march=native -fno-semantic-interposition -std=c11 <input.c> -o <output.o>
```

**Difference**: None - identical compilation
**Impact**: Fair

---

### 🟡 **3. LINKING METHOD - EXPECTED DIFFERENCE**

#### Legacy Method
```bash
# Create static library
ar rcs <output.a> <input.o>

# Link into binary (implicitly via cargo)
cargo:rustc-link-arg=<path-to-static-lib.a>
cargo:rustc-link-arg=-Wl,--export-dynamic
cargo:rustc-link-arg=-Wl,--no-gc-sections
cargo:rustc-link-arg=-Wl,-Bsymbolic
cargo:rustc-link-arg=-Wl,-z,now
cargo:rustc-link-arg=-Wl,-z,noexecstack
```

#### Dynamic Method
```bash
# Create shared library
clang -shared <input.o> -o <output.so> \
  -Wl,-Bsymbolic \
  -Wl,-z,now \
  -Wl,-z,noexecstack

# Load at runtime via libloading
```

**Difference**: 
- Legacy: Static linking (.a) with `--no-gc-sections` (prevents garbage collection)
- Dynamic: Dynamic linking (.so) with eager binding (`-z,now`)

**Impact**: This is the **expected and intended difference**. Both use `-Bsymbolic` for local symbol resolution and `-z,now` for eager binding. Fair for comparison purposes.

---

### 🟡 **4. BATCH SIZE CONFIGURATION - DIFFERENT METHODOLOGY**

#### Legacy Method (`src/main.rs:113-119`)
```rust
let config = MeasurementConfig {
    cycle_goal: 10_000,          // Target cycles per batch
    num_batches: 31,             // Number of measurement batches
    initial_batch_size: 200,     // Starting batch size
    min_batch_size: 10,
    max_batch_size: 5_000,
};
// Calibration: Adjusts batch_size to hit cycle_goal
```

#### Dynamic Method (`src/dynamic_cli.rs:11-12`)
```rust
const DEFAULT_BATCH_SIZE: usize = 500;  // Fixed batch size
const DEFAULT_BATCHES: usize = 31;       // Number of batches
// No cycle-goal calibration
```

**Difference**: 
- Legacy: Dynamically calibrates batch size to achieve ~10,000 cycles per batch
- Dynamic: Uses fixed batch size of 500 (2.5x larger than legacy's initial 200)

**Impact**: Different batch sizes can affect measurement accuracy due to:
- Cache effects
- Branch prediction
- CPU frequency scaling
- However, both methods measure the same work (batch), so fair if reported as "cycles per call"

---

### 🟢 **5. RANDOMIZATION - IDENTICAL**

Both methods use Fisher-Yates shuffle to randomize measurement order:

**Legacy (`src/measurement.rs:140-141`)**:
```rust
let mut order = [0usize, 1usize, 2usize];
order.shuffle(&mut rng);
```

**Dynamic (`src/measure_dyn.rs:62-69`)**:
```rust
let mut order = [(ptr_a, true), (ptr_b, false)];
order.shuffle(&mut rng);
```

**Impact**: Fair - both use proper randomization

---

### 🟢 **6. MEDIAN CALCULATION - IDENTICAL**

Both use the same median calculation algorithm:

**Legacy (`src/measurement.rs:25-36`)**
**Dynamic (`src/measure_dyn.rs:91-102`)**

**Impact**: Fair - identical statistical analysis

---

### 🟢 **7. CPU PINNING - CONSISTENT**

Both support CPU pinning via `sched_setaffinity`:

**Legacy**: Via external script `setup_benchmark_environment.sh`
**Dynamic (`src/measure_dyn.rs:114-125`)**: Via `--cpu` flag using `libc::sched_setaffinity`

**Impact**: Fair - both can control CPU affinity

---

## Recommendations to Ensure Fair Comparison

### ✅ **Critical Fix Required**

1. **Unify timing methodology**: The dynamic method MUST use the same fence sequence as legacy:
   - Before measurement: `_mm_mfence()` + `_mm_lfence()` + `_rdtsc()`
   - After measured code: `_mm_mfence()`
   - After measurement: `_mm_mfence()` + `_mm_lfence()` + `_rdtsc()`

### ✅ **Recommended Improvements**

2. **Add cycle-goal calibration to dynamic method**: Implement the same dynamic batch sizing as legacy to ensure consistent measurement duration

3. **Document NASM -DPIC flag**: Clarify whether `-DPIC` affects code generation for assembly files (likely minimal impact)

### ✅ **Optional Enhancements**

4. **Add warmup calls**: Dynamic method does one warmup per function (line 59-60). Legacy does warmup during calibration. Consider making this explicit.

5. **Report batch sizes**: Dynamic method should report the actual batch size used in output

---

## Conclusion

The primary concern is the **timing methodology difference** (mfence usage). This must be fixed to ensure fair comparison. The linking method difference (.a vs .so) is the intended comparison point and is properly implemented. Other differences are minor and acceptable.

### Key Principle

> The only difference between methods should be **static linking (.a) vs dynamic linking (.so)**. All measurement methodology, compilation flags, and timing mechanisms should be identical to ensure fair comparison.
