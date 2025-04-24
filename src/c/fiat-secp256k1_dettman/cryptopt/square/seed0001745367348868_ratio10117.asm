SECTION .text
	GLOBAL fiat_c_secp256k1_dettman_square_CryptOpt
fiat_c_secp256k1_dettman_square_CryptOpt:
mov rax, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov r10, rax; load m64 x10 to register64
shl r10, 0x1; x10 <- arg1[1] * 0x2
mov rax, [ rsi + 0x0 ]; load m64 arg1[0] to register64
lea r11, [rax + rax]; x12 <- arg1[0] * 2 
mov rdx, r11; x12 to rdx
mulx r11, rax, [ rsi + 0x18 ]; x20_1, x20_0<- x12 * arg1[3] (_0*_0)
mov rcx, rdx; preserving value of x12 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx r9, r8, rdx; x16_1, x16_0<- arg1[4]^2
mov rdx, [ rsi + 0x18 ]; load m64 arg1[3] to register64
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, rdx; load m64 x4 to register64
shl rbx, 0x1; x4 <- arg1[3] * 0x2
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, r10; x23_1, x23_0<- x10 * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, rdx; x34_1, x34_0<- arg1[2]^2
xor rdx, rdx
adox rbp, rax
adox r11, r12
mov rax, 0xffffffffffffffff ; moving imm to reg
and r8, rax; lo limb and'ed
mov r12, 0x1000003d10 ; moving imm to reg
mov rdx, r12; 0x1000003d10 to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r12, r8; x26_1, x26_0<- x25 * 0x1000003d10 (_0*_0)
adox r12, rbp
adox r11, r15
mov rdx, r10; x10 to rdx
mulx rbp, r10, [ rsi + 0x18 ]; x33_1, x33_0<- x10 * arg1[3] (_0*_0)
adcx r13, r10
adcx rbp, r14
mov r14, r12;
mov r8, rdx; preserving value of x10 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx r10, r15, rcx; x32_1, x32_0<- x12 * arg1[4] (_0*_0)
add r15, r13; could be done better, if r0 has been u8 as well
adcx rbp, r10
mov rdx, 0x1000003d10000 ; moving imm to reg
mulx r10, r13, r9; x37_1, x37_0<- x17 * 0x1000003d10000 (_0*_0)
xor r9, r9
adox r13, r15
adox rbp, r10
shrd r12, r11, 0x34; lo
shr r11, 0x34; x28_1>>=0x34
and r12, rax; lo limb and'ed
adox r12, r13
adox rbp, r9
mov r15, r12;
shrd r15, rbp, 0x34; lo
shr rbp, 0x34; x40_1>>=0x34
and r15, rax; lo limb and'ed
mov r10, r12;
shr r10, 0x30; x50 <- x41>> 0x30
imul r13, [ rsi + 0x10 ], 0x2; x7 <- arg1[2] * 0x2
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbp, r11, r8; x43_1, x43_0<- arg1[4] * x10 (_0*_0)
mov rdx, r13; x7 to rdx
mulx r8, r13, [ rsi + 0x20 ]; x65_1, x65_0<- arg1[4] * x7 (_0*_0)
mov r9, 0xffffffffffffe ; moving imm to reg
and r14, r9; x30 <- x29&0xffffffffffffe
mulx rax, r9, [ rsi + 0x18 ]; x45_1, x45_0<- x7 * arg1[3] (_0*_0)
adox r9, r11
adox rbp, rax
adcx r15, r9
adc rbp, 0x0; add CF to r0's alloc
mov rdx, r15;
shrd r15, rbp, 0x34; lo
shr rbp, 0x34; x48_1>>=0x34
mov r11, rdx; preserving value of x49 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r9, rax, rdx; x54_1, x54_0<- arg1[0]^2
mov rdx, 0x4 ; moving imm to reg
shlx rbp, r11, rdx; x55 <- x49 * 0x10 (shlx does not change the flags)
mov r11, 0xfffffffffffff0 ; moving imm to reg
and rbp, r11; x56 <- x55&0xfffffffffffff0
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r11, rdx; x66_1, x66_0<- arg1[3]^2
adox r11, r13
adox r8, rdi
mov rdx, 0x40 ; moving imm to reg
bzhi r13, r15, rdx; x64 <- x48_0 (only least 0x40 bits)
mov r15, 0x4 ; moving imm to reg
bzhi rdi, r10, r15; x51 <- x50 (only least 0x4 bits)
or rbp, rdi; x57 <- x56|x51
adox r13, r11
mov r10, 0x0 ; moving imm to reg
adox r8, r10
mov r11, 0x34 ; moving imm to reg
bzhi rdi, r13, r11; x73 <- x68_0 (only least 0x34 bits)
mov r10, 0x1000003d10 ; moving imm to reg
mov rdx, rdi; x73_0 to rdx
mulx r15, rdi, r10; x74_1, x74_0<- x73 * 0x1000003d10 (_0*_0)
mov rdx, 0x1000003d1 ; moving imm to reg
mulx r10, r11, rbp; x59_1, x59_0<- x57 * 0x1000003d1 (_0*_0)
adox rax, r11
adox r10, r9
mov r9, rax;
shrd r9, r10, 0x34; lo
shr r10, 0x34; x61_1>>=0x34
mov rbp, 0xffffffffffffffff ; moving imm to reg
and r9, rbp; lo limb and'ed
mov rdx, rcx; x12 to rdx
mulx r11, rcx, [ rsi + 0x10 ]; x86_1, x86_0<- x12 * arg1[2] (_0*_0)
shrd r13, r8, 0x34; lo
shr r8, 0x34; x69_1>>=0x34
mulx r8, r10, [ rsi + 0x8 ]; x72_1, x72_0<- x12 * arg1[1] (_0*_0)
and r13, rbp; lo limb and'ed
adox r10, rdi
adox r15, r8
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r8, rdi, rdx; x87_1, x87_0<- arg1[1]^2
adcx r9, r10
adc r15, 0x0; add CF to r0's alloc
mov rdx, rbx; x4 to rdx
mulx r10, rbx, [ rsi + 0x20 ]; x82_1, x82_0<- arg1[4] * x4 (_0*_0)
add rdi, rcx; could be done better, if r0 has been u8 as well
adcx r11, r8
xor rdx, rdx
adox rbx, r13
adox r10, rdx
mov rcx, r9;
shrd rcx, r15, 0x34; lo
shr r15, 0x34; x77_1>>=0x34
and rcx, rbp; lo limb and'ed
and rbx, rbp; lo limb and'ed
mov r13, 0x1000003d10 ; moving imm to reg
mov rdx, r13; 0x1000003d10 to rdx
mulx r8, r13, rbx; x90_1, x90_0<- x89 * 0x1000003d10 (_0*_0)
adox r13, rdi
adox r11, r8
adcx rcx, r13
adc r11, 0x0; add CF to r0's alloc
mov rdi, rcx;
mov r15, 0xfffffffffffff ; moving imm to reg
and rdi, r15; x96 <- x95&0xfffffffffffff
shrd rcx, r11, 0x34; lo
shr r11, 0x34; x93_1>>=0x34
mov rbx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbx + 0x10 ], rdi; out1[2] = x96
and r9, r15; x79 <- x78&0xfffffffffffff
mov [ rbx + 0x8 ], r9; out1[1] = x79
lea r14, [ r14 + rcx ]
mov r8, 0x1000003d10000 ; moving imm to reg
mov rdx, r8; 0x1000003d10000 to rdx
mulx r13, r8, r10; x99_1, x99_0<- x84 * 0x1000003d10000 (_0*_0)
adox r14, r8
mov rdi, 0x0 ; moving imm to reg
adox r13, rdi
mov r11, r14;
shrd r11, r13, 0x34; lo
shr r13, 0x34; x101_1>>=0x34
and rax, r15; x63 <- x62&0xfffffffffffff
mov rcx, 0xffffffffffff ; moving imm to reg
and r12, rcx; x52 <- x41&0xffffffffffff
lea r12, [ r12 + r11 ]
and r14, r15; x104 <- x103&0xfffffffffffff
mov [ rbx + 0x0 ], rax; out1[0] = x63
mov [ rbx + 0x20 ], r12; out1[4] = x105
mov [ rbx + 0x18 ], r14; out1[3] = x104
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0117
; seed 2878453220436757 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1144737 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=371, initial num_batches=31): 49847 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.04354449974098854
; number reverted permutation / tried permutation: 31246 / 40126 =77.870%
; number reverted decision / tried decision: 28154 / 39873 =70.609%