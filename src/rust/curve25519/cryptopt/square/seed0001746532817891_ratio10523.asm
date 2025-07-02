SECTION .text
	GLOBAL rust_fiat_curve25519_carry_square_CryptOpt
rust_fiat_curve25519_carry_square_CryptOpt:
mov rax, 0x26 ; moving imm to reg
mov r10, [ rsi + 0x18 ]; load m64 x10 to register64
imul r10, rax; lox10 = arg1[3]*0x26
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rcx, r11, r10; x29_1, x29_0<- arg1[2] * x10 (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r9, r8, rdx; x37_1, x37_0<- arg1[1]^2
mov rdx, [ rsi + 0x20 ]; load m64 x5 to register64
imul rdx, rax; lox5 = arg1[4]*0x26
mov r10, [ rsi + 0x10 ]; load m64 arg1[2] to register64
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
lea rbx, [r10 + r10]; x14 <- arg1[2] * 2 
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, r10, [ rsi + 0x18 ]; x23_1, x23_0<- arg1[3] * x5 (_0*_0)
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, [ rsi + 0x8 ]; x32_1, x32_0<- arg1[1] * x5 (_0*_0)
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov r14, rdx; preserving value of x5 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx rax, r15, rdx; x46_1, x46_0<- arg1[0]^2
xor rdx, rdx
adox r11, r12
adox r13, rcx
adcx r15, r11
adcx r13, rax
mov rcx, [ rsi + 0x8 ]; load m64 arg1[1] to register64
lea r12, [rcx + rcx]; x17 <- arg1[1] * 2 
mov rcx, r15;
mov rdx, r12; x17 to rdx
mulx rax, r12, [ rsi + 0x0 ]; x45_1, x45_0<- arg1[0] * x17 (_0*_0)
mov r11, 0x13 ; moving imm to reg
mov rdx, [ rsi + 0x18 ]; load m64 x9 to register64
imul rdx, r11; lox9 = arg1[3]*0x13
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r11, [ rsi + 0x18 ]; x25_1, x25_0<- x9 * arg1[3] (_0*_0)
shrd r15, r13, 0x33; lo
shr r13, 0x33; x49_1>>=0x33
mov rdx, r14; x5 to rdx
mulx r13, r14, [ rsi + 0x10 ]; x27_1, x27_0<- arg1[2] * x5 (_0*_0)
xor rdx, rdx
adox r11, r14
adox r13, rdi
adcx r12, r11
adcx r13, rax
mov rax, 0xffffffffffffffff ; moving imm to reg
and r15, rax; lo limb and'ed
adox r15, r12
adox r13, rdx
mov rdi, r15;
shrd rdi, r13, 0x33; lo
shr r13, 0x33; x62_1>>=0x33
xor r14, r14
adox r10, r8
adox r9, rbp
mov rdx, rbx; x14 to rdx
mulx r8, rbx, [ rsi + 0x0 ]; x43_1, x43_0<- arg1[0] * x14 (_0*_0)
adcx rbx, r10
adcx r9, r8
and rdi, rax; lo limb and'ed
adox rdi, rbx
adox r9, r14
mov rbp, 0x13 ; moving imm to reg
mov r11, [ rsi + 0x20 ]; load m64 x4 to register64
imul r11, rbp; lox4 = arg1[4]*0x13
mov r12, rdi;
shrd r12, r9, 0x33; lo
shr r9, 0x33; x67_1>>=0x33
and r12, rax; lo limb and'ed
mulx r10, r13, [ rsi + 0x8 ]; x36_1, x36_0<- arg1[1] * x14 (_0*_0)
mov rdx, r11; x4 to rdx
mulx r8, r11, [ rsi + 0x20 ]; x20_1, x20_0<- x4 * arg1[4] (_0*_0)
imul rbx, [ rsi + 0x18 ], 0x2; x11 <- arg1[3] * 0x2
xor rdx, rdx
adox r11, r13
adox r10, r8
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r9, r14, rbx; x42_1, x42_0<- arg1[0] * x11 (_0*_0)
adcx r14, r11
adcx r10, r9
xor rdx, rdx
adox r12, r14
adox r10, rdx
mov r13, r12;
imul r8, [ rsi + 0x20 ], 0x2; x6 <- arg1[4] * 0x2
mov rdx, r8; x6 to rdx
mulx r11, r8, [ rsi + 0x0 ]; x41_1, x41_0<- arg1[0] * x6 (_0*_0)
shrd r12, r10, 0x33; lo
shr r10, 0x33; x72_1>>=0x33
mov rdx, rbx; x11 to rdx
mulx r9, rbx, [ rsi + 0x8 ]; x34_1, x34_0<- arg1[1] * x11 (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r10, r14, rdx; x30_1, x30_0<- arg1[2]^2
xor rdx, rdx
adox r14, rbx
adox r9, r10
adcx r8, r14
adcx r9, r11
mov r11, 0x7ffffffffffff ; moving imm to reg
and rcx, r11; x51 <- x50&0x7ffffffffffff
and r12, rax; lo limb and'ed
and r13, r11; x74 <- x73&0x7ffffffffffff
adox r12, r8
adox r9, rdx
mov rbx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbx + 0x18 ], r13; out1[3] = x74
mov r10, r12;
shrd r12, r9, 0x33; lo
shr r9, 0x33; x77_1>>=0x33
imul r12, rbp; lox81 = x78*0x13
lea r12, [ r12 + rcx ]
mov r14, r12;
shr r14, 0x33; x83 <- x82>> 0x33
and r15, r11; x64 <- x63&0x7ffffffffffff
and rdi, r11; x69 <- x68&0x7ffffffffffff
lea r14, [ r14 + r15 ]
mov r8, r14;
and r8, r11; x87 <- x85&0x7ffffffffffff
shr r14, 0x33; x86 <- x85>> 0x33
mov [ rbx + 0x8 ], r8; out1[1] = x87
and r10, r11; x80 <- x79&0x7ffffffffffff
mov [ rbx + 0x20 ], r10; out1[4] = x80
and r12, r11; x84 <- x82&0x7ffffffffffff
lea r14, [ r14 + rdi ]
mov [ rbx + 0x0 ], r12; out1[0] = x84
mov [ rbx + 0x10 ], r14; out1[2] = x88
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0523
; seed 1805749842180118 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 779094 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=473, initial num_batches=31): 103328 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.13262584489163054
; number reverted permutation / tried permutation: 67074 / 90116 =74.431%
; number reverted decision / tried decision: 66801 / 89883 =74.320%