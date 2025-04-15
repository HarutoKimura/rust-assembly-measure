SECTION .text
	GLOBAL rust_fiat_secp256k1_dettman_square_CryptOpt
rust_fiat_secp256k1_dettman_square_CryptOpt:
mov rax, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov r10, rax; load m64 x10 to register64
shl r10, 0x1; x10 <- arg1[1] * 0x2
mov rax, [ rsi + 0x0 ]; load m64 arg1[0] to register64
mov r11, rax; load m64 x12 to register64
shl r11, 0x1; x12 <- arg1[0] * 0x2
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rcx, rax, r10; x33_1, x33_0<- x10 * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r9, r8, rdx; x54_1, x54_0<- arg1[0]^2
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, rdx; x16_1, x16_0<- arg1[4]^2
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, r11; x86_1, x86_0<- x12 * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, r11; x20_1, x20_0<- x12 * arg1[3] (_0*_0)
mov rdx, r10; x10 to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r10, [ rsi + 0x10 ]; x23_1, x23_0<- x10 * arg1[2] (_0*_0)
test al, al
adox r10, r14
adox r15, rdi
mulx rdi, r14, [ rsi + 0x20 ]; x43_1, x43_0<- arg1[4] * x10 (_0*_0)
mov rdx, 0xfffffffffffffffd ; moving imm to reg
and rbx, rdx; lo limb and'ed
mov rdx, 0x1000003d10 ; moving imm to reg
mov [ rsp - 0x48 ], r9; spilling x54_1 to mem
mov [ rsp - 0x40 ], r8; spilling x54_0 to mem
mulx r8, r9, rbx; x26_1, x26_0<- x25 * 0x1000003d10 (_0*_0)
mov rbx, [ rsi + 0x10 ]; load m64 arg1[2] to register64
mov rdx, rbx; load m64 x7 to register64
shl rdx, 0x1; x7 <- arg1[2] * 0x2
mov rbx, rdx; preserving value of x7 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp - 0x38 ], r13; spilling x86_1 to mem
mov [ rsp - 0x30 ], r12; spilling x86_0 to mem
mulx r12, r13, rdx; x34_1, x34_0<- arg1[2]^2
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x28 ], rdi; spilling x43_1 to mem
mov [ rsp - 0x20 ], r14; spilling x43_0 to mem
mulx r14, rdi, rbx; x65_1, x65_0<- arg1[4] * x7 (_0*_0)
xor rdx, rdx
adox r9, r10
adox r15, r8
mov rdx, r11; x12 to rdx
mulx r10, r11, [ rsi + 0x20 ]; x32_1, x32_0<- x12 * arg1[4] (_0*_0)
mov r8, r9;
shrd r8, r15, 0x34; lo
shr r15, 0x34; x28_1>>=0x34
xor r15, r15
adox r13, rax
adox rcx, r12
adcx r11, r13
adcx rcx, r10
mulx r12, rax, [ rsi + 0x8 ]; x72_1, x72_0<- x12 * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x18 ]; load m64 arg1[3] to register64
lea r10, [rdx + rdx]; x4 <- arg1[3] * 2 
mov rdx, 0x1000003d10000 ; moving imm to reg
mulx r15, r13, rbp; x37_1, x37_0<- x17 * 0x1000003d10000 (_0*_0)
xor rbp, rbp
adox r13, r11
adox rcx, r15
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r15, r11, r10; x82_1, x82_0<- arg1[4] * x4 (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r8, rdx; lo limb and'ed
adox r8, r13
adox rcx, rbp
mov r10, r8;
shrd r10, rcx, 0x34; lo
shr rcx, 0x34; x40_1>>=0x34
and r10, rdx; lo limb and'ed
mov rdx, rbx; x7 to rdx
mulx r13, rbx, [ rsi + 0x18 ]; x45_1, x45_0<- x7 * arg1[3] (_0*_0)
mov rdx, r8;
shr rdx, 0x30; x50 <- x41>> 0x30
mov rcx, rdx; preserving value of x50 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mov [ rsp - 0x18 ], r12; spilling x72_1 to mem
mulx r12, rbp, rdx; x87_1, x87_0<- arg1[1]^2
xor rdx, rdx
adox rbx, [ rsp - 0x20 ]
adox r13, [ rsp - 0x28 ]
adcx r10, rbx
adc r13, 0x0; add CF to r0's alloc
mov rbx, r10;
imul rdx, rbx, 0x10; x55 <- x49 * 0x10
mov rbx, rdx; preserving value of x55 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mov [ rsp - 0x10 ], r9; spilling x29 to mem
mov [ rsp - 0x8 ], rax; spilling x72_0 to mem
mulx rax, r9, rdx; x66_1, x66_0<- arg1[3]^2
xor rdx, rdx
adox r9, rdi
adox r14, rax
shrd r10, r13, 0x34; lo
shr r13, 0x34; x48_1>>=0x34
mov rdi, 0xffffffffffffffff ; moving imm to reg
and r10, rdi; lo limb and'ed
mov rax, 0xfffffffffffff0 ; moving imm to reg
and rbx, rax; x56 <- x55&0xfffffffffffff0
adox r10, r9
adox r14, rdx
mov r9, r10;
shrd r9, r14, 0x34; lo
shr r14, 0x34; x69_1>>=0x34
and r9, rdi; lo limb and'ed
adox r11, r9
adox r15, rdx
and r11, rdi; lo limb and'ed
mov r13, 0xfffffffffffff ; moving imm to reg
and r10, r13; lo limb and'ed
mov r14, 0x4 ; moving imm to reg
bzhi r9, rcx, r14; x51 <- x50 (only least 0x4 bits)
mov rcx, 0x1000003d10 ; moving imm to reg
mov rdx, rcx; 0x1000003d10 to rdx
mulx r14, rcx, r10; x74_1, x74_0<- x73 * 0x1000003d10 (_0*_0)
mulx r13, r10, r11; x90_1, x90_0<- x89 * 0x1000003d10 (_0*_0)
adox rbp, [ rsp - 0x30 ]
adox r12, [ rsp - 0x38 ]
test al, al
adox r10, rbp
adox r12, r13
or rbx, r9; x57 <- x56|x51
mov r11, 0x1000003d1 ; moving imm to reg
mov rdx, r11; 0x1000003d1 to rdx
mulx r9, r11, rbx; x59_1, x59_0<- x57 * 0x1000003d1 (_0*_0)
mov r13, r11;
adox r13, [ rsp - 0x40 ]
adox r9, [ rsp - 0x48 ]
mov rbp, r13;
shrd rbp, r9, 0x34; lo
shr r9, 0x34; x61_1>>=0x34
mov rbx, rcx;
add rbx, [ rsp - 0x8 ]; could be done better, if r0 has been u8 as well
adcx r14, [ rsp - 0x18 ]
and rbp, rdi; lo limb and'ed
adox rbp, rbx
mov rcx, 0x0 ; moving imm to reg
adox r14, rcx
mov r11, rbp;
shrd rbp, r14, 0x34; lo
shr r14, 0x34; x77_1>>=0x34
and rbp, rdi; lo limb and'ed
adox rbp, r10
adox r12, rcx
mov r10, rbp;
shrd r10, r12, 0x34; lo
shr r12, 0x34; x93_1>>=0x34
mov r9, 0xffffffffffffe ; moving imm to reg
mov rbx, [ rsp - 0x10 ];
and rbx, r9; x30 <- x29&0xffffffffffffe
mov r14, 0x1000003d10000 ; moving imm to reg
mov rdx, r15; x84 to rdx
mulx r12, r15, r14; x99_1, x99_0<- x84 * 0x1000003d10000 (_0*_0)
lea rbx, [ rbx + r10 ]
adox rbx, r15
adox r12, rcx
mov r10, rbx;
shrd r10, r12, 0x34; lo
shr r12, 0x34; x101_1>>=0x34
mov rdx, 0xfffffffffffff ; moving imm to reg
and r13, rdx; x63 <- x62&0xfffffffffffff
mov r15, 0xffffffffffff ; moving imm to reg
and r8, r15; x52 <- x41&0xffffffffffff
lea r8, [ r8 + r10 ]
and rbx, rdx; x104 <- x103&0xfffffffffffff
mov r12, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r12 + 0x20 ], r8; out1[4] = x105
mov [ r12 + 0x18 ], rbx; out1[3] = x104
and rbp, rdx; x96 <- x95&0xfffffffffffff
and r11, rdx; x79 <- x78&0xfffffffffffff
mov [ r12 + 0x8 ], r11; out1[1] = x79
mov [ r12 + 0x10 ], rbp; out1[2] = x96
mov [ r12 + 0x0 ], r13; out1[0] = x63
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.9462
; seed 1950212058579692 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 49049 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=375, initial num_batches=31): 5087 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.10371261391669555
; number reverted permutation / tried permutation: 3004 / 3933 =76.379%
; number reverted decision / tried decision: 2862 / 4066 =70.389%