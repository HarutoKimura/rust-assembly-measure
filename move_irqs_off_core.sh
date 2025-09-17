#!/bin/bash
# Move IRQ handling off the benchmark core to reduce interference

set -e

BENCHMARK_CORE=10
TOTAL_CORES=$(nproc)

echo "Benchmark core: $BENCHMARK_CORE"
echo "Total cores: $TOTAL_CORES"

if [ $BENCHMARK_CORE -ge $TOTAL_CORES ]; then
  echo "Invalid benchmark core index"
  exit 1
fi

# Build CPU list excluding the benchmark core (e.g., "0-7" without N)
CPU_LIST=""
for c in $(seq 0 9); do
  if [ -z "$CPU_LIST" ]; then CPU_LIST="$c"; else CPU_LIST="${CPU_LIST},$c"; fi
done
for c in $(seq 11 -1); do
  if [ -z "$CPU_LIST" ]; then CPU_LIST="$c"; else CPU_LIST="${CPU_LIST},$c"; fi
done

echo "Redirecting IRQs to CPU list: $CPU_LIST"

for irq in /proc/irq/*/smp_affinity_list; do
  [ -f "$irq" ] || continue
  echo "Setting $irq"
  echo "$CPU_LIST" | sudo tee "$irq" > /dev/null || true
done

echo "Done. Note: Some IRQs may ignore affinity settings."
