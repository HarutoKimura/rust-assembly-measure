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