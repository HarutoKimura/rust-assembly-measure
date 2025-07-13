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