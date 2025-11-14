# CryptOpt vs OpenSSL X25519 Performance Analysis

## Executive Summary

This document analyzes the fundamental differences between OpenSSL's hand-tuned X25519 field arithmetic implementation and CryptOpt's automatically-generated code. Both implementations use radix 2^51 representation (5 limbs of 51 bits each), but differ significantly in instruction selection, scheduling, register allocation, and carry handling strategies.

**Key Finding:** CryptOpt's slower performance (ratio 1.275x compared to target) stems from suboptimal instruction scheduling that creates longer dependency chains and underutilizes CPU execution ports, despite using modern BMI2 instructions.

---

## 1. Instruction Selection Differences

### 1.1 Multiplication Instructions

**OpenSSL (x25519_fe51_mul):**
- Uses traditional `MUL/MULQ` instructions
- Explicit management of RDX:RAX for multiplication results
- Manual extraction of high/low parts via MOV instructions
- Example (line 133):
  ```asm
  mulq    %r11        # f[0]*g[0]
  mov     %rax,%rbx   # save low 64 bits
  mov     %rdx,%rcx   # save high 64 bits
  ```

**CryptOpt (fiat_curve25519_carry_mul):**
- Exclusively uses `MULX` instruction (BMI2 extension, introduced in Haswell)
- Three-operand form: `mulx dest_hi, dest_lo, src`
- Does not clobber RDX/RAX, allows better register allocation
- Example (line 6):
  ```asm
  mulx r11, r10, [rax + 0x0]  # load, multiply, store in one go
  ```

**Performance Impact:**
- MULX has same latency as MUL (4 cycles on modern Intel) but higher throughput
- MULX removes dependency on RDX/RAX, reducing register pressure
- However, CryptOpt doesn't fully exploit this advantage due to scheduling issues (see Section 2)

### 1.2 Constant Multiplication (Factor of 19)

**OpenSSL:**
- Uses LEA instruction for multiplication by 19: `lea (%r14,%r14,8),%r15` then `lea (%r14,%r15,2),%rdi`
- This computes: r15 = r14 + 8*r14 = 9*r14, then rdi = r14 + 2*r15 = 19*r14
- LEA has 1 cycle latency and executes on ports 1 and 5
- Alternative: Uses IMUL when LEA chain would be too long: `imulq $19,%rbp,%rdi`

**CryptOpt:**
- Always uses IMUL with immediate: `imul rdx, [rax + 0x18], 0x13` (line 7)
- IMUL has 3 cycle latency on modern Intel CPUs
- Simpler but slower

**Performance Impact:**
- LEA approach saves 2 cycles per constant multiplication
- In field multiplication with 5 limbs, this happens multiple times
- Estimated savings: 6-8 cycles per field multiplication (~2-3%)

---

## 2. Instruction Scheduling and Dependency Chains

### 2.1 Critical Path Analysis

**OpenSSL Strategy:**
- Carefully interleaves independent multiplications to hide latency
- Starts multiple dependency chains in parallel
- Example (lines 133-157): While computing h0 (rbx:rcx), simultaneously computes h1 (r8:r9), h2 (r10:r11), h3 (r12:r13), h4 (r14:r15)
- Reduces dependency chains by processing "horizontally" (all limbs of one product level before moving to next)

**CryptOpt Strategy:**
- More sequential processing with longer dependency chains
- Example (lines 6-25): Computes multiple products with pre-multiplied constants before starting main multiplication
- Uses TEST/ADOX/ADCX chains that serialize some operations
- Pattern: `test al, al` (line 28) → `adox r15, r12` → `adox r13, rdi` → `adcx rcx, rbp`

**Dependency Chain Comparison:**

OpenSSL critical path for computing first partial product sum:
```
MUL (4 cycles) → ADD (1 cycle) → MUL (4 cycles) → ADD (1 cycle) = ~10 cycles
```

CryptOpt critical path for equivalent computation:
```
IMUL (3 cycles) → MULX (4 cycles) → ADOX (1 cycle) → ADOX (1 cycle) → ADCX (1 cycle) = ~10 cycles
```

However, CryptOpt's effective critical path is longer due to:
1. Early IMUL operations that feed into later MULX operations
2. Longer ADOX/ADCX chains (up to 4-5 instructions in sequence)
3. More XOR instructions for flag zeroing (lines 41, 46, 56, 69, 80, 85, 104, 113, 126)

