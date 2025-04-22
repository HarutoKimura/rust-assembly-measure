SECTION .text
	GLOBAL fiat_c_curve25519_carry_mul_CryptOpt
fiat_c_curve25519_carry_mul_CryptOpt:
sub rsp, 152
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x8 ]; saving arg2[1] in rdx.
mulx r11, r10, [ rsi + 0x0 ]; x62_1, x62_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r8, rcx, [ rsi + 0x8 ]; x55_1, x55_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov r9, [ rax + 0x20 ]; load m64 x8 to register64
imul r9, rdx; lox8 = arg2[4]*0x13
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, [ rax + 0x8 ]; x54_1, x54_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, r9; x10_1, x10_0<- x8 * arg1[4] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov r14, [ rax + 0x10 ]; load m64 x18 to register64
imul r14, rdx; lox18 = arg2[2]*0x13
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov r15, [ rax + 0x18 ]; load m64 x13 to register64
imul r15, rdx; lox13 = arg2[3]*0x13
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], r13; spilling x10_1 to mem
mulx r13, rdi, r15; x30_1, x30_0<- arg1[3] * x13 (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x40 ], r12; spilling x10_0 to mem
mov [ rsp - 0x38 ], rbp; spilling x54_1 to mem
mulx rbp, r12, r14; x20_1, x20_0<- x18 * arg1[4] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov [ rsp - 0x30 ], rbx; spilling x54_0 to mem
mov rbx, [ rax + 0x8 ]; load m64 x23 to register64
imul rbx, rdx; lox23 = arg2[1]*0x13
test al, al
adox r12, rdi
adox r13, rbp
mov rdx, rbx; x23 to rdx
mulx rdi, rbx, [ rsi + 0x20 ]; x25_1, x25_0<- x23 * arg1[4] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x28 ], r11; spilling x62_1 to mem
mulx r11, rbp, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x20 ], r11; spilling x49_1 to mem
mov [ rsp - 0x18 ], rbp; spilling x49_0 to mem
mulx rbp, r11, r14; x31_1, x31_0<- arg1[3] * x18 (_0*_0)
adcx rbx, r11
adcx rbp, rdi
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rdi, r14, r15; x36_1, x36_0<- arg1[2] * x13 (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x10 ], r10; spilling x62_0 to mem
mulx r10, r11, [ rsi + 0x0 ]; x60_1, x60_0<- arg1[0] * arg2[3] (_0*_0)
test al, al
adox r14, rbx
adox rbp, rdi
mov rdx, r9; x8 to rdx
mulx rbx, r9, [ rsi + 0x8 ]; x40_1, x40_0<- arg1[1] * x8 (_0*_0)
mov rdi, rdx; preserving value of x8 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp - 0x8 ], r10; spilling x60_1 to mem
mov [ rsp + 0x0 ], r11; spilling x60_0 to mem
mulx r11, r10, [ rsi + 0x0 ]; x63_1, x63_0<- arg1[0] * arg2[0] (_0*_0)
adcx r9, r14
adcx rbp, rbx
xor rdx, rdx
adox r10, r9
adox rbp, r11
mov r14, r10;
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r11, rbx, rdi; x35_1, x35_0<- arg1[2] * x8 (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0x8 ], r8; spilling x55_1 to mem
mulx r8, r9, [ rsi + 0x20 ]; x43_1, x43_0<- arg2[0] * arg1[4] (_0*_0)
adcx rbx, r12
adcx r13, r11
mov rdx, 0x33 ; moving imm to reg
bzhi r12, r14, rdx; x70 <- x69 (only least 0x33 bits)
shrd r10, rbp, 0x33; lo
shr rbp, 0x33; x68_1>>=0x33
mov rdx, r15; x13 to rdx
mulx r14, r15, [ rsi + 0x20 ]; x15_1, x15_0<- x13 * arg1[4] (_0*_0)
mov rdx, rdi; x8 to rdx
mulx r11, rdi, [ rsi + 0x18 ]; x29_1, x29_0<- arg1[3] * x8 (_0*_0)
xor rdx, rdx
adox rcx, rbx
adox r13, [ rsp + 0x8 ]
adcx r15, rdi
adcx r11, r14
mov rbx, rcx;
test al, al
adox rbx, [ rsp - 0x10 ]
adox r13, [ rsp - 0x28 ]
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r14, rbp, [ rsi + 0x0 ]; x61_1, x61_0<- arg1[0] * arg2[2] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r10, rdx; lo limb and'ed
adox r10, rbx
mov rdi, 0x0 ; moving imm to reg
adox r13, rdi
mov rcx, r10;
shrd rcx, r13, 0x33; lo
shr r13, 0x33; x78_1>>=0x33
mov rbx, r15;
add rbx, [ rsp - 0x30 ]; could be done better, if r0 has been u8 as well
adcx r11, [ rsp - 0x38 ]
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r13, r15, [ rsi + 0x10 ]; x50_1, x50_0<- arg2[0] * arg1[2] (_0*_0)
xor rdx, rdx
adox r15, rbx
adox r11, r13
adcx rbp, r15
adcx r11, r14
mov rdi, 0xffffffffffffffff ; moving imm to reg
and rcx, rdi; lo limb and'ed
adox rcx, rbp
adox r11, rdx
mov r14, rcx;
shrd r14, r11, 0x33; lo
shr r11, 0x33; x86_1>>=0x33
and r14, rdi; lo limb and'ed
mov rbx, 0x7ffffffffffff ; moving imm to reg
and rcx, rbx; x88 <- x87&0x7ffffffffffff
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r15, r13, [ rax + 0x10 ]; x48_1, x48_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r11, rbp, [ rsi + 0x8 ]; x53_1, x53_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx rbx, rdi, [ rsi + 0x18 ]; x46_1, x46_0<- arg2[0] * arg1[3] (_0*_0)
mov rdx, [ rsp - 0x40 ]; load m64 x10_0 to register64
adox rdx, [ rsp - 0x18 ]
mov [ rsp + 0x10 ], rcx; spilling x88 to mem
mov rcx, [ rsp - 0x48 ]; load m64 x10_1 to register64
adox rcx, [ rsp - 0x20 ]
adcx rbp, rdx
adcx rcx, r11
xor r11, r11
adox rdi, rbp
adox rcx, rbx
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rbp, rbx, [ rax + 0x8 ]; x45_1, x45_0<- arg1[3] * arg2[1] (_0*_0)
adcx rbx, r13
adcx r15, rbp
mov rdx, rdi;
xor r13, r13
adox rdx, [ rsp + 0x0 ]
adox rcx, [ rsp - 0x8 ]
adcx r14, rdx
adc rcx, 0x0; add CF to r0's alloc
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, r11, [ rax + 0x18 ]; x52_1, x52_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, r14;
shrd r14, rcx, 0x33; lo
shr rcx, 0x33; x95_1>>=0x33
xor rbp, rbp
adox r11, rbx
adox r15, rdi
mov r13, rdx; preserving value of x96 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx rdi, rbx, [ rax + 0x20 ]; x59_1, x59_0<- arg1[0] * arg2[4] (_0*_0)
adcx r9, r11
adcx r15, r8
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r14, rdx; lo limb and'ed
adox rbx, r9
adox r15, rdi
adcx r14, rbx
adc r15, 0x0; add CF to r0's alloc
mov r8, 0x7ffffffffffff ; moving imm to reg
and r13, r8; x97 <- x96&0x7ffffffffffff
mov rcx, r14;
mov r11, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r11 + 0x18 ], r13; out1[3] = x97
shrd r14, r15, 0x33; lo
shr r15, 0x33; x104_1>>=0x33
mov rdi, 0x13 ; moving imm to reg
imul r14, rdi; lox108 = x105*0x13
lea r14, [ r14 + r12 ]
mov r12, r14;
shr r12, 0x33; x110 <- x109>> 0x33
and r10, r8; x80 <- x79&0x7ffffffffffff
lea r12, [ r12 + r10 ]
mov r9, r12;
shr r9, 0x33; x113 <- x112>> 0x33
and r14, r8; x111 <- x109&0x7ffffffffffff
mov [ r11 + 0x0 ], r14; out1[0] = x111
add r9, [ rsp + 0x10 ]
and r12, r8; x114 <- x112&0x7ffffffffffff
mov [ r11 + 0x8 ], r12; out1[1] = x114
and rcx, r8; x107 <- x106&0x7ffffffffffff
mov [ r11 + 0x20 ], rcx; out1[4] = x107
mov [ r11 + 0x10 ], r9; out1[2] = x115
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 152
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0096
; seed 1700224605869517 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 4624171 ms on 800000 evaluations.
; Time spent for assembling and measuring (initial batch_size=329, initial num_batches=31): 486258 ms
; number of used evaluations: 800000
; Ratio (time for assembling + measure)/(total runtime for 800000 evals): 0.10515571331596517
; number reverted permutation / tried permutation: 322765 / 399699 =80.752%
; number reverted decision / tried decision: 257658 / 400300 =64.366%