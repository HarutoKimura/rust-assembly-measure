SECTION .text
	GLOBAL rust_ec_secp256k1_mul_inner_CryptOpt
rust_ec_secp256k1_mul_inner_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx r11, r10, [ rax + 0x20 ]; x35_1, x35_0<- arg2[4] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r8, rcx, [ rax + 0x0 ]; x34_1, x34_0<- arg2[0] * arg1[3] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x20 ]; x49_1, x49_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x18 ]; x107_1, x107_0<- arg2[4] * arg1[3] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rsi + 0x18 ]; x48_1, x48_0<- arg2[1] * arg1[3] (_0*_0)
mov rdx, r10;
shrd rdx, r11, 0x34; lo
shr r11, 0x34; x42_1>>=0x34
mov r11, rdx; preserving value of x42_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rsi + 0x10 ]; x33_1, x33_0<- arg2[1] * arg1[2] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r11, rdx; lo limb and'ed
adox rcx, r15
adox rdi, r8
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r15, r8, [ rsi + 0x8 ]; x32_1, x32_0<- arg2[2] * arg1[1] (_0*_0)
adcx r8, rcx
adcx rdi, r15
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r15, rcx, [ rax + 0x18 ]; x31_1, x31_0<- arg2[3] * arg1[0] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x48 ], r12; spilling x107_1 to mem
mov [ rsp - 0x40 ], rbp; spilling x107_0 to mem
mulx rbp, r12, [ rax + 0x0 ]; x105_1, x105_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0xfffffffffffff ; moving imm to reg
and r10, rdx; lo limb and'ed
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x38 ], rbp; spilling x105_1 to mem
mov [ rsp - 0x30 ], r12; spilling x105_0 to mem
mulx r12, rbp, [ rsi + 0x8 ]; x85_1, x85_0<- arg2[0] * arg1[1] (_0*_0)
adox rcx, r8
adox rdi, r15
mov rdx, 0x1000003d10 ; moving imm to reg
mulx r15, r8, r10; x37_1, x37_0<- x36 * 0x1000003d10 (_0*_0)
adcx r8, rcx
adcx rdi, r15
mov r10, r8;
shrd r10, rdi, 0x34; lo
shr rdi, 0x34; x43_1>>=0x34
xor rcx, rcx
adox r9, r13
adox r14, rbx
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r13, rbx, [ rax + 0x18 ]; x46_1, x46_0<- arg2[3] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx rdi, r15, [ rsi + 0x10 ]; x47_1, x47_0<- arg2[2] * arg1[2] (_0*_0)
adcx r15, r9
adcx r14, rdi
test al, al
adox rbx, r15
adox r14, r13
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r13, r9, [ rax + 0x20 ]; x45_1, x45_0<- arg2[4] * arg1[0] (_0*_0)
adcx r9, rbx
adcx r14, r13
mov rdx, 0xfffffffffffff ; moving imm to reg
and r8, rdx; lo limb and'ed
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r15, rdi, [ rax + 0x8 ]; x67_1, x67_0<- arg2[1] * arg1[4] (_0*_0)
mov rdx, 0x1000003d10 ; moving imm to reg
mulx r13, rbx, r11; x51_1, x51_0<- x50 * 0x1000003d10 (_0*_0)
adox rbx, r9
adox r14, r13
mov r11, 0xffffffffffffffff ; moving imm to reg
and r10, r11; lo limb and'ed
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r13, r9, [ rsi + 0x18 ]; x66_1, x66_0<- arg2[2] * arg1[3] (_0*_0)
adox r10, rbx
adox r14, rcx
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx rcx, rbx, [ rsi + 0x10 ]; x65_1, x65_0<- arg2[3] * arg1[2] (_0*_0)
mov rdx, r10;
mov r11, rdx; preserving value of x58 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mov [ rsp - 0x28 ], r8; spilling x124_0 to mem
mov [ rsp - 0x20 ], r12; spilling x85_1 to mem
mulx r12, r8, [ rsi + 0x20 ]; x89_1, x89_0<- arg2[2] * arg1[4] (_0*_0)
adcx rdi, r9
adcx r13, r15
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r9, r15, [ rax + 0x20 ]; x64_1, x64_0<- arg2[4] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x18 ], rbp; spilling x85_0 to mem
mov [ rsp - 0x10 ], r11; spilling x58 to mem
mulx r11, rbp, [ rsi + 0x18 ]; x88_1, x88_0<- arg2[3] * arg1[3] (_0*_0)
add rbx, rdi; could be done better, if r0 has been u8 as well
adcx r13, rcx
mov rdx, r10;
shrd rdx, r14, 0x34; lo
shr r14, 0x34; x59_1>>=0x34
mov rcx, rdx; preserving value of x59_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r14, rdi, [ rax + 0x20 ]; x87_1, x87_0<- arg2[4] * arg1[2] (_0*_0)
add r15, rbx; could be done better, if r0 has been u8 as well
adcx r13, r9
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rcx, rdx; lo limb and'ed
adox rcx, r15
mov r9, 0x0 ; moving imm to reg
adox r13, r9
mov rbx, rcx;
shl rbx, 0x4; x74 <- x72 * 0x10
xor r15, r15
adox r8, rbp
adox r11, r12
adcx rdi, r8
adcx r11, r14
shrd rcx, r13, 0x34; lo
shr r13, 0x34; x73_1>>=0x34
and rcx, rdx; lo limb and'ed
adox rcx, rdi
adox r11, r15
mov r9, 0xfffffffffffff0 ; moving imm to reg
and rbx, r9; x75 <- x74&0xfffffffffffff0
mov r12, rcx;
shrd r12, r11, 0x34; lo
shr r11, 0x34; x98_1>>=0x34
and r12, rdx; lo limb and'ed
mov rbp, [ rsp - 0x10 ];
shr rbp, 0x30; x60 <- x58>> 0x30
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r8, r14, [ rsi + 0x20 ]; x108_1, x108_0<- arg2[3] * arg1[4] (_0*_0)
xor rdx, rdx
adox r14, [ rsp - 0x40 ]
adox r8, [ rsp - 0x48 ]
adcx r12, r14
adc r8, 0x0; add CF to r0's alloc
mov r15, 0xfffffffffffff ; moving imm to reg
mov rdi, r12;
and rdi, r15; lo limb and'ed
mov r13, 0xf ; moving imm to reg
and rbp, r13; x61 <- x60&0xf
shrd r12, r8, 0x34; lo
shr r8, 0x34; x117_1>>=0x34
or rbx, rbp; x76 <- x75|x61
mov r11, 0x1000003d1 ; moving imm to reg
mov rdx, r11; 0x1000003d1 to rdx
mulx r14, r11, rbx; x78_1, x78_0<- x76 * 0x1000003d1 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r8, rbp, [ rax + 0x0 ]; x62_1, x62_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r13, rbx, [ rsi + 0x0 ]; x103_1, x103_0<- arg2[2] * arg1[0] (_0*_0)
adox rbp, r11
adox r14, r8
mov rdx, rbp;
shrd rdx, r14, 0x34; lo
shr r14, 0x34; x82_1>>=0x34
mov r11, 0xffffffffffffffff ; moving imm to reg
and rdx, r11; lo limb and'ed
mov r8, rdx; preserving value of x83_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx r9, r14, [ rsi + 0x8 ]; x104_1, x104_0<- arg2[1] * arg1[1] (_0*_0)
and rcx, r15; lo limb and'ed
mov rdx, r14;
adox rdx, [ rsp - 0x30 ]
adox r9, [ rsp - 0x38 ]
mov r14, rdx; preserving value of x113_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r15, r11, [ rax + 0x8 ]; x84_1, x84_0<- arg2[1] * arg1[0] (_0*_0)
adcx rbx, r14
adcx r9, r13
mov rdx, 0x1000003d10 ; moving imm to reg
mulx r14, r13, rdi; x112_1, x112_0<- x111 * 0x1000003d10 (_0*_0)
xor rdi, rdi
adox r13, rbx
adox r9, r14
mulx r14, rbx, rcx; x94_1, x94_0<- x93 * 0x1000003d10 (_0*_0)
mov rcx, r11;
adcx rcx, [ rsp - 0x18 ]
adcx r15, [ rsp - 0x20 ]
xor r11, r11
adox rbx, rcx
adox r15, r14
adcx r8, rbx
adc r15, 0x0; add CF to r0's alloc
mov rdi, r8;
shrd rdi, r15, 0x34; lo
shr r15, 0x34; x101_1>>=0x34
mov r14, 0xffffffffffffffff ; moving imm to reg
and rdi, r14; lo limb and'ed
adox rdi, r13
adox r9, r11
mov r13, rdi;
shrd r13, r9, 0x34; lo
shr r9, 0x34; x120_1>>=0x34
and r12, r14; lo limb and'ed
mulx rbx, rcx, r12; x123_1, x123_0<- x122 * 0x1000003d10 (_0*_0)
mov r15, 0x30 ; moving imm to reg
bzhi r9, r10, r15; x130 <- x57_0 (only least 0x30 bits)
mov r10, rcx;
adox r10, [ rsp - 0x28 ]
adox rbx, r11
and r13, r14; lo limb and'ed
adox r13, r10
adox rbx, r11
mov r12, r13;
shrd r12, rbx, 0x34; lo
shr rbx, 0x34; x129_1>>=0x34
xor rcx, rcx
adox r9, r12
adox rbx, rcx
mov r11, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r11 + 0x20 ], r9; out1[4] = x132
mov r10, 0xfffffffffffff ; moving imm to reg
and r13, r10; x128 <- x127&0xfffffffffffff
mov [ r11 + 0x18 ], r13; out1[3] = x128
and r8, r10; x100 <- x99&0xfffffffffffff
mov [ r11 + 0x8 ], r8; out1[1] = x100
and rbp, r10; x81 <- x80&0xfffffffffffff
mov [ r11 + 0x0 ], rbp; out1[0] = x81
and rdi, r10; x119 <- x118&0xfffffffffffff
mov [ r11 + 0x10 ], rdi; out1[2] = x119
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0493
; seed 0392477331301992 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 6121922 ms on 800000 evaluations.
; Time spent for assembling and measuring (initial batch_size=276, initial num_batches=31): 548066 ms
; number of used evaluations: 800000
; Ratio (time for assembling + measure)/(total runtime for 800000 evals): 0.08952515239495047
; number reverted permutation / tried permutation: 295120 / 400056 =73.770%
; number reverted decision / tried decision: 240280 / 399943 =60.079%