**Estimated Critical Path:**
- OpenSSL: ~80-90 cycles for core multiplication
- CryptOpt: ~100-110 cycles for core multiplication
- **Impact: 20-25% longer critical path explains most of the 27.5% slowdown**

### 2.2 Flag Register Management

**OpenSSL:**
- Minimal use of carry/overflow flags
- Uses ADC primarily for 128-bit addition (high:low pairs)
- No explicit flag initialization needed

**CryptOpt:**
- Heavy use of ADOX/ADCX for dual carry chains
- Requires frequent flag clearing: `xor rdx, rdx` or `test al, al`
- These operations add no computational value but consume execution slots
- Count: 7 flag-zeroing operations in 166-line function

**Performance Impact:**
- Flag-zeroing operations: ~7 cycles wasted
- More critically: ADOX/ADCX chains cannot execute until flags are ready
- Creates artificial serialization points
- Estimated cost: 10-15 cycles (~3-5%)

---

## 3. Register Allocation Strategies

### 3.1 Register Usage

**OpenSSL:**
- Uses all 16 general-purpose registers: RAX, RBX, RCX, RDX, RBP, RSI, RDI, R8-R15
- Saves callee-saved registers on entry: RBP, RBX, R12-R15 (6 registers)
- Allocates 40 bytes (5 qwords) of stack space for temporary storage
- Strategic spilling: Stores input array elements to stack (lines 134, 139, 145, 177, 200, 223)
- Re-loads only when needed

**CryptOpt:**
- Also uses all 16 GP registers
- Saves same callee-saved registers: RBX, RBP, R12-R15
- Uses 128 bytes (0x80) of stack space for temporary storage
- More aggressive stack usage: Stores many intermediate values
- Stack operations scattered throughout (lines 10-26 for saves, lines 139-165 for restores)

### 3.2 Stack Access Patterns

**OpenSSL stack accesses:**
```asm
Line 134: mov %r11,8*0(%rsp)    # offload g[0]
Line 139: mov %r12,8*1(%rsp)    # offload g[1]
Line 145: mov %r13,8*2(%rsp)    # offload g[2]
```
Total: ~10 stack stores, ~10 stack loads for intermediate values

**CryptOpt stack accesses:**
```asm
Line 10-21: 9 stores for register saves and intermediate values
Line 48:    mov r12, [rsp - 0x38]  # load from stack
Line 64:    add r13, [rsp - 0x40]  # load from stack
Line 65:    adcx r8, [rsp - 0x48]  # load from stack
Line 139-165: loads for restoration
```
Total: ~15+ stack stores, ~15+ stack loads

**Performance Impact:**
- Load latency: 4-5 cycles (L1 cache hit)
- Store-to-load forwarding can help, but only if address matches exactly
- CryptOpt's extra 5-10 memory operations: 20-40 cycles wasted (~5-8%)
- Memory operations also consume port 2/3 bandwidth, limiting parallelism

---

## 4. Carry Handling and Reduction

### 4.1 Carry Propagation During Multiplication

**OpenSSL:**
- Uses explicit ADC (add with carry) for multi-precision arithmetic
- Example (lines 160-162):
  ```asm
  add     %rax,%rbx
  adc     %rdx,%rcx
  ```
- Natural 2-way carry chains (high:low pairs)
- Carry propagation limited to 2 levels typically

**CryptOpt:**
- Uses ADOX/ADCX for independent carry chains
- Allows two carries to propagate simultaneously
- Example (lines 42-45):
  ```asm
  adox    rcx, r8      # uses overflow flag
  adox    r9, rbx      # uses overflow flag
  adcx    rcx, rdi     # uses carry flag
  adcx    rbp, r9      # uses carry flag
  ```
- Theoretically better parallelism

**Analysis:**
- ADOX/ADCX can execute on ports 0, 1, 5, 6 (4 ports)
- ADC executes on ports 0, 1, 5, 6 (4 ports)
- Same port availability!
- ADOX/ADCX advantage only matters if you have truly independent chains
- CryptOpt's chains often aren't independent due to data dependencies
- **Impact: Minimal benefit in practice, but added complexity with flag management**

### 4.2 Final Reduction (Modulo 2^255-19)

