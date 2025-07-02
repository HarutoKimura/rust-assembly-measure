SECTION .text
	GLOBAL fiat_c_secp256k1_dettman_square_CryptOpt
fiat_c_secp256k1_dettman_square_CryptOpt:
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r10, rax, rdx; x16_1, x16_0<- arg1[4]^2
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rcx, r11, rdx; x66_1, x66_0<- arg1[3]^2
mov rdx, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov r8, rdx; load m64 x10 to register64
shl r8, 0x1; x10 <- arg1[1] * 0x2
mov rdx, [ rsi + 0x0 ]; load m64 arg1[0] to register64
mov r9, rdx; load m64 x12 to register64
shl r9, 0x1; x12 <- arg1[0] * 0x2
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, r9; x20_1, x20_0<- x12 * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, r8; x23_1, x23_0<- x10 * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, r8; x33_1, x33_0<- x10 * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], rcx; spilling x66_1 to mem
mulx rcx, rdi, rdx; x34_1, x34_0<- arg1[2]^2
xor rdx, rdx
adox rdi, r14
adox r15, rcx
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rcx, r14, r9; x72_1, x72_0<- x12 * arg1[1] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rax, rdx; lo limb and'ed
adox r12, rbx
adox rbp, r13
mov rbx, 0x1000003d10 ; moving imm to reg
mov rdx, rbx; 0x1000003d10 to rdx
mulx r13, rbx, rax; x26_1, x26_0<- x25 * 0x1000003d10 (_0*_0)
adcx rbx, r12
adcx rbp, r13
mov rax, rbx;
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r13, r12, r9; x32_1, x32_0<- x12 * arg1[4] (_0*_0)
mov rdx, 0x1000003d10000 ; moving imm to reg
mov [ rsp - 0x40 ], rcx; spilling x72_1 to mem
mov [ rsp - 0x38 ], r14; spilling x72_0 to mem
mulx r14, rcx, r10; x37_1, x37_0<- x17 * 0x1000003d10000 (_0*_0)
xor r10, r10
adox r12, rdi
adox r15, r13
shrd rbx, rbp, 0x34; lo
shr rbp, 0x34; x28_1>>=0x34
add rcx, r12; could be done better, if r0 has been u8 as well
adcx r15, r14
mov rdi, 0xffffffffffffffff ; moving imm to reg
and rbx, rdi; lo limb and'ed
adox rbx, rcx
adox r15, r10
mov r13, rbx;
mov r14, r13;
shr r14, 0x30; x50 <- x41>> 0x30
shrd rbx, r15, 0x34; lo
shr r15, 0x34; x40_1>>=0x34
mov r12, 0xffffffffffffe ; moving imm to reg
and rax, r12; x30 <- x29&0xffffffffffffe
and rbx, rdi; lo limb and'ed
mov rbp, 0x4 ; moving imm to reg
bzhi rcx, r14, rbp; x51 <- x50 (only least 0x4 bits)
mov r14, [ rsi + 0x10 ]; load m64 arg1[2] to register64
lea r15, [r14 + r14]; x7 <- arg1[2] * 2 
mov rdx, r15; x7 to rdx
mulx r15, r14, [ rsi + 0x18 ]; x45_1, x45_0<- x7 * arg1[3] (_0*_0)
mulx rbp, r10, [ rsi + 0x20 ]; x65_1, x65_0<- arg1[4] * x7 (_0*_0)
mov rdx, 0xffffffffffff ; moving imm to reg
and r13, rdx; x52 <- x41&0xffffffffffff
adox r11, r10
adox rbp, [ rsp - 0x48 ]
mov rdx, r8; x10 to rdx
mulx r10, r8, [ rsi + 0x20 ]; x43_1, x43_0<- arg1[4] * x10 (_0*_0)
adcx r14, r8
adcx r10, r15
xor rdx, rdx
adox rbx, r14
adox r10, rdx
mov r15, rbx;
shrd rbx, r10, 0x34; lo
shr r10, 0x34; x48_1>>=0x34
shl r15, 0x4; x55 <- x49 * 0x10
mov r8, 0xfffffffffffff0 ; moving imm to reg
and r15, r8; x56 <- x55&0xfffffffffffff0
or r15, rcx; x57 <- x56|x51
imul rcx, [ rsi + 0x18 ], 0x2; x4 <- arg1[3] * 0x2
mov r14, 0x1000003d1 ; moving imm to reg
mov rdx, r14; 0x1000003d1 to rdx
mulx r10, r14, r15; x59_1, x59_0<- x57 * 0x1000003d1 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r8, r15, rdx; x54_1, x54_0<- arg1[0]^2
and rbx, rdi; lo limb and'ed
adox r15, r14
adox r10, r8
adcx rbx, r11
adc rbp, 0x0; add CF to r0's alloc
mov rdx, rbx;
shrd rdx, rbp, 0x34; lo
shr rbp, 0x34; x69_1>>=0x34
and rdx, rdi; lo limb and'ed
mov r11, rdx; preserving value of x80_0 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx r8, r14, rcx; x82_1, x82_0<- arg1[4] * x4 (_0*_0)
adox r14, r11
mov rdx, 0x0 ; moving imm to reg
adox r8, rdx
and r14, rdi; lo limb and'ed
mov rcx, r15;
shrd rcx, r10, 0x34; lo
shr r10, 0x34; x61_1>>=0x34
mov rbp, 0x1000003d10 ; moving imm to reg
mov rdx, rbp; 0x1000003d10 to rdx
mulx r11, rbp, r14; x90_1, x90_0<- x89 * 0x1000003d10 (_0*_0)
and rcx, rdi; lo limb and'ed
mov r14, 0xfffffffffffff ; moving imm to reg
and rbx, r14; lo limb and'ed
mulx r14, r10, rbx; x74_1, x74_0<- x73 * 0x1000003d10 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r12, rbx, rdx; x87_1, x87_0<- arg1[1]^2
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x30 ], r13; spilling x52 to mem
mulx r13, rdi, r9; x86_1, x86_0<- x12 * arg1[2] (_0*_0)
mov rdx, r10;
adox rdx, [ rsp - 0x38 ]
adox r14, [ rsp - 0x40 ]
adcx rcx, rdx
adc r14, 0x0; add CF to r0's alloc
mov r9, rcx;
shrd r9, r14, 0x34; lo
shr r14, 0x34; x77_1>>=0x34
xor r10, r10
adox rbx, rdi
adox r13, r12
adcx rbp, rbx
adcx r13, r11
mov r11, 0xffffffffffffffff ; moving imm to reg
and r9, r11; lo limb and'ed
adox r9, rbp
adox r13, r10
mov r12, r9;
shrd r9, r13, 0x34; lo
shr r13, 0x34; x93_1>>=0x34
lea rax, [ rax + r9 ]
mov rdi, 0x1000003d10000 ; moving imm to reg
mov rdx, rdi; 0x1000003d10000 to rdx
mulx r14, rdi, r8; x99_1, x99_0<- x84 * 0x1000003d10000 (_0*_0)
add rax, rdi; could be done better, if r0 has been u8 as well
adc r14, 0x0; add CF to r0's alloc
mov rbx, rax;
shrd rbx, r14, 0x34; lo
shr r14, 0x34; x101_1>>=0x34
mov rbp, 0xfffffffffffff ; moving imm to reg
and r12, rbp; x96 <- x95&0xfffffffffffff
and r15, rbp; x63 <- x62&0xfffffffffffff
add rbx, [ rsp - 0x30 ]
mov r13, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r13 + 0x0 ], r15; out1[0] = x63
and rcx, rbp; x79 <- x78&0xfffffffffffff
and rax, rbp; x104 <- x103&0xfffffffffffff
mov [ r13 + 0x18 ], rax; out1[3] = x104
mov [ r13 + 0x10 ], r12; out1[2] = x96
mov [ r13 + 0x8 ], rcx; out1[1] = x79
mov [ r13 + 0x20 ], rbx; out1[4] = x105
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.9956
; seed 0656812713724829 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1577043 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=370, initial num_batches=31): 112261 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.07118448894545044
; number reverted permutation / tried permutation: 70084 / 90078 =77.804%
; number reverted decision / tried decision: 64576 / 89921 =71.814%