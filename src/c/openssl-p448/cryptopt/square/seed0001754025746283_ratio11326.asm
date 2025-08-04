SECTION .text
	GLOBAL openssl_p448_square
openssl_p448_square:
sub rsp, 280
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mulx r10, rax, [ rsi + 0x30 ]; x39_1, x39_0<- arg1[6] * arg1[5] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rcx, r11, [ rsi + 0x8 ]; x32_1, x32_0<- arg1[2] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x38 ];
add rdx, [ rsi + 0x18 ]
mov r8, rdx; preserving value of x20 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, rdx; x66_1, x66_0<- arg1[0]^2
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, rdx; x122_1, x122_0<- arg1[3]^2
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, rdx; x65_1, x65_0<- arg1[6]^2
imul rdx, [ rsi + 0x28 ], 0x2; x57 <- arg1[5] * 0x2
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov r15, [ rsi + 0x28 ];
add r15, [ rsi + 0x8 ]
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov rdi, 0x1 ; moving imm to reg
mov [ rsp - 0x48 ], r12; spilling x122_1 to mem
shlx r12, r15, rdi; x54 <- x10 * 0x2 (shlx does not change the flags)
mov rdi, rdx; preserving value of x57 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mov [ rsp - 0x40 ], rbp; spilling x122_0 to mem
mov [ rsp - 0x38 ], r14; spilling x65_1 to mem
mulx r14, rbp, [ rsi + 0x0 ]; x23_1, x23_0<- arg1[3] * arg1[0] (_0*_0)
mov rdx, 0x1 ; moving imm to reg
mov [ rsp - 0x30 ], r13; spilling x65_0 to mem
shlx r13, [ rsi + 0x8 ], rdx; x63 <- arg1[1] * 0x2 (shlx does not change the flags)
test al, al
adox r11, rbp
adox r14, rcx
mov rcx, [ rsi + 0x30 ];
add rcx, [ rsi + 0x10 ]
mov rdx, rcx; x15 to rdx
mulx rbp, rcx, rdx; x60_1, x60_0<- x15^2
mov [ rsp - 0x28 ], rbx; spilling x66_1 to mem
mov rbx, rdx;
shl rbx, 0x1; x87 <- x15 * 0x2
mov [ rsp - 0x20 ], rbx; spilling x87 to mem
mov rbx, rdx; preserving value of x15 into a new reg
mov rdx, [ rsi + 0x38 ]; saving arg1[7] in rdx.
mov [ rsp - 0x18 ], r9; spilling x66_0 to mem
mov [ rsp - 0x10 ], rdi; spilling x57 to mem
mulx rdi, r9, [ rsi + 0x20 ]; x29_1, x29_0<- arg1[7] * arg1[4] (_0*_0)
add rax, r9; could be done better, if r0 has been u8 as well
adcx rdi, r10
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r9, r10, rdx; x74_1, x74_0<- arg1[2]^2
mov rdx, r13; x63 to rdx
mov [ rsp - 0x8 ], rbp; spilling x60_1 to mem
mulx rbp, r13, [ rsi + 0x18 ]; x75_1, x75_0<- arg1[3] * x63 (_0*_0)
test al, al
adox r10, r13
adox rbp, r9
mov rdx, r12; x54 to rdx
mulx r9, r12, r8; x56_1, x56_0<- x20 * x54 (_0*_0)
mov rdx, [ rsi + 0x0 ]; load m64 arg1[0] to register64
lea r13, [rdx + rdx]; x96 <- arg1[0] * 2 
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x0 ], rbp; spilling x76_1 to mem
mov [ rsp + 0x8 ], r10; spilling x76_0 to mem
mulx r10, rbp, r13; x124_1, x124_0<- arg1[2] * x96 (_0*_0)
mov rdx, r11;
adcx rdx, rax
adcx rdi, r14
test al, al
adox rcx, r12
adox r9, [ rsp - 0x8 ]
mov rax, rdx; preserving value of x43_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mov [ rsp + 0x10 ], r9; spilling x61_1 to mem
mulx r9, r12, rdx; x127_1, x127_0<- arg1[1]^2
mov rdx, [ rsi + 0x20 ];
add rdx, [ rsi + 0x0 ]
mov [ rsp + 0x18 ], rcx; spilling x61_0 to mem
xor rcx, rcx
adox r12, rbp
adox r10, r9
lea rbp, [rdx + rdx]; x99 <- x5 * 2 
mulx rcx, r9, r8; x26_1, x26_0<- x20 * x5 (_0*_0)
mov [ rsp + 0x20 ], r10; spilling x128_1 to mem
mov r10, r9;
sub r10, r11
sbb rcx, r14
mulx r14, r11, rdx; x67_1, x67_0<- x5^2
mov rdx, rbx; x15 to rdx
mulx r9, rbx, r15; x36_1, x36_0<- x15 * x10 (_0*_0)
mov [ rsp + 0x28 ], r12; spilling x128_0 to mem
mov [ rsp + 0x30 ], rdi; spilling x43_1 to mem
mulx rdi, r12, rbp; x125_1, x125_0<- x15 * x99 (_0*_0)
test al, al
adox rbx, r10
adox rcx, r9
mov rdx, [ rsp - 0x10 ]; x57 to rdx
mulx r9, r10, [ rsi + 0x38 ]; x59_1, x59_0<- arg1[7] * x57 (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0x38 ], rdi; spilling x125_1 to mem
mov [ rsp + 0x40 ], r12; spilling x125_0 to mem
mulx r12, rdi, rdx; x73_1, x73_0<- arg1[4]^2
mov rdx, r11;
sub rdx, [ rsp - 0x18 ]
sbb r14, [ rsp - 0x28 ]
mov r11, rdx;
test al, al
adox r11, [ rsp - 0x30 ]
adox r14, [ rsp - 0x38 ]
mov rdx, rax;
adcx r10, r11
adcx r14, r9
mov r9, [ rsp + 0x30 ];
shrd rax, r9, 0x37; lo
shr r9, 0x37; x53_1>>=0x37
mov r11, rdi;
mov [ rsp + 0x48 ], rdx; spilling x44 to mem
xor rdx, rdx
adox r11, [ rsp - 0x18 ]
adox r12, [ rsp - 0x28 ]
mov rdi, [ rsi + 0x20 ]; load m64 arg1[4] to register64
lea rdx, [rdi + rdi]; x102 <- arg1[4] * 2 
mov rdi, r11;
sub rdi, [ rsp + 0x8 ]
sbb r12, [ rsp + 0x0 ]
mov r11, rbx;
mov [ rsp + 0x50 ], r11; spilling x48 to mem
mov [ rsp + 0x58 ], r12; spilling x78_1 to mem
mulx r12, r11, [ rsi + 0x30 ]; x126_1, x126_0<- arg1[6] * x102 (_0*_0)
shrd rbx, rcx, 0x37; lo
shr rcx, 0x37; x52_1>>=0x37
test al, al
adox rbx, [ rsp + 0x18 ]
adox rcx, [ rsp + 0x10 ]
adcx rax, r10
adcx r14, r9
mov r10, rbx;
xor r9, r9
adox r10, rax
adox r14, rcx
adcx rbx, rdi
adcx rcx, [ rsp + 0x58 ]
mov rdi, rdx; preserving value of x102 into a new reg
mov rdx, [ rsi + 0x28 ]; saving arg1[5] in rdx.
mulx r9, rax, rdx; x130_1, x130_0<- arg1[5]^2
mov rdx, [ rsi + 0x10 ]; load m64 arg1[2] to register64
mov [ rsp + 0x60 ], r14; spilling x72_1 to mem
mov r14, rdx; load m64 x90 to register64
shl r14, 0x1; x90 <- arg1[2] * 0x2
xor rdx, rdx
adox rax, [ rsp + 0x28 ]
adox r9, [ rsp + 0x20 ]
adcx r11, rax
adcx r9, r12
mov rdx, r14; x90 to rdx
mulx r12, r14, [ rsi + 0x18 ]; x92_1, x92_0<- arg1[3] * x90 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x68 ], r10; spilling x72_0 to mem
mulx r10, rax, r13; x98_1, x98_0<- arg1[1] * x96 (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0x70 ], r9; spilling x137_1 to mem
mulx r9, r13, rdi; x104_1, x104_0<- arg1[5] * x102 (_0*_0)
mov rdx, r8; x20 to rdx
mulx rdi, r8, rdx; x121_1, x121_0<- x20^2
mov [ rsp + 0x78 ], rdi; spilling x121_1 to mem
mov rdi, rax;
mov [ rsp + 0x80 ], r8; spilling x121_0 to mem
xor r8, r8
adox rdi, r13
adox r9, r10
mov r13, rbx;
mov r8, rdi;
sub r8, r14
sbb r9, r12
mulx r12, r14, [ rsp - 0x20 ]; x89_1, x89_0<- x20 * x87 (_0*_0)
mov rdx, r11;
sub rdx, [ rsp - 0x40 ]
mov rdi, [ rsp + 0x70 ]; load m64 x137_1 to register64
sbb rdi, [ rsp - 0x48 ]
mov r11, rdx;
test al, al
adox r11, [ rsp + 0x80 ]
adox rdi, [ rsp + 0x78 ]
mov rdx, [ rsi + 0x30 ]; load m64 arg1[6] to register64
mov [ rsp + 0x88 ], r13; spilling x80 to mem
lea r13, [rdx + rdx]; x93 <- arg1[6] * 2 
shrd rbx, rcx, 0x38; lo
shr rcx, 0x38; x85_1>>=0x38
mov rdx, rbp; x99 to rdx
mov [ rsp + 0x90 ], rdi; spilling x139_1 to mem
mulx rdi, rbp, r15; x101_1, x101_0<- x10 * x99 (_0*_0)
mov rdx, r14;
test al, al
adox rdx, r8
adox r9, r12
adcx rbx, rdx
adcx r9, rcx
mov r8, rbx;
shrd r8, r9, 0x38; lo
shr r9, 0x38; x119_1>>=0x38
mov rcx, rbp;
sub rcx, rax
sbb rdi, r10
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mulx r10, rax, r13; x95_1, x95_0<- arg1[7] * x93 (_0*_0)
mov rdx, r15; x10 to rdx
mulx r13, r15, rdx; x129_1, x129_0<- x10^2
xor rdx, rdx
adox rax, rcx
adox rdi, r10
adcx r8, r11
adcx r9, [ rsp + 0x90 ]
xor r11, r11
adox r14, rax
adox rdi, r12
mov rdx, r15;
sub rdx, [ rsp + 0x28 ]
sbb r13, [ rsp + 0x20 ]
mov r12, r8;
shrd r12, r9, 0x38; lo
shr r9, 0x38; x147_1>>=0x38
mov rbp, rdx;
xor rcx, rcx
adox rbp, [ rsp + 0x40 ]
adox r13, [ rsp + 0x38 ]
mov r11, [ rsp + 0x60 ];
mov r10, [ rsp + 0x68 ];
shrd r10, r11, 0x38; lo
shr r11, 0x38; x86_1>>=0x38
add r10, r14; could be done better, if r0 has been u8 as well
adcx rdi, r11
mov r15, r10;
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mulx r14, rax, rdx; x123_1, x123_0<- arg1[7]^2
mov rdx, 0xffffffffffffff ; moving imm to reg
and r8, rdx; x142 <- x141&0xffffffffffffff
adox rax, rbp
adox r13, r14
mov rbp, [ rsp + 0x48 ]; load m64 x44 to register64
lea r11, [rbp + rbp]; x45 <- x44 * 2 
mov rbp, 0xfffffffffffffe ; moving imm to reg
and r11, rbp; x46 <- x45&0xfffffffffffffe
mov r14, rax;
adox r14, [ rsp + 0x80 ]
adox r13, [ rsp + 0x78 ]
and r15, rdx; x117 <- x116&0xffffffffffffff
shrd r10, rdi, 0x38; lo
shr rdi, 0x38; x120_1>>=0x38
xor rax, rax
adox r10, r14
adox r13, rdi
mov rcx, r10;
shrd rcx, r13, 0x38; lo
shr r13, 0x38; x148_1>>=0x38
mov r14, [ rsp + 0x88 ];
and r14, rdx; x81 <- x80&0xffffffffffffff
mov rdi, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rdi + 0x28 ], r15; out1[5] = x117
adox r11, r12
adox r9, rax
imul r12, [ rsp + 0x50 ], 0x2; x49 <- x48 * 0x2
mov r15, r11;
shrd r11, r9, 0x38; lo
shr r9, 0x38; x157_1>>=0x38
and r12, rbp; x50 <- x49&0xfffffffffffffe
adox r12, rcx
adox r13, rax
and r15, rdx; x154 <- x153&0xffffffffffffff
mov rcx, r12;
shrd rcx, r13, 0x38; lo
shr r13, 0x38; x158_1>>=0x38
and r10, rdx; x145 <- x144&0xffffffffffffff
mov r9, [ rsp + 0x68 ];
and r9, rdx; x83 <- x82&0xffffffffffffff
and r12, rdx; x156 <- x155&0xffffffffffffff
and rbx, rdx; x114 <- x113&0xffffffffffffff
lea r9, [ r9 + r11 ]
mov [ rdi + 0x38 ], r12; out1[7] = x156
lea r9, [ r9 + rcx ]
mov [ rdi + 0x20 ], r9; out1[4] = x162
lea r14, [ r14 + rcx ]
mov [ rdi + 0x8 ], rbx; out1[1] = x114
mov [ rdi + 0x30 ], r10; out1[6] = x145
mov [ rdi + 0x10 ], r8; out1[2] = x142
mov [ rdi + 0x0 ], r14; out1[0] = x163
mov [ rdi + 0x18 ], r15; out1[3] = x154
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 280
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1326
; seed 0728209925599819 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; target mutation ratio P:50% D:50%
; time needed: 3383349 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=117, initial num_batches=31): 175677 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.051923996016964256
; number reverted permutation / tried permutation: 68209 / 90219 =75.604%
; number reverted decision / tried decision: 59339 / 89780 =66.094%
;
; === NATURAL MUTATION DISTRIBUTION ANALYSIS ===
; Study Goal: Measure inherent mutation preferences without forced ratios
; Total Evaluations: 179999 (excluding initial)
; Total Mutations: 179999
;
; NATURAL DISTRIBUTION:
;   Permutation: 90219 mutations (50.1%)
;   Decision:    89780 mutations (49.9%)
;
; FALLBACK ANALYSIS:
;   Original Intended Permutations: 90219
;   Decision→Permutation Fallbacks: 0
;   Fallback Rate: 0.0% of total mutations
;
; SUCCESS RATES (mutations kept):
;   Permutation Success: 22010/90219 (24.4%)
;   Decision Success:    30441/89780 (33.9%)
;
; KEY FINDING: Natural P/D ratio = 50.1%/49.9% for this implementation
; Time-series data: 179999 mutations recorded with timestamps