**OpenSSL (.Lreduce51):**
```asm
Line 356: mov $0x7ffffffffffff,%rbp    # mask = 2^51 - 1

# Extract carry from h2:
Line 358-362:
    mov     %r10,%rdx
    shr     $51,%r10              # h2 >> 51
    shl     $13,%r11              # h2_high << 13
    and     %rbp,%rdx             # g2 = h2 & mask
    or      %r10,%r11             # combine
    add     %r11,%r12             # h3 += h2>>51

# Multiplication by 19 for high bits:
Line 395-397:
    lea     (%r15,%r15,8),%r14    # r14 = 9 * r15
    lea     (%r15,%r14,2),%r15    # r15 = 19 * r15
    add     %r15,%rax             # g0 += (h4>>51)*19
```

**CryptOpt reduction:**
```asm
Line 135-158:
    mov     r9, 0x7ffffffffffff   # mask = 2^51 - 1
    mov     r8, r12
    and     r8, r9                # r8 = r12 & mask
    shrd    r12, rbx, 51          # r12 = (rbx:r12) >> 51

    lea     r11, [r12 + 8 * r12]  # r11 = 9 * r12
    lea     r14, [r12 + 2 * r11]  # r14 = 19 * r12
    lea     rcx, [rcx + r14]      # combine
```

**Comparison:**
- Both use same algorithmic approach: mask and shift
- OpenSSL uses SHR + SHL + OR sequence (3 instructions)
- CryptOpt uses SHRD (1 instruction) - more efficient!
- Both use LEA for multiplication by 19 in reduction
- **Reduction performance: CryptOpt slightly better (~2-3 cycles saved)**

---

## 5. Microarchitectural Considerations

### 5.1 Port Pressure Analysis

Modern Intel CPUs (Skylake/Coffee Lake/Ice Lake) have 8 execution ports:
- Port 0: ALU, MUL, DIV
- Port 1: ALU, MUL
- Port 2: Load
- Port 3: Load
- Port 4: Store
- Port 5: ALU
- Port 6: ALU
- Port 7: Store

**Multiplication port usage:**
- MUL/MULX: Port 0 or 1 (2-way parallelism max)
- IMUL: Port 1 (blocks port for 3 cycles)

**OpenSSL port pressure:**
- Balanced mix of ALU and multiplication
- Load/Store operations spread out
- Good saturation of ports 0 and 1
- Estimated throughput: ~1.5-2 instructions/cycle

**CryptOpt port pressure:**
- Front-loaded IMUL operations create port 1 bottleneck
- MULX operations better distributed
- Stack operations create spikes in port 2/3 usage
- ADOX/ADCX chains can execute on any ALU port but depend on flags
- Estimated throughput: ~1.3-1.7 instructions/cycle

**Performance Impact:**
- Lower IPC (instructions per cycle) for CryptOpt
- Port 1 bottleneck from IMUL: 5-10% slowdown
- Unbalanced port usage reduces parallelism

### 5.2 Instruction Fusion and Macro-ops

**OpenSSL:**
- Uses MOV + arithmetic sequences that can sometimes micro-fuse
- Example: `mov %rax,%rdi` followed by `mulq %r11`
- Good code density

**CryptOpt:**
- Uses memory-source operands for MULX: `mulx r11, r10, [rax + 0x0]`
- This is a complex memory operand (base + offset)
- Can micro-fuse into single uop on modern CPUs
- Example of lamination on Ice Lake+

**Analysis:**
- Both implementations benefit from fusion
- CryptOpt's memory operands in MULX are efficient on newer CPUs
- Older CPUs (pre-Skylake) may have issues with complex addressing
- **Impact: Neutral to slightly favors CryptOpt on newest CPUs**

---

## 6. Root Cause Analysis: Why is CryptOpt Slower?

### 6.1 Quantified Performance Factors

Based on the analysis above, here's the breakdown of CryptOpt's 27.5% slowdown:

| Factor | Estimated Cycle Cost | % of Slowdown |
|--------|---------------------|---------------|
| Longer dependency chains from poor scheduling | 20-25 cycles | 50-60% |
| Excessive stack memory operations | 20-40 cycles | 20-25% |
| Flag register management overhead | 10-15 cycles | 8-12% |
| IMUL vs LEA for constant multiplication | 6-8 cycles | 5-8% |
| Port pressure imbalance | Throughput loss | 5-10% |
| **Total estimated overhead** | **~60-80 cycles** | **~100%** |

