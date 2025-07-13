# Benchmarking Setup Guide for Cryptographic Assembly Code

This guide provides comprehensive instructions for configuring your system for accurate and reproducible microbenchmarking of cryptographic assembly code.

## System Information

**Current System:**
- **CPU:** Intel Core i7-1360P (13th Gen)
- **Cores:** 12 physical cores, 16 logical cores (SMT enabled)
- **Max frequency:** 5.0 GHz
- **Architecture:** x86_64
- **L1d Cache:** 448 KiB (12 instances)
- **L1i Cache:** 640 KiB (12 instances)
- **L2 Cache:** 9 MiB (6 instances)
- **L3 Cache:** 18 MiB (1 instance)

## Critical Benchmarking Factors

### 1. CPU Core Pinning

**Why it matters:** Process migration between cores affects cache behavior and measurement consistency.

**Check current affinity:**
```bash
# Check current process affinity
taskset -p $$
# Example output: pid 1587796's current affinity mask: ffff (all 16 cores)
```

**Set CPU affinity:**
```bash
# Pin to specific core (e.g., core 0)
taskset -c 0 ./your_benchmark

# Or use numactl if available
numactl --physcpubind=0 ./your_benchmark

# For cargo commands
taskset -c 0 cargo run --release curve25519 mul 10
```

### 2. Turbo Boost Control

**Why it matters:** Turbo Boost causes frequency variation, adding noise to cycle measurements.

**Check turbo boost status:**
```bash
# Check turbo boost (0=enabled, 1=disabled)
cat /sys/devices/system/cpu/intel_pstate/no_turbo
# Current: 0 (enabled) - NOT IDEAL for benchmarking
```

**Disable turbo boost:**
```bash
# Disable turbo boost for consistent frequencies
echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo

# Verify change
cat /sys/devices/system/cpu/intel_pstate/no_turbo
```

### 3. CPU Frequency Scaling

**Why it matters:** Dynamic frequency scaling causes performance variation during benchmarks.

**Check current governor:**
```bash
# Check current governor
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | sort | uniq -c
# Current: powersave - NOT IDEAL for benchmarking

# Check available governors
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
```

**Set performance mode:**
```bash
# Set to performance mode for all cores
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Verify current frequencies
cat /proc/cpuinfo | grep "cpu MHz" | head -4
```

### 4. SMT (Simultaneous Multi-Threading)

**Why it matters:** SMT can cause interference between logical cores on the same physical core.

**Check SMT status:**
```bash
# Check SMT status (1=enabled, 0=disabled)
cat /sys/devices/system/cpu/smt/active
# Current: 1 (enabled) - May add noise to benchmarks
```

**Disable SMT (optional):**
```bash
# Disable SMT for more consistent results
echo off | sudo tee /sys/devices/system/cpu/smt/control

# Re-enable SMT
echo on | sudo tee /sys/devices/system/cpu/smt/control
```

### 5. ASLR (Address Space Layout Randomization)

**Why it matters:** ASLR can affect memory layout between runs, causing performance variation.

**Check ASLR status:**
```bash
# Check ASLR status (0=disabled, 1=conservative, 2=full)
cat /proc/sys/kernel/randomize_va_space
# Current: 2 (full) - May affect benchmark consistency
```

**Disable ASLR temporarily:**
```bash
# Disable ASLR temporarily
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

# Re-enable ASLR
echo 2 | sudo tee /proc/sys/kernel/randomize_va_space
```

### 6. Additional Performance Settings

**Transparent Huge Pages:**
```bash
# Check THP status
cat /sys/kernel/mm/transparent_hugepage/enabled
# Current: always [madvise] never

# For consistent results, consider setting to 'never'
echo never | sudo tee /sys/kernel/mm/transparent_hugepage/enabled
```

**CPU Isolation:**
```bash
# Check if any CPUs are isolated
cat /sys/devices/system/cpu/isolated
# Current: (empty) - No isolated CPUs

# Check IRQ affinity (shows which CPUs handle interrupts)
find /proc/irq -name smp_affinity -exec sh -c 'echo -n "IRQ $(basename $(dirname {})): "; cat {}' \; | head -5
```

