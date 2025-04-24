SECTION .text
	GLOBAL fiat_c_p448_solinas_carry_square_CryptOpt
fiat_c_p448_solinas_carry_square_CryptOpt:
sub rsp, 480
imul rax, [ rsi + 0x18 ], 0x2; x16 <- arg1[3] * 0x2
mov r10, 0x1 ; moving imm to reg
shlx r11, [ rsi + 0x38 ], r10; x4 <- arg1[7] * 0x2 (shlx does not change the flags)
imul rdx, [ rsi + 0x30 ], 0x2; x7 <- arg1[6] * 0x2
mov rcx, rdx; preserving value of x7 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r9, r8, r11; x48_1, x48_0<- arg1[2] * x4 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r10, rdx; x74_1, x74_0<- arg1[0]^2
mov rdx, rax; x16 to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rax, [ rsi + 0x0 ]; x70_1, x70_0<- arg1[0] * x16 (_0*_0)
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
imul r12, [ rsi + 0x10 ], 0x2; x19 <- arg1[2] * 0x2
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov r13, rdx; preserving value of x16 into a new reg
mov rdx, [ rsi + 0x28 ]; saving arg1[5] in rdx.
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, rcx; x32_1, x32_0<- arg1[5] * x7 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], rbx; spilling x74_1 to mem
mulx rbx, rdi, r12; x62_1, x62_0<- arg1[1] * x19 (_0*_0)
imul rdx, [ rsi + 0x28 ], 0x2; x10 <- arg1[5] * 0x2
mov [ rsp - 0x40 ], r10; spilling x74_0 to mem
mov r10, [ rsi + 0x20 ]; load m64 arg1[4] to register64
mov [ rsp - 0x38 ], rbp; spilling x70_1 to mem
mov rbp, r10; load m64 x13 to register64
shl rbp, 0x1; x13 <- arg1[4] * 0x2
mov [ rsp - 0x30 ], rax; spilling x70_0 to mem
mulx rax, r10, [ rsi + 0x10 ]; x50_1, x50_0<- arg1[2] * x10 (_0*_0)
mov [ rsp - 0x28 ], rbx; spilling x62_1 to mem
mov [ rsp - 0x20 ], rdi; spilling x62_0 to mem
mulx rdi, rbx, [ rsi + 0x18 ]; x43_1, x43_0<- arg1[3] * x10 (_0*_0)
mov [ rsp - 0x18 ], rax; spilling x50_1 to mem
mov rax, rdx; preserving value of x10 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp - 0x10 ], r10; spilling x50_0 to mem
mov [ rsp - 0x8 ], rbp; spilling x13 to mem
mulx rbp, r10, rcx; x49_1, x49_0<- arg1[2] * x7 (_0*_0)
mov rdx, r11; x4 to rdx
mov [ rsp + 0x0 ], rbp; spilling x49_1 to mem
mulx rbp, r11, [ rsi + 0x0 ]; x66_1, x66_0<- arg1[0] * x4 (_0*_0)
mov [ rsp + 0x8 ], rbp; spilling x66_1 to mem
mov rbp, rdx; preserving value of x4 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mov [ rsp + 0x10 ], r11; spilling x66_0 to mem
mov [ rsp + 0x18 ], r10; spilling x49_0 to mem
mulx r10, r11, rdx; x28_1, x28_0<- arg1[6]^2
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x20 ], r9; spilling x48_1 to mem
mov [ rsp + 0x28 ], r8; spilling x48_0 to mem
mulx r8, r9, rbp; x56_1, x56_0<- arg1[1] * x4 (_0*_0)
mov rdx, rbp; x4 to rdx
mov [ rsp + 0x30 ], r8; spilling x56_1 to mem
mulx r8, rbp, [ rsi + 0x18 ]; x41_1, x41_0<- arg1[3] * x4 (_0*_0)
mov [ rsp + 0x38 ], r8; spilling x41_1 to mem
mov [ rsp + 0x40 ], rbp; spilling x41_0 to mem
mulx rbp, r8, [ rsi + 0x28 ]; x30_1, x30_0<- arg1[5] * x4 (_0*_0)
mov [ rsp + 0x48 ], r9; spilling x56_0 to mem
xor r9, r9
adox r11, r8
adox rbp, r10
mulx r8, r10, [ rsi + 0x20 ]; x35_1, x35_0<- arg1[4] * x4 (_0*_0)
mov r9, rdx; preserving value of x4 into a new reg
mov rdx, [ rsi + 0x28 ]; saving arg1[5] in rdx.
mov [ rsp + 0x50 ], rbp; spilling x87_1 to mem
mov [ rsp + 0x58 ], r11; spilling x87_0 to mem
mulx r11, rbp, rdx; x33_1, x33_0<- arg1[5]^2
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0x60 ], r15; spilling x32_1 to mem
mov [ rsp + 0x68 ], r14; spilling x32_0 to mem
mulx r14, r15, rcx; x36_1, x36_0<- arg1[4] * x7 (_0*_0)
adcx rbp, r15
adcx r14, r11
mov rdx, rcx; x7 to rdx
mulx r11, rcx, [ rsi + 0x18 ]; x42_1, x42_0<- arg1[3] * x7 (_0*_0)
mov r15, rdx; preserving value of x7 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mov [ rsp + 0x70 ], r14; spilling x132_1 to mem
mov [ rsp + 0x78 ], rbp; spilling x132_0 to mem
mulx rbp, r14, rax; x38_1, x38_0<- arg1[4] * x10 (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0x80 ], r8; spilling x35_1 to mem
mov [ rsp + 0x88 ], r10; spilling x35_0 to mem
mulx r10, r8, rdx; x39_1, x39_0<- arg1[4]^2
xor rdx, rdx
adox r8, rbx
adox rdi, r10
adcx r14, rcx
adcx r11, rbp
mov rbx, [ rsp + 0x68 ]; load m64 x32_0 to register64
add rbx, [ rsp + 0x88 ]; could be done better, if r0 has been u8 as well
mov rcx, [ rsp + 0x60 ]; load m64 x32_1 to register64
adcx rcx, [ rsp + 0x80 ]
test al, al
adox r14, [ rsp + 0x28 ]
adox r11, [ rsp + 0x20 ]
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r10, rbp, [ rsp - 0x8 ]; x45_1, x45_0<- arg1[3] * x13 (_0*_0)
mov rdx, rbx;
adcx rdx, rbp
adcx r10, rcx
mov rbp, rdx;
mov [ rsp + 0x90 ], r13; spilling x16 to mem
xor r13, r13
adox rbp, [ rsp - 0x10 ]
adox r10, [ rsp - 0x18 ]
mov rdx, r15; x7 to rdx
mulx r13, r15, [ rsi + 0x0 ]; x67_1, x67_0<- arg1[0] * x7 (_0*_0)
mov [ rsp + 0x98 ], r13; spilling x67_1 to mem
mov r13, 0x2 ; moving imm to reg
mov [ rsp + 0xa0 ], r15; spilling x67_0 to mem
mov r15, [ rsp + 0x58 ]; load m64 x87_0 to register64
mov [ rsp + 0xa8 ], r11; spilling x114_1 to mem
mov r11, [ rsp + 0x50 ]; load m64 x87_1 to register64
xchg rdx, r13; 0x2, swapping with x7, which is currently in rdx
mov [ rsp + 0xb0 ], r14; spilling x114_0 to mem
mov [ rsp + 0xb8 ], rdi; spilling x94_1 to mem
mov [ rsp + 0xc0 ], r8; spilling x94_0 to mem
mulx r8, r14, r11; __,tmp <- (a_0 in rdx) * b_hi
mulx r8, rdi, r15; hi,lo <- (a_0 in rdx) * b_lo
lea r8, [r8+r14]; hi += tmp
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0xc8 ], r8; spilling x93_1 to mem
mulx r8, r14, r13; x57_1, x57_0<- arg1[1] * x7 (_0*_0)
adcx r14, rbp
adcx r10, r8
xor rdx, rdx
adox rbx, [ rsp - 0x20 ]
adox rcx, [ rsp - 0x28 ]
adcx rdi, [ rsp + 0xc0 ]
mov r13, [ rsp + 0xc8 ]; load m64 x93_1 to register64
adcx r13, [ rsp + 0xb8 ]
mov rbp, rdi;
add rbp, [ rsp + 0x18 ]; could be done better, if r0 has been u8 as well
adcx r13, [ rsp + 0x0 ]
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rdi, r8, rdx; x54_1, x54_0<- arg1[2]^2
mov rdx, r14;
test al, al
adox rdx, [ rsp + 0x10 ]
adox r10, [ rsp + 0x8 ]
adcx r15, [ rsp + 0xc0 ]
adcx r11, [ rsp + 0xb8 ]
test al, al
adox r8, rbp
adox r13, rdi
mov r14, r15;
adcx r14, [ rsp + 0x18 ]
adcx r11, [ rsp + 0x0 ]
mov rbp, rbx;
add rbp, [ rsp - 0x30 ]; could be done better, if r0 has been u8 as well
adcx rcx, [ rsp - 0x38 ]
mov rbx, rbp;
shrd rbp, rcx, 0x38; lo
shr rcx, 0x38; x78_1>>=0x38
mov rdi, r14;
test al, al
adox rdi, [ rsp + 0x48 ]
adox r11, [ rsp + 0x30 ]
mov r15, rdx; preserving value of x84_0 into a new reg
mov rdx, [ rsi + 0x38 ]; saving arg1[7] in rdx.
mulx rcx, r14, rdx; x24_1, x24_0<- arg1[7]^2
mov rdx, rdi;
adcx rdx, [ rsp - 0x40 ]
adcx r11, [ rsp - 0x48 ]
mov rdi, 0xffffffffffffff ; moving imm to reg
and rbx, rdi; x80 <- x79&0xffffffffffffff
mov rdi, rdx; preserving value of x110_0 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mov [ rsp + 0xd0 ], rbx; spilling x80 to mem
mov [ rsp + 0xd8 ], r12; spilling x19 to mem
mulx r12, rbx, r9; x27_1, x27_0<- arg1[6] * x4 (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0xe0 ], r11; spilling x110_1 to mem
mov [ rsp + 0xe8 ], rdi; spilling x110_0 to mem
mulx rdi, r9, r12; __,tmp <- (a_0 in rdx) * b_hi
mulx rdi, r11, rbx; hi,lo <- (a_0 in rdx) * b_lo
lea rdi, [rdi+r9]; hi += tmp
adox rbx, [ rsp + 0xb0 ]
adox r12, [ rsp + 0xa8 ]
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp + 0xf0 ], rbp; spilling x78_0 to mem
mulx rbp, r9, [ rsp - 0x8 ]; x69_1, x69_0<- arg1[0] * x13 (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0xf8 ], rbp; spilling x69_1 to mem
mov [ rsp + 0x100 ], r9; spilling x69_0 to mem
mov [ rsp + 0x108 ], r13; spilling x97_1 to mem
mulx r13, rbp, rcx; __,tmp <- (a_0 in rdx) * b_hi
mulx r13, r9, r14; hi,lo <- (a_0 in rdx) * b_lo
lea r13, [r13+rbp]; hi += tmp
mov rbp, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov [ rsp + 0x110 ], r13; spilling x85_1 to mem
lea r13, [rbp + rbp]; x22 <- arg1[1] * 2 
adcx r11, [ rsp + 0xb0 ]
adcx rdi, [ rsp + 0xa8 ]
mov rdx, r13; x22 to rdx
mulx r13, rbp, [ rsi + 0x0 ]; x73_1, x73_0<- arg1[0] * x22 (_0*_0)
xor rdx, rdx
adox rbp, rbx
adox r12, r13
mov rbx, r15;
shrd rbx, r10, 0x38; lo
shr r10, 0x38; x89_1>>=0x38
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r10, r13, [ rsp - 0x8 ]; x59_1, x59_0<- arg1[1] * x13 (_0*_0)
mov rdx, [ rsp + 0x90 ]; x16 to rdx
mov [ rsp + 0x118 ], r12; spilling x126_1 to mem
mov [ rsp + 0x120 ], rbp; spilling x126_0 to mem
mulx rbp, r12, [ rsi + 0x8 ]; x60_1, x60_0<- arg1[1] * x16 (_0*_0)
mov [ rsp + 0x128 ], r10; spilling x59_1 to mem
mov r10, [ rsp + 0x78 ]; load m64 x132_0 to register64
add r10, [ rsp + 0x40 ]; could be done better, if r0 has been u8 as well
mov [ rsp + 0x130 ], r13; spilling x59_0 to mem
mov r13, [ rsp + 0x70 ]; load m64 x132_1 to register64
adcx r13, [ rsp + 0x38 ]
mov [ rsp + 0x138 ], rdi; spilling x115_1 to mem
xor rdi, rdi
adox r14, r10
mov [ rsp + 0x140 ], r11; spilling x115_0 to mem
mov r11, r13;
adox r11, rcx
mov rcx, r8;
adcx rcx, [ rsp + 0x48 ]
mov [ rsp + 0x148 ], r11; spilling x145_1 to mem
mov r11, [ rsp + 0x108 ]; load m64 x97_1 to register64
adcx r11, [ rsp + 0x30 ]
test al, al
adox r12, rcx
adox r11, rbp
mov r8, r12;
adcx r8, [ rsp + 0x100 ]
adcx r11, [ rsp + 0xf8 ]
mov rbp, 0x40 ; moving imm to reg
bzhi rcx, [ rsp + 0xf0 ], rbp; x88 <- x78_0 (only least 0x40 bits)
adox rcx, r8
adox r11, rdi
bzhi r12, rbx, rbp; x92 <- x89_0 (only least 0x40 bits)
mov rbx, r12;
adox rbx, rcx
adox r11, rdi
mov r8, rbx;
shrd r8, r11, 0x38; lo
shr r11, 0x38; x103_1>>=0x38
mov rcx, rdx; preserving value of x16 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mulx rdi, r11, rdx; x46_1, x46_0<- arg1[3]^2
test al, al
adox r12, [ rsp + 0xe8 ]
mov rdx, [ rsp + 0xe0 ];
mov rbp, 0x0 ; moving imm to reg
adox rdx, rbp
mov rbp, 0xffffffffffffff ; moving imm to reg
and r15, rbp; x91 <- x90&0xffffffffffffff
adox r9, r10
adox r13, [ rsp + 0x110 ]
adcx r11, r9
adcx r13, rdi
mov r10, rdx; preserving value of x111_1 into a new reg
mov rdx, [ rsp - 0x8 ]; saving x13 in rdx.
mulx r9, rdi, [ rsi + 0x10 ]; x51_1, x51_0<- arg1[2] * x13 (_0*_0)
mov rdx, r12;
mov rbp, rdx; preserving value of x121 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp + 0x150 ], rbx; spilling x104 to mem
mov [ rsp + 0x158 ], r14; spilling x145_0 to mem
mulx r14, rbx, rcx; x53_1, x53_0<- arg1[2] * x16 (_0*_0)
xor rdx, rdx
adox rdi, r11
adox r13, r9
adcx rbx, [ rsp + 0x140 ]
adcx r14, [ rsp + 0x138 ]
mov rcx, rbx;
xor r11, r11
adox rcx, [ rsp + 0x130 ]
adox r14, [ rsp + 0x128 ]
mov rdx, 0x40 ; moving imm to reg
bzhi r9, r8, rdx; x112 <- x103_0 (only least 0x40 bits)
mov rdx, rax; x10 to rdx
mulx r8, rax, [ rsi + 0x0 ]; x68_1, x68_0<- arg1[0] * x10 (_0*_0)
adox rax, rcx
adox r14, r8
xor rbx, rbx
adox r9, rax
adox r14, rbx
mov r11, r9;
shrd r11, r14, 0x38; lo
shr r14, 0x38; x128_1>>=0x38
shrd r12, r10, 0x38; lo
shr r10, 0x38; x120_1>>=0x38
mov rcx, 0x40 ; moving imm to reg
bzhi r8, r11, rcx; x131 <- x128_0 (only least 0x40 bits)
bzhi rax, r12, rcx; x123 <- x120_0 (only least 0x40 bits)
adox rax, [ rsp + 0x120 ]
mov r14, [ rsp + 0x118 ];
adox r14, rbx
mulx r10, r11, [ rsi + 0x8 ]; x58_1, x58_0<- arg1[1] * x10 (_0*_0)
add r11, rdi; could be done better, if r0 has been u8 as well
adcx r13, r10
mov rdx, r11;
xor rdi, rdi
adox rdx, [ rsp + 0xa0 ]
adox r13, [ rsp + 0x98 ]
adcx r8, rdx
adc r13, 0x0; add CF to r0's alloc
mov rbx, r8;
shrd rbx, r13, 0x38; lo
shr r13, 0x38; x149_1>>=0x38
lea r15, [ r15 + rbx ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r10, r12, rdx; x63_1, x63_0<- arg1[1]^2
mov rdx, 0xffffffffffffff ; moving imm to reg
and r8, rdx; x152 <- x151&0xffffffffffffff
mov r11, rax;
shrd r11, r14, 0x38; lo
shr r14, 0x38; x140_1>>=0x38
and rbp, rdx; x122 <- x121&0xffffffffffffff
mov r13, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r13 + 0x30 ], r8; out1[6] = x152
adox r12, [ rsp + 0x158 ]
adox r10, [ rsp + 0x148 ]
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r8, rbx, [ rsp + 0xd8 ]; x71_1, x71_0<- arg1[0] * x19 (_0*_0)
adcx rbx, r12
adcx r10, r8
bzhi rdx, r11, rcx; x143 <- x140_0 (only least 0x40 bits)
adox rdx, rbx
adox r10, rdi
mov r14, rdx;
shrd r14, r10, 0x38; lo
shr r10, 0x38; x154_1>>=0x38
add r14, [ rsp + 0xd0 ]
mov r11, 0xffffffffffffff ; moving imm to reg
and rdx, r11; x157 <- x156&0xffffffffffffff
mov r12, r15;
shr r12, 0x38; x159 <- x153>> 0x38
mov r8, r12;
lea r8, [ r8 + rbp ]
mov rbp, [ rsp + 0x150 ];
and rbp, r11; x105 <- x104&0xffffffffffffff
mov rbx, r14;
shr rbx, 0x38; x161 <- x158>> 0x38
lea rbx, [ rbx + rbp ]
lea rbx, [ rbx + r12 ]
and r9, r11; x130 <- x129&0xffffffffffffff
mov r10, rbx;
and r10, r11; x167 <- x165&0xffffffffffffff
mov r12, r8;
shr r12, 0x38; x169 <- x163>> 0x38
and rax, r11; x142 <- x141&0xffffffffffffff
lea r12, [ r12 + rax ]
shr rbx, 0x38; x166 <- x165>> 0x38
lea rbx, [ rbx + r9 ]
mov [ r13 + 0x10 ], rdx; out1[2] = x157
and r14, r11; x162 <- x158&0xffffffffffffff
mov [ r13 + 0x28 ], rbx; out1[5] = x168
and r8, r11; x170 <- x163&0xffffffffffffff
mov [ r13 + 0x20 ], r10; out1[4] = x167
and r15, r11; x160 <- x153&0xffffffffffffff
mov [ r13 + 0x38 ], r15; out1[7] = x160
mov [ r13 + 0x18 ], r14; out1[3] = x162
mov [ r13 + 0x0 ], r8; out1[0] = x170
mov [ r13 + 0x8 ], r12; out1[1] = x171
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 480
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0358
; seed 1954309857151120 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1386581 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=182, initial num_batches=31): 63167 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.04555593939337118
; number reverted permutation / tried permutation: 31647 / 39857 =79.401%
; number reverted decision / tried decision: 29417 / 40142 =73.282%