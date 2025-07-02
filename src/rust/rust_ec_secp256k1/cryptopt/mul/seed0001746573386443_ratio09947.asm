SECTION .text
	GLOBAL rust_ec_secp256k1_mul_inner_CryptOpt
rust_ec_secp256k1_mul_inner_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r11, r10, [ rax + 0x8 ]; x33_1, x33_0<- arg2[1] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r8, rcx, [ rsi + 0x20 ]; x49_1, x49_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x8 ]; x46_1, x46_0<- arg2[3] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rax + 0x8 ]; x48_1, x48_0<- arg2[1] * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rax + 0x0 ]; x34_1, x34_0<- arg2[0] * arg1[3] (_0*_0)
add rcx, rbp; could be done better, if r0 has been u8 as well
adcx r12, r8
xor rdx, rdx
adox r13, r10
adox r11, r14
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r8, r10, [ rax + 0x20 ]; x35_1, x35_0<- arg2[4] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r14, rbp, [ rsi + 0x8 ]; x32_1, x32_0<- arg2[2] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rax + 0x18 ]; x31_1, x31_0<- arg2[3] * arg1[0] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x48 ], rbx; spilling x46_1 to mem
mov [ rsp - 0x40 ], r9; spilling x46_0 to mem
mulx r9, rbx, [ rax + 0x8 ]; x104_1, x104_0<- arg2[1] * arg1[1] (_0*_0)
mov rdx, 0xfffffffffffff ; moving imm to reg
mov [ rsp - 0x38 ], r9; spilling x104_1 to mem
mov r9, r10;
and r9, rdx; lo limb and'ed
adox rbp, r13
adox r11, r14
adcx r15, rbp
adcx r11, rdi
mov r13, 0x1000003d10 ; moving imm to reg
mov rdx, r9; x36_0 to rdx
mulx r14, r9, r13; x37_1, x37_0<- x36 * 0x1000003d10 (_0*_0)
test al, al
adox r9, r15
adox r11, r14
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx rbp, rdi, [ rsi + 0x10 ]; x47_1, x47_0<- arg2[2] * arg1[2] (_0*_0)
mov rdx, r9;
shrd rdx, r11, 0x34; lo
shr r11, 0x34; x43_1>>=0x34
xor r15, r15
adox rdi, rcx
adox r12, rbp
shrd r10, r8, 0x34; lo
shr r8, 0x34; x42_1>>=0x34
mov rcx, rdx; preserving value of x43_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx rbp, r14, [ rax + 0x20 ]; x45_1, x45_0<- arg2[4] * arg1[0] (_0*_0)
mov rdx, rdi;
xor r11, r11
adox rdx, [ rsp - 0x40 ]
adox r12, [ rsp - 0x48 ]
mov r15, 0xffffffffffffffff ; moving imm to reg
and r10, r15; lo limb and'ed
xchg rdx, r13; 0x1000003d10, swapping with x54_0, which is currently in rdx
mulx r8, rdi, r10; x51_1, x51_0<- x50 * 0x1000003d10 (_0*_0)
adox r14, r13
adox r12, rbp
adcx rdi, r14
adcx r12, r8
and rcx, r15; lo limb and'ed
adox rcx, rdi
adox r12, r11
mov rbp, rcx;
shrd rbp, r12, 0x34; lo
shr r12, 0x34; x59_1>>=0x34
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r10, r13, [ rax + 0x10 ]; x66_1, x66_0<- arg2[2] * arg1[3] (_0*_0)
mov rdx, rcx;
and rbp, r15; lo limb and'ed
mov r8, 0x30 ; moving imm to reg
bzhi r14, rcx, r8; x130 <- x57_0 (only least 0x30 bits)
mov rdi, rdx; preserving value of x58 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mulx r12, rcx, [ rsi + 0x10 ]; x65_1, x65_0<- arg2[3] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r8, r11, [ rsi + 0x20 ]; x67_1, x67_0<- arg2[1] * arg1[4] (_0*_0)
shr rdi, 0x30; x60 <- x58>> 0x30
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x30 ], r14; spilling x130_0 to mem
mulx r14, r15, [ rax + 0x20 ]; x64_1, x64_0<- arg2[4] * arg1[1] (_0*_0)
xor rdx, rdx
adox r11, r13
adox r10, r8
adcx rcx, r11
adcx r10, r12
add r15, rcx; could be done better, if r0 has been u8 as well
adcx r10, r14
xor r13, r13
adox rbp, r15
adox r10, r13
mov rdx, rbp;
imul r12, rdx, 0x10; x74 <- x72 * 0x10
mov r8, 0xfffffffffffff0 ; moving imm to reg
and r12, r8; x75 <- x74&0xfffffffffffff0
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r11, r14, [ rsi + 0x20 ]; x89_1, x89_0<- arg2[2] * arg1[4] (_0*_0)
mov rdx, 0xf ; moving imm to reg
and rdi, rdx; x61 <- x60&0xf
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r15, rcx, [ rsi + 0x18 ]; x88_1, x88_0<- arg2[3] * arg1[3] (_0*_0)
or r12, rdi; x76 <- x75|x61
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r13, rdi, [ rax + 0x0 ]; x62_1, x62_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, 0x1000003d1 ; moving imm to reg
mov [ rsp - 0x28 ], rbx; spilling x104_0 to mem
mulx rbx, r8, r12; x78_1, x78_0<- x76 * 0x1000003d1 (_0*_0)
adox rdi, r8
adox rbx, r13
shrd rbp, r10, 0x34; lo
shr r10, 0x34; x73_1>>=0x34
mov r12, 0xffffffffffffffff ; moving imm to reg
and rbp, r12; lo limb and'ed
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r8, r13, [ rax + 0x20 ]; x87_1, x87_0<- arg2[4] * arg1[2] (_0*_0)
mov rdx, rdi;
shrd rdi, rbx, 0x34; lo
shr rbx, 0x34; x82_1>>=0x34
test al, al
adox r14, rcx
adox r15, r11
adcx r13, r14
adcx r15, r8
add rbp, r13; could be done better, if r0 has been u8 as well
adc r15, 0x0; add CF to r0's alloc
mov r11, rbp;
shrd r11, r15, 0x34; lo
shr r15, 0x34; x98_1>>=0x34
mov rcx, rdx; preserving value of x80 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx r8, r10, [ rsi + 0x0 ]; x84_1, x84_0<- arg2[1] * arg1[0] (_0*_0)
and r11, r12; lo limb and'ed
mov rdx, 0x34 ; moving imm to reg
bzhi rbx, rcx, rdx; x81 <- x80 (only least 0x34 bits)
bzhi rcx, rbp, rdx; x93 <- x92_0 (only least 0x34 bits)
mov r14, 0x1000003d10 ; moving imm to reg
mov rdx, r14; 0x1000003d10 to rdx
mulx r13, r14, rcx; x94_1, x94_0<- x93 * 0x1000003d10 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r15, rbp, [ rax + 0x0 ]; x85_1, x85_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, 0xfffffffffffff ; moving imm to reg
and r9, rdx; lo limb and'ed
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r12, rcx, [ rax + 0x20 ]; x107_1, x107_0<- arg2[4] * arg1[3] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x20 ], rbx; spilling x81 to mem
mov [ rsp - 0x18 ], r9; spilling x124_0 to mem
mulx r9, rbx, [ rsi + 0x20 ]; x108_1, x108_0<- arg2[3] * arg1[4] (_0*_0)
adox rbx, rcx
adox r12, r9
adcx r11, rbx
adc r12, 0x0; add CF to r0's alloc
mov rdx, r11;
shrd rdx, r12, 0x34; lo
shr r12, 0x34; x117_1>>=0x34
add rbp, r10; could be done better, if r0 has been u8 as well
adcx r8, r15
mov r10, 0xffffffffffffffff ; moving imm to reg
and rdi, r10; lo limb and'ed
adox r14, rbp
adox r8, r13
adcx rdi, r14
adc r8, 0x0; add CF to r0's alloc
and rdx, r10; lo limb and'ed
mov r13, rdi;
mov r15, rdx; preserving value of x122_0 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mulx r9, rcx, [ rsi + 0x10 ]; x105_1, x105_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0x1000003d10 ; moving imm to reg
mulx r12, rbx, r15; x123_1, x123_0<- x122 * 0x1000003d10 (_0*_0)
adox rcx, [ rsp - 0x28 ]
adox r9, [ rsp - 0x38 ]
shrd rdi, r8, 0x34; lo
shr r8, 0x34; x101_1>>=0x34
and rdi, r10; lo limb and'ed
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r14, rbp, [ rsi + 0x0 ]; x103_1, x103_0<- arg2[2] * arg1[0] (_0*_0)
mov rdx, 0xfffffffffffff ; moving imm to reg
and r11, rdx; lo limb and'ed
adox rbp, rcx
adox r9, r14
and r13, rdx; x100 <- x99&0xfffffffffffff
mov r15, 0x1000003d10 ; moving imm to reg
mov rdx, r11; x111_0 to rdx
mulx rcx, r11, r15; x112_1, x112_0<- x111 * 0x1000003d10 (_0*_0)
adox r11, rbp
adox r9, rcx
mov r8, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r8 + 0x8 ], r13; out1[1] = x100
adcx rdi, r11
adc r9, 0x0; add CF to r0's alloc
mov r14, rbx;
xor rdx, rdx
adox r14, [ rsp - 0x18 ]
adox r12, rdx
mov rbx, rdi;
shrd rbx, r9, 0x34; lo
shr r9, 0x34; x120_1>>=0x34
and rbx, r10; lo limb and'ed
adox rbx, r14
adox r12, rdx
mov rbp, rbx;
shrd rbx, r12, 0x34; lo
shr r12, 0x34; x129_1>>=0x34
mov r13, 0xfffffffffffff ; moving imm to reg
and rbp, r13; x128 <- x127&0xfffffffffffff
mov rcx, rbx;
adox rcx, [ rsp - 0x30 ]
adox r12, rdx
and rdi, r13; x119 <- x118&0xfffffffffffff
mov [ r8 + 0x10 ], rdi; out1[2] = x119
mov [ r8 + 0x18 ], rbp; out1[3] = x128
mov r11, [ rsp - 0x20 ]; load m64 x81 to register64
mov [ r8 + 0x0 ], r11; out1[0] = x81
mov [ r8 + 0x20 ], rcx; out1[4] = x132
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.9947
; seed 4385336868239970 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1383004 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=276, initial num_batches=31): 121107 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.08756807644807969
; number reverted permutation / tried permutation: 66758 / 89886 =74.270%
; number reverted decision / tried decision: 54192 / 90113 =60.138%