## Benchmarking Setup Scripts

### System Configuration Script

Create `benchmark_setup.sh`:
```bash
#!/bin/bash
# benchmark_setup.sh - Configure system for optimal benchmarking

echo "=== Configuring system for benchmarking ==="

# Create backup directory
mkdir -p /tmp/benchmark_backup

# Save current settings
echo "Saving current settings..."
cat /sys/devices/system/cpu/intel_pstate/no_turbo > /tmp/benchmark_backup/turbo_orig
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor > /tmp/benchmark_backup/governor_orig
cat /proc/sys/kernel/randomize_va_space > /tmp/benchmark_backup/aslr_orig
cat /sys/kernel/mm/transparent_hugepage/enabled > /tmp/benchmark_backup/thp_orig

# Configure for benchmarking
echo "Configuring optimal settings..."

# Disable turbo boost
echo 1 | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo

# Set performance governor
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Disable ASLR
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

# Set THP to madvise (optional)
echo madvise | sudo tee /sys/kernel/mm/transparent_hugepage/enabled

# Optional: disable SMT (uncomment if needed)
# echo off | sudo tee /sys/devices/system/cpu/smt/control

echo "=== System configured for benchmarking ==="
echo "Settings saved to /tmp/benchmark_backup/"
echo "Run benchmark_restore.sh to restore original settings"

# Display current configuration
echo -e "\n=== Current Configuration ==="
echo "Turbo Boost: $(cat /sys/devices/system/cpu/intel_pstate/no_turbo) (1=disabled)"
echo "CPU Governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"
echo "ASLR: $(cat /proc/sys/kernel/randomize_va_space) (0=disabled)"
echo "SMT: $(cat /sys/devices/system/cpu/smt/active) (1=enabled)"
```

### System Restore Script

Create `benchmark_restore.sh`:
```bash
#!/bin/bash
# benchmark_restore.sh - Restore original system settings

echo "=== Restoring original settings ==="

# Check if backup exists
if [ ! -d "/tmp/benchmark_backup" ]; then
    echo "Error: Backup directory not found. Settings may not have been saved."
    exit 1
fi

# Restore settings
echo "Restoring turbo boost..."
sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo < /tmp/benchmark_backup/turbo_orig

echo "Restoring CPU governor..."
sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor < /tmp/benchmark_backup/governor_orig

echo "Restoring ASLR..."
sudo tee /proc/sys/kernel/randomize_va_space < /tmp/benchmark_backup/aslr_orig

echo "Restoring THP..."
sudo tee /sys/kernel/mm/transparent_hugepage/enabled < /tmp/benchmark_backup/thp_orig

# If SMT was disabled, re-enable it
if [ "$(cat /sys/devices/system/cpu/smt/active)" = "0" ]; then
    echo "Re-enabling SMT..."
    echo on | sudo tee /sys/devices/system/cpu/smt/control
fi

echo "=== Settings restored ==="

# Display restored configuration
echo -e "\n=== Restored Configuration ==="
echo "Turbo Boost: $(cat /sys/devices/system/cpu/intel_pstate/no_turbo) (0=enabled)"
echo "CPU Governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"
echo "ASLR: $(cat /proc/sys/kernel/randomize_va_space) (2=full)"
echo "SMT: $(cat /sys/devices/system/cpu/smt/active) (1=enabled)"
```

### Make scripts executable:
```bash
chmod +x benchmark_setup.sh benchmark_restore.sh
```

## Current Benchmarking Implementation

### Parameters from Code Analysis:
- **Batch size:** 200 operations per batch
- **Number of batches:** 31 batches per run
- **Measurement method:** `rdtsc` (CPU cycle counter)
- **Warm-up:** No explicit warm-up runs
- **Statistical method:** Median of medians
- **Repetitions:** Configurable (default: 1)

### Measurement Process:
1. Generate random inputs
2. Execute batches of operations using `rdtsc`
3. Calculate median cycle count across batches
4. Repeat measurement process multiple times
5. Calculate median-of-medians as final result

## Optimal Benchmarking Commands

