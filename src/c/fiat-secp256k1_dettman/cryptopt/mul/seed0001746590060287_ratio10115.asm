SECTION .text
	GLOBALfiat_c_secp256k1_dettman_mul_CryptOpt
fiat_c_secp256k1_dettman_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x18 ]; saving arg2[3] in rdx.
mulx r11, r10, [ rsi + 0x0 ]; x16_1, x16_0<- arg2[3] * arg1[0] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r8, rcx, [ rax + 0x18 ]; x63_1, x63_0<- arg1[2] * arg2[3] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rax + 0x20 ]; x62_1, x62_0<- arg1[1] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rax + 0x20 ]; x9_1, x9_0<- arg2[4] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rsi + 0x18 ]; x64_1, x64_0<- arg1[3] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rsi + 0x10 ]; x30_1, x30_0<- arg2[1] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x48 ], r14; spilling x64_1 to mem
mov [ rsp - 0x40 ], r13; spilling x64_0 to mem
mulx r13, r14, [ rsi + 0x20 ]; x88_1, x88_0<- arg2[2] * arg1[4] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rbp, rdx; lo limb and'ed
adox r9, rcx
adox r8, rbx
mov rcx, 0x1000003d10 ; moving imm to reg
mov rdx, rcx; 0x1000003d10 to rdx
mulx rbx, rcx, rbp; x38_1, x38_0<- x37 * 0x1000003d10 (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x38 ], r8; spilling x66_1 to mem
mulx r8, rbp, [ rsi + 0x10 ]; x113_1, x113_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x30 ], r8; spilling x113_1 to mem
mov [ rsp - 0x28 ], rbp; spilling x113_0 to mem
mulx rbp, r8, [ rsi + 0x8 ]; x23_1, x23_0<- arg2[2] * arg1[1] (_0*_0)
adcx r10, rcx
adcx rbx, r11
test al, al
adox r8, r10
adox rbx, rbp
adcx r15, r8
adcx rbx, rdi
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx rdi, r11, [ rsi + 0x18 ]; x36_1, x36_0<- arg2[0] * arg1[3] (_0*_0)
xor rdx, rdx
adox r11, r15
adox rbx, rdi
mov rcx, r11;
shrd r11, rbx, 0x34; lo
shr rbx, 0x34; x43_1>>=0x34
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r10, rbp, [ rsi + 0x8 ]; x48_1, x48_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r15, r8, [ rsi + 0x0 ]; x47_1, x47_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, 0x1000003d10000 ; moving imm to reg
mulx rbx, rdi, r12; x52_1, x52_0<- x10 * 0x1000003d10000 (_0*_0)
xor r12, r12
adox r8, rdi
adox rbx, r15
adcx rbp, r8
adcx rbx, r10
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r15, r10, [ rax + 0x8 ]; x50_1, x50_0<- arg1[3] * arg2[1] (_0*_0)
mov rdx, 0xfffffffffffff ; moving imm to reg
and rcx, rdx; x45 <- x44&0xfffffffffffff
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r8, rdi, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[2] (_0*_0)
adox rdi, rbp
adox rbx, r8
adcx r10, rdi
adcx rbx, r15
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r15, rbp, [ rax + 0x0 ]; x51_1, x51_0<- arg2[0] * arg1[4] (_0*_0)
add rbp, r10; could be done better, if r0 has been u8 as well
adcx rbx, r15
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r11, rdx; lo limb and'ed
adox r11, rbp
adox rbx, r12
mov r8, r11;
shrd r8, rbx, 0x34; lo
shr rbx, 0x34; x59_1>>=0x34
and r8, rdx; lo limb and'ed
mov rdi, r11;
shr rdi, 0x30; x72 <- x60>> 0x30
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r15, r10, [ rsi + 0x10 ]; x86_1, x86_0<- arg1[2] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbx, rbp, [ rax + 0x8 ]; x65_1, x65_0<- arg2[1] * arg1[4] (_0*_0)
test al, al
adox r14, r10
adox r15, r13
adcx rbp, r9
adcx rbx, [ rsp - 0x38 ]
mov rdx, rbp;
add rdx, [ rsp - 0x40 ]; could be done better, if r0 has been u8 as well
adcx rbx, [ rsp - 0x48 ]
add r8, rdx; could be done better, if r0 has been u8 as well
adc rbx, 0x0; add CF to r0's alloc
mov r13, r8;
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r10, r9, [ rsi + 0x18 ]; x105_1, x105_0<- arg1[3] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r12, rbp, [ rsi + 0x18 ]; x87_1, x87_0<- arg1[3] * arg2[3] (_0*_0)
mov rdx, 0x4 ; moving imm to reg
mov [ rsp - 0x20 ], rcx; spilling x45 to mem
shlx rcx, r13, rdx; x76 <- x71 * 0x10 (shlx does not change the flags)
mov r13, 0xfffffffffffff0 ; moving imm to reg
and rcx, r13; x77 <- x76&0xfffffffffffff0
adox rbp, r14
adox r15, r12
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r12, r14, [ rax + 0x18 ]; x106_1, x106_0<- arg2[3] * arg1[4] (_0*_0)
adcx r14, r9
adcx r10, r12
shrd r8, rbx, 0x34; lo
shr rbx, 0x34; x70_1>>=0x34
mov rdx, 0x40 ; moving imm to reg
bzhi r9, r8, rdx; x85 <- x70_0 (only least 0x40 bits)
mov r12, 0x4 ; moving imm to reg
bzhi rbx, rdi, r12; x73 <- x72 (only least 0x4 bits)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r8, rdi, [ rsi + 0x0 ]; x94_1, x94_0<- arg2[1] * arg1[0] (_0*_0)
or rcx, rbx; x78 <- x77|x73
adox r9, rbp
mov rdx, 0x0 ; moving imm to reg
adox r15, rdx
mov rbp, 0x1000003d1 ; moving imm to reg
mov rdx, rbp; 0x1000003d1 to rdx
mulx rbx, rbp, rcx; x80_1, x80_0<- x78 * 0x1000003d1 (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r12, rcx, [ rsi + 0x0 ]; x75_1, x75_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, r9;
shrd rdx, r15, 0x34; lo
shr r15, 0x34; x92_1>>=0x34
test al, al
adox rcx, rbp
adox rbx, r12
mov rbp, 0xffffffffffffffff ; moving imm to reg
and rdx, rbp; lo limb and'ed
adox rdx, r14
mov r12, 0x0 ; moving imm to reg
adox r10, r12
mov r14, rdx; preserving value of x108_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx r12, r15, [ rsi + 0x8 ]; x112_1, x112_0<- arg2[1] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx rbp, r13, [ rsi + 0x8 ]; x95_1, x95_0<- arg2[0] * arg1[1] (_0*_0)
adcx rdi, r13
adcx rbp, r8
mov rdx, 0x1000003d10000 ; moving imm to reg
mulx r13, r8, r10; x126_1, x126_0<- x109 * 0x1000003d10000 (_0*_0)
mov r10, 0xfffffffffffff ; moving imm to reg
and r9, r10; lo limb and'ed
mov r10, 0x1000003d10 ; moving imm to reg
mov rdx, r10; 0x1000003d10 to rdx
mov [ rsp - 0x18 ], r13; spilling x126_1 to mem
mulx r13, r10, r9; x98_1, x98_0<- x97 * 0x1000003d10 (_0*_0)
adox r10, rdi
adox rbp, r13
mov rdi, 0xffffffffffffffff ; moving imm to reg
and r14, rdi; lo limb and'ed
mulx r13, r9, r14; x115_1, x115_0<- x114 * 0x1000003d10 (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx rdi, r14, [ rsi + 0x0 ]; x111_1, x111_0<- arg2[2] * arg1[0] (_0*_0)
mov rdx, rcx;
shrd rdx, rbx, 0x34; lo
shr rbx, 0x34; x82_1>>=0x34
xor rbx, rbx
adox r14, r15
adox r12, rdi
mov r15, r14;
adcx r15, [ rsp - 0x28 ]
adcx r12, [ rsp - 0x30 ]
test al, al
adox r9, r15
adox r12, r13
mov r13, 0xffffffffffffffff ; moving imm to reg
and rdx, r13; lo limb and'ed
adox rdx, r10
adox rbp, rbx
mov r10, rdx;
shrd rdx, rbp, 0x34; lo
shr rbp, 0x34; x101_1>>=0x34
and rdx, r13; lo limb and'ed
adox rdx, r9
adox r12, rbx
mov rdi, rdx;
shrd rdi, r12, 0x34; lo
shr r12, 0x34; x120_1>>=0x34
mov r14, 0x30 ; moving imm to reg
bzhi r15, r11, r14; x74 <- x60 (only least 0x30 bits)
mov r11, 0xfffffffffffff ; moving imm to reg
and r10, r11; x103 <- x102&0xfffffffffffff
add rdi, [ rsp - 0x20 ]
test al, al
adox rdi, r8
mov r9, [ rsp - 0x18 ];
adox r9, rbx
mov r8, rdi;
and rdx, r11; x123 <- x122&0xfffffffffffff
and rcx, r11; x84 <- x83&0xfffffffffffff
and r8, r11; x131 <- x130&0xfffffffffffff
shrd rdi, r9, 0x34; lo
shr r9, 0x34; x128_1>>=0x34
lea r15, [ r15 + rdi ]
mov rbp, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbp + 0x0 ], rcx; out1[0] = x84
mov [ rbp + 0x20 ], r15; out1[4] = x132
mov [ rbp + 0x10 ], rdx; out1[2] = x123
mov [ rbp + 0x18 ], r8; out1[3] = x131
mov [ rbp + 0x8 ], r10; out1[1] = x103
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0115
; seed 3169334708595916 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1163879 ms on 160000 evaluations.
; Time spent for assembling and measuring (initial batch_size=286, initial num_batches=31): 105681 ms
; number of used evaluations: 160000
; Ratio (time for assembling + measure)/(total runtime for 160000 evals): 0.09080067601529025
; number reverted permutation / tried permutation: 61250 / 80166 =76.404%
; number reverted decision / tried decision: 48205 / 79833 =60.382%