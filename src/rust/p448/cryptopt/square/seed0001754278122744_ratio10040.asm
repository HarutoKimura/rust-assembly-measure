SECTION .text
	GLOBAL rust_fiat_p448_solinas_carry_square_CryptOpt
rust_fiat_p448_solinas_carry_square_CryptOpt:
sub rsp, 432
mov rax, [ rsi + 0x30 ]; load m64 arg1[6] to register64
mov r10, rax; load m64 x7 to register64
shl r10, 0x1; x7 <- arg1[6] * 0x2
mov rax, [ rsi + 0x38 ]; load m64 arg1[7] to register64
mov r11, rax; load m64 x4 to register64
shl r11, 0x1; x4 <- arg1[7] * 0x2
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mulx rcx, rax, rdx; x28_1, x28_0<- arg1[6]^2
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r9, r8, rdx; x39_1, x39_0<- arg1[4]^2
mov rdx, r10; x7 to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r10, [ rsi + 0x8 ]; x57_1, x57_0<- arg1[1] * x7 (_0*_0)
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov rbp, 0x1 ; moving imm to reg
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
shlx r12, [ rsi + 0x18 ], rbp; x16 <- arg1[3] * 0x2 (shlx does not change the flags)
mov rbp, rdx; preserving value of x7 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, rdx; x54_1, x54_0<- arg1[2]^2
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, rbp; x36_1, x36_0<- arg1[4] * x7 (_0*_0)
mov rdx, r11; x4 to rdx
mov [ rsp - 0x48 ], r14; spilling x54_1 to mem
mulx r14, r11, [ rsi + 0x28 ]; x30_1, x30_0<- arg1[5] * x4 (_0*_0)
mov [ rsp - 0x40 ], r13; spilling x54_0 to mem
xor r13, r13
adox rax, r11
adox r14, rcx
mov rcx, 0x1 ; moving imm to reg
shlx r11, [ rsi + 0x28 ], rcx; x10 <- arg1[5] * 0x2 (shlx does not change the flags)
mov r13, rdx; preserving value of x4 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp - 0x38 ], r12; spilling x16 to mem
mulx r12, rcx, r11; x50_1, x50_0<- arg1[2] * x10 (_0*_0)
imul rdx, [ rsi + 0x10 ], 0x2; x19 <- arg1[2] * 0x2
xchg rdx, r13; x4, swapping with x19, which is currently in rdx
mov [ rsp - 0x30 ], rbx; spilling x57_1 to mem
mov [ rsp - 0x28 ], r10; spilling x57_0 to mem
mulx r10, rbx, [ rsi + 0x18 ]; x41_1, x41_0<- arg1[3] * x4 (_0*_0)
xchg rdx, rbp; x7, swapping with x4, which is currently in rdx
mov [ rsp - 0x20 ], r10; spilling x41_1 to mem
mov [ rsp - 0x18 ], rbx; spilling x41_0 to mem
mulx rbx, r10, [ rsi + 0x18 ]; x42_1, x42_0<- arg1[3] * x7 (_0*_0)
mov [ rsp - 0x10 ], r13; spilling x19 to mem
mov r13, rdx; preserving value of x7 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mov [ rsp - 0x8 ], rdi; spilling x36_1 to mem
mov [ rsp + 0x0 ], r15; spilling x36_0 to mem
mulx r15, rdi, r11; x38_1, x38_0<- arg1[4] * x10 (_0*_0)
xor rdx, rdx
adox rdi, r10
adox rbx, r15
mov r10, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov r15, r10; load m64 x22 to register64
shl r15, 0x1; x22 <- arg1[1] * 0x2
mov r10, rax;
test al, al
adox r10, rax
mov [ rsp + 0x8 ], r15; spilling x22 to mem
mov r15, r14;
adox r15, r14
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x10 ], rbx; spilling x114_1 to mem
mov [ rsp + 0x18 ], rdi; spilling x114_0 to mem
mulx rdi, rbx, rbp; x48_1, x48_0<- arg1[2] * x4 (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0x20 ], rdi; spilling x48_1 to mem
mov [ rsp + 0x28 ], rbx; spilling x48_0 to mem
mulx rbx, rdi, rbp; x35_1, x35_0<- arg1[4] * x4 (_0*_0)
mov rdx, r8;
adcx rdx, r10
adcx r15, r9
xchg rdx, r13; x7, swapping with x100_0, which is currently in rdx
mov [ rsp + 0x30 ], r15; spilling x100_1 to mem
mulx r15, r10, [ rsi + 0x28 ]; x32_1, x32_0<- arg1[5] * x7 (_0*_0)
mov [ rsp + 0x38 ], r13; spilling x100_0 to mem
mov r13, [ rsi + 0x20 ]; load m64 arg1[4] to register64
mov [ rsp + 0x40 ], r12; spilling x50_1 to mem
mov r12, r13; load m64 x13 to register64
shl r12, 0x1; x13 <- arg1[4] * 0x2
test al, al
adox r10, rdi
adox rbx, r15
xchg rdx, r12; x13, swapping with x7, which is currently in rdx
mulx rdi, r13, [ rsi + 0x18 ]; x45_1, x45_0<- arg1[3] * x13 (_0*_0)
mov [ rsp + 0x48 ], rcx; spilling x50_0 to mem
mulx rcx, r15, [ rsi + 0x8 ]; x59_1, x59_0<- arg1[1] * x13 (_0*_0)
adcx rax, r8
adcx r9, r14
mulx r14, r8, [ rsi + 0x10 ]; x51_1, x51_0<- arg1[2] * x13 (_0*_0)
mov [ rsp + 0x50 ], r14; spilling x51_1 to mem
mov [ rsp + 0x58 ], r8; spilling x51_0 to mem
mulx r8, r14, [ rsi + 0x0 ]; x69_1, x69_0<- arg1[0] * x13 (_0*_0)
mov rdx, r10;
mov [ rsp + 0x60 ], rcx; spilling x59_1 to mem
xor rcx, rcx
adox rdx, r13
adox rdi, rbx
mov r13, rdx;
adcx r13, [ rsp + 0x48 ]
adcx rdi, [ rsp + 0x40 ]
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp + 0x68 ], r15; spilling x59_0 to mem
mulx r15, rcx, rbp; x27_1, x27_0<- arg1[6] * x4 (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0x70 ], r8; spilling x69_1 to mem
mov [ rsp + 0x78 ], r14; spilling x69_0 to mem
mov [ rsp + 0x80 ], r9; spilling x88_1 to mem
mulx r9, r8, r15; __,tmp <- (a_0 in rdx) * b_hi
mulx r9, r14, rcx; hi,lo <- (a_0 in rdx) * b_lo
lea r9, [r9+r8]; hi += tmp
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0x88 ], r9; spilling x86_1 to mem
mulx r9, r8, rdx; x33_1, x33_0<- arg1[5]^2
xor rdx, rdx
adox rcx, [ rsp + 0x18 ]
adox r15, [ rsp + 0x10 ]
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp + 0x90 ], r15; spilling x126_1 to mem
mov [ rsp + 0x98 ], rcx; spilling x126_0 to mem
mulx rcx, r15, rbp; x66_1, x66_0<- arg1[0] * x4 (_0*_0)
adcx r8, [ rsp + 0x0 ]
adcx r9, [ rsp - 0x8 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0xa0 ], r14; spilling x86_0 to mem
mov [ rsp + 0xa8 ], r9; spilling x134_1 to mem
mulx r9, r14, [ rsp - 0x10 ]; x62_1, x62_0<- arg1[1] * x19 (_0*_0)
mov rdx, r13;
test al, al
adox rdx, [ rsp - 0x28 ]
adox rdi, [ rsp - 0x30 ]
adcx r10, r14
adcx r9, rbx
test al, al
adox r15, rdx
adox rdi, rcx
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r13, rbx, r11; x43_1, x43_0<- arg1[3] * x10 (_0*_0)
mov rdx, r12; x7 to rdx
mulx rcx, r12, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * x7 (_0*_0)
mov r14, rbx;
adcx r14, rax
mov [ rsp + 0xb0 ], r8; spilling x134_0 to mem
mov r8, r13;
adcx r8, [ rsp + 0x80 ]
mov rax, r12;
test al, al
adox rax, r14
adox r8, rcx
mov r14, rdx; preserving value of x7 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mov [ rsp + 0xb8 ], r8; spilling x90_1 to mem
mov [ rsp + 0xc0 ], rax; spilling x90_0 to mem
mulx rax, r8, [ rsp - 0x38 ]; x70_1, x70_0<- arg1[0] * x16 (_0*_0)
adcx r8, r10
adcx r9, rax
mov rdx, r15;
add rbx, [ rsp + 0x38 ]; could be done better, if r0 has been u8 as well
adcx r13, [ rsp + 0x30 ]
xor r10, r10
adox r12, rbx
adox r13, rcx
mov rcx, r8;
shrd rcx, r9, 0x38; lo
shr r9, 0x38; x78_1>>=0x38
mov rax, r12;
add rax, [ rsp - 0x40 ]; could be done better, if r0 has been u8 as well
adcx r13, [ rsp - 0x48 ]
mov rbx, rdx; preserving value of x95 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r9, r12, rbp; x56_1, x56_0<- arg1[1] * x4 (_0*_0)
mov rdx, r12;
xor rbp, rbp
adox rdx, [ rsp + 0xc0 ]
mov r10, r9;
adox r10, [ rsp + 0xb8 ]
mov rbp, rdx; preserving value of x91_0 into a new reg
mov rdx, [ rsi + 0x38 ]; saving arg1[7] in rdx.
mov [ rsp + 0xc8 ], rbx; spilling x95 to mem
mov [ rsp + 0xd0 ], r8; spilling x79 to mem
mulx r8, rbx, rdx; x24_1, x24_0<- arg1[7]^2
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0xd8 ], rcx; spilling x78_0 to mem
mov [ rsp + 0xe0 ], r10; spilling x91_1 to mem
mov [ rsp + 0xe8 ], rbp; spilling x91_0 to mem
mulx rbp, rcx, r8; __,tmp <- (a_0 in rdx) * b_hi
mulx rbp, r10, rbx; hi,lo <- (a_0 in rdx) * b_lo
lea rbp, [rbp+rcx]; hi += tmp
adcx rbx, [ rsp + 0xb0 ]
adcx r8, [ rsp + 0xa8 ]
test al, al
adox r12, rax
adox r13, r9
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rax, rcx, [ rsp - 0x38 ]; x60_1, x60_0<- arg1[1] * x16 (_0*_0)
adcx rcx, r12
adcx r13, rax
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r12, r9, rdx; x74_1, x74_0<- arg1[0]^2
add r9, [ rsp + 0xe8 ]; could be done better, if r0 has been u8 as well
adcx r12, [ rsp + 0xe0 ]
shrd r15, rdi, 0x38; lo
shr rdi, 0x38; x94_1>>=0x38
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r15, rdx; lo limb and'ed
mov rax, r15;
adox rax, r9
mov rdi, 0x0 ; moving imm to reg
adox r12, rdi
mov r9, [ rsp + 0xd8 ];
and r9, rdx; lo limb and'ed
mov rdi, rax;
shrd rdi, r12, 0x38; lo
shr r12, 0x38; x121_1>>=0x38
mov r12, rcx;
xor rdx, rdx
adox r12, [ rsp + 0x78 ]
adox r13, [ rsp + 0x70 ]
adcx r9, r12
adc r13, 0x0; add CF to r0's alloc
xor rcx, rcx
adox r15, r9
adox r13, rcx
adcx r10, [ rsp + 0xb0 ]
adcx rbp, [ rsp + 0xa8 ]
mov rdx, r15;
mov r12, r10;
add r12, [ rsp - 0x18 ]; could be done better, if r0 has been u8 as well
adcx rbp, [ rsp - 0x20 ]
mov r9, [ rsp + 0x18 ]; load m64 x114_0 to register64
mov r10, r9;
add r10, [ rsp + 0xa0 ]; could be done better, if r0 has been u8 as well
mov [ rsp + 0xf0 ], rdx; spilling x110 to mem
mov rdx, [ rsp + 0x10 ]; load m64 x114_1 to register64
adcx rdx, [ rsp + 0x88 ]
shrd r15, r13, 0x38; lo
shr r13, 0x38; x109_1>>=0x38
mov r9, rdx; preserving value of x115_1 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mulx rcx, r13, rdx; x46_1, x46_0<- arg1[3]^2
mov rdx, [ rsp + 0x28 ]; load m64 x48_0 to register64
mov [ rsp + 0xf8 ], r15; spilling x109_0 to mem
mov r15, rdx;
add r15, [ rsp + 0x98 ]; could be done better, if r0 has been u8 as well
mov [ rsp + 0x100 ], rcx; spilling x46_1 to mem
mov rcx, [ rsp + 0x20 ]; load m64 x48_1 to register64
mov [ rsp + 0x108 ], r13; spilling x46_0 to mem
mov r13, rcx;
adcx r13, [ rsp + 0x90 ]
mov [ rsp + 0x110 ], rbp; spilling x136_1 to mem
mov rbp, 0x38 ; moving imm to reg
mov [ rsp + 0x118 ], r12; spilling x136_0 to mem
bzhi r12, rax, rbp; x123 <- x122 (only least 0x38 bits)
mov rax, rdx; preserving value of x48_0 into a new reg
mov rdx, [ rsp + 0x8 ]; saving x22 in rdx.
mov [ rsp + 0x120 ], r12; spilling x123 to mem
mulx r12, rbp, [ rsi + 0x0 ]; x73_1, x73_0<- arg1[0] * x22 (_0*_0)
adox rax, r10
adox r9, rcx
xor rdx, rdx
adox rbp, r15
adox r13, r12
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r10, rcx, r11; x68_1, x68_0<- arg1[0] * x10 (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r12, r15, [ rsp - 0x38 ]; x53_1, x53_0<- arg1[2] * x16 (_0*_0)
adcx r15, rax
adcx r9, r12
mov rdx, [ rsp - 0x10 ]; x19 to rdx
mulx r12, rax, [ rsi + 0x0 ]; x71_1, x71_0<- arg1[0] * x19 (_0*_0)
mov rdx, 0x40 ; moving imm to reg
mov [ rsp + 0x128 ], r12; spilling x71_1 to mem
bzhi r12, rdi, rdx; x124 <- x121_0 (only least 0x40 bits)
adox r12, rbp
mov rdi, 0x0 ; moving imm to reg
adox r13, rdi
mov rbp, rbx;
test al, al
adox rbp, [ rsp - 0x18 ]
adox r8, [ rsp - 0x20 ]
mov rbx, r12;
shrd rbx, r13, 0x38; lo
shr r13, 0x38; x142_1>>=0x38
mov r13, r15;
add r13, [ rsp + 0x68 ]; could be done better, if r0 has been u8 as well
adcx r9, [ rsp + 0x60 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, r15, r11; x58_1, x58_0<- arg1[1] * x10 (_0*_0)
add rcx, r13; could be done better, if r0 has been u8 as well
adcx r9, r10
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r10, r11, rdx; x63_1, x63_0<- arg1[1]^2
mov rdx, r14; x7 to rdx
mulx r13, r14, [ rsi + 0x0 ]; x67_1, x67_0<- arg1[0] * x7 (_0*_0)
test al, al
adox r11, rbp
adox r8, r10
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rbx, rdx; lo limb and'ed
adox rax, r11
adox r8, [ rsp + 0x128 ]
mov rbp, [ rsp + 0x118 ]; load m64 x136_0 to register64
mov r10, rbp;
adcx r10, [ rsp + 0x108 ]
mov r11, [ rsp + 0x110 ]; load m64 x136_1 to register64
adcx r11, [ rsp + 0x100 ]
add rbx, rax; could be done better, if r0 has been u8 as well
adc r8, 0x0; add CF to r0's alloc
mov rbp, [ rsp + 0xf8 ];
and rbp, rdx; lo limb and'ed
adox rbp, rcx
mov rax, 0x0 ; moving imm to reg
adox r9, rax
mov rcx, r10;
adcx rcx, [ rsp + 0x58 ]
adcx r11, [ rsp + 0x50 ]
mov r10, rbp;
shrd r10, r9, 0x38; lo
shr r9, 0x38; x130_1>>=0x38
mov r9, rbx;
xor rdx, rdx
adox r15, rcx
adox r11, rdi
adcx r14, r15
adcx r11, r13
mov rax, 0x40 ; moving imm to reg
bzhi rdi, r10, rax; x133 <- x130_0 (only least 0x40 bits)
adox rdi, r14
adox r11, rdx
mov r13, rdi;
shrd r13, r11, 0x38; lo
shr r11, 0x38; x152_1>>=0x38
mov rcx, 0x38 ; moving imm to reg
bzhi r10, rdi, rcx; x155 <- x154 (only least 0x38 bits)
mov r15, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r15 + 0x30 ], r10; out1[6] = x155
bzhi r14, [ rsp + 0xd0 ], rcx; x80 <- x79 (only least 0x38 bits)
shrd rbx, r8, 0x38; lo
shr r8, 0x38; x157_1>>=0x38
bzhi r11, [ rsp + 0xc8 ], rcx; x96 <- x95 (only least 0x38 bits)
bzhi rdi, [ rsp + 0xf0 ], rcx; x111 <- x110 (only least 0x38 bits)
lea r11, [ r11 + r13 ]
mov r10, r11;
shr r10, 0x38; x162 <- x156>> 0x38
lea r14, [ r14 + rbx ]
bzhi r8, r11, rcx; x163 <- x156 (only least 0x38 bits)
mov r13, r14;
shr r13, 0x38; x164 <- x161>> 0x38
lea r13, [ r13 + rdi ]
lea r13, [ r13 + r10 ]
bzhi rdi, r13, rcx; x170 <- x168 (only least 0x38 bits)
shr r13, 0x38; x169 <- x168>> 0x38
add r10, [ rsp + 0x120 ]
bzhi r11, r10, rcx; x173 <- x166 (only least 0x38 bits)
mov [ r15 + 0x20 ], rdi; out1[4] = x170
bzhi rbx, r12, rcx; x144 <- x143 (only least 0x38 bits)
bzhi r12, rbp, rcx; x132 <- x131 (only least 0x38 bits)
bzhi rdi, r9, rcx; x160 <- x159 (only least 0x38 bits)
mov [ r15 + 0x0 ], r11; out1[0] = x173
shr r10, 0x38; x172 <- x166>> 0x38
lea r10, [ r10 + rbx ]
mov [ r15 + 0x10 ], rdi; out1[2] = x160
lea r13, [ r13 + r12 ]
bzhi r9, r14, rcx; x165 <- x161 (only least 0x38 bits)
mov [ r15 + 0x28 ], r13; out1[5] = x171
mov [ r15 + 0x38 ], r8; out1[7] = x163
mov [ r15 + 0x8 ], r10; out1[1] = x174
mov [ r15 + 0x18 ], r9; out1[3] = x165
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 432
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0040
; seed 3919394241237680 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; target mutation ratio P:50% D:50%
; time needed: 5787986 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=102, initial num_batches=31): 199935 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.034543103594238136
; number reverted permutation / tried permutation: 68612 / 90147 =76.111%
; number reverted decision / tried decision: 63988 / 89852 =71.215%
;
; === NATURAL MUTATION DISTRIBUTION ANALYSIS ===
; Study Goal: Measure inherent mutation preferences without forced ratios
; Total Evaluations: 179999 (excluding initial)
; Total Mutations: 179999
;
; NATURAL DISTRIBUTION:
;   Permutation: 90147 mutations (50.1%)
;   Decision:    89852 mutations (49.9%)
;
; FALLBACK ANALYSIS:
;   Original Intended Permutations: 90147
;   Decision→Permutation Fallbacks: 0
;   Fallback Rate: 0.0% of total mutations
;
; SUCCESS RATES (mutations kept):
;   Permutation Success: 21535/90147 (23.9%)
;   Decision Success:    25864/89852 (28.8%)
;
; KEY FINDING: Natural P/D ratio = 50.1%/49.9% for this implementation
; Time-series data: 179999 mutations recorded with timestamps