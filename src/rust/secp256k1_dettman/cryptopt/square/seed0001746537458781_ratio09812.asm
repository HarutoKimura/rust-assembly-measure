SECTION .text
	GLOBAL rust_fiat_secp256k1_dettman_square_CryptOpt
rust_fiat_secp256k1_dettman_square_CryptOpt:
imul rax, [ rsi + 0x10 ], 0x2; x7 <- arg1[2] * 0x2
mov r10, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov r11, r10; load m64 x10 to register64
shl r11, 0x1; x10 <- arg1[1] * 0x2
mov r10, [ rsi + 0x0 ]; load m64 arg1[0] to register64
lea rdx, [r10 + r10]; x12 <- arg1[0] * 2 
mov r10, rdx; preserving value of x12 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r8, rcx, r11; x23_1, x23_0<- x10 * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, r10; x20_1, x20_0<- x12 * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, rdx; x16_1, x16_0<- arg1[4]^2
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, r11; x43_1, x43_0<- arg1[4] * x10 (_0*_0)
mov rdx, r11; x10 to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r11, [ rsi + 0x18 ]; x33_1, x33_0<- x10 * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], r14; spilling x43_1 to mem
mulx r14, rdi, rdx; x34_1, x34_0<- arg1[2]^2
mov rdx, 0xfffffffffffffffd ; moving imm to reg
and rbp, rdx; lo limb and'ed
adox rcx, r9
adox rbx, r8
mov r8, 0x1000003d10 ; moving imm to reg
mov rdx, rbp; x25_0 to rdx
mulx r9, rbp, r8; x26_1, x26_0<- x25 * 0x1000003d10 (_0*_0)
adcx rbp, rcx
adcx rbx, r9
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r9, rcx, r10; x32_1, x32_0<- x12 * arg1[4] (_0*_0)
xor rdx, rdx
adox rdi, r11
adox r15, r14
adcx rcx, rdi
adcx r15, r9
mov r11, rbp;
shrd rbp, rbx, 0x34; lo
shr rbx, 0x34; x28_1>>=0x34
mov r14, 0xffffffffffffffff ; moving imm to reg
and rbp, r14; lo limb and'ed
mov r9, 0x1000003d10000 ; moving imm to reg
mov rdx, r12; x17 to rdx
mulx rdi, r12, r9; x37_1, x37_0<- x17 * 0x1000003d10000 (_0*_0)
mov rdx, 0xffffffffffffe ; moving imm to reg
and r11, rdx; x30 <- x29&0xffffffffffffe
adox r12, rcx
adox r15, rdi
adcx rbp, r12
adc r15, 0x0; add CF to r0's alloc
mov rcx, rbp;
shrd rbp, r15, 0x34; lo
shr r15, 0x34; x40_1>>=0x34
and rbp, r14; lo limb and'ed
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rdi, rbx, rax; x45_1, x45_0<- x7 * arg1[3] (_0*_0)
mov rdx, rax; x7 to rdx
mulx r12, rax, [ rsi + 0x20 ]; x65_1, x65_0<- arg1[4] * x7 (_0*_0)
mov rdx, rcx;
shr rdx, 0x30; x50 <- x41>> 0x30
xor r15, r15
adox rbx, r13
adox rdi, [ rsp - 0x48 ]
adcx rbp, rbx
adc rdi, 0x0; add CF to r0's alloc
mov r13, rbp;
shrd r13, rdi, 0x34; lo
shr rdi, 0x34; x48_1>>=0x34
mov rbx, rdx; preserving value of x50 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mulx r15, rdi, rdx; x66_1, x66_0<- arg1[3]^2
test al, al
adox rdi, rax
adox r12, r15
shl rbp, 0x4; x55 <- x49 * 0x10
mov rdx, 0xfffffffffffff0 ; moving imm to reg
and rbp, rdx; x56 <- x55&0xfffffffffffff0
and r13, r14; lo limb and'ed
adox r13, rdi
mov rax, 0x0 ; moving imm to reg
adox r12, rax
mov r15, r13;
shrd r15, r12, 0x34; lo
shr r12, 0x34; x69_1>>=0x34
mov rdi, 0xfffffffffffff ; moving imm to reg
and r13, rdi; lo limb and'ed
and r15, r14; lo limb and'ed
mov r12, [ rsi + 0x18 ]; load m64 arg1[3] to register64
lea rax, [r12 + r12]; x4 <- arg1[3] * 2 
mov rdx, rax; x4 to rdx
mulx r12, rax, [ rsi + 0x20 ]; x82_1, x82_0<- arg1[4] * x4 (_0*_0)
adox rax, r15
mov rdx, 0x0 ; moving imm to reg
adox r12, rdx
mov rdx, r8; 0x1000003d10 to rdx
mulx r15, r8, r13; x74_1, x74_0<- x73 * 0x1000003d10 (_0*_0)
and rax, r14; lo limb and'ed
mulx rdi, r13, rax; x90_1, x90_0<- x89 * 0x1000003d10 (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r9, rax, r10; x86_1, x86_0<- x12 * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x40 ], r12; spilling x84 to mem
mulx r12, r14, r10; x72_1, x72_0<- x12 * arg1[1] (_0*_0)
mov rdx, 0x4 ; moving imm to reg
bzhi r10, rbx, rdx; x51 <- x50 (only least 0x4 bits)
or rbp, r10; x57 <- x56|x51
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r10, rbx, rdx; x87_1, x87_0<- arg1[1]^2
adox r14, r8
adox r15, r12
adcx rbx, rax
adcx r9, r10
mov rdx, 0x1000003d1 ; moving imm to reg
mulx rax, r8, rbp; x59_1, x59_0<- x57 * 0x1000003d1 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbp, r12, rdx; x54_1, x54_0<- arg1[0]^2
xor rdx, rdx
adox r13, rbx
adox r9, rdi
adcx r12, r8
adcx rax, rbp
mov rdi, r12;
shrd rdi, rax, 0x34; lo
shr rax, 0x34; x61_1>>=0x34
mov r10, 0xffffffffffffffff ; moving imm to reg
and rdi, r10; lo limb and'ed
adox rdi, r14
adox r15, rdx
mov r14, 0xfffffffffffff ; moving imm to reg
and r12, r14; x63 <- x62&0xfffffffffffff
mov rbx, rdi;
mov r8, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r8 + 0x0 ], r12; out1[0] = x63
and rbx, r14; x79 <- x78&0xfffffffffffff
shrd rdi, r15, 0x34; lo
shr r15, 0x34; x77_1>>=0x34
and rdi, r10; lo limb and'ed
adox rdi, r13
adox r9, rdx
mov rbp, rdi;
shrd rbp, r9, 0x34; lo
shr r9, 0x34; x93_1>>=0x34
lea r11, [ r11 + rbp ]
and rdi, r14; x96 <- x95&0xfffffffffffff
mov r13, 0x1000003d10000 ; moving imm to reg
mov rdx, r13; 0x1000003d10000 to rdx
mulx rax, r13, [ rsp - 0x40 ]; x99_1, x99_0<- x84 * 0x1000003d10000 (_0*_0)
adox r11, r13
mov r12, 0x0 ; moving imm to reg
adox rax, r12
mov r15, r11;
shrd r15, rax, 0x34; lo
shr rax, 0x34; x101_1>>=0x34
mov [ r8 + 0x8 ], rbx; out1[1] = x79
and r11, r14; x104 <- x103&0xfffffffffffff
mov rbx, 0x30 ; moving imm to reg
bzhi r9, rcx, rbx; x52 <- x41 (only least 0x30 bits)
mov [ r8 + 0x18 ], r11; out1[3] = x104
lea r9, [ r9 + r15 ]
mov [ r8 + 0x10 ], rdi; out1[2] = x96
mov [ r8 + 0x20 ], r9; out1[4] = x105
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.9812
; seed 0678522561110147 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1320637 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=374, initial num_batches=31): 112102 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.08488479423187446
; number reverted permutation / tried permutation: 69680 / 89752 =77.636%
; number reverted decision / tried decision: 63897 / 90247 =70.802%