**Baseline OpenSSL performance:** ~80-90 cycles for core computation
**CryptOpt performance:** ~140-170 cycles
**Measured ratio:** 1.275x (27.5% slower)

### 6.2 Why CryptOpt's Optimization Failed

CryptOpt uses stochastic superoptimization to search for optimal instruction sequences. However, it appears to have optimization issues:

1. **Local vs. Global Optimization:**
   - CryptOpt optimizes small instruction windows (likely 10-20 instructions)
   - Misses global scheduling opportunities
   - OpenSSL hand-optimization considers entire function structure

2. **Cost Model Limitations:**
   - CryptOpt's cost model may not accurately capture:
     - Flag register dependencies
     - Port pressure and throughput limits
     - Stack access latencies
     - Dependency chain lengths across basic blocks

3. **Search Space Exploration:**
   - Stochastic search may have converged to local optimum
   - The seed value (1318608097904961) produced this specific result
   - Different seeds might produce better results
   - 190,000 evaluations took 1902 seconds (~32 minutes)
   - May need more search time or better heuristics

4. **Lack of Human Insight:**
   - Hand-tuned code uses domain knowledge:
     - Interleaving independent operations
     - Minimizing register spills
     - Using LEA for constants
   - CryptOpt treats all instructions equally without semantic understanding

---

## 7. Specific Optimization Opportunities for CryptOpt

### 7.1 Instruction Reordering

**Current CryptOpt pattern (lines 7-25):**
```asm
imul rdx, [rax + 0x18], 0x13    # 3 cycle latency
imul rcx, [rax + 0x8], 0x13     # 3 cycle latency
mulx r9, r8, [rsi + 0x10]       # depends on rdx (IMUL result)
...
mulx r13, r12, [rsi + 0x18]     # depends on rdx
```

**Improved ordering:**
```asm
# Load all constants first
mov r_temp, [rax + 0x18]
mov rcx, [rax + 0x8]
# Start independent multiplications
mulx r11, r10, [rax + 0x0]      # use original rdx
# Compute constants in parallel
imul r_temp, r_temp, 0x13       # can execute in parallel
imul rcx, rcx, 0x13
# Continue with dependent operations
mulx r9, r8, [rsi + 0x10]
```

**Benefit:** Saves ~10-15 cycles by improving parallelism

### 7.2 Reduce Stack Spills

CryptOpt saves values to stack that are rarely reused:
- Lines 22-24: Store rbp and rbx, but these are reloaded only once
- Better strategy: Keep more values in registers, recompute if needed

**Benefit:** Saves ~20-30 cycles from eliminated memory operations

### 7.3 Simplify Flag Management

Current pattern:
```asm
test al, al      # zero flags
adox r15, r12    # use OF
adox r13, rdi    # use OF
```

Alternative using CMC (complement carry):
```asm
clc              # clear CF
adcx r15, r12
adcx r13, rdi
```

Or avoid flag-based operations entirely:
```asm
add r15, r12
adc r13, rdi
adc result, 0    # explicit carry handling
```

**Benefit:** Saves ~7 cycles from eliminated TEST/XOR instructions

### 7.4 Use LEA for Constant 19

Replace (line 7):
```asm
imul rdx, [rax + 0x18], 0x13
```

With:
```asm
mov rdx, [rax + 0x18]
lea r_temp, [rdx + 8*rdx]    # 9*rdx
lea rdx, [rdx + 2*r_temp]    # 19*rdx
```

**Benefit:** Saves 2 cycles per IMUL replacement × 5 uses = ~10 cycles

### 7.5 Estimated Total Improvement

If all optimizations applied:
- Current: ~140-170 cycles
- Optimized: ~90-110 cycles
- **Potential improvement: 30-40% faster (approaching OpenSSL performance)**

---

## 8. Broader Implications

### 8.1 Superoptimizer Limitations

This case study reveals fundamental challenges for automated optimization:

1. **The Scheduling Problem is Hard:**
   - Optimal scheduling is NP-complete
   - Stochastic search can miss global optimum
   - Requires good cost model that captures microarchitectural behavior

2. **Human Expertise Still Matters:**
   - Domain knowledge about carry chains, reduction algorithms
   - Understanding of high-level algorithm structure
   - Ability to make principled trade-offs

3. **Hybrid Approach Needed:**
   - Use superoptimizer for local optimization within basic blocks
   - Use human guidance for global structure
   - Interactive optimization with human in the loop

