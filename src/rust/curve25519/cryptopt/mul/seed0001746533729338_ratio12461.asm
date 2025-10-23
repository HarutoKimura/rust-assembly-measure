SECTION .text
	GLOBAL rust_fiat_curve25519_carry_mul_CryptOpt
rust_fiat_curve25519_carry_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x0 ]; saving arg2[0] in rdx.
mulx r11, r10, [ rsi + 0x8 ]; x55_1, x55_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov rcx, [ rax + 0x8 ]; load m64 x23 to register64
imul rcx, rdx; lox23 = arg2[1]*0x13
mov r8, [ rax + 0x20 ]; load m64 x8 to register64
imul r8, rdx; lox8 = arg2[4]*0x13
mov r9, [ rax + 0x10 ]; load m64 x18 to register64
imul r9, rdx; lox18 = arg2[2]*0x13
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, r8; x35_1, x35_0<- arg1[2] * x8 (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, r9; x31_1, x31_0<- arg1[3] * x18 (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, [ rsi + 0x8 ]; x54_1, x54_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov rdi, [ rax + 0x18 ]; load m64 x13 to register64
imul rdi, rdx; lox13 = arg2[3]*0x13
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x48 ], r15; spilling x54_1 to mem
mov [ rsp - 0x40 ], r14; spilling x54_0 to mem
mulx r14, r15, rcx; x25_1, x25_0<- x23 * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x38 ], r11; spilling x55_1 to mem
mulx r11, rcx, rdi; x36_1, x36_0<- arg1[2] * x13 (_0*_0)
mov rdx, rdi; x13 to rdx
mov [ rsp - 0x30 ], r10; spilling x55_0 to mem
mulx r10, rdi, [ rsi + 0x18 ]; x30_1, x30_0<- arg1[3] * x13 (_0*_0)
mov [ rsp - 0x28 ], rbp; spilling x35_1 to mem
xor rbp, rbp
adox r15, r12
adox r13, r14
adcx rcx, r15
adcx r13, r11
mov r12, rdx; preserving value of x13 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r11, r14, r8; x40_1, x40_0<- arg1[1] * x8 (_0*_0)
xor rdx, rdx
adox r14, rcx
adox r13, r11
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r15, rbp, [ rax + 0x0 ]; x63_1, x63_0<- arg1[0] * arg2[0] (_0*_0)
adcx rbp, r14
adcx r13, r15
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r11, rcx, r9; x20_1, x20_0<- x18 * arg1[4] (_0*_0)
test al, al
adox rcx, rdi
adox r10, r11
adcx rbx, rcx
adcx r10, [ rsp - 0x28 ]
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx rdi, r9, [ rsi + 0x0 ]; x62_1, x62_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, r8; x8 to rdx
mulx r14, r8, [ rsi + 0x18 ]; x29_1, x29_0<- arg1[3] * x8 (_0*_0)
mov r15, rdx; preserving value of x8 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx rcx, r11, r12; x15_1, x15_0<- x13 * arg1[4] (_0*_0)
xor rdx, rdx
adox r11, r8
adox r14, rcx
mov r12, rbx;
adcx r12, [ rsp - 0x30 ]
adcx r10, [ rsp - 0x38 ]
mov rbx, rbp;
shrd rbx, r13, 0x33; lo
shr r13, 0x33; x68_1>>=0x33
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx rcx, r8, [ rsi + 0x10 ]; x50_1, x50_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rbx, rdx; lo limb and'ed
adox r9, r12
adox r10, rdi
adcx rbx, r9
adc r10, 0x0; add CF to r0's alloc
mov rdi, rbx;
shrd rdi, r10, 0x33; lo
shr r10, 0x33; x78_1>>=0x33
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r13, r12, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[1] (_0*_0)
mov rdx, r11;
xor r9, r9
adox rdx, [ rsp - 0x40 ]
adox r14, [ rsp - 0x48 ]
adcx r8, rdx
adcx r14, rcx
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rcx, r11, [ rax + 0x10 ]; x61_1, x61_0<- arg1[0] * arg2[2] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r9, r10, r15; x10_1, x10_0<- x8 * arg1[4] (_0*_0)
xor rdx, rdx
adox r10, r12
adox r13, r9
mov r15, 0xffffffffffffffff ; moving imm to reg
and rdi, r15; lo limb and'ed
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r9, r12, [ rsi + 0x8 ]; x53_1, x53_0<- arg1[1] * arg2[2] (_0*_0)
adox r11, r8
adox r14, rcx
adcx rdi, r11
adc r14, 0x0; add CF to r0's alloc
mov rdx, rdi;
shrd rdx, r14, 0x33; lo
shr r14, 0x33; x86_1>>=0x33
xor r8, r8
adox r12, r10
adox r13, r9
mov rcx, rdx; preserving value of x86_0 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mulx r9, r10, [ rsi + 0x18 ]; x46_1, x46_0<- arg2[0] * arg1[3] (_0*_0)
adcx r10, r12
adcx r13, r9
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r14, r11, [ rax + 0x18 ]; x60_1, x60_0<- arg1[0] * arg2[3] (_0*_0)
test al, al
adox r11, r10
adox r13, r14
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r9, r12, [ rax + 0x18 ]; x52_1, x52_0<- arg1[1] * arg2[3] (_0*_0)
and rcx, r15; lo limb and'ed
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r14, r10, [ rax + 0x10 ]; x48_1, x48_0<- arg1[2] * arg2[2] (_0*_0)
adox rcx, r11
adox r13, r8
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r8, r11, [ rsi + 0x18 ]; x45_1, x45_0<- arg1[3] * arg2[1] (_0*_0)
adcx r11, r10
adcx r14, r8
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r8, r10, [ rsi + 0x20 ]; x43_1, x43_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, rcx;
mov r15, 0x7ffffffffffff ; moving imm to reg
and rdx, r15; x97 <- x96&0x7ffffffffffff
adox r12, r11
adox r14, r9
adcx r10, r12
adcx r14, r8
mov r9, rdx; preserving value of x97 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r8, r11, [ rax + 0x20 ]; x59_1, x59_0<- arg1[0] * arg2[4] (_0*_0)
xor rdx, rdx
adox r11, r10
adox r14, r8
shrd rcx, r13, 0x33; lo
shr r13, 0x33; x95_1>>=0x33
mov r12, 0xffffffffffffffff ; moving imm to reg
and rcx, r12; lo limb and'ed
and rbp, r15; x70 <- x69&0x7ffffffffffff
adox rcx, r11
adox r14, rdx
mov r10, rcx;
shrd rcx, r14, 0x33; lo
shr r14, 0x33; x104_1>>=0x33
mov r8, 0x13 ; moving imm to reg
imul rcx, r8; lox108 = x105*0x13
and r10, r15; x107 <- x106&0x7ffffffffffff
lea rcx, [ rcx + rbp ]
mov r11, rcx;
shr r11, 0x33; x110 <- x109>> 0x33
and rbx, r15; x80 <- x79&0x7ffffffffffff
lea r11, [ r11 + rbx ]
mov r13, r11;
shr r13, 0x33; x113 <- x112>> 0x33
and rcx, r15; x111 <- x109&0x7ffffffffffff
and rdi, r15; x88 <- x87&0x7ffffffffffff
lea r13, [ r13 + rdi ]
mov rbp, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbp + 0x10 ], r13; out1[2] = x115
and r11, r15; x114 <- x112&0x7ffffffffffff
mov [ rbp + 0x20 ], r10; out1[4] = x107
mov [ rbp + 0x8 ], r11; out1[1] = x114
mov [ rbp + 0x0 ], rcx; out1[0] = x111
mov [ rbp + 0x18 ], r9; out1[3] = x97
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.2461
; seed 3783687044361655 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1112127 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=286, initial num_batches=31): 106518 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.09577862959895768
; number reverted permutation / tried permutation: 71798 / 90103 =79.684%
; number reverted decision / tried decision: 57749 / 89896 =64.240%S