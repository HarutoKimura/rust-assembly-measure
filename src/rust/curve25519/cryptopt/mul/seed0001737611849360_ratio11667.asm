SECTION .text
	GLOBAL rust_fiat_curve25519_carry_mul_CryptOpt
rust_fiat_curve25519_carry_mul_CryptOpt:
mov rax, 0x13 ; moving imm to reg
mov r10, [ rdx + 0x20 ]; load m64 x8 to register64
imul r10, rax; lox8 = arg2[4]*0x13
mov r11, [ rdx + 0x8 ]; load m64 x23 to register64
imul r11, rax; lox23 = arg2[1]*0x13
mov rcx, [ rdx + 0x10 ]; load m64 x18 to register64
imul rcx, rax; lox18 = arg2[2]*0x13
mov r8, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, rcx; x20_1, x20_0<- x18 * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ r8 + 0x0 ]; x46_1, x46_0<- arg2[0] * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, r10; x40_1, x40_0<- arg1[1] * x8 (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x13 to register64
imul rdx, rax; lox13 = arg2[3]*0x13
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx rax, r15, [ rsi + 0x20 ]; x15_1, x15_0<- x13 * arg1[4] (_0*_0)
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], r12; spilling x46_1 to mem
mulx r12, rdi, [ rsi + 0x18 ]; x30_1, x30_0<- arg1[3] * x13 (_0*_0)
mov [ rsp - 0x40 ], rbp; spilling x46_0 to mem
xor rbp, rbp
adox r9, rdi
adox r12, rbx
mulx rdi, rbx, [ rsi + 0x10 ]; x36_1, x36_0<- arg1[2] * x13 (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x38 ], rax; spilling x15_1 to mem
mulx rax, rbp, r11; x25_1, x25_0<- x23 * arg1[4] (_0*_0)
mov rdx, rcx; x18 to rdx
mulx r11, rcx, [ rsi + 0x18 ]; x31_1, x31_0<- arg1[3] * x18 (_0*_0)
mov rdx, [ r8 + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x30 ], r15; spilling x15_0 to mem
mov [ rsp - 0x28 ], r12; spilling x72_1 to mem
mulx r12, r15, [ rsi + 0x8 ]; x55_1, x55_0<- arg2[0] * arg1[1] (_0*_0)
adcx rbp, rcx
adcx r11, rax
xor rdx, rdx
adox rbx, rbp
adox r11, rdi
mov rdx, [ r8 + 0x10 ]; arg2[2] to rdx
mulx rax, rdi, [ rsi + 0x10 ]; x48_1, x48_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x8 ]; arg2[1] to rdx
mulx rbp, rcx, [ rsi + 0x18 ]; x45_1, x45_0<- arg1[3] * arg2[1] (_0*_0)
adcx rcx, rdi
adcx rax, rbp
mov rdx, r10; x8 to rdx
mulx rdi, r10, [ rsi + 0x10 ]; x35_1, x35_0<- arg1[2] * x8 (_0*_0)
xor rbp, rbp
adox r13, rbx
adox r11, r14
mov r14, rdx; preserving value of x8 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx rbp, rbx, [ r8 + 0x0 ]; x63_1, x63_0<- arg1[0] * arg2[0] (_0*_0)
adcx rbx, r13
adcx r11, rbp
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbp, r13, r14; x10_1, x10_0<- x8 * arg1[4] (_0*_0)
mov rdx, rbx;
test al, al
adox r10, r9
adox rdi, [ rsp - 0x28 ]
mov r9, rdx; preserving value of x69 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mov [ rsp - 0x20 ], rbp; spilling x10_1 to mem
mov [ rsp - 0x18 ], r13; spilling x10_0 to mem
mulx r13, rbp, [ r8 + 0x8 ]; x62_1, x62_0<- arg1[0] * arg2[1] (_0*_0)
adcx r15, r10
adcx rdi, r12
mov rdx, 0x33 ; moving imm to reg
bzhi r12, r9, rdx; x70 <- x69 (only least 0x33 bits)
adox rbp, r15
adox rdi, r13
mov rdx, [ r8 + 0x18 ]; arg2[3] to rdx
mulx r10, r9, [ rsi + 0x8 ]; x52_1, x52_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r15, r13, [ r8 + 0x8 ]; x54_1, x54_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, r14; x8 to rdx
mov [ rsp - 0x10 ], r12; spilling x70 to mem
mulx r12, r14, [ rsi + 0x18 ]; x29_1, x29_0<- arg1[3] * x8 (_0*_0)
xor rdx, rdx
adox r9, rcx
adox rax, r10
mov rcx, r14;
adcx rcx, [ rsp - 0x30 ]
adcx r12, [ rsp - 0x38 ]
shrd rbx, r11, 0x33; lo
shr r11, 0x33; x68_1>>=0x33
xor r10, r10
adox r13, rcx
adox r12, r15
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r14, r15, [ r8 + 0x0 ]; x50_1, x50_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0x40 ; moving imm to reg
bzhi rcx, rbx, rdx; x76 <- x68_0 (only least 0x40 bits)
adox rcx, rbp
adox rdi, r10
mov rdx, [ r8 + 0x8 ]; arg2[1] to rdx
mulx r11, rbp, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[1] (_0*_0)
mov rdx, rcx;
shrd rdx, rdi, 0x33; lo
shr rdi, 0x33; x78_1>>=0x33
xor rbx, rbx
adox r15, r13
adox r12, r14
mov r10, rdx; preserving value of x78_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r14, r13, [ r8 + 0x10 ]; x61_1, x61_0<- arg1[0] * arg2[2] (_0*_0)
adcx r13, r15
adcx r12, r14
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r15, rdi, [ r8 + 0x10 ]; x53_1, x53_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, rbp;
xor r14, r14
adox rdx, [ rsp - 0x18 ]
adox r11, [ rsp - 0x20 ]
adcx rdi, rdx
adcx r11, r15
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbp, rbx, [ r8 + 0x20 ]; x59_1, x59_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r14, r15, [ r8 + 0x18 ]; x60_1, x60_0<- arg1[0] * arg2[3] (_0*_0)
mov rdx, rdi;
test al, al
adox rdx, [ rsp - 0x40 ]
adox r11, [ rsp - 0x48 ]
adcx r15, rdx
adcx r11, r14
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r14, rdi, [ r8 + 0x0 ]; x43_1, x43_0<- arg2[0] * arg1[4] (_0*_0)
xor rdx, rdx
adox rdi, r9
adox rax, r14
mov r9, 0xffffffffffffffff ; moving imm to reg
and r10, r9; lo limb and'ed
adox r10, r13
adox r12, rdx
mov r13, r10;
shrd r13, r12, 0x33; lo
shr r12, 0x33; x86_1>>=0x33
and r13, r9; lo limb and'ed
adox r13, r15
adox r11, rdx
mov r15, r13;
shrd r15, r11, 0x33; lo
shr r11, 0x33; x95_1>>=0x33
and r15, r9; lo limb and'ed
mov r14, 0x7ffffffffffff ; moving imm to reg
and r13, r14; x97 <- x96&0x7ffffffffffff
adox rbx, rdi
adox rax, rbp
adcx r15, rbx
adc rax, 0x0; add CF to r0's alloc
mov rbp, r15;
shrd r15, rax, 0x33; lo
shr rax, 0x33; x104_1>>=0x33
mov rdi, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rdi + 0x18 ], r13; out1[3] = x97
mov r12, 0x13 ; moving imm to reg
imul r15, r12; lox108 = x105*0x13
add r15, [ rsp - 0x10 ]
mov r11, r15;
and r11, r14; x111 <- x109&0x7ffffffffffff
and rcx, r14; x80 <- x79&0x7ffffffffffff
shr r15, 0x33; x110 <- x109>> 0x33
mov [ rdi + 0x0 ], r11; out1[0] = x111
lea r15, [ r15 + rcx ]
mov r13, r15;
shr r13, 0x33; x113 <- x112>> 0x33
and r10, r14; x88 <- x87&0x7ffffffffffff
lea r13, [ r13 + r10 ]
mov [ rdi + 0x10 ], r13; out1[2] = x115
and rbp, r14; x107 <- x106&0x7ffffffffffff
mov [ rdi + 0x20 ], rbp; out1[4] = x107
and r15, r14; x114 <- x112&0x7ffffffffffff
mov [ rdi + 0x8 ], r15; out1[1] = x114
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1667
; seed 4452876168858890 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 53869 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=287, initial num_batches=31): 4873 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.09046019046204681
; number reverted permutation / tried permutation: 3227 / 3990 =80.877%
; number reverted decision / tried decision: 2666 / 4009 =66.500%