SECTION .text
	GLOBAL rust_ec_secp256k1_square_CryptOpt
rust_ec_secp256k1_square_CryptOpt:
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r10, rax, [ rsi + 0x20 ]; x43_1, x43_0<- arg1[4] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rcx, r11, [ rsi + 0x0 ]; x16_1, x16_0<- arg1[3] * arg1[0] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r9, r8, rdx; x18_1, x18_0<- arg1[4]^2
mov rdx, 0xffffffffffffd ; moving imm to reg
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, r8;
and rbx, rdx; lo limb and'ed
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x18 ]; x31_1, x31_0<- arg1[3] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rsi + 0x10 ]; x44_1, x44_0<- arg1[3] * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rsi + 0x0 ]; x30_1, x30_0<- arg1[4] * arg1[0] (_0*_0)
adox r13, rax
adox r10, r14
mov rdx, 0x1000003d10 ; moving imm to reg
mulx r14, rax, rbx; x20_1, x20_0<- x19 * 0x1000003d10 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x48 ], r10; spilling x45_1 to mem
mulx r10, rbx, [ rsi + 0x10 ]; x17_1, x17_0<- arg1[2] * arg1[1] (_0*_0)
adcx rbx, r11
adcx rcx, r10
mov rdx, 0x2 ; moving imm to reg
mov [ rsp - 0x40 ], r13; spilling x45_0 to mem
mulx r13, r11, rcx; __,tmp <- (a_0 in rdx) * b_hi
mulx r13, r10, rbx; hi,lo <- (a_0 in rdx) * b_lo
lea r13, [r13+r11]; hi += tmp
xor r11, r11
adox r10, rax
adox r14, r13
mov rax, r10;
shrd rax, r14, 0x34; lo
shr r14, 0x34; x25_1>>=0x34
shrd r8, r9, 0x34; lo
shr r9, 0x34; x24_1>>=0x34
mov rbx, 0xffffffffffffffff ; moving imm to reg
and r8, rbx; lo limb and'ed
mov rcx, 0x1000003d10 ; moving imm to reg
mov rdx, r8; x28_0 to rdx
mulx r13, r8, rcx; x29_1, x29_0<- x28 * 0x1000003d10 (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r9, r14, rdx; x27_1, x27_0<- arg1[2]^2
adox rbp, r15
adox rdi, r12
mov rdx, 0x2 ; moving imm to reg
mulx r11, r12, rdi; __,tmp <- (a_0 in rdx) * b_hi
mulx r11, r15, rbp; hi,lo <- (a_0 in rdx) * b_lo
lea r11, [r11+r12]; hi += tmp
adcx r14, r8
adcx r13, r9
and rax, rbx; lo limb and'ed
adox rax, r14
mov r12, 0x0 ; moving imm to reg
adox r13, r12
adcx r15, rax
adcx r13, r11
mov r8, r15;
mov r9, r15;
shrd r9, r13, 0x34; lo
shr r13, 0x34; x38_1>>=0x34
and r9, rbx; lo limb and'ed
mulx rdi, rbp, [ rsi + 0x10 ]; x62_1, x62_0<- arg1[2] * 0x2 (_0*_0)
mov r11, [ rsp - 0x40 ]; load m64 x45_0 to register64
mov r14, [ rsp - 0x48 ]; load m64 x45_1 to register64
mulx r12, rax, r14; __,tmp <- (a_0 in rdx) * b_hi
mulx r12, r13, r11; hi,lo <- (a_0 in rdx) * b_lo
lea r12, [r12+rax]; hi += tmp
adox r13, r9
mov rax, 0x0 ; moving imm to reg
adox r12, rax
mov r11, r13;
shrd r11, r12, 0x34; lo
shr r12, 0x34; x49_1>>=0x34
and r11, rbx; lo limb and'ed
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r9, r14, rdx; x61_1, x61_0<- arg1[3]^2
mov rdx, [ rsi + 0x20 ]; load m64 arg1[4] to register64
mulx rbx, r12, rdi; __,tmp <- (a_0 in rdx) * b_hi
mulx rbx, rax, rbp; hi,lo <- (a_0 in rdx) * b_lo
lea rbx, [rbx+r12]; hi += tmp
adox r14, rax
adox rbx, r9
mov rdx, 0xffffffffffff ; moving imm to reg
and r15, rdx; lo limb and'ed
adox r11, r14
mov r12, 0x0 ; moving imm to reg
adox rbx, r12
mov rbp, r11;
shrd rbp, rbx, 0x34; lo
shr rbx, 0x34; x72_1>>=0x34
shr r8, 0x30; x39 <- x37>> 0x30
shl r13, 0x4; x50 <- x48 * 0x10
mov rdi, 0xfffffffffffff0 ; moving imm to reg
and r13, rdi; x51 <- x50&0xfffffffffffff0
mov r9, 0xffffffffffffffff ; moving imm to reg
and rbp, r9; lo limb and'ed
mov rax, 0x2 ; moving imm to reg
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rbx, r14, rax; x79_1, x79_0<- arg1[3] * 0x2 (_0*_0)
mov rdx, [ rsi + 0x20 ]; load m64 arg1[4] to register64
mulx r9, r12, rbx; __,tmp <- (a_0 in rdx) * b_hi
mulx r9, rdi, r14; hi,lo <- (a_0 in rdx) * b_lo
lea r9, [r9+r12]; hi += tmp
mov rdx, 0xf ; moving imm to reg
and r8, rdx; x40 <- x39&0xf
or r13, r8; x52 <- x51|x40
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r14, r12, rax; x68_1, x68_0<- arg1[0] * 0x2 (_0*_0)
mov rdx, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mulx rax, rbx, r14; __,tmp <- (a_0 in rdx) * b_hi
mulx rax, r8, r12; hi,lo <- (a_0 in rdx) * b_lo
lea rax, [rax+rbx]; hi += tmp
adox rdi, rbp
mov rdx, 0x0 ; moving imm to reg
adox r9, rdx
mov rbx, rdi;
shrd rbx, r9, 0x34; lo
shr r9, 0x34; x89_1>>=0x34
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r9, rbp, rdx; x41_1, x41_0<- arg1[0]^2
mov rdx, 0x1000003d1 ; moving imm to reg
mov [ rsp - 0x38 ], r15; spilling x102_0 to mem
mulx r15, rcx, r13; x54_1, x54_0<- x52 * 0x1000003d1 (_0*_0)
xor r13, r13
adox rbp, rcx
adox r15, r9
mov r9, rbp;
shrd r9, r15, 0x34; lo
shr r15, 0x34; x58_1>>=0x34
mov rcx, 0xfffffffffffff ; moving imm to reg
and r11, rcx; lo limb and'ed
mov r15, 0x1000003d10 ; moving imm to reg
mov rdx, r15; 0x1000003d10 to rdx
mulx r13, r15, r11; x67_1, x67_0<- x66 * 0x1000003d10 (_0*_0)
adox r8, r15
adox r13, rax
mov rax, 0xffffffffffffffff ; moving imm to reg
and r9, rax; lo limb and'ed
adox r9, r8
mov r11, 0x0 ; moving imm to reg
adox r13, r11
mov r15, r9;
shrd r15, r13, 0x34; lo
shr r13, 0x34; x75_1>>=0x34
and r15, rax; lo limb and'ed
mov r8, [ rsi + 0x10 ]; load m64 arg1[2] to register64
mov rdx, r8; arg1[2] to rdx
mulx r11, r8, r14; __,tmp <- (a_0 in rdx) * b_hi
mulx r11, r13, r12; hi,lo <- (a_0 in rdx) * b_lo
lea r11, [r11+r8]; hi += tmp
and rdi, rcx; lo limb and'ed
mov rdx, 0xffffffffffffe ; moving imm to reg
and r10, rdx; lo limb and'ed
mov r8, 0x1000003d10 ; moving imm to reg
mov rdx, r8; 0x1000003d10 to rdx
mulx r12, r8, rdi; x83_1, x83_0<- x82 * 0x1000003d10 (_0*_0)
and r9, rcx; x74 <- x73&0xfffffffffffff
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, r14, rdx; x77_1, x77_0<- arg1[1]^2
adox r14, r13
adox r11, rdi
adcx r8, r14
adcx r11, r12
xor rdx, rdx
adox r15, r8
adox r11, rdx
mov r13, r15;
shrd r13, r11, 0x34; lo
shr r11, 0x34; x92_1>>=0x34
and r15, rcx; x91 <- x90&0xfffffffffffff
and r13, rax; lo limb and'ed
and rbx, rax; lo limb and'ed
mov r12, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r12 + 0x10 ], r15; out1[2] = x91
mov rdi, 0x1000003d10 ; moving imm to reg
mov rdx, rdi; 0x1000003d10 to rdx
mulx r14, rdi, rbx; x95_1, x95_0<- x94 * 0x1000003d10 (_0*_0)
adox r10, rdi
mov r8, 0x0 ; moving imm to reg
adox r14, r8
adcx r13, r10
adc r14, 0x0; add CF to r0's alloc
mov r11, r13;
shrd r13, r14, 0x34; lo
shr r14, 0x34; x101_1>>=0x34
mov r15, r13;
xor rbx, rbx
adox r15, [ rsp - 0x38 ]
adox r14, rbx
and rbp, rcx; x57 <- x56&0xfffffffffffff
mov [ r12 + 0x0 ], rbp; out1[0] = x57
and r11, rcx; x100 <- x99&0xfffffffffffff
mov [ r12 + 0x18 ], r11; out1[3] = x100
mov [ r12 + 0x20 ], r15; out1[4] = x104
mov [ r12 + 0x8 ], r9; out1[1] = x74
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.8485
; seed 2755282337699789 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1190345 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=342, initial num_batches=31): 123396 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.10366406377982854
; number reverted permutation / tried permutation: 69531 / 89564 =77.633%
; number reverted decision / tried decision: 60460 / 90435 =66.855%