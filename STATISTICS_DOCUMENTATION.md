# Performance Measurement Statistics Documentation

This document explains the statistical measures used in the performance benchmarking tool, their meanings, and detailed calculation methods.

## Table of Contents
1. [Raw Cycle Counts](#raw-cycle-counts)
2. [Summary Statistics](#summary-statistics)
   - [Mean](#mean)
   - [Median](#median)
   - [Standard Deviation](#standard-deviation)
3. [Outlier Detection](#outlier-detection)
4. [Confidence Intervals](#confidence-intervals)
5. [Statistical Significance Testing](#statistical-significance-testing)
   - [T-Statistics](#t-statistics)
   - [P-Values](#p-values)
6. [Interpretation Guide](#interpretation-guide)

---

## Raw Cycle Counts

**What it represents:** The actual CPU cycle measurements from each run of the benchmark.

**Example:**
```
Raw cycle counts: [15876, 16200, 16156, 15988, 15968, ...]
```

**How it's measured:**
- Each value represents the **median** of 31 batches
- Each batch contains 200 operations
- Total operations per measurement: 31 × 200 = 6,200
- Uses x86-64 `RDTSC` instruction for cycle counting

**Why we collect multiple runs:**
- Reduces impact of system noise
- Provides data for statistical analysis
- Allows detection of outliers

---

## Summary Statistics

### Mean

**What it represents:** The average performance across all measurements.

**Formula:**
```
Mean = Σ(xi) / n

where:
- xi = each measurement
- n = number of measurements
```

**Example:** Mean: 16019.33 cycles

**Interpretation:** 
- Represents the "typical" performance
- Can be affected by outliers
- Used for confidence interval calculations

### Median

**What it represents:** The middle value when all measurements are sorted.

**Calculation:**
```python
sorted_values = sort(measurements)
if n is odd:
    median = sorted_values[n/2]
else:
    median = (sorted_values[n/2-1] + sorted_values[n/2]) / 2
```

**Example:** Median: 15990 cycles

**Interpretation:**
- More robust to outliers than mean
- Better represents "typical" performance
- Used for performance comparisons

### Standard Deviation (Std Dev)

**What it represents:** The spread or variability of measurements.

**Formula:**
```
σ = √(Σ(xi - μ)² / n)

where:
- xi = each measurement
- μ = mean
- n = number of measurements
```

**Example:** Std Dev: 106.84 cycles

**Interpretation:**
- Lower is better (more consistent)
- ~68% of measurements fall within ±1 std dev of mean
- ~95% fall within ±2 std dev

---

## Outlier Detection

**Method:** Interquartile Range (IQR) Method

**Calculation:**
```python
Q1 = 25th percentile
Q3 = 75th percentile
IQR = Q3 - Q1

Lower bound = Q1 - 1.5 × IQR
Upper bound = Q3 + 1.5 × IQR

Outliers = values outside [lower_bound, upper_bound]
```

**Example:**
```
Outliers removed: 2 (using IQR method)
Filtered cycle counts: [15652, 15708, 15696, ...]
```

**Why remove outliers:**
- System interrupts can cause anomalous measurements
- Outliers can skew statistics
- More accurate representation of true performance

---

## Confidence Intervals

**What it represents:** The range where we're 95% confident the true mean performance lies.

**Formula:**
```
CI = mean ± (t-value × standard_error)

where:
- standard_error = σ / √n
- t-value depends on degrees of freedom (df = n-1)
```

**T-values for common sample sizes:**
- n=11 (df=10): t = 2.228
- n=16 (df=15): t = 2.131
- n=21 (df=20): t = 2.086
- n=31 (df=30): t = 2.042
- n>30: t ≈ 1.96 (normal approximation)

**Example:** 95% CI: [15970.70, 16067.97] cycles

**Interpretation:**
- If we repeated this experiment many times, 95% of the calculated means would fall in this range
- Narrower intervals = more precise estimates
- Non-overlapping CIs = statistically significant difference

---

## Statistical Significance Testing

### T-Statistics

**What it represents:** A measure of how different two sample means are, accounting for variance.

**Formula (Welch's t-test for unequal variances):**
```
t = |μ₁ - μ₂| / SE

where:
- μ₁, μ₂ = sample means
- SE = √(σ₁²/n₁ + σ₂²/n₂)
- σ₁², σ₂² = sample variances
- n₁, n₂ = sample sizes
```

**Degrees of freedom (Welch-Satterthwaite equation):**
```
df = (σ₁²/n₁ + σ₂²/n₂)² / [(σ₁²/n₁)²/(n₁-1) + (σ₂²/n₂)²/(n₂-1)]
```

**Example:** t_stat=116.51, df=23.18

**Interpretation:**
- Higher t-statistic = larger difference between groups
- t > 2 generally indicates significance
- t > 10 indicates extremely strong difference

### P-Values

**What it represents:** The probability that the observed difference could occur by chance if there's no real difference.

**Calculation:**
1. Calculate t-statistic
2. Use t-distribution CDF to find probability
3. For two-tailed test: p = 2 × (1 - CDF(|t|))

**For very large t-statistics (t > 30):**
- Use normal distribution approximation
- p-value becomes extremely small (e.g., 10⁻⁵⁰)

**Example:** p = 0.000001 (or p < 0.000001)

**Interpretation:**
- p < 0.05: Statistically significant (5% significance level)
- p < 0.01: Highly significant
- p < 0.001: Very highly significant
- p < 0.000001: Extremely strong evidence

---

## Interpretation Guide

### Example Output Analysis
```
=== Performance Statistics (multiply) ===
CryptOpt format ASM:
  Raw cycle counts: [12714, 12778, 12738, ...]
  Mean: 12740.10 cycles
  Median: 12744 cycles
  Std Dev: 36.07 cycles
  95% CI: [12723.87, 12756.32] cycles

=== Comparative Analysis ===
CryptOpt is 26.63% faster than GAS (based on median).

=== Statistical Significance ===
CryptOpt is significantly faster than GAS (95% CI non-overlapping, p < 0.000001)
```

### What this tells us:

1. **Performance Difference:**
   - CryptOpt takes ~12,744 cycles (median)
   - GAS takes ~16,138 cycles (median)
   - Difference: 26.63% improvement

2. **Consistency:**
   - CryptOpt std dev: 36.07 (very consistent)
   - GAS std dev: 125.95 (more variable)
   - Lower std dev = more predictable performance

3. **Statistical Confidence:**
   - 95% CI don't overlap = difference is real
   - p < 0.000001 = less than 0.0001% chance this is random
   - Extremely strong evidence of performance improvement

### Decision Guidelines:

| Scenario | Confidence Intervals | P-value | Interpretation |
|----------|---------------------|---------|----------------|
| Strong difference | Non-overlapping | p < 0.001 | Definitive performance difference |
| Moderate difference | Barely overlapping | 0.001 < p < 0.05 | Likely real difference |
| Marginal difference | Overlapping | 0.05 < p < 0.10 | Suggestive but not conclusive |
| No difference | Heavily overlapping | p > 0.10 | No evidence of difference |

### Practical Considerations:

1. **Look at both median and mean:** If they differ significantly, there may be outliers
2. **Check std dev:** High variance might indicate unstable performance
3. **Consider effect size:** Even if statistically significant, is 2% improvement practically meaningful?
4. **Examine raw data:** Look for patterns or anomalies in the raw cycle counts

---

## Technical Notes

### Why Median for Performance Comparison?
- Less affected by outliers than mean
- Better represents "typical" case
- Standard practice in performance benchmarking

### Why 95% Confidence Level?
- Scientific standard
- Balances Type I and Type II errors
- 5% chance of false positive is acceptable

### Why Welch's t-test?
- Doesn't assume equal variances
- More conservative (less likely to claim false significance)
- Appropriate for comparing different implementations

### Limitations:
1. Assumes measurements are independent
2. T-test assumes approximately normal distribution
3. Very small p-values (< 10⁻¹⁰) are approximations
4. CPU frequency scaling can affect measurements

---

## References

1. Welch, B. L. (1947). "The generalization of Student's problem when several different population variances are involved"
2. Student (1908). "The probable error of a mean"
3. Intel® 64 and IA-32 Architectures Software Developer's Manual (RDTSC instruction)
4. CryptOpt: Verified Compilation with Random Program Search (2021)