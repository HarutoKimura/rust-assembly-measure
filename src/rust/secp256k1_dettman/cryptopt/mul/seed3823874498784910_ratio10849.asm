SECTION .text
	GLOBAL rust_fiat_secp256k1_dettman_mul_CryptOpt
rust_fiat_secp256k1_dettman_mul_CryptOpt:
sub rsp, 160
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r11, r10, [ rax + 0x0 ]; x113_1, x113_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r8, rcx, [ rax + 0x20 ]; x9_1, x9_0<- arg2[4] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x0 ]; x16_1, x16_0<- arg2[3] * arg1[0] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rax + 0x0 ]; x36_1, x36_0<- arg2[0] * arg1[3] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rsi + 0x8 ]; x112_1, x112_0<- arg2[1] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rsi + 0x18 ]; x64_1, x64_0<- arg1[3] * arg2[2] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x48 ], rdi; spilling x64_1 to mem
mov [ rsp - 0x40 ], r15; spilling x64_0 to mem
mulx r15, rdi, [ rax + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rcx, rdx; lo limb and'ed
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x38 ], r15; spilling x49_1 to mem
mov [ rsp - 0x30 ], rdi; spilling x49_0 to mem
mulx rdi, r15, [ rsi + 0x20 ]; x51_1, x51_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, 0x1000003d10 ; moving imm to reg
mov [ rsp - 0x28 ], rdi; spilling x51_1 to mem
mov [ rsp - 0x20 ], r15; spilling x51_0 to mem
mulx r15, rdi, rcx; x38_1, x38_0<- x37 * 0x1000003d10 (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x18 ], r8; spilling x10 to mem
mulx r8, rcx, [ rsi + 0x0 ]; x111_1, x111_0<- arg2[2] * arg1[0] (_0*_0)
adox r9, rdi
adox r15, rbx
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx rdi, rbx, [ rsi + 0x8 ]; x23_1, x23_0<- arg2[2] * arg1[1] (_0*_0)
adcx rcx, r13
adcx r14, r8
add rbx, r9; could be done better, if r0 has been u8 as well
adcx r15, rdi
xor rdx, rdx
adox r10, rcx
adox r14, r11
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r13, r11, [ rsi + 0x10 ]; x30_1, x30_0<- arg2[1] * arg1[2] (_0*_0)
adcx r11, rbx
adcx r15, r13
test al, al
adox rbp, r11
adox r15, r12
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r8, r12, [ rsi + 0x10 ]; x86_1, x86_0<- arg1[2] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rdi, r9, [ rax + 0x10 ]; x88_1, x88_0<- arg2[2] * arg1[4] (_0*_0)
mov rdx, rbp;
mov rcx, rdx; preserving value of x44 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mulx r13, rbx, [ rsi + 0x8 ]; x48_1, x48_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp - 0x10 ], r14; spilling x117_1 to mem
mulx r14, r11, [ rsi + 0x0 ]; x47_1, x47_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, 0x1000003d10000 ; moving imm to reg
mov [ rsp - 0x8 ], r10; spilling x117_0 to mem
mov [ rsp + 0x0 ], rcx; spilling x44 to mem
mulx rcx, r10, [ rsp - 0x18 ]; x52_1, x52_0<- x10 * 0x1000003d10000 (_0*_0)
adcx r11, r10
adcx rcx, r14
add rbx, r11; could be done better, if r0 has been u8 as well
adcx rcx, r13
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r14, r13, [ rax + 0x18 ]; x87_1, x87_0<- arg1[3] * arg2[3] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r11, r10, [ rax + 0x18 ]; x63_1, x63_0<- arg1[2] * arg2[3] (_0*_0)
test al, al
adox r9, r12
adox r8, rdi
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rdi, r12, [ rax + 0x8 ]; x50_1, x50_0<- arg1[3] * arg2[1] (_0*_0)
mov rdx, rbx;
adcx rdx, [ rsp - 0x30 ]
adcx rcx, [ rsp - 0x38 ]
add r12, rdx; could be done better, if r0 has been u8 as well
adcx rcx, rdi
test al, al
adox r13, r9
adox r8, r14
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r14, rbx, [ rsi + 0x8 ]; x62_1, x62_0<- arg1[1] * arg2[4] (_0*_0)
mov rdx, r12;
adcx rdx, [ rsp - 0x20 ]
adcx rcx, [ rsp - 0x28 ]
mov r9, rdx; preserving value of x57_0 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx r12, rdi, [ rax + 0x8 ]; x65_1, x65_0<- arg2[1] * arg1[4] (_0*_0)
shrd rbp, r15, 0x34; lo
shr r15, 0x34; x43_1>>=0x34
xor rdx, rdx
adox rbx, r10
adox r11, r14
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r14, r10, [ rsi + 0x20 ]; x106_1, x106_0<- arg2[3] * arg1[4] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rbp, rdx; lo limb and'ed
adox rbp, r9
mov r15, 0x0 ; moving imm to reg
adox rcx, r15
mov r9, rbp;
mov r15, 0xfffffffffffff ; moving imm to reg
mov rdx, [ rsp + 0x0 ];
and rdx, r15; x45 <- x44&0xfffffffffffff
adox rdi, rbx
adox r11, r12
shrd rbp, rcx, 0x34; lo
shr rcx, 0x34; x59_1>>=0x34
mov r12, 0x40 ; moving imm to reg
bzhi rbx, rbp, r12; x61 <- x59_0 (only least 0x40 bits)
mov rcx, 0xffffffffffff ; moving imm to reg
mov rbp, r9;
and rbp, rcx; x74 <- x60&0xffffffffffff
mov r12, rdi;
adox r12, [ rsp - 0x40 ]
adox r11, [ rsp - 0x48 ]
adcx rbx, r12
adc r11, 0x0; add CF to r0's alloc
mov rdi, rbx;
shrd rbx, r11, 0x34; lo
shr r11, 0x34; x70_1>>=0x34
mov r12, 0x40 ; moving imm to reg
bzhi rcx, rbx, r12; x85 <- x70_0 (only least 0x40 bits)
mov r11, rdx; preserving value of x45 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r12, rbx, [ rax + 0x0 ]; x95_1, x95_0<- arg2[0] * arg1[1] (_0*_0)
shr r9, 0x30; x72 <- x60>> 0x30
mov rdx, 0x4 ; moving imm to reg
shlx r15, rdi, rdx; x76 <- x71 * 0x10 (shlx does not change the flags)
xor rdi, rdi
adox rcx, r13
adox r8, rdi
mov r13, rcx;
shrd r13, r8, 0x34; lo
shr r8, 0x34; x92_1>>=0x34
bzhi r8, r9, rdx; x73 <- x72 (only least 0x4 bits)
mov r9, 0x34 ; moving imm to reg
bzhi rdi, rcx, r9; x97 <- x91_0 (only least 0x34 bits)
mov rcx, 0xffffffffffffffff ; moving imm to reg
and r13, rcx; lo limb and'ed
mov rdx, 0xfffffffffffff0 ; moving imm to reg
and r15, rdx; x77 <- x76&0xfffffffffffff0
or r15, r8; x78 <- x77|x73
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rcx, r8, [ rax + 0x0 ]; x75_1, x75_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0x8 ], rbp; spilling x74 to mem
mulx rbp, r9, [ rsi + 0x18 ]; x105_1, x105_0<- arg1[3] * arg2[4] (_0*_0)
mov rdx, 0x1000003d1 ; moving imm to reg
mov [ rsp + 0x10 ], r11; spilling x45 to mem
mov [ rsp + 0x18 ], rcx; spilling x75_1 to mem
mulx rcx, r11, r15; x80_1, x80_0<- x78 * 0x1000003d1 (_0*_0)
adox r10, r9
adox rbp, r14
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r15, r14, [ rax + 0x8 ]; x94_1, x94_0<- arg2[1] * arg1[0] (_0*_0)
adcx r13, r10
adc rbp, 0x0; add CF to r0's alloc
xor rdx, rdx
adox r14, rbx
adox r12, r15
mov rbx, 0x1000003d10 ; moving imm to reg
mov rdx, rbx; 0x1000003d10 to rdx
mulx r9, rbx, rdi; x98_1, x98_0<- x97 * 0x1000003d10 (_0*_0)
adcx rbx, r14
adcx r12, r9
test al, al
adox r8, r11
adox rcx, [ rsp + 0x18 ]
mov rdi, r8;
shrd rdi, rcx, 0x34; lo
shr rcx, 0x34; x82_1>>=0x34
mov r11, 0x1000003d10000 ; moving imm to reg
mov rdx, rbp; x109 to rdx
mulx r10, rbp, r11; x126_1, x126_0<- x109 * 0x1000003d10000 (_0*_0)
mov r15, 0xffffffffffffffff ; moving imm to reg
and rdi, r15; lo limb and'ed
adox rdi, rbx
mov rdx, 0x0 ; moving imm to reg
adox r12, rdx
mov r14, rdi;
shrd r14, r12, 0x34; lo
shr r12, 0x34; x101_1>>=0x34
mov r9, 0xfffffffffffff ; moving imm to reg
and r8, r9; x84 <- x83&0xfffffffffffff
and r13, r15; lo limb and'ed
mov rbx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbx + 0x0 ], r8; out1[0] = x84
mov rcx, 0x1000003d10 ; moving imm to reg
mov rdx, r13; x114_0 to rdx
mulx r12, r13, rcx; x115_1, x115_0<- x114 * 0x1000003d10 (_0*_0)
adox r13, [ rsp - 0x8 ]
adox r12, [ rsp - 0x10 ]
and r14, r15; lo limb and'ed
adox r14, r13
mov r8, 0x0 ; moving imm to reg
adox r12, r8
and rdi, r9; x103 <- x102&0xfffffffffffff
mov rdx, r14;
shrd rdx, r12, 0x34; lo
shr r12, 0x34; x120_1>>=0x34
add rdx, [ rsp + 0x10 ]
mov [ rbx + 0x8 ], rdi; out1[1] = x103
test al, al
adox rdx, rbp
adox r10, r8
mov rbp, rdx;
shrd rbp, r10, 0x34; lo
shr r10, 0x34; x128_1>>=0x34
and r14, r9; x123 <- x122&0xfffffffffffff
and rdx, r9; x131 <- x130&0xfffffffffffff
mov [ rbx + 0x10 ], r14; out1[2] = x123
add rbp, [ rsp + 0x8 ]
mov [ rbx + 0x20 ], rbp; out1[4] = x132
mov [ rbx + 0x18 ], rdx; out1[3] = x131
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 160
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0849
; seed 3823874498784910 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 18281 ms on 2000 evaluations.
; Time spent for assembling and measuring (initial batch_size=260, initial num_batches=31): 1413 ms
; number of used evaluations: 2000
; Ratio (time for assembling + measure)/(total runtime for 2000 evals): 0.07729336469558558
; number reverted permutation / tried permutation: 712 / 1000 =71.200%
; number reverted decision / tried decision: 621 / 999 =62.162%