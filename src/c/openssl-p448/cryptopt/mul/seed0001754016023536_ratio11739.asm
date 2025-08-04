SECTION .text
	GLOBAL openssl_p448_mul
openssl_p448_mul:
sub rsp, 360
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x20 ]; saving arg2[4] in rdx.
mulx r11, r10, [ rsi + 0x30 ]; x128_1, x128_0<- arg1[6] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r8, rcx, [ rax + 0x0 ]; x170_1, x170_0<- arg1[3] * arg2[0] (_0*_0)
mov rdx, [ rax + 0x28 ];
add rdx, [ rax + 0x8 ]
mov r9, rdx; preserving value of x43 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, [ rax + 0x38 ]; x104_1, x104_0<- arg2[7] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, [ rsi + 0x20 ]; x130_1, x130_0<- arg2[6] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, [ rax + 0x20 ]; x61_1, x61_0<- arg2[4] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x38 ];
add rdx, [ rax + 0x18 ]
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov rdi, [ rax + 0x30 ];
add rdi, [ rax + 0x10 ]
mov [ rsp - 0x48 ], rbp; spilling x104_1 to mem
xor rbp, rbp
adox r10, r12
adox r13, r11
mulx r12, r11, [ rsi + 0x38 ]; x127_1, x127_0<- x33 * arg1[7] (_0*_0)
mov rbp, rdx; preserving value of x33 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mov [ rsp - 0x40 ], rbx; spilling x104_0 to mem
mov [ rsp - 0x38 ], r9; spilling x43 to mem
mulx r9, rbx, rdi; x58_1, x58_0<- x22 * arg1[6] (_0*_0)
adcx r11, r10
adcx r13, r12
xor rdx, rdx
adox r14, rbx
adox r9, r15
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r10, r15, [ rax + 0x8 ]; x171_1, x171_0<- arg1[2] * arg2[1] (_0*_0)
adcx r15, rcx
adcx r8, r10
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r12, rcx, [ rax + 0x18 ]; x174_1, x174_0<- arg2[3] * arg1[0] (_0*_0)
test al, al
adox rcx, r15
adox r8, r12
mov rdx, rdi;
add rdx, [ rax + 0x30 ]
mov rbx, rdx; preserving value of x23 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx r15, r10, [ rax + 0x28 ]; x96_1, x96_0<- arg2[5] * arg1[4] (_0*_0)
mov rdx, rdi; x22 to rdx
mulx r12, rdi, [ rsi + 0x38 ]; x93_1, x93_0<- arg1[7] * x22 (_0*_0)
mov [ rsp - 0x30 ], r13; spilling x150_1 to mem
mov r13, rdx; preserving value of x22 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mov [ rsp - 0x28 ], r11; spilling x150_0 to mem
mov [ rsp - 0x20 ], rbx; spilling x23 to mem
mulx rbx, r11, [ rsi + 0x8 ]; x172_1, x172_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, rbp; x33 to rdx
mov [ rsp - 0x18 ], r9; spilling x87_1 to mem
mulx r9, rbp, [ rsi + 0x30 ]; x94_1, x94_0<- x33 * arg1[6] (_0*_0)
test al, al
adox rdi, r10
adox r15, r12
adcx r11, rcx
adcx r8, rbx
mulx r10, rcx, [ rsi + 0x28 ]; x60_1, x60_0<- arg1[5] * x33 (_0*_0)
mov r12, rdx; preserving value of x33 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp - 0x10 ], r8; spilling x177_1 to mem
mulx r8, rbx, [ rsi + 0x0 ]; x79_1, x79_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x8 ], r11; spilling x177_0 to mem
mov [ rsp + 0x0 ], r8; spilling x79_1 to mem
mulx r8, r11, [ rax + 0x30 ]; x76_1, x76_0<- arg2[6] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x20 ];
add rdx, [ rax + 0x0 ]
mov [ rsp + 0x8 ], rbx; spilling x79_0 to mem
xor rbx, rbx
adox rcx, r14
adox r10, [ rsp - 0x18 ]
adcx rbp, rdi
adcx r15, r9
mov r14, [ rsi + 0x20 ];
add r14, [ rsi + 0x0 ]
mov r9, rdx; preserving value of x10 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.
mulx rbx, rdi, [ rsi + 0x28 ]; x129_1, x129_0<- arg1[5] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x38 ];
add rdx, [ rsi + 0x18 ]
mov [ rsp + 0x10 ], r15; spilling x116_1 to mem
mov [ rsp + 0x18 ], rbp; spilling x116_0 to mem
mulx rbp, r15, r9; x165_1, x165_0<- x28 * x10 (_0*_0)
mov [ rsp + 0x20 ], r10; spilling x88_1 to mem
mov [ rsp + 0x28 ], rcx; spilling x88_0 to mem
mulx rcx, r10, [ rsp - 0x20 ]; x98_1, x98_0<- x28 * x23 (_0*_0)
xchg rdx, r14; x6, swapping with x28, which is currently in rdx
mov [ rsp + 0x30 ], r8; spilling x76_1 to mem
mov [ rsp + 0x38 ], r11; spilling x76_0 to mem
mulx r11, r8, [ rsp - 0x38 ]; x101_1, x101_0<- x43 * x6 (_0*_0)
mov [ rsp + 0x40 ], rbp; spilling x165_1 to mem
mov rbp, [ rsi + 0x8 ];
add rbp, [ rsi + 0x28 ]
test al, al
adox rdi, [ rsp - 0x28 ]
adox rbx, [ rsp - 0x30 ]
mov [ rsp + 0x48 ], rbx; spilling x151_1 to mem
mov [ rsp + 0x50 ], rdi; spilling x151_0 to mem
mulx rdi, rbx, r9; x71_1, x71_0<- x10 * x6 (_0*_0)
mov [ rsp + 0x58 ], rdi; spilling x71_1 to mem
mov rdi, [ rsi + 0x30 ];
add rdi, [ rsi + 0x10 ]
mov [ rsp + 0x60 ], rbx; spilling x71_0 to mem
xor rbx, rbx
adox r10, r8
adox r11, rcx
mulx r8, rcx, r12; x168_1, x168_0<- x33 * x6 (_0*_0)
xchg rdx, r9; x10, swapping with x6, which is currently in rdx
mov [ rsp + 0x68 ], r11; spilling x110_1 to mem
mulx r11, rbx, rdi; x133_1, x133_0<- x17 * x10 (_0*_0)
adcx r15, rcx
adcx r8, [ rsp + 0x40 ]
mov [ rsp + 0x70 ], r10; spilling x110_0 to mem
mulx r10, rcx, rbp; x100_1, x100_0<- x48 * x10 (_0*_0)
add r12, [ rax + 0x38 ]
mov rdx, r9; x6 to rdx
mov [ rsp + 0x78 ], r10; spilling x100_1 to mem
mulx r10, r9, r13; x135_1, x135_0<- x22 * x6 (_0*_0)
mov rdx, r12; x34 to rdx
mov [ rsp + 0x80 ], rcx; spilling x100_0 to mem
mulx rcx, r12, r14; x132_1, x132_0<- x34 * x28 (_0*_0)
test al, al
adox rbx, r9
adox r10, r11
adcx r12, rbx
adcx r10, rcx
mov r11, rdx; preserving value of x34 into a new reg
mov rdx, [ rsp - 0x38 ]; saving x43 in rdx.
mulx rcx, r9, rbp; x134_1, x134_0<- x48 * x43 (_0*_0)
test al, al
adox r9, r12
adox r10, rcx
mulx r12, rbx, rdi; x166_1, x166_0<- x43 * x17 (_0*_0)
adcx rbx, r15
adcx r8, r12
xchg rdx, rbp; x48, swapping with x43, which is currently in rdx
mulx rcx, r15, r13; x167_1, x167_0<- x48 * x22 (_0*_0)
xchg rdx, rdi; x17, swapping with x48, which is currently in rdx
mulx r12, r13, [ rsp - 0x20 ]; x68_1, x68_0<- x23 * x17 (_0*_0)
mov [ rsp + 0x88 ], r10; spilling x146_1 to mem
mov r10, r13;
test al, al
adox r10, [ rsp + 0x60 ]
adox r12, [ rsp + 0x58 ]
mov r13, [ rsp + 0x8 ]; load m64 x79_0 to register64
adcx r13, [ rsp + 0x38 ]
mov [ rsp + 0x90 ], r9; spilling x146_0 to mem
mov r9, [ rsp + 0x0 ]; load m64 x79_1 to register64
adcx r9, [ rsp + 0x30 ]
mov [ rsp + 0x98 ], r12; spilling x83_1 to mem
mov r12, rbp;
add r12, [ rax + 0x28 ]
mov [ rsp + 0xa0 ], r10; spilling x83_0 to mem
mov r10, rdx; preserving value of x17 into a new reg
mov rdx, [ rax + 0x38 ]; saving arg2[7] in rdx.
mov [ rsp + 0xa8 ], r9; spilling x80_1 to mem
mov [ rsp + 0xb0 ], r13; spilling x80_0 to mem
mulx r13, r9, [ rsi + 0x8 ]; x78_1, x78_0<- arg1[1] * arg2[7] (_0*_0)
mov rdx, rbp; x43 to rdx
mov [ rsp + 0xb8 ], r13; spilling x78_1 to mem
mulx r13, rbp, [ rsi + 0x38 ]; x55_1, x55_0<- x43 * arg1[7] (_0*_0)
xor rdx, rdx
adox r15, rbx
adox r8, rcx
mov rdx, r14; x28 to rdx
mulx rbx, r14, r12; x65_1, x65_0<- x62 * x28 (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mulx r12, rcx, [ rsi + 0x18 ]; x73_1, x73_0<- arg2[5] * arg1[3] (_0*_0)
mov rdx, r15;
sub rdx, [ rsp - 0x8 ]
sbb r8, [ rsp - 0x10 ]
test al, al
adox rcx, [ rsp + 0xb0 ]
adox r12, [ rsp + 0xa8 ]
xchg rdx, rdi; x48, swapping with x181_0, which is currently in rdx
mov [ rsp + 0xc0 ], r8; spilling x181_1 to mem
mulx r8, r15, r11; x70_1, x70_0<- x48 * x34 (_0*_0)
adcx r9, rcx
adcx r12, [ rsp + 0xb8 ]
add r14, [ rsp + 0xa0 ]; could be done better, if r0 has been u8 as well
adcx rbx, [ rsp + 0x98 ]
xor rdx, rdx
adox r15, r14
adox rbx, r8
mov rcx, r15;
sub rcx, r9
sbb rbx, r12
mov rdx, r11; x34 to rdx
mulx r8, r11, r10; x99_1, x99_0<- x34 * x17 (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r14, r10, [ rsi + 0x0 ]; x106_1, x106_0<- arg2[1] * arg1[0] (_0*_0)
add rbp, [ rsp + 0x28 ]; could be done better, if r0 has been u8 as well
adcx r13, [ rsp + 0x20 ]
mov rdx, rcx;
shrd rdx, rbx, 0x38; lo
shr rbx, 0x38; x102_1>>=0x38
xor r15, r15
adox r11, [ rsp + 0x70 ]
adox r8, [ rsp + 0x68 ]
mov [ rsp + 0xc8 ], rdi; spilling x181_0 to mem
mov rdi, r11;
adcx rdi, [ rsp + 0x80 ]
adcx r8, [ rsp + 0x78 ]
test al, al
adox r9, rbp
adox r13, r12
mov r12, rdx; preserving value of x102_0 into a new reg
mov rdx, [ rax + 0x30 ]; saving arg2[6] in rdx.
mulx r11, rbp, [ rsi + 0x18 ]; x103_1, x103_0<- arg1[3] * arg2[6] (_0*_0)
adcx r10, rbp
adcx r11, r14
mov rdx, r10;
xor r14, r14
adox rdx, [ rsp - 0x40 ]
adox r11, [ rsp - 0x48 ]
mov r15, 0x38 ; moving imm to reg
bzhi rbp, r9, r15; x199 <- x90_0 (only least 0x38 bits)
mov r10, rdx; preserving value of x108_0 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mulx r15, r14, [ rsi + 0x8 ]; x105_1, x105_0<- arg1[1] * arg2[0] (_0*_0)
adox r14, r10
adox r11, r15
mov rdx, 0xffffffffffffff ; moving imm to reg
and rcx, rdx; lo limb and'ed
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r15, r10, [ rsi + 0x28 ]; x95_1, x95_0<- arg1[5] * arg2[4] (_0*_0)
adox r10, [ rsp + 0x18 ]
adox r15, [ rsp + 0x10 ]
shrd r9, r13, 0x38; lo
shr r13, 0x38; x97_1>>=0x38
mov rdx, r14;
test al, al
adox rdx, r10
adox r15, r11
adcx r9, rdx
adcx r15, r13
mov r10, r9;
shrd r10, r15, 0x38; lo
shr r15, 0x38; x131_1>>=0x38
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0xd0 ], rbp; spilling x199_0 to mem
mulx rbp, r13, [ rax + 0x0 ]; x138_1, x138_0<- arg1[2] * arg2[0] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp + 0xd8 ], rcx; spilling x196_0 to mem
mov [ rsp + 0xe0 ], r15; spilling x131_1 to mem
mulx r15, rcx, [ rax + 0x10 ]; x140_1, x140_0<- arg2[2] * arg1[0] (_0*_0)
mov rdx, rdi;
sub rdx, r14
sbb r8, r11
test al, al
adox r12, rdx
adox r8, rbx
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx rdi, rbx, [ rsi + 0x8 ]; x139_1, x139_0<- arg1[1] * arg2[1] (_0*_0)
adcx r13, rcx
adcx r15, rbp
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r11, r14, [ rax + 0x38 ]; x137_1, x137_0<- arg2[7] * arg1[3] (_0*_0)
add r14, r13; could be done better, if r0 has been u8 as well
adcx r15, r11
xor rdx, rdx
adox rbx, r14
adox r15, rdi
mov rbp, rbx;
adcx rbp, [ rsp + 0x50 ]
mov rcx, r15;
adcx rcx, [ rsp + 0x48 ]
mov rdi, r12;
shrd rdi, r8, 0x38; lo
shr r8, 0x38; x136_1>>=0x38
mov r13, [ rsp + 0x90 ]; load m64 x146_0 to register64
mov r11, r13;
sub r11, rbx
mov r14, [ rsp + 0x88 ]; load m64 x146_1 to register64
sbb r14, r15
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mulx rbx, r13, [ rsi + 0x20 ]; x163_1, x163_0<- arg2[7] * arg1[4] (_0*_0)
xor rdx, rdx
adox rdi, r11
adox r14, r8
mov r15, rdi;
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mulx r11, r8, [ rax + 0x20 ]; x160_1, x160_0<- arg1[7] * arg2[4] (_0*_0)
adcx r8, r13
adcx rbx, r11
shrd rdi, r14, 0x38; lo
shr r14, 0x38; x169_1>>=0x38
test al, al
adox rdi, [ rsp + 0xc8 ]
adox r14, [ rsp + 0xc0 ]
mov rdx, rdi;
shrd rdx, r14, 0x38; lo
shr r14, 0x38; x195_1>>=0x38
add r10, rbp; could be done better, if r0 has been u8 as well
adcx rcx, [ rsp + 0xe0 ]
mov rbp, rdx; preserving value of x195_0 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mulx r11, r13, [ rax + 0x28 ]; x161_1, x161_0<- arg2[5] * arg1[6] (_0*_0)
xor rdx, rdx
adox r13, r8
adox rbx, r11
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mulx r11, r8, [ rax + 0x30 ]; x162_1, x162_0<- arg1[5] * arg2[6] (_0*_0)
adcx r8, r13
adcx rbx, r11
mov rdx, r8;
test al, al
adox rdx, [ rsp - 0x8 ]
adox rbx, [ rsp - 0x10 ]
mov r13, r10;
shrd r10, rcx, 0x38; lo
shr rcx, 0x38; x164_1>>=0x38
xor r11, r11
adox r10, rdx
adox rbx, rcx
mov r8, r10;
shrd r8, rbx, 0x38; lo
shr rbx, 0x38; x194_1>>=0x38
mov rdx, r8;
test al, al
adox rdx, [ rsp + 0xd8 ]
adox rbx, r11
mov rcx, rbp;
adcx rcx, rdx
adcx rbx, r14
mov r8, rcx;
shrd r8, rbx, 0x38; lo
shr rbx, 0x38; x205_1>>=0x38
mov rdx, 0xffffffffffffff ; moving imm to reg
and r10, rdx; x189 <- x188&0xffffffffffffff
mov rbx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbx + 0x18 ], r10; out1[3] = x189
and rcx, rdx; x202 <- x201&0xffffffffffffff
and r15, rdx; x158 <- x157&0xffffffffffffff
mov [ rbx + 0x20 ], rcx; out1[4] = x202
mov r10, rbp;
adox r10, [ rsp + 0xd0 ]
adox r14, r11
mov rbp, r10;
shrd r10, r14, 0x38; lo
shr r14, 0x38; x206_1>>=0x38
and r12, rdx; x124 <- x123&0xffffffffffffff
mov [ rbx + 0x30 ], r15; out1[6] = x158
and r9, rdx; x121 <- x120&0xffffffffffffff
lea r9, [ r9 + r10 ]
mov [ rbx + 0x8 ], r9; out1[1] = x210
lea r12, [ r12 + r8 ]
mov [ rbx + 0x28 ], r12; out1[5] = x208
and rdi, rdx; x192 <- x191&0xffffffffffffff
mov [ rbx + 0x38 ], rdi; out1[7] = x192
and rbp, rdx; x204 <- x203&0xffffffffffffff
mov [ rbx + 0x0 ], rbp; out1[0] = x204
and r13, rdx; x155 <- x154&0xffffffffffffff
mov [ rbx + 0x10 ], r13; out1[2] = x155
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 360
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1739
; seed 1103379551386106 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; target mutation ratio P:50% D:50%
; time needed: 7114754 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=85, initial num_batches=31): 209248 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.029410433586319357
; number reverted permutation / tried permutation: 66976 / 90200 =74.253%
; number reverted decision / tried decision: 55326 / 89799 =61.611%
;
; === NATURAL MUTATION DISTRIBUTION ANALYSIS ===
; Study Goal: Measure inherent mutation preferences without forced ratios
; Total Evaluations: 179999 (excluding initial)
; Total Mutations: 179999
;
; NATURAL DISTRIBUTION:
;   Permutation: 90200 mutations (50.1%)
;   Decision:    89799 mutations (49.9%)
;
; FALLBACK ANALYSIS:
;   Original Intended Permutations: 90200
;   Decision→Permutation Fallbacks: 0
;   Fallback Rate: 0.0% of total mutations
;
; SUCCESS RATES (mutations kept):
;   Permutation Success: 23224/90200 (25.7%)
;   Decision Success:    34473/89799 (38.4%)
;
; KEY FINDING: Natural P/D ratio = 50.1%/49.9% for this implementation
; Time-series data: 179999 mutations recorded with timestamps