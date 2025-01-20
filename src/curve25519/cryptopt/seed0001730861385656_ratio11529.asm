SECTION .text
	GLOBAL rust_fiat_curve25519_carry_mul_CryptOpt
rust_fiat_curve25519_carry_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x0 ]; saving arg2[0] in rdx.
mulx r11, r10, [ rsi + 0x10 ]; x50_1, x50_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, [ rsi + 0x18 ]; x46_1, x46_0<- arg2[0] * arg1[3] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, [ rsi + 0x0 ]; x62_1, x62_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov r14, [ rax + 0x8 ]; load m64 x23 to register64
imul r14, rdx; lox23 = arg2[1]*0x13
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov r15, [ rax + 0x10 ]; load m64 x18 to register64
imul r15, rdx; lox18 = arg2[2]*0x13
mov rdx, r14; x23 to rdx
mov [ rsp - 0x50 ], r9; spilling arg5 to mem
mulx r9, r14, [ rsi + 0x20 ]; x25_1, x25_0<- x23 * arg1[4] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov [ rsp - 0x48 ], r8; spilling arg4 to mem
mov r8, [ rax + 0x18 ]; load m64 x13 to register64
imul r8, rdx; lox13 = arg2[3]*0x13
mov rdx, r8; x13 to rdx
mov [ rsp - 0x40 ], rcx; spilling arg3 to mem
mulx rcx, r8, [ rsi + 0x20 ]; x15_1, x15_0<- x13 * arg1[4] (_0*_0)
mov [ rsp - 0x38 ], rdi; spilling out1 to mem
mov rdi, 0x13 ; moving imm to reg
mov [ rsp - 0x30 ], rbp; spilling x46_1 to mem
mov rbp, [ rax + 0x20 ]; load m64 x8 to register64
imul rbp, rdi; lox8 = arg2[4]*0x13
mov rdi, rdx; preserving value of x13 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mov [ rsp - 0x28 ], rbx; spilling x46_0 to mem
mov [ rsp - 0x20 ], r11; spilling x50_1 to mem
mulx r11, rbx, rbp; x29_1, x29_0<- arg1[3] * x8 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x18 ], r10; spilling x50_0 to mem
mov [ rsp - 0x10 ], r13; spilling x62_1 to mem
mulx r13, r10, rbp; x40_1, x40_0<- arg1[1] * x8 (_0*_0)
xor rdx, rdx
adox r8, rbx
adox r11, rcx
mov rdx, r15; x18 to rdx
mulx rcx, r15, [ rsi + 0x18 ]; x31_1, x31_0<- arg1[3] * x18 (_0*_0)
adcx r14, r15
adcx rcx, r9
mov r9, rdx; preserving value of x18 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r15, rbx, rdi; x36_1, x36_0<- arg1[2] * x13 (_0*_0)
xor rdx, rdx
adox rbx, r14
adox rcx, r15
mov rdx, r9; x18 to rdx
mulx r14, r9, [ rsi + 0x20 ]; x20_1, x20_0<- x18 * arg1[4] (_0*_0)
mov rdx, rdi; x13 to rdx
mulx r15, rdi, [ rsi + 0x18 ]; x30_1, x30_0<- arg1[3] * x13 (_0*_0)
adcx r10, rbx
adcx rcx, r13
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbx, r13, [ rax + 0x0 ]; x63_1, x63_0<- arg1[0] * arg2[0] (_0*_0)
xor rdx, rdx
adox r13, r10
adox rcx, rbx
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rbx, r10, rbp; x35_1, x35_0<- arg1[2] * x8 (_0*_0)
mov rdx, r13;
shrd rdx, rcx, 0x33; lo
shr rcx, 0x33; x68_1>>=0x33
test al, al
adox r9, rdi
adox r15, r14
adcx r10, r9
adcx r15, rbx
mov r14, rdx; preserving value of x68_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx rbx, rdi, [ rax + 0x0 ]; x55_1, x55_0<- arg2[0] * arg1[1] (_0*_0)
xor rdx, rdx
adox rdi, r10
adox r15, rbx
mov r9, 0xffffffffffffffff ; moving imm to reg
and r14, r9; lo limb and'ed
adox r12, rdi
adox r15, [ rsp - 0x10 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r10, rcx, [ rax + 0x8 ]; x54_1, x54_0<- arg1[1] * arg2[1] (_0*_0)
adcx rcx, r8
adcx r11, r10
mov rdx, rcx;
add rdx, [ rsp - 0x18 ]; could be done better, if r0 has been u8 as well
adcx r11, [ rsp - 0x20 ]
add r14, r12; could be done better, if r0 has been u8 as well
adc r15, 0x0; add CF to r0's alloc
mov r8, r14;
mov rbx, rdx; preserving value of x83_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r12, rdi, [ rax + 0x10 ]; x61_1, x61_0<- arg1[0] * arg2[2] (_0*_0)
shrd r14, r15, 0x33; lo
shr r15, 0x33; x78_1>>=0x33
xor rdx, rdx
adox rdi, rbx
adox r11, r12
and r14, r9; lo limb and'ed
adox r14, rdi
adox r11, rdx
mov r10, r14;
shrd r10, r11, 0x33; lo
shr r11, 0x33; x86_1>>=0x33
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx rbx, rcx, [ rsi + 0x18 ]; x45_1, x45_0<- arg1[3] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r15, r12, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[1] (_0*_0)
mov rdx, rbp; x8 to rdx
mulx rdi, rbp, [ rsi + 0x20 ]; x10_1, x10_0<- x8 * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r9, r11, [ rax + 0x10 ]; x48_1, x48_0<- arg1[2] * arg2[2] (_0*_0)
xor rdx, rdx
adox rcx, r11
adox r9, rbx
mov rbx, 0x7ffffffffffff ; moving imm to reg
and r13, rbx; x70 <- x69&0x7ffffffffffff
adox rbp, r12
adox r15, rdi
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, r12, [ rax + 0x10 ]; x53_1, x53_0<- arg1[1] * arg2[2] (_0*_0)
adcx r12, rbp
adcx r15, rdi
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbp, r11, [ rax + 0x18 ]; x60_1, x60_0<- arg1[0] * arg2[3] (_0*_0)
mov rdx, r12;
xor rdi, rdi
adox rdx, [ rsp - 0x28 ]
adox r15, [ rsp - 0x30 ]
mov r12, 0xffffffffffffffff ; moving imm to reg
and r10, r12; lo limb and'ed
adox r11, rdx
adox r15, rbp
adcx r10, r11
adc r15, 0x0; add CF to r0's alloc
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r11, rbp, [ rax + 0x18 ]; x52_1, x52_0<- arg1[1] * arg2[3] (_0*_0)
xor rdx, rdx
adox rbp, rcx
adox r9, r11
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx rcx, rdi, [ rsi + 0x0 ]; x59_1, x59_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx rbx, r11, [ rsi + 0x20 ]; x43_1, x43_0<- arg2[0] * arg1[4] (_0*_0)
adcx r11, rbp
adcx r9, rbx
mov rdx, r10;
shrd rdx, r15, 0x33; lo
shr r15, 0x33; x95_1>>=0x33
xor rbp, rbp
adox rdi, r11
adox r9, rcx
and rdx, r12; lo limb and'ed
adox rdx, rdi
adox r9, rbp
mov rcx, rdx;
shrd rcx, r9, 0x33; lo
shr r9, 0x33; x104_1>>=0x33
mov rbx, 0x7ffffffffffff ; moving imm to reg
and r10, rbx; x97 <- x96&0x7ffffffffffff
mov r11, [ rsp - 0x38 ]; load m64 out1 to register64
mov [ r11 + 0x18 ], r10; out1[3] = x97
and r8, rbx; x80 <- x79&0x7ffffffffffff
and rdx, rbx; x107 <- x106&0x7ffffffffffff
mov r15, 0x13 ; moving imm to reg
imul rcx, r15; lox108 = x105*0x13
lea rcx, [ rcx + r13 ]
mov r13, rcx;
and r13, rbx; x111 <- x109&0x7ffffffffffff
shr rcx, 0x33; x110 <- x109>> 0x33
lea rcx, [ rcx + r8 ]
mov rdi, rcx;
and rdi, rbx; x114 <- x112&0x7ffffffffffff
and r14, rbx; x88 <- x87&0x7ffffffffffff
shr rcx, 0x33; x113 <- x112>> 0x33
lea rcx, [ rcx + r14 ]
mov [ r11 + 0x8 ], rdi; out1[1] = x114
mov [ r11 + 0x0 ], r13; out1[0] = x111
mov [ r11 + 0x10 ], rcx; out1[2] = x115
mov [ r11 + 0x20 ], rdx; out1[4] = x107
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1529
; seed 1544583981347554 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 497079 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=291, initial num_batches=31): 48107 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.09677938516815235
; number reverted permutation / tried permutation: 32004 / 39972 =80.066%
; number reverted decision / tried decision: 25592 / 40027 =63.937%