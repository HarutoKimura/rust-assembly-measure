SECTION .text
	GLOBAL curve25519_dalek_mul_CryptOpt
curve25519_dalek_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r11, r10, [ rax + 0x8 ]; x46_1, x46_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r8, rcx, [ rax + 0x0 ]; x50_1, x50_0<- arg1[2] * arg2[0] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rax + 0x10 ]; x64_1, x64_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x0 ]; x53_1, x53_0<- arg1[0] * arg2[2] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov r13, [ rax + 0x8 ]; load m64 x5 to register64
imul r13, rdx; lox5 = arg2[1]*0x13
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, [ rax + 0x0 ]; x44_1, x44_0<- arg1[1] * arg2[0] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], rbx; spilling x64_1 to mem
mulx rbx, rdi, r13; x24_1, x24_0<- arg1[4] * x5 (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov r13, [ rax + 0x10 ]; load m64 x8 to register64
imul r13, rdx; lox8 = arg2[2]*0x13
mov rdx, r13; x8 to rdx
mov [ rsp - 0x40 ], r9; spilling x64_0 to mem
mulx r9, r13, [ rsi + 0x18 ]; x30_1, x30_0<- arg1[3] * x8 (_0*_0)
mov [ rsp - 0x38 ], r8; spilling x50_1 to mem
mov r8, rdx; preserving value of x8 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp - 0x30 ], rcx; spilling x50_0 to mem
mov [ rsp - 0x28 ], r15; spilling x44_1 to mem
mulx r15, rcx, [ rsi + 0x0 ]; x19_1, x19_0<- arg2[0] * arg1[0] (_0*_0)
xor rdx, rdx
adox rcx, rdi
adox rbx, r15
mov rdx, r8; x8 to rdx
mulx rdi, r8, [ rsi + 0x20 ]; x47_1, x47_0<- arg1[4] * x8 (_0*_0)
adcx r10, r8
adcx rdi, r11
mov r11, 0x13 ; moving imm to reg
mov rdx, [ rax + 0x20 ]; load m64 x14 to register64
imul rdx, r11; lox14 = arg2[4]*0x13
mov r15, [ rax + 0x18 ]; load m64 x11 to register64
imul r15, r11; lox11 = arg2[3]*0x13
mulx r11, r8, [ rsi + 0x8 ]; x42_1, x42_0<- arg1[1] * x14 (_0*_0)
mov [ rsp - 0x20 ], r14; spilling x44_0 to mem
mov r14, rdx; preserving value of x14 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mov [ rsp - 0x18 ], rdi; spilling x70_1 to mem
mov [ rsp - 0x10 ], r10; spilling x70_0 to mem
mulx r10, rdi, r15; x54_1, x54_0<- arg1[4] * x11 (_0*_0)
add r13, rcx; could be done better, if r0 has been u8 as well
adcx rbx, r9
mov rdx, r15; x11 to rdx
mulx r9, r15, [ rsi + 0x10 ]; x36_1, x36_0<- arg1[2] * x11 (_0*_0)
test al, al
adox rbp, rdi
adox r10, r12
adcx r15, r13
adcx rbx, r9
xor r12, r12
adox r8, r15
adox rbx, r11
mov rcx, r8;
shrd rcx, rbx, 0x33; lo
shr rbx, 0x33; x68_1>>=0x33
mulx rdi, r11, [ rsi + 0x18 ]; x48_1, x48_0<- arg1[3] * x11 (_0*_0)
xor rdx, rdx
adox r11, [ rsp - 0x10 ]
adox rdi, [ rsp - 0x18 ]
mov rdx, r14; x14 to rdx
mulx r14, r12, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * x14 (_0*_0)
adcx r12, r11
adcx rdi, r14
mov r13, r12;
xor r9, r9
adox r13, [ rsp - 0x20 ]
adox rdi, [ rsp - 0x28 ]
mov r15, 0xffffffffffffffff ; moving imm to reg
and rcx, r15; lo limb and'ed
adox rcx, r13
adox rdi, r9
mov rbx, rcx;
shrd rbx, rdi, 0x33; lo
shr rdi, 0x33; x77_1>>=0x33
and rbx, r15; lo limb and'ed
mov r11, 0x7ffffffffffff ; moving imm to reg
and r8, r11; x76 <- x75&0x7ffffffffffff
mulx r12, r14, [ rsi + 0x18 ]; x55_1, x55_0<- arg1[3] * x14 (_0*_0)
adox r14, rbp
adox r10, r12
mov rbp, rdx; preserving value of x14 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx rdi, r13, [ rax + 0x8 ]; x51_1, x51_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, r14;
adcx rdx, [ rsp - 0x30 ]
adcx r10, [ rsp - 0x38 ]
xor r12, r12
adox r13, rdx
adox r10, rdi
adcx rbx, r13
adc r10, 0x0; add CF to r0's alloc
mov r9, rbx;
shrd rbx, r10, 0x33; lo
shr r10, 0x33; x86_1>>=0x33
mov rdx, rbp; x14 to rdx
mulx r14, rbp, [ rsi + 0x20 ]; x61_1, x61_0<- arg1[4] * x14 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r13, rdi, [ rax + 0x18 ]; x60_1, x60_0<- arg1[0] * arg2[3] (_0*_0)
and r9, r11; x94 <- x93&0x7ffffffffffff
adox rdi, rbp
adox r14, r13
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx rbp, r10, [ rsi + 0x18 ]; x56_1, x56_0<- arg1[3] * arg2[0] (_0*_0)
adcx r10, rdi
adcx r14, rbp
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx rdi, r13, [ rsi + 0x10 ]; x57_1, x57_0<- arg1[2] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r12, rbp, [ rsi + 0x8 ]; x58_1, x58_0<- arg1[1] * arg2[2] (_0*_0)
xor rdx, rdx
adox r13, r10
adox r14, rdi
adcx rbp, r13
adcx r14, r12
and rbx, r15; lo limb and'ed
adox rbx, rbp
adox r14, rdx
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx rdi, r10, [ rsi + 0x20 ]; x62_1, x62_0<- arg1[4] * arg2[0] (_0*_0)
mov rdx, rbx;
shrd rdx, r14, 0x33; lo
shr r14, 0x33; x95_1>>=0x33
mov r12, rdx; preserving value of x95_0 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mulx rbp, r13, [ rsi + 0x0 ]; x67_1, x67_0<- arg1[0] * arg2[4] (_0*_0)
xor rdx, rdx
adox r13, r10
adox rdi, rbp
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r14, r10, [ rax + 0x8 ]; x63_1, x63_0<- arg1[3] * arg2[1] (_0*_0)
adcx r10, r13
adcx rdi, r14
mov rdx, r10;
xor rbp, rbp
adox rdx, [ rsp - 0x40 ]
adox rdi, [ rsp - 0x48 ]
mov r13, rdx; preserving value of x99_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r10, r14, [ rax + 0x18 ]; x65_1, x65_0<- arg1[1] * arg2[3] (_0*_0)
adcx r14, r13
adcx rdi, r10
and r12, r15; lo limb and'ed
adox r12, r14
adox rdi, rbp
mov rdx, r12;
shrd r12, rdi, 0x33; lo
shr rdi, 0x33; x104_1>>=0x33
mov r13, 0x13 ; moving imm to reg
imul r12, r13; lox108 = x105*0x13
lea r12, [ r12 + r8 ]
mov r8, r12;
and r8, r11; x112 <- x109&0x7ffffffffffff
shr r12, 0x33; x110 <- x109>> 0x33
mov r10, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r10 + 0x10 ], r9; out1[2] = x94
and rdx, r11; x107 <- x106&0x7ffffffffffff
mov [ r10 + 0x20 ], rdx; out1[4] = x107
and rbx, r11; x103 <- x102&0x7ffffffffffff
and rcx, r11; x85 <- x84&0x7ffffffffffff
lea r12, [ r12 + rcx ]
mov [ r10 + 0x8 ], r12; out1[1] = x111
mov [ r10 + 0x0 ], r8; out1[0] = x112
mov [ r10 + 0x18 ], rbx; out1[3] = x103
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.2380
; seed 2621336291749788 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 5037502 ms on 800000 evaluations.
; Time spent for assembling and measuring (initial batch_size=294, initial num_batches=31): 459794 ms
; number of used evaluations: 800000
; Ratio (time for assembling + measure)/(total runtime for 800000 evals): 0.09127420693828012
; number reverted permutation / tried permutation: 312086 / 400162 =77.990%
; number reverted decision / tried decision: 251957 / 399837 =63.015%