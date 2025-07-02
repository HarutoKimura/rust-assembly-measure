SECTION .text
	GLOBAL rust_fiat_secp256k1_dettman_mul_CryptOpt
rust_fiat_secp256k1_dettman_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x20 ]; saving arg2[4] in rdx.
mulx r11, r10, [ rsi + 0x20 ]; x9_1, x9_0<- arg2[4] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r8, rcx, [ rsi + 0x0 ]; x47_1, x47_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rax + 0x0 ]; x51_1, x51_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rax + 0x0 ]; x113_1, x113_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0x1000003d10000 ; moving imm to reg
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, r11; x52_1, x52_0<- x10 * 0x1000003d10000 (_0*_0)
xor r11, r11
adox rcx, r13
adox r14, r8
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r13, r8, [ rsi + 0x8 ]; x48_1, x48_0<- arg1[1] * arg2[3] (_0*_0)
adcx r8, rcx
adcx r14, r13
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r13, rcx, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r11, [ rsi + 0x20 ]; x106_1, x106_0<- arg2[3] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], r12; spilling x113_1 to mem
mulx r12, rdi, [ rsi + 0x10 ]; x63_1, x63_0<- arg1[2] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x40 ], rbp; spilling x113_0 to mem
mov [ rsp - 0x38 ], r15; spilling x106_1 to mem
mulx r15, rbp, [ rsi + 0x0 ]; x16_1, x16_0<- arg2[3] * arg1[0] (_0*_0)
xor rdx, rdx
adox rcx, r8
adox r14, r13
mov r8, 0xffffffffffffffff ; moving imm to reg
and r10, r8; lo limb and'ed
mov r13, 0x1000003d10 ; moving imm to reg
mov rdx, r13; 0x1000003d10 to rdx
mulx r8, r13, r10; x38_1, x38_0<- x37 * 0x1000003d10 (_0*_0)
adox rbp, r13
adox r8, r15
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r10, r15, [ rsi + 0x8 ]; x23_1, x23_0<- arg2[2] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x30 ], r11; spilling x106_0 to mem
mulx r11, r13, [ rsi + 0x10 ]; x30_1, x30_0<- arg2[1] * arg1[2] (_0*_0)
adcx r15, rbp
adcx r8, r10
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r10, rbp, [ rsi + 0x18 ]; x50_1, x50_0<- arg1[3] * arg2[1] (_0*_0)
add rbp, rcx; could be done better, if r0 has been u8 as well
adcx r14, r10
add r13, r15; could be done better, if r0 has been u8 as well
adcx r8, r11
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r11, rcx, [ rsi + 0x18 ]; x36_1, x36_0<- arg2[0] * arg1[3] (_0*_0)
test al, al
adox rcx, r13
adox r8, r11
mov rdx, rcx;
shrd rdx, r8, 0x34; lo
shr r8, 0x34; x43_1>>=0x34
xor r15, r15
adox r9, rbp
adox r14, rbx
mov rbx, 0xffffffffffffffff ; moving imm to reg
and rdx, rbx; lo limb and'ed
adox rdx, r9
adox r14, r15
mov r10, rdx;
shrd rdx, r14, 0x34; lo
shr r14, 0x34; x59_1>>=0x34
mov rbp, rdx; preserving value of x59_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r11, r13, [ rax + 0x20 ]; x62_1, x62_0<- arg1[1] * arg2[4] (_0*_0)
test al, al
adox r13, rdi
adox r12, r11
and rbp, rbx; lo limb and'ed
mov rdx, r10;
shr rdx, 0x30; x72 <- x60>> 0x30
mov rdi, rdx; preserving value of x72 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mulx r9, r8, [ rax + 0x10 ]; x64_1, x64_0<- arg1[3] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r11, r14, [ rsi + 0x20 ]; x65_1, x65_0<- arg2[1] * arg1[4] (_0*_0)
xor rdx, rdx
adox r14, r13
adox r12, r11
adcx r8, r14
adcx r12, r9
xor r15, r15
adox rbp, r8
adox r12, r15
mov rdx, rbp;
imul r13, rdx, 0x10; x76 <- x71 * 0x10
shrd rbp, r12, 0x34; lo
shr r12, 0x34; x70_1>>=0x34
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r11, r9, [ rsi + 0x10 ]; x86_1, x86_0<- arg1[2] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r8, r14, [ rax + 0x10 ]; x88_1, x88_0<- arg2[2] * arg1[4] (_0*_0)
test al, al
adox r14, r9
adox r11, r8
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r9, r12, [ rsi + 0x8 ]; x95_1, x95_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r15, r8, [ rax + 0x18 ]; x87_1, x87_0<- arg1[3] * arg2[3] (_0*_0)
adcx r8, r14
adcx r11, r15
and rbp, rbx; lo limb and'ed
adox rbp, r8
mov rdx, 0x0 ; moving imm to reg
adox r11, rdx
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r15, r14, [ rsi + 0x0 ]; x94_1, x94_0<- arg2[1] * arg1[0] (_0*_0)
mov rdx, 0xfffffffffffff ; moving imm to reg
mov r8, rbp;
and r8, rdx; lo limb and'ed
adox r14, r12
adox r9, r15
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r15, r12, [ rsi + 0x0 ]; x75_1, x75_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, 0x4 ; moving imm to reg
bzhi rbx, rdi, rdx; x73 <- x72 (only least 0x4 bits)
mov rdi, 0xfffffffffffff0 ; moving imm to reg
and r13, rdi; x77 <- x76&0xfffffffffffff0
or r13, rbx; x78 <- x77|x73
mov rbx, 0x1000003d1 ; moving imm to reg
mov rdx, rbx; 0x1000003d1 to rdx
mulx rdi, rbx, r13; x80_1, x80_0<- x78 * 0x1000003d1 (_0*_0)
adox r12, rbx
adox rdi, r15
mov r15, r12;
shrd r15, rdi, 0x34; lo
shr rdi, 0x34; x82_1>>=0x34
mov r13, 0xffffffffffffffff ; moving imm to reg
and r15, r13; lo limb and'ed
mov rbx, 0x1000003d10 ; moving imm to reg
mov rdx, r8; x97_0 to rdx
mulx rdi, r8, rbx; x98_1, x98_0<- x97 * 0x1000003d10 (_0*_0)
adox r8, r14
adox r9, rdi
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx rdi, r14, [ rsi + 0x0 ]; x111_1, x111_0<- arg2[2] * arg1[0] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r13, rbx, [ rsi + 0x8 ]; x112_1, x112_0<- arg2[1] * arg1[1] (_0*_0)
shrd rbp, r11, 0x34; lo
shr r11, 0x34; x92_1>>=0x34
xor rdx, rdx
adox r15, r8
adox r9, rdx
mov r8, 0xffffffffffffffff ; moving imm to reg
and rbp, r8; lo limb and'ed
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r8, r11, [ rsi + 0x18 ]; x105_1, x105_0<- arg1[3] * arg2[4] (_0*_0)
mov rdx, r11;
adox rdx, [ rsp - 0x30 ]
adox r8, [ rsp - 0x38 ]
adcx rbp, rdx
adc r8, 0x0; add CF to r0's alloc
mov r11, 0xffffffffffffffff ; moving imm to reg
and rbp, r11; lo limb and'ed
adox r14, rbx
adox r13, rdi
mov rdi, r14;
adcx rdi, [ rsp - 0x40 ]
adcx r13, [ rsp - 0x48 ]
mov rbx, 0x1000003d10 ; moving imm to reg
mov rdx, rbx; 0x1000003d10 to rdx
mulx r14, rbx, rbp; x115_1, x115_0<- x114 * 0x1000003d10 (_0*_0)
xor rbp, rbp
adox rbx, rdi
adox r13, r14
mov rdi, r15;
shrd rdi, r9, 0x34; lo
shr r9, 0x34; x101_1>>=0x34
and rdi, r11; lo limb and'ed
adox rdi, rbx
adox r13, rbp
mov r14, rdi;
shrd r14, r13, 0x34; lo
shr r13, 0x34; x120_1>>=0x34
mov rbx, 0xfffffffffffff ; moving imm to reg
and rcx, rbx; x45 <- x44&0xfffffffffffff
lea rcx, [ rcx + r14 ]
mov r9, 0x1000003d10000 ; moving imm to reg
mov rdx, r9; 0x1000003d10000 to rdx
mulx r13, r9, r8; x126_1, x126_0<- x109 * 0x1000003d10000 (_0*_0)
adox rcx, r9
adox r13, rbp
mov r14, rcx;
shrd rcx, r13, 0x34; lo
shr r13, 0x34; x128_1>>=0x34
mov r8, 0x30 ; moving imm to reg
bzhi r9, r10, r8; x74 <- x60 (only least 0x30 bits)
and rdi, rbx; x123 <- x122&0xfffffffffffff
and r15, rbx; x103 <- x102&0xfffffffffffff
mov r10, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r10 + 0x10 ], rdi; out1[2] = x123
and r12, rbx; x84 <- x83&0xfffffffffffff
lea r9, [ r9 + rcx ]
and r14, rbx; x131 <- x130&0xfffffffffffff
mov [ r10 + 0x20 ], r9; out1[4] = x132
mov [ r10 + 0x18 ], r14; out1[3] = x131
mov [ r10 + 0x0 ], r12; out1[0] = x84
mov [ r10 + 0x8 ], r15; out1[1] = x103
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0550
; seed 1136046243264618 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1722172 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=275, initial num_batches=31): 117570 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.06826844240877218
; number reverted permutation / tried permutation: 67745 / 89772 =75.463%
; number reverted decision / tried decision: 54572 / 90227 =60.483%