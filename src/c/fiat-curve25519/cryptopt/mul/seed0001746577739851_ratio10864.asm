SECTION .text
	GLOBAL fiat_c_curve25519_carry_mul_CryptOpt
fiat_c_curve25519_carry_mul_CryptOpt:
mov rax, 0x13 ; moving imm to reg
mov r10, [ rdx + 0x18 ]; load m64 x13 to register64
imul r10, rax; lox13 = arg2[3]*0x13
mov r11, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mulx r8, rcx, r10; x30_1, x30_0<- arg1[3] * x13 (_0*_0)
mov rdx, [ r11 + 0x8 ]; load m64 x23 to register64
imul rdx, rax; lox23 = arg2[1]*0x13
mov r9, [ r11 + 0x20 ]; load m64 x8 to register64
imul r9, rax; lox8 = arg2[4]*0x13
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, rdx; preserving value of x23 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, r9; x40_1, x40_0<- arg1[1] * x8 (_0*_0)
mov rdx, [ r11 + 0x10 ]; load m64 x18 to register64
imul rdx, rax; lox18 = arg2[2]*0x13
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rsi + 0x20 ]; x20_1, x20_0<- x18 * arg1[4] (_0*_0)
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov r15, rdx; preserving value of x18 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, rax, [ r11 + 0x20 ]; x59_1, x59_0<- arg1[0] * arg2[4] (_0*_0)
xor rdx, rdx
adox r13, rcx
adox r8, r14
mov rdx, rbx; x23 to rdx
mulx rcx, rbx, [ rsi + 0x20 ]; x25_1, x25_0<- x23 * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x48 ], rdi; spilling x59_1 to mem
mulx rdi, r14, r15; x31_1, x31_0<- arg1[3] * x18 (_0*_0)
adcx rbx, r14
adcx rdi, rcx
mov rdx, r10; x13 to rdx
mulx r15, r10, [ rsi + 0x10 ]; x36_1, x36_0<- arg1[2] * x13 (_0*_0)
xor rcx, rcx
adox r10, rbx
adox rdi, r15
adcx rbp, r10
adcx rdi, r12
mov r12, rdx; preserving value of x13 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx rbx, r14, [ r11 + 0x0 ]; x63_1, x63_0<- arg1[0] * arg2[0] (_0*_0)
xor rdx, rdx
adox r14, rbp
adox rdi, rbx
mov rcx, r14;
shrd rcx, rdi, 0x33; lo
shr rdi, 0x33; x68_1>>=0x33
mov rdx, r9; x8 to rdx
mulx r15, r9, [ rsi + 0x10 ]; x35_1, x35_0<- arg1[2] * x8 (_0*_0)
mulx rbp, r10, [ rsi + 0x18 ]; x29_1, x29_0<- arg1[3] * x8 (_0*_0)
mov rbx, rdx; preserving value of x8 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mov [ rsp - 0x40 ], rax; spilling x59_0 to mem
mulx rax, rdi, r12; x15_1, x15_0<- x13 * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x38 ], rcx; spilling x68_0 to mem
mulx rcx, r12, [ r11 + 0x0 ]; x55_1, x55_0<- arg2[0] * arg1[1] (_0*_0)
add rdi, r10; could be done better, if r0 has been u8 as well
adcx rbp, rax
add r9, r13; could be done better, if r0 has been u8 as well
adcx r8, r15
xor rdx, rdx
adox r12, r9
adox r8, rcx
mov rdx, [ r11 + 0x8 ]; arg2[1] to rdx
mulx r15, r13, [ rsi + 0x8 ]; x54_1, x54_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, [ r11 + 0x8 ]; arg2[1] to rdx
mulx rax, r10, [ rsi + 0x0 ]; x62_1, x62_0<- arg1[0] * arg2[1] (_0*_0)
adcx r10, r12
adcx r8, rax
mov rdx, 0x33 ; moving imm to reg
bzhi rcx, r14, rdx; x70 <- x69 (only least 0x33 bits)
mov r9, 0xffffffffffffffff ; moving imm to reg
mov r12, [ rsp - 0x38 ];
and r12, r9; lo limb and'ed
mov rdx, [ r11 + 0x8 ]; arg2[1] to rdx
mulx rax, r14, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[1] (_0*_0)
adox r12, r10
mov rdx, 0x0 ; moving imm to reg
adox r8, rdx
mov r10, r12;
shrd r10, r8, 0x33; lo
shr r8, 0x33; x78_1>>=0x33
test al, al
adox r13, rdi
adox rbp, r15
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r15, rdi, [ r11 + 0x0 ]; x50_1, x50_0<- arg2[0] * arg1[2] (_0*_0)
adcx rdi, r13
adcx rbp, r15
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r13, r8, [ r11 + 0x10 ]; x61_1, x61_0<- arg1[0] * arg2[2] (_0*_0)
xor rdx, rdx
adox r8, rdi
adox rbp, r13
mov rdx, rbx; x8 to rdx
mulx r15, rbx, [ rsi + 0x20 ]; x10_1, x10_0<- x8 * arg1[4] (_0*_0)
adcx rbx, r14
adcx rax, r15
and r10, r9; lo limb and'ed
adox r10, r8
mov rdx, 0x0 ; moving imm to reg
adox rbp, rdx
mov r14, r10;
shrd r14, rbp, 0x33; lo
shr rbp, 0x33; x86_1>>=0x33
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r13, rdi, [ r11 + 0x10 ]; x53_1, x53_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r15, r8, [ r11 + 0x0 ]; x46_1, x46_0<- arg2[0] * arg1[3] (_0*_0)
xor rdx, rdx
adox rdi, rbx
adox rax, r13
adcx r8, rdi
adcx rax, r15
mov rbx, 0x7ffffffffffff ; moving imm to reg
and r10, rbx; x88 <- x87&0x7ffffffffffff
mov rdx, [ r11 + 0x18 ]; arg2[3] to rdx
mulx r13, rbp, [ rsi + 0x0 ]; x60_1, x60_0<- arg1[0] * arg2[3] (_0*_0)
adox rbp, r8
adox rax, r13
mov rdx, [ r11 + 0x8 ]; arg2[1] to rdx
mulx rdi, r15, [ rsi + 0x18 ]; x45_1, x45_0<- arg1[3] * arg2[1] (_0*_0)
mov rdx, [ r11 + 0x10 ]; arg2[2] to rdx
mulx r13, r8, [ rsi + 0x10 ]; x48_1, x48_0<- arg1[2] * arg2[2] (_0*_0)
and r14, r9; lo limb and'ed
adox r15, r8
adox r13, rdi
adcx r14, rbp
adc rax, 0x0; add CF to r0's alloc
mov rdx, r14;
shrd rdx, rax, 0x33; lo
shr rax, 0x33; x95_1>>=0x33
mov rbp, rdx; preserving value of x95_0 into a new reg
mov rdx, [ r11 + 0x18 ]; saving arg2[3] in rdx.
mulx r8, rdi, [ rsi + 0x8 ]; x52_1, x52_0<- arg1[1] * arg2[3] (_0*_0)
xor rdx, rdx
adox rdi, r15
adox r13, r8
mov rdx, [ r11 + 0x0 ]; arg2[0] to rdx
mulx rax, r15, [ rsi + 0x20 ]; x43_1, x43_0<- arg2[0] * arg1[4] (_0*_0)
adcx r15, rdi
adcx r13, rax
mov rdx, r15;
xor r8, r8
adox rdx, [ rsp - 0x40 ]
adox r13, [ rsp - 0x48 ]
and rbp, r9; lo limb and'ed
adox rbp, rdx
adox r13, r8
mov rdi, rbp;
shrd rdi, r13, 0x33; lo
shr r13, 0x33; x104_1>>=0x33
mov rax, 0x13 ; moving imm to reg
imul rdi, rax; lox108 = x105*0x13
and rbp, rbx; x107 <- x106&0x7ffffffffffff
lea rdi, [ rdi + rcx ]
mov rcx, rdi;
shr rcx, 0x33; x110 <- x109>> 0x33
and rdi, rbx; x111 <- x109&0x7ffffffffffff
mov r15, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r15 + 0x20 ], rbp; out1[4] = x107
and r12, rbx; x80 <- x79&0x7ffffffffffff
lea rcx, [ rcx + r12 ]
mov rdx, rcx;
shr rdx, 0x33; x113 <- x112>> 0x33
lea rdx, [ rdx + r10 ]
mov [ r15 + 0x10 ], rdx; out1[2] = x115
mov [ r15 + 0x0 ], rdi; out1[0] = x111
and rcx, rbx; x114 <- x112&0x7ffffffffffff
and r14, rbx; x97 <- x96&0x7ffffffffffff
mov [ r15 + 0x8 ], rcx; out1[1] = x114
mov [ r15 + 0x18 ], r14; out1[3] = x97
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0864
; seed 2967934433045954 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1131010 ms on 160000 evaluations.
; Time spent for assembling and measuring (initial batch_size=325, initial num_batches=31): 99799 ms
; number of used evaluations: 160000
; Ratio (time for assembling + measure)/(total runtime for 160000 evals): 0.0882388307795687
; number reverted permutation / tried permutation: 64372 / 79757 =80.710%
; number reverted decision / tried decision: 51785 / 80242 =64.536%