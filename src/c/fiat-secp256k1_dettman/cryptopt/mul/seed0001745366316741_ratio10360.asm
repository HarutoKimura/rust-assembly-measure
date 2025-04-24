SECTION .text
	GLOBAL fiat_c_secp256k1_dettman_mul_CryptOpt
fiat_c_secp256k1_dettman_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r11, r10, [ rax + 0x20 ]; x86_1, x86_0<- arg1[2] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r8, rcx, [ rax + 0x20 ]; x9_1, x9_0<- arg2[4] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rax + 0x18 ]; x106_1, x106_0<- arg2[3] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rax + 0x20 ]; x47_1, x47_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rax + 0x10 ]; x88_1, x88_0<- arg2[2] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rax + 0x10 ]; x23_1, x23_0<- arg2[2] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x48 ], rbx; spilling x106_1 to mem
mov [ rsp - 0x40 ], r9; spilling x106_0 to mem
mulx r9, rbx, [ rax + 0x18 ]; x63_1, x63_0<- arg1[2] * arg2[3] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rcx, rdx; lo limb and'ed
adox r13, r10
adox r11, r14
mov r10, 0x1000003d10 ; moving imm to reg
mov rdx, r10; 0x1000003d10 to rdx
mulx r14, r10, rcx; x38_1, x38_0<- x37 * 0x1000003d10 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x38 ], r11; spilling x89_1 to mem
mulx r11, rcx, [ rax + 0x18 ]; x16_1, x16_0<- arg2[3] * arg1[0] (_0*_0)
adcx rcx, r10
adcx r14, r11
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r11, r10, [ rsi + 0x8 ]; x95_1, x95_0<- arg2[0] * arg1[1] (_0*_0)
test al, al
adox r15, rcx
adox r14, rdi
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx rcx, rdi, [ rsi + 0x10 ]; x30_1, x30_0<- arg2[1] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x30 ], r11; spilling x95_1 to mem
mov [ rsp - 0x28 ], r10; spilling x95_0 to mem
mulx r10, r11, [ rsi + 0x18 ]; x36_1, x36_0<- arg2[0] * arg1[3] (_0*_0)
adcx rdi, r15
adcx r14, rcx
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx rcx, r15, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[2] (_0*_0)
add r11, rdi; could be done better, if r0 has been u8 as well
adcx r14, r10
mov rdx, 0x1000003d10000 ; moving imm to reg
mulx rdi, r10, r8; x52_1, x52_0<- x10 * 0x1000003d10000 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x20 ], r13; spilling x89_0 to mem
mulx r13, r8, [ rax + 0x18 ]; x48_1, x48_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x18 ], r9; spilling x63_1 to mem
mov [ rsp - 0x10 ], rbx; spilling x63_0 to mem
mulx rbx, r9, [ rsi + 0x18 ]; x50_1, x50_0<- arg1[3] * arg2[1] (_0*_0)
mov rdx, r11;
test al, al
adox rbp, r10
adox rdi, r12
shrd r11, r14, 0x34; lo
shr r14, 0x34; x43_1>>=0x34
test al, al
adox r8, rbp
adox rdi, r13
adcx r15, r8
adcx rdi, rcx
mov r12, rdx; preserving value of x44 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mulx r10, rcx, [ rsi + 0x20 ]; x51_1, x51_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rbp, r13, [ rax + 0x20 ]; x62_1, x62_0<- arg1[1] * arg2[4] (_0*_0)
xor rdx, rdx
adox r9, r15
adox rdi, rbx
adcx rcx, r9
adcx rdi, r10
mov rbx, 0xffffffffffffffff ; moving imm to reg
and r11, rbx; lo limb and'ed
adox r11, rcx
adox rdi, rdx
mov r14, r11;
shrd r14, rdi, 0x34; lo
shr rdi, 0x34; x59_1>>=0x34
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r15, r8, [ rax + 0x8 ]; x65_1, x65_0<- arg2[1] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r9, r10, [ rax + 0x10 ]; x64_1, x64_0<- arg1[3] * arg2[2] (_0*_0)
xor rdx, rdx
adox r13, [ rsp - 0x10 ]
adox rbp, [ rsp - 0x18 ]
adcx r8, r13
adcx rbp, r15
add r10, r8; could be done better, if r0 has been u8 as well
adcx rbp, r9
and r14, rbx; lo limb and'ed
adox r14, r10
adox rbp, rdx
mov rcx, r14;
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r15, rdi, [ rsi + 0x18 ]; x87_1, x87_0<- arg1[3] * arg2[3] (_0*_0)
shrd r14, rbp, 0x34; lo
shr rbp, 0x34; x70_1>>=0x34
imul rdx, rcx, 0x10; x76 <- x71 * 0x10
and r14, rbx; lo limb and'ed
adox rdi, [ rsp - 0x20 ]
adox r15, [ rsp - 0x38 ]
adcx r14, rdi
adc r15, 0x0; add CF to r0's alloc
mov r9, rdx; preserving value of x76 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mulx r8, r13, [ rsi + 0x0 ]; x75_1, x75_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, r14;
shrd rdx, r15, 0x34; lo
shr r15, 0x34; x92_1>>=0x34
mov r10, r11;
shr r10, 0x30; x72 <- x60>> 0x30
mov rcx, 0x4 ; moving imm to reg
bzhi rbp, r10, rcx; x73 <- x72 (only least 0x4 bits)
mov rdi, rdx; preserving value of x92_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r10, r15, [ rax + 0x8 ]; x94_1, x94_0<- arg2[1] * arg1[0] (_0*_0)
mov rdx, 0xfffffffffffff0 ; moving imm to reg
and r9, rdx; x77 <- x76&0xfffffffffffff0
or r9, rbp; x78 <- x77|x73
adox r15, [ rsp - 0x28 ]
adox r10, [ rsp - 0x30 ]
mov rbp, 0x1000003d1 ; moving imm to reg
mov rdx, rbp; 0x1000003d1 to rdx
mulx rcx, rbp, r9; x80_1, x80_0<- x78 * 0x1000003d1 (_0*_0)
adcx r13, rbp
adcx rcx, r8
mov r8, r13;
shrd r8, rcx, 0x34; lo
shr rcx, 0x34; x82_1>>=0x34
mov r9, 0xfffffffffffff ; moving imm to reg
and r14, r9; lo limb and'ed
mov rbp, 0x1000003d10 ; moving imm to reg
mov rdx, rbp; 0x1000003d10 to rdx
mulx rcx, rbp, r14; x98_1, x98_0<- x97 * 0x1000003d10 (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r9, r14, [ rax + 0x20 ]; x105_1, x105_0<- arg1[3] * arg2[4] (_0*_0)
mov rdx, r14;
adox rdx, [ rsp - 0x40 ]
adox r9, [ rsp - 0x48 ]
adcx rbp, r15
adcx r10, rcx
and r8, rbx; lo limb and'ed
adox r8, rbp
mov r15, 0x0 ; moving imm to reg
adox r10, r15
mov rcx, r8;
shrd rcx, r10, 0x34; lo
shr r10, 0x34; x101_1>>=0x34
and rcx, rbx; lo limb and'ed
and rdi, rbx; lo limb and'ed
adox rdi, rdx
adox r9, r15
and rdi, rbx; lo limb and'ed
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbp, r14, [ rax + 0x10 ]; x111_1, x111_0<- arg2[2] * arg1[0] (_0*_0)
mov rdx, 0x1000003d10000 ; moving imm to reg
mulx r15, r10, r9; x126_1, x126_0<- x109 * 0x1000003d10000 (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx rbx, r9, [ rsi + 0x8 ]; x112_1, x112_0<- arg2[1] * arg1[1] (_0*_0)
adox r14, r9
adox rbx, rbp
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r9, rbp, [ rax + 0x0 ]; x113_1, x113_0<- arg2[0] * arg1[2] (_0*_0)
adcx rbp, r14
adcx rbx, r9
mov rdx, 0xfffffffffffff ; moving imm to reg
and r12, rdx; x45 <- x44&0xfffffffffffff
mov r14, 0x1000003d10 ; moving imm to reg
mov rdx, rdi; x114_0 to rdx
mulx r9, rdi, r14; x115_1, x115_0<- x114 * 0x1000003d10 (_0*_0)
adox rdi, rbp
adox rbx, r9
adcx rcx, rdi
adc rbx, 0x0; add CF to r0's alloc
mov rdx, rcx;
shrd rcx, rbx, 0x34; lo
shr rbx, 0x34; x120_1>>=0x34
lea r12, [ r12 + rcx ]
xor rbp, rbp
adox r12, r10
adox r15, rbp
mov r10, r12;
shrd r10, r15, 0x34; lo
shr r15, 0x34; x128_1>>=0x34
mov r9, 0x30 ; moving imm to reg
bzhi rdi, r11, r9; x74 <- x60 (only least 0x30 bits)
lea rdi, [ rdi + r10 ]
mov r11, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r11 + 0x20 ], rdi; out1[4] = x132
mov rbx, 0xfffffffffffff ; moving imm to reg
and rdx, rbx; x123 <- x122&0xfffffffffffff
and r13, rbx; x84 <- x83&0xfffffffffffff
mov [ r11 + 0x10 ], rdx; out1[2] = x123
and r12, rbx; x131 <- x130&0xfffffffffffff
and r8, rbx; x103 <- x102&0xfffffffffffff
mov [ r11 + 0x8 ], r8; out1[1] = x103
mov [ r11 + 0x18 ], r12; out1[3] = x131
mov [ r11 + 0x0 ], r13; out1[0] = x84
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0360
; seed 3610650118721548 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 588839 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=285, initial num_batches=31): 54033 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.09176192473664278
; number reverted permutation / tried permutation: 30424 / 40081 =75.906%
; number reverted decision / tried decision: 24042 / 39918 =60.228%