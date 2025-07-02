SECTION .text
	GLOBAL c_fiat_p448_carry_square_CryptOpt
c_fiat_p448_carry_square_CryptOpt:
sub rsp, 368
mov rax, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov r10, rax; load m64 x22 to register64
shl r10, 0x1; x22 <- arg1[1] * 0x2
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mulx r11, rax, rdx; x28_1, x28_0<- arg1[6]^2
mov rdx, 0x1 ; moving imm to reg
shlx rcx, [ rsi + 0x20 ], rdx; x13 <- arg1[4] * 0x2 (shlx does not change the flags)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r9, r8, rdx; x39_1, x39_0<- arg1[4]^2
mov rdx, [ rsi + 0x28 ]; load m64 arg1[5] to register64
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
lea rbx, [rdx + rdx]; x10 <- arg1[5] * 2 
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, rbx; x43_1, x43_0<- arg1[3] * x10 (_0*_0)
xor rdx, rdx
adox r8, rbp
adox r12, r9
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbp, r9, rbx; x38_1, x38_0<- arg1[4] * x10 (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, rdx; x54_1, x54_0<- arg1[2]^2
mov rdx, rbx; x10 to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, rbx, [ rsi + 0x10 ]; x50_1, x50_0<- arg1[2] * x10 (_0*_0)
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov rdi, [ rsi + 0x18 ]; load m64 arg1[3] to register64
mov [ rsp - 0x48 ], r10; spilling x22 to mem
lea r10, [rdi + rdi]; x16 <- arg1[3] * 2 
mov rdi, rdx; preserving value of x10 into a new reg
mov rdx, [ rsi + 0x28 ]; saving arg1[5] in rdx.
mov [ rsp - 0x40 ], rbp; spilling x38_1 to mem
mov [ rsp - 0x38 ], r9; spilling x38_0 to mem
mulx r9, rbp, rdx; x33_1, x33_0<- arg1[5]^2
imul rdx, [ rsi + 0x38 ], 0x2; x4 <- arg1[7] * 0x2
mov [ rsp - 0x30 ], r10; spilling x16 to mem
mov [ rsp - 0x28 ], r14; spilling x54_1 to mem
mulx r14, r10, [ rsi + 0x28 ]; x30_1, x30_0<- arg1[5] * x4 (_0*_0)
mov [ rsp - 0x20 ], r13; spilling x54_0 to mem
mov r13, 0x1 ; moving imm to reg
mov [ rsp - 0x18 ], r12; spilling x94_1 to mem
shlx r12, [ rsi + 0x30 ], r13; x7 <- arg1[6] * 0x2 (shlx does not change the flags)
test al, al
adox rax, r10
adox r14, r11
xchg rdx, r12; x7, swapping with x4, which is currently in rdx
mulx r10, r11, [ rsi + 0x28 ]; x32_1, x32_0<- arg1[5] * x7 (_0*_0)
mov r13, rdx; preserving value of x7 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mov [ rsp - 0x10 ], r8; spilling x94_0 to mem
mov [ rsp - 0x8 ], r14; spilling x87_1 to mem
mulx r14, r8, r12; x35_1, x35_0<- arg1[4] * x4 (_0*_0)
adcx r11, r8
adcx r14, r10
mov rdx, r12; x4 to rdx
mulx r10, r12, [ rsi + 0x30 ]; x27_1, x27_0<- arg1[6] * x4 (_0*_0)
xchg rdx, rcx; x13, swapping with x4, which is currently in rdx
mov [ rsp + 0x0 ], r10; spilling x27_1 to mem
mulx r10, r8, [ rsi + 0x18 ]; x45_1, x45_0<- arg1[3] * x13 (_0*_0)
mov [ rsp + 0x8 ], r12; spilling x27_0 to mem
mov r12, r11;
mov [ rsp + 0x10 ], rax; spilling x87_0 to mem
xor rax, rax
adox r12, r8
adox r10, r14
adcx rbx, r12
adcx r10, r15
mov r15, rdx; preserving value of x13 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx r12, r8, r13; x36_1, x36_0<- arg1[4] * x7 (_0*_0)
test al, al
adox rbp, r8
adox r12, r9
mov rdx, rcx; x4 to rdx
mulx r9, rcx, [ rsi + 0x18 ]; x41_1, x41_0<- arg1[3] * x4 (_0*_0)
adcx rbp, rcx
adcx r9, r12
mov r8, rdx; preserving value of x4 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx rcx, r12, r13; x57_1, x57_0<- arg1[1] * x7 (_0*_0)
test al, al
adox r12, rbx
adox r10, rcx
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rcx, rbx, r8; x66_1, x66_0<- arg1[0] * x4 (_0*_0)
adcx rbx, r12
adcx r10, rcx
mov rdx, 0x2 ; moving imm to reg
mov r12, [ rsp + 0x10 ]; load m64 x87_0 to register64
mov rcx, [ rsp - 0x8 ]; load m64 x87_1 to register64
mov [ rsp + 0x18 ], r9; spilling x133_1 to mem
mov [ rsp + 0x20 ], rbp; spilling x133_0 to mem
mulx rbp, rax, rcx; __,tmp <- (a_0 in rdx) * b_hi
mulx rbp, r9, r12; hi,lo <- (a_0 in rdx) * b_lo
lea rbp, [rbp+rax]; hi += tmp
xor rax, rax
adox r9, [ rsp - 0x10 ]
adox rbp, [ rsp - 0x18 ]
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x28 ], r10; spilling x84_1 to mem
mulx r10, rax, r13; x49_1, x49_0<- arg1[2] * x7 (_0*_0)
mov rdx, rax;
adcx rdx, r9
adcx rbp, r10
mov r9, rbx;
mov [ rsp + 0x30 ], r9; spilling x90 to mem
mov r9, rdx;
mov [ rsp + 0x38 ], rbx; spilling x84_0 to mem
xor rbx, rbx
adox r9, [ rsp - 0x20 ]
adox rbp, [ rsp - 0x28 ]
adcx r12, [ rsp - 0x10 ]
adcx rcx, [ rsp - 0x18 ]
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp + 0x40 ], rbp; spilling x97_1 to mem
mulx rbp, rbx, rdx; x24_1, x24_0<- arg1[7]^2
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0x48 ], r9; spilling x97_0 to mem
mov [ rsp + 0x50 ], rcx; spilling x107_1 to mem
mov [ rsp + 0x58 ], r12; spilling x107_0 to mem
mulx r12, r9, rbp; __,tmp <- (a_0 in rdx) * b_hi
mulx r12, rcx, rbx; hi,lo <- (a_0 in rdx) * b_lo
lea r12, [r12+r9]; hi += tmp
xor r9, r9
adox rcx, [ rsp + 0x20 ]
adox r12, [ rsp + 0x18 ]
adcx rbx, [ rsp + 0x20 ]
adcx rbp, [ rsp + 0x18 ]
test al, al
adox rax, [ rsp + 0x58 ]
adox r10, [ rsp + 0x50 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x60 ], r12; spilling x134_1 to mem
mulx r12, r9, r8; x56_1, x56_0<- arg1[1] * x4 (_0*_0)
mov rdx, r9;
adcx rdx, rax
adcx r10, r12
add r9, [ rsp + 0x48 ]; could be done better, if r0 has been u8 as well
adcx r12, [ rsp + 0x40 ]
mov rax, [ rsp + 0x28 ];
mov [ rsp + 0x68 ], rcx; spilling x134_0 to mem
mov rcx, [ rsp + 0x38 ];
shrd rcx, rax, 0x38; lo
shr rax, 0x38; x89_1>>=0x38
mov rax, rdx; preserving value of x109_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mov [ rsp + 0x70 ], rbp; spilling x145_1 to mem
mov [ rsp + 0x78 ], rbx; spilling x145_0 to mem
mulx rbx, rbp, rdx; x74_1, x74_0<- arg1[0]^2
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rcx, rdx; lo limb and'ed
adox rbp, rax
adox r10, rbx
mov rax, rcx;
adcx rax, rbp
adc r10, 0x0; add CF to r0's alloc
mov rbx, rax;
shrd rbx, r10, 0x38; lo
shr r10, 0x38; x120_1>>=0x38
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r10, rbp, [ rsp - 0x30 ]; x70_1, x70_0<- arg1[0] * x16 (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x80 ], rbx; spilling x120_0 to mem
mov [ rsp + 0x88 ], r12; spilling x98_1 to mem
mulx r12, rbx, r13; x42_1, x42_0<- arg1[3] * x7 (_0*_0)
mov rdx, [ rsi + 0x10 ]; load m64 arg1[2] to register64
mov [ rsp + 0x90 ], r9; spilling x98_0 to mem
lea r9, [rdx + rdx]; x19 <- arg1[2] * 2 
mov rdx, rbx;
mov [ rsp + 0x98 ], rdi; spilling x10 to mem
xor rdi, rdi
adox rdx, [ rsp - 0x38 ]
adox r12, [ rsp - 0x40 ]
mov rbx, rdx; preserving value of x113_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp + 0xa0 ], r12; spilling x113_1 to mem
mulx r12, rdi, r8; x48_1, x48_0<- arg1[2] * x4 (_0*_0)
mov rdx, r9; x19 to rdx
mulx r8, r9, [ rsi + 0x8 ]; x62_1, x62_0<- arg1[1] * x19 (_0*_0)
adcx r11, r9
adcx r8, r14
add rbp, r11; could be done better, if r0 has been u8 as well
adcx r8, r10
mulx r10, r14, [ rsi + 0x0 ]; x71_1, x71_0<- arg1[0] * x19 (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov r9, [ rsp + 0x8 ]; load m64 x27_0 to register64
mov r11, [ rsp + 0x0 ]; load m64 x27_1 to register64
mov [ rsp + 0xa8 ], r10; spilling x71_1 to mem
mov [ rsp + 0xb0 ], r14; spilling x71_0 to mem
mov [ rsp + 0xb8 ], r8; spilling x77_1 to mem
mulx r8, r10, r11; __,tmp <- (a_0 in rdx) * b_hi
mulx r8, r14, r9; hi,lo <- (a_0 in rdx) * b_lo
lea r8, [r8+r10]; hi += tmp
test al, al
adox rbx, rdi
adox r12, [ rsp + 0xa0 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, r10, [ rsp - 0x30 ]; x60_1, x60_0<- arg1[1] * x16 (_0*_0)
adcx r14, rbx
mov rdx, r12;
adcx rdx, r8
xor r8, r8
adox r9, rbx
adox r12, r11
adcx r10, [ rsp + 0x90 ]
adcx rdi, [ rsp + 0x88 ]
mov r11, [ rsp + 0xb8 ];
mov rbx, rbp;
shrd rbx, r11, 0x38; lo
shr r11, 0x38; x78_1>>=0x38
mov r8, 0xffffffffffffffff ; moving imm to reg
and rbx, r8; lo limb and'ed
mov r11, rdx; preserving value of x115_1 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mov [ rsp + 0xc0 ], r14; spilling x115_0 to mem
mulx r14, r8, r15; x69_1, x69_0<- arg1[0] * x13 (_0*_0)
adox r8, r10
adox rdi, r14
adcx rbx, r8
adc rdi, 0x0; add CF to r0's alloc
mov rdx, [ rsp - 0x48 ]; x22 to rdx
mulx r14, r10, [ rsi + 0x0 ]; x73_1, x73_0<- arg1[0] * x22 (_0*_0)
add rcx, rbx; could be done better, if r0 has been u8 as well
adc rdi, 0x0; add CF to r0's alloc
add r10, r9; could be done better, if r0 has been u8 as well
adcx r12, r14
mov rdx, rcx;
mov r9, 0x40 ; moving imm to reg
bzhi r8, [ rsp + 0x80 ], r9; x123 <- x120_0 (only least 0x40 bits)
mov rbx, rdx; preserving value of x104 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r9, r14, rdx; x63_1, x63_0<- arg1[1]^2
adox r8, r10
mov rdx, 0x0 ; moving imm to reg
adox r12, rdx
shrd rcx, rdi, 0x38; lo
shr rdi, 0x38; x103_1>>=0x38
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, r10, r15; x59_1, x59_0<- arg1[1] * x13 (_0*_0)
xor rdx, rdx
adox r14, [ rsp + 0x78 ]
adox r9, [ rsp + 0x70 ]
mov rdx, r8;
mov [ rsp + 0xc8 ], rdx; spilling x141 to mem
mov rdx, 0xffffffffffffff ; moving imm to reg
and rbx, rdx; x105 <- x104&0xffffffffffffff
shrd r8, r12, 0x38; lo
shr r12, 0x38; x140_1>>=0x38
mov r12, r14;
add r12, [ rsp + 0xb0 ]; could be done better, if r0 has been u8 as well
adcx r9, [ rsp + 0xa8 ]
mov r14, 0xffffffffffffffff ; moving imm to reg
and r8, r14; lo limb and'ed
adox r8, r12
mov rdx, 0x0 ; moving imm to reg
adox r9, rdx
mov r12, r8;
shrd r12, r9, 0x38; lo
shr r9, 0x38; x154_1>>=0x38
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r14, r9, rdx; x46_1, x46_0<- arg1[3]^2
test al, al
adox r9, [ rsp + 0x68 ]
adox r14, [ rsp + 0x60 ]
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0xd0 ], rbx; spilling x105 to mem
mov [ rsp + 0xd8 ], r12; spilling x155 to mem
mulx r12, rbx, r15; x51_1, x51_0<- arg1[2] * x13 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp + 0xe0 ], r12; spilling x51_1 to mem
mulx r12, r15, r13; x67_1, x67_0<- arg1[0] * x7 (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0xe8 ], r12; spilling x67_1 to mem
mulx r12, r13, [ rsp - 0x30 ]; x53_1, x53_0<- arg1[2] * x16 (_0*_0)
adcx r13, [ rsp + 0xc0 ]
adcx r11, r12
xor rdx, rdx
adox r10, r13
adox r11, rdi
mov rdi, 0xffffffffffffffff ; moving imm to reg
and rcx, rdi; lo limb and'ed
mov rdx, [ rsp + 0x98 ]; x10 to rdx
mulx r13, r12, [ rsi + 0x8 ]; x58_1, x58_0<- arg1[1] * x10 (_0*_0)
adox rbx, r9
adox r14, [ rsp + 0xe0 ]
adcx r12, rbx
adcx r14, r13
mulx r13, r9, [ rsi + 0x0 ]; x68_1, x68_0<- arg1[0] * x10 (_0*_0)
test al, al
adox r9, r10
adox r11, r13
adcx rcx, r9
adc r11, 0x0; add CF to r0's alloc
mov rdx, rcx;
shrd rdx, r11, 0x38; lo
shr r11, 0x38; x128_1>>=0x38
and rdx, rdi; lo limb and'ed
mov r10, 0x38 ; moving imm to reg
bzhi rbx, [ rsp + 0x30 ], r10; x91 <- x90 (only least 0x38 bits)
bzhi r13, rbp, r10; x80 <- x79 (only least 0x38 bits)
adox r15, r12
adox r14, [ rsp + 0xe8 ]
add rdx, r15; could be done better, if r0 has been u8 as well
adc r14, 0x0; add CF to r0's alloc
mov rbp, rdx;
bzhi r12, rcx, r10; x130 <- x129 (only least 0x38 bits)
shrd rdx, r14, 0x38; lo
shr r14, 0x38; x149_1>>=0x38
bzhi r9, rbp, r10; x152 <- x151 (only least 0x38 bits)
lea rbx, [ rbx + rdx ]
mov r11, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r11 + 0x30 ], r9; out1[6] = x152
bzhi rcx, rax, r10; x122 <- x121 (only least 0x38 bits)
mov rax, rbx;
shr rax, 0x38; x159 <- x153>> 0x38
add r13, [ rsp + 0xd8 ]
mov r15, rax;
lea r15, [ r15 + rcx ]
bzhi rbp, rbx, r10; x160 <- x153 (only least 0x38 bits)
mov r14, r13;
shr r14, 0x38; x161 <- x158>> 0x38
mov [ r11 + 0x38 ], rbp; out1[7] = x160
bzhi r9, [ rsp + 0xc8 ], r10; x142 <- x141 (only least 0x38 bits)
add r14, [ rsp + 0xd0 ]
lea r14, [ r14 + rax ]
mov rdx, r15;
shr rdx, 0x38; x169 <- x163>> 0x38
bzhi rbx, r14, r10; x167 <- x165 (only least 0x38 bits)
mov [ r11 + 0x20 ], rbx; out1[4] = x167
shr r14, 0x38; x166 <- x165>> 0x38
lea r14, [ r14 + r12 ]
bzhi r12, r15, r10; x170 <- x163 (only least 0x38 bits)
bzhi rcx, r13, r10; x162 <- x158 (only least 0x38 bits)
mov [ r11 + 0x18 ], rcx; out1[3] = x162
lea rdx, [ rdx + r9 ]
mov [ r11 + 0x8 ], rdx; out1[1] = x171
bzhi rax, r8, r10; x157 <- x156 (only least 0x38 bits)
mov [ r11 + 0x28 ], r14; out1[5] = x168
mov [ r11 + 0x0 ], r12; out1[0] = x170
mov [ r11 + 0x10 ], rax; out1[2] = x157
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 368
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0853
; seed 0561339935862671 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 3031031 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=180, initial num_batches=31): 139178 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.045917709188721595
; number reverted permutation / tried permutation: 69690 / 89955 =77.472%
; number reverted decision / tried decision: 65102 / 90044 =72.300%