### Basic Benchmarking:
```bash
# Configure system
sudo ./benchmark_setup.sh

# Run benchmark with CPU pinning and high priority
sudo taskset -c 0 nice -n -20 cargo run --release curve25519 mul 10

# Restore system
sudo ./benchmark_restore.sh
```

### Advanced Benchmarking with Performance Counters:
```bash
# Configure system
sudo ./benchmark_setup.sh

# Run with perf monitoring
sudo perf stat -e cycles,instructions,cache-misses,branch-misses \
    taskset -c 0 nice -n -20 cargo run --release curve25519 mul 10

# Restore system
sudo ./benchmark_restore.sh
```

### Comprehensive Benchmark Script:
```bash
#!/bin/bash
# run_benchmark.sh - Complete benchmarking workflow

CURVE=${1:-curve25519}
OPERATION=${2:-mul}
REPEATS=${3:-10}

echo "=== Running comprehensive benchmark ==="
echo "Curve: $CURVE"
echo "Operation: $OPERATION"
echo "Repeats: $REPEATS"

# Configure system
sudo ./benchmark_setup.sh

# Wait for system to stabilize
sleep 5

# Run benchmark
echo "Starting benchmark..."
sudo taskset -c 0 nice -n -20 cargo run --release $CURVE $OPERATION $REPEATS

# Restore system
sudo ./benchmark_restore.sh

echo "=== Benchmark complete ==="
```

## Performance Analysis Tools

### Available Tools:
- **perf:** Available (`/usr/bin/perf`)
- **cpupower:** Available (`/usr/bin/cpupower`)
- **time:** Available (shell builtin)
- **numactl:** Not available

### Using perf for detailed analysis:
```bash
# Basic performance counters
sudo perf stat -e cycles,instructions,cache-misses,branch-misses \
    taskset -c 0 cargo run --release curve25519 mul 5

# Detailed profiling
sudo perf record -e cycles:u -c 1000000 \
    taskset -c 0 cargo run --release curve25519 mul 5

# View profile
sudo perf report
```

## Current Issues and Recommendations

### ❌ Current Issues:
1. **Turbo Boost enabled** - causes frequency variation
2. **Power-saving governor** - CPU frequency changes during benchmark
3. **ASLR enabled** - may affect memory layout between runs
4. **SMT enabled** - may cause interference between threads
5. **No CPU pinning** - process can migrate between cores
6. **No explicit warm-up** - may include cold cache effects

### ✅ Recommendations:
1. **Use system configuration scripts** before benchmarking
2. **Pin benchmarks to specific CPU core** (core 0 recommended)
3. **Run with high priority** (`nice -n -20`)
4. **Add warm-up runs** to the benchmark code
5. **Increase repetitions** for better statistical confidence
6. **Use perf counters** for additional insights
7. **Consider CPU isolation** for critical benchmarks

### Suggested Code Improvements:
1. Add warm-up iterations before measurement
2. Implement CPU core pinning within the benchmark
3. Add performance counter collection
4. Implement outlier detection and removal
5. Add confidence intervals to results

## Quick Reference Commands

```bash
# Check current system state
echo "Turbo: $(cat /sys/devices/system/cpu/intel_pstate/no_turbo) (1=disabled)"
echo "Governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"
echo "ASLR: $(cat /proc/sys/kernel/randomize_va_space) (0=disabled)"
echo "SMT: $(cat /sys/devices/system/cpu/smt/active) (1=enabled)"

# Quick benchmark setup
sudo echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
sudo echo performance > /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
sudo echo 0 > /proc/sys/kernel/randomize_va_space

# Run optimized benchmark
sudo taskset -c 0 nice -n -20 cargo run --release curve25519 mul 10
```

## References

- [Intel Performance Analysis Guide](https://www.intel.com/content/www/us/en/develop/documentation/vtune-help/top/analyze-performance.html)
- [Linux Performance Tools](https://www.brendangregg.com/linuxperf.html)
- [CPU Frequency Scaling](https://www.kernel.org/doc/html/latest/admin-guide/pm/cpufreq.html)
- [RDTSC Instruction Reference](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html)

---

**Note:** Always remember to restore original system settings after benchmarking to avoid impacting system performance for other tasks. 