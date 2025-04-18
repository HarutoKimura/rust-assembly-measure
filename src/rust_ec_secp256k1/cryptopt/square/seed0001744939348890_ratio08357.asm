SECTION .text
	GLOBAL rust_ec_secp256k1_square_CryptOpt
rust_ec_secp256k1_square_CryptOpt:
mov rax, 0x2 ; moving imm to reg
mov rdx, rax; 0x2 to rdx
mulx r10, rax, [ rsi + 0x18 ]; x79_1, x79_0<- arg1[3] * 0x2 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rcx, r11, [ rsi + 0x10 ]; x17_1, x17_0<- arg1[2] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r9, r8, rdx; x18_1, x18_0<- arg1[4]^2
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, [ rsi + 0x20 ]; x30_1, x30_0<- arg1[4] * arg1[0] (_0*_0)
mov rdx, 0xffffffffffffd ; moving imm to reg
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov r12, r8;
and r12, rdx; lo limb and'ed
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, rdx; x27_1, x27_0<- arg1[2]^2
mov rdx, [ rsi + 0x20 ]; load m64 arg1[4] to register64
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], r14; spilling x27_1 to mem
mulx r14, r15, r10; __,tmp <- (a_0 in rdx) * b_hi
mulx r14, rdi, rax; hi,lo <- (a_0 in rdx) * b_lo
lea r14, [r14+r15]; hi += tmp
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rax, r15, [ rsi + 0x0 ]; x16_1, x16_0<- arg1[3] * arg1[0] (_0*_0)
shrd r8, r9, 0x34; lo
shr r9, 0x34; x24_1>>=0x34
xor rdx, rdx
adox r11, r15
adox rax, rcx
mov r10, 0xffffffffffffffff ; moving imm to reg
and r8, r10; lo limb and'ed
mov rcx, 0x1000003d10 ; moving imm to reg
mov rdx, r12; x19_0 to rdx
mulx r15, r12, rcx; x20_1, x20_0<- x19 * 0x1000003d10 (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mulx r10, r9, rax; __,tmp <- (a_0 in rdx) * b_hi
mulx r10, rcx, r11; hi,lo <- (a_0 in rdx) * b_lo
lea r10, [r10+r9]; hi += tmp
adox rcx, r12
adox r15, r10
mulx r11, r9, [ rsi + 0x0 ]; x68_1, x68_0<- arg1[0] * 0x2 (_0*_0)
mov rax, rcx;
shrd rax, r15, 0x34; lo
shr r15, 0x34; x25_1>>=0x34
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r10, r12, [ rsi + 0x10 ]; x44_1, x44_0<- arg1[3] * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x40 ], r14; spilling x80_1 to mem
mulx r14, r15, [ rsi + 0x8 ]; x43_1, x43_0<- arg1[4] * arg1[1] (_0*_0)
xor rdx, rdx
adox r12, r15
adox r14, r10
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r15, r10, [ rsi + 0x8 ]; x31_1, x31_0<- arg1[3] * arg1[1] (_0*_0)
adcx r10, rbx
adcx rbp, r15
mov rdx, 0x2 ; moving imm to reg
mov [ rsp - 0x38 ], rdi; spilling x80_0 to mem
mulx rdi, rbx, rbp; __,tmp <- (a_0 in rdx) * b_hi
mulx rdi, r15, r10; hi,lo <- (a_0 in rdx) * b_lo
lea rdi, [rdi+rbx]; hi += tmp
mov rbx, 0x1000003d10 ; moving imm to reg
mov rdx, r8; x28_0 to rdx
mulx r10, r8, rbx; x29_1, x29_0<- x28 * 0x1000003d10 (_0*_0)
mov rdx, 0xffffffffffffe ; moving imm to reg
and rcx, rdx; lo limb and'ed
mov rbp, 0xffffffffffffffff ; moving imm to reg
and rax, rbp; lo limb and'ed
adox r13, r8
adox r10, [ rsp - 0x48 ]
adcx rax, r13
adc r10, 0x0; add CF to r0's alloc
xor r8, r8
adox r15, rax
adox r10, rdi
mov rdi, r15;
shr rdi, 0x30; x39 <- x37>> 0x30
mov r13, r15;
shrd r13, r10, 0x34; lo
shr r10, 0x34; x38_1>>=0x34
and r13, rbp; lo limb and'ed
mov rax, 0xf ; moving imm to reg
and rdi, rax; x40 <- x39&0xf
mov r10, 0xffffffffffff ; moving imm to reg
and r15, r10; lo limb and'ed
mov r8, 0x2 ; moving imm to reg
mov rdx, r8; 0x2 to rdx
mulx rax, r8, r14; __,tmp <- (a_0 in rdx) * b_hi
mulx rax, r10, r12; hi,lo <- (a_0 in rdx) * b_lo
lea rax, [rax+r8]; hi += tmp
adox r10, r13
mov r8, 0x0 ; moving imm to reg
adox rax, r8
mov r12, r10;
imul r14, r12, 0x10; x50 <- x48 * 0x10
mov r13, 0xfffffffffffff0 ; moving imm to reg
and r14, r13; x51 <- x50&0xfffffffffffff0
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r8, r12, rdx; x41_1, x41_0<- arg1[0]^2
shrd r10, rax, 0x34; lo
shr rax, 0x34; x49_1>>=0x34
or r14, rdi; x52 <- x51|x40
and r10, rbp; lo limb and'ed
mov rdx, 0x1000003d1 ; moving imm to reg
mulx rax, rdi, r14; x54_1, x54_0<- x52 * 0x1000003d1 (_0*_0)
adox r12, rdi
adox rax, r8
mov r8, r12;
shrd r12, rax, 0x34; lo
shr rax, 0x34; x58_1>>=0x34
mov r14, 0x2 ; moving imm to reg
mov rdx, r14; 0x2 to rdx
mulx rdi, r14, [ rsi + 0x10 ]; x62_1, x62_0<- arg1[2] * 0x2 (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r13, rax, rdx; x61_1, x61_0<- arg1[3]^2
mov rdx, [ rsi + 0x20 ]; load m64 arg1[4] to register64
mov [ rsp - 0x30 ], r15; spilling x102_0 to mem
mulx r15, rbx, rdi; __,tmp <- (a_0 in rdx) * b_hi
mulx r15, rbp, r14; hi,lo <- (a_0 in rdx) * b_lo
lea r15, [r15+rbx]; hi += tmp
test al, al
adox rax, rbp
adox r15, r13
adcx r10, rax
adc r15, 0x0; add CF to r0's alloc
mov rdx, [ rsi + 0x10 ]; load m64 arg1[2] to register64
mulx rdi, rbx, r11; __,tmp <- (a_0 in rdx) * b_hi
mulx rdi, r14, r9; hi,lo <- (a_0 in rdx) * b_lo
lea rdi, [rdi+rbx]; hi += tmp
mov rdx, r10;
shrd rdx, r15, 0x34; lo
shr r15, 0x34; x72_1>>=0x34
mov rbx, rdx; preserving value of x72_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx rbp, r13, rdx; x77_1, x77_0<- arg1[1]^2
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rbx, rdx; lo limb and'ed
adox r13, r14
adox rdi, rbp
mov rax, 0xfffffffffffff ; moving imm to reg
and r8, rax; x57 <- x56&0xfffffffffffff
and r10, rax; lo limb and'ed
mov r14, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r14 + 0x0 ], r8; out1[0] = x57
mov r15, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov rdx, r15; arg1[1] to rdx
mulx r8, r15, r11; __,tmp <- (a_0 in rdx) * b_hi
mulx r8, rbp, r9; hi,lo <- (a_0 in rdx) * b_lo
lea r8, [r8+r15]; hi += tmp
mov rdx, 0x1000003d10 ; moving imm to reg
mulx r9, r15, r10; x67_1, x67_0<- x66 * 0x1000003d10 (_0*_0)
adox rbp, r15
adox r9, r8
mov r11, rbx;
adcx r11, [ rsp - 0x38 ]
mov r10, [ rsp - 0x40 ];
adc r10, 0x0; add CF to r0's alloc
mov rbx, r11;
and rbx, rax; lo limb and'ed
shrd r11, r10, 0x34; lo
shr r10, 0x34; x89_1>>=0x34
mov r8, 0xffffffffffffffff ; moving imm to reg
and r11, r8; lo limb and'ed
and r12, r8; lo limb and'ed
adox r12, rbp
mov r15, 0x0 ; moving imm to reg
adox r9, r15
mov rbp, r12;
shrd r12, r9, 0x34; lo
shr r9, 0x34; x75_1>>=0x34
mulx r9, r10, r11; x95_1, x95_0<- x94 * 0x1000003d10 (_0*_0)
and r12, r8; lo limb and'ed
adox rcx, r10
adox r9, r15
mulx r10, r11, rbx; x83_1, x83_0<- x82 * 0x1000003d10 (_0*_0)
and rbp, rax; x74 <- x73&0xfffffffffffff
mov [ r14 + 0x8 ], rbp; out1[1] = x74
adox r11, r13
adox rdi, r10
adcx r12, r11
adc rdi, 0x0; add CF to r0's alloc
mov r13, r12;
shrd r13, rdi, 0x34; lo
shr rdi, 0x34; x92_1>>=0x34
and r13, r8; lo limb and'ed
adox r13, rcx
adox r9, r15
mov rbx, r13;
shrd rbx, r9, 0x34; lo
shr r9, 0x34; x101_1>>=0x34
and r13, rax; x100 <- x99&0xfffffffffffff
mov [ r14 + 0x18 ], r13; out1[3] = x100
and r12, rax; x91 <- x90&0xfffffffffffff
mov [ r14 + 0x10 ], r12; out1[2] = x91
mov rcx, rbx;
adox rcx, [ rsp - 0x30 ]
adox r9, r15
mov [ r14 + 0x20 ], rcx; out1[4] = x104
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.8357
; seed 0139840413387866 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 19386993 ms on 800000 evaluations.
; Time spent for assembling and measuring (initial batch_size=346, initial num_batches=31): 555351 ms
; number of used evaluations: 800000
; Ratio (time for assembling + measure)/(total runtime for 800000 evals): 0.02864554601118389
; number reverted permutation / tried permutation: 311708 / 400595 =77.811%
; number reverted decision / tried decision: 269349 / 399404 =67.438%