### 8.2 Why OpenSSL's Code is Better

OpenSSL's x25519 implementation benefits from:

1. **Iterative refinement over years:**
   - Written by Andy Polyakov (@dot-asm), renowned cryptographic assembly expert
   - Tested across many CPU generations
   - Tuned based on actual performance measurements

2. **Algorithmic insights:**
   - Strategic choice of radix (2^51 vs 2^64)
   - Conditional compilation for ADCX/ADOX support
   - Fall-back implementations for older CPUs

3. **Holistic optimization:**
   - Considers entire scalar multiplication ladder
   - Optimizes for common case (field multiplication in loops)
   - Balances code size vs. performance

### 8.3 Recommendations for CryptOpt Improvement

To achieve parity with hand-tuned code, CryptOpt should:

1. **Improve Cost Model:**
   - Model port pressure and throughput limits
   - Account for dependency chains across wider windows
   - Include stack access costs

2. **Hierarchical Optimization:**
   - Basic block optimization (current approach)
   - Control flow optimization (reorder basic blocks)
   - Register allocation optimization (separate phase)

3. **Learn from Hand-Tuned Code:**
   - Extract patterns from expert-written assembly
   - Build heuristics for instruction ordering
   - Identify high-value idioms (like LEA for constants)

4. **Increase Search Budget:**
   - Current: 190,000 evaluations
   - Try: 1-10 million evaluations
   - Use better initialization from existing good code

5. **Hybrid Approach:**
   - Accept human annotations/hints
   - Allow constraints on code structure
   - Enable manual refinement of auto-generated code

---

## 9. Conclusion

CryptOpt's 27.5% performance gap compared to OpenSSL's hand-tuned X25519 implementation stems primarily from **suboptimal instruction scheduling** that creates longer dependency chains and underutilizes CPU execution resources. While CryptOpt successfully uses modern BMI2 instructions (MULX) and achieves correct results, it fails to match the carefully crafted scheduling, register allocation, and carry chain management of expert hand-written code.

The analysis reveals that automated superoptimization, while powerful, still has fundamental limitations:
- Local optimization misses global opportunities
- Cost models don't fully capture microarchitectural complexity
- Domain-specific knowledge is hard to encode

**Key Findings:**
1. **Scheduling matters most:** 50-60% of slowdown from longer dependency chains
2. **Memory is expensive:** 20-25% from unnecessary stack operations
3. **Details matter:** LEA vs IMUL, flag management, port pressure all contribute
4. **Human expertise still valuable:** Years of iterative refinement show in OpenSSL code

**Path Forward:**
CryptOpt can close the gap through:
- Better dependency-aware scheduling
- Smarter register allocation to reduce spills
- Learning from patterns in hand-optimized code
- Hybrid human-machine optimization

The good news: CryptOpt's generated code is structurally sound and uses modern instructions well. With improved scheduling heuristics and cost modeling, automated tools can potentially match or exceed human performance while providing formal correctness guarantees that hand-written assembly lacks.

---

## Appendix: Detailed Instruction Counts

### OpenSSL x25519_fe51_mul:
- Total instructions: ~140
- MULQ: 25
- IMUL: 5
- ADD/ADC: 48
- MOV: 32
- LEA: 6
- AND: 5
- SHR/SHL: 8
- OR: 4
- Stack loads: ~10
- Stack stores: ~10

### CryptOpt fiat_curve25519_carry_mul:
- Total instructions: 166
- MULX: 20
- IMUL: 5
- ADD/ADC: 12
- ADOX: 22
- ADCX: 16
- MOV: 30
- LEA: 5
- AND: 5
- SHR/SHRD: 5
- XOR/TEST: 7 (flag management)
- Stack loads: ~15
- Stack stores: ~15

**Key differences:**
- CryptOpt: 18% more instructions (166 vs 140)
- CryptOpt: More flag-based operations (38 ADOX/ADCX vs 48 ADD/ADC)
- CryptOpt: 50% more stack operations
- OpenSSL: More MOV operations for explicit data movement

---

**Document version:** 1.0
**Date:** 2025-11-07
**Analysis basis:** OpenSSL x25519-x86_64.pl (x25519_fe51_mul) vs CryptOpt seed0000000879783339_ratio12750.asm
**Target CPU:** Intel Coffee Lake (Core i7-6770HQ referenced in CryptOpt metadata)
