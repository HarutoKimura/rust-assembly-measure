SECTION .text
	GLOBAL rust_fiat_curve25519_carry_square_CryptOpt
rust_fiat_curve25519_carry_square_CryptOpt:
mov rax, 0x26 ; moving imm to reg
mov r10, [ rsi + 0x20 ]; load m64 x5 to register64
imul r10, rax; lox5 = arg1[4]*0x26
mov rdx, r10; x5 to rdx
mulx r11, r10, [ rsi + 0x18 ]; x23_1, x23_0<- arg1[3] * x5 (_0*_0)
mulx r8, rcx, [ rsi + 0x8 ]; x32_1, x32_0<- arg1[1] * x5 (_0*_0)
mov r9, [ rsi + 0x8 ]; load m64 arg1[1] to register64
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, r9; load m64 x17 to register64
shl rbx, 0x1; x17 <- arg1[1] * 0x2
mov r9, [ rsi + 0x18 ]; load m64 x10 to register64
imul r9, rax; lox10 = arg1[3]*0x26
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov rbp, rdx; preserving value of x5 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, r9; x29_1, x29_0<- arg1[2] * x10 (_0*_0)
mov rdx, rbp; x5 to rdx
mulx r9, rbp, [ rsi + 0x10 ]; x27_1, x27_0<- arg1[2] * x5 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, rdx; x46_1, x46_0<- arg1[0]^2
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, rax, rdx; x30_1, x30_0<- arg1[2]^2
add r12, rcx; could be done better, if r0 has been u8 as well
adcx r8, r13
xor rdx, rdx
adox r14, r12
adox r8, r15
mov rcx, r14;
shrd rcx, r8, 0x33; lo
shr r8, 0x33; x49_1>>=0x33
mov r13, 0x13 ; moving imm to reg
mov r15, [ rsi + 0x18 ]; load m64 x9 to register64
imul r15, r13; lox9 = arg1[3]*0x13
mov rdx, r15; x9 to rdx
mulx r12, r15, [ rsi + 0x18 ]; x25_1, x25_0<- x9 * arg1[3] (_0*_0)
test al, al
adox r15, rbp
adox r9, r12
mov rbp, [ rsi + 0x20 ]; load m64 x4 to register64
imul rbp, r13; lox4 = arg1[4]*0x13
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r12, r8, rbx; x45_1, x45_0<- arg1[0] * x17 (_0*_0)
xor rdx, rdx
adox r8, r15
adox r9, r12
mov rdx, rbp; x4 to rdx
mulx rbx, rbp, [ rsi + 0x20 ]; x20_1, x20_0<- x4 * arg1[4] (_0*_0)
mov r15, 0xffffffffffffffff ; moving imm to reg
and rcx, r15; lo limb and'ed
adox rcx, r8
mov rdx, 0x0 ; moving imm to reg
adox r9, rdx
mov r12, rcx;
shrd r12, r9, 0x33; lo
shr r9, 0x33; x62_1>>=0x33
mov r8, [ rsi + 0x10 ]; load m64 arg1[2] to register64
lea r9, [r8 + r8]; x14 <- arg1[2] * 2 
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r15, r8, rdx; x37_1, x37_0<- arg1[1]^2
add r10, r8; could be done better, if r0 has been u8 as well
adcx r15, r11
mov rdx, r9; x14 to rdx
mulx r11, r9, [ rsi + 0x0 ]; x43_1, x43_0<- arg1[0] * x14 (_0*_0)
test al, al
adox r9, r10
adox r15, r11
mov r8, 0xffffffffffffffff ; moving imm to reg
and r12, r8; lo limb and'ed
adox r12, r9
mov r10, 0x0 ; moving imm to reg
adox r15, r10
mov r11, r12;
shrd r11, r15, 0x33; lo
shr r15, 0x33; x67_1>>=0x33
and r11, r8; lo limb and'ed
mulx r15, r9, [ rsi + 0x8 ]; x36_1, x36_0<- arg1[1] * x14 (_0*_0)
imul rdx, [ rsi + 0x18 ], 0x2; x11 <- arg1[3] * 0x2
xor r8, r8
adox rbp, r9
adox r15, rbx
mulx rbx, r10, [ rsi + 0x8 ]; x34_1, x34_0<- arg1[1] * x11 (_0*_0)
mulx r8, r9, [ rsi + 0x0 ]; x42_1, x42_0<- arg1[0] * x11 (_0*_0)
adcx r9, rbp
adcx r15, r8
imul rdx, [ rsi + 0x20 ], 0x2; x6 <- arg1[4] * 0x2
xor rbp, rbp
adox r11, r9
adox r15, rbp
adcx rax, r10
adcx rbx, rdi
mov rdi, r11;
shrd rdi, r15, 0x33; lo
shr r15, 0x33; x72_1>>=0x33
mov r10, 0xffffffffffffffff ; moving imm to reg
and rdi, r10; lo limb and'ed
mulx r9, r8, [ rsi + 0x0 ]; x41_1, x41_0<- arg1[0] * x6 (_0*_0)
adox r8, rax
adox rbx, r9
adcx rdi, r8
adc rbx, 0x0; add CF to r0's alloc
mov rdx, rdi;
shrd rdx, rbx, 0x33; lo
shr rbx, 0x33; x77_1>>=0x33
mov rax, 0x7ffffffffffff ; moving imm to reg
and rdi, rax; x80 <- x79&0x7ffffffffffff
and rcx, rax; x64 <- x63&0x7ffffffffffff
mov r15, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r15 + 0x20 ], rdi; out1[4] = x80
imul rdx, r13; lox81 = x78*0x13
and r14, rax; x51 <- x50&0x7ffffffffffff
lea rdx, [ rdx + r14 ]
and r11, rax; x74 <- x73&0x7ffffffffffff
mov r9, rdx;
shr r9, 0x33; x83 <- x82>> 0x33
lea r9, [ r9 + rcx ]
mov r8, r9;
shr r8, 0x33; x86 <- x85>> 0x33
and r12, rax; x69 <- x68&0x7ffffffffffff
and r9, rax; x87 <- x85&0x7ffffffffffff
and rdx, rax; x84 <- x82&0x7ffffffffffff
mov [ r15 + 0x18 ], r11; out1[3] = x74
lea r8, [ r8 + r12 ]
mov [ r15 + 0x8 ], r9; out1[1] = x87
mov [ r15 + 0x0 ], rdx; out1[0] = x84
mov [ r15 + 0x10 ], r8; out1[2] = x88
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.2581
; seed 4209879438348476 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 85975 ms on 20000 evaluations.
; Time spent for assembling and measuring (initial batch_size=381, initial num_batches=31): 11847 ms
; number of used evaluations: 20000
; Ratio (time for assembling + measure)/(total runtime for 20000 evals): 0.13779587089270137
; number reverted permutation / tried permutation: 7383 / 9916 =74.455%
; number reverted decision / tried decision: 7324 / 10083 =72.637%