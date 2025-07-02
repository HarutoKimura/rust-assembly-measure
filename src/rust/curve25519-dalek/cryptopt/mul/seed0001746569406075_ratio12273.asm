SECTION .text
	GLOBAL curve25519_dalek_mul_CryptOpt
curve25519_dalek_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r11, r10, [ rax + 0x10 ]; x53_1, x53_0<- arg1[0] * arg2[2] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r8, rcx, [ rax + 0x0 ]; x62_1, x62_0<- arg1[4] * arg2[0] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov r9, [ rax + 0x18 ]; load m64 x11 to register64
imul r9, rdx; lox11 = arg2[3]*0x13
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, [ rax + 0x8 ]; load m64 x5 to register64
imul rbx, rdx; lox5 = arg2[1]*0x13
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x0 ]; x19_1, x19_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, rbx; x24_1, x24_0<- arg1[4] * x5 (_0*_0)
test al, al
adox rbp, r13
adox r14, r12
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r12, rbx, r9; x36_1, x36_0<- arg1[2] * x11 (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov r13, [ rax + 0x10 ]; load m64 x8 to register64
imul r13, rdx; lox8 = arg2[2]*0x13
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rsi + 0x10 ]; x64_1, x64_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x48 ], rdi; spilling x64_1 to mem
mov [ rsp - 0x40 ], r15; spilling x64_0 to mem
mulx r15, rdi, r9; x48_1, x48_0<- arg1[3] * x11 (_0*_0)
mov rdx, r13; x8 to rdx
mov [ rsp - 0x38 ], r8; spilling x62_1 to mem
mulx r8, r13, [ rsi + 0x20 ]; x47_1, x47_0<- arg1[4] * x8 (_0*_0)
mov [ rsp - 0x30 ], rcx; spilling x62_0 to mem
mov [ rsp - 0x28 ], r11; spilling x53_1 to mem
mulx r11, rcx, [ rsi + 0x18 ]; x30_1, x30_0<- arg1[3] * x8 (_0*_0)
xor rdx, rdx
adox rcx, rbp
adox r14, r11
adcx rbx, rcx
adcx r14, r12
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r12, rbp, [ rax + 0x8 ]; x46_1, x46_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov r11, [ rax + 0x20 ]; load m64 x14 to register64
imul r11, rdx; lox14 = arg2[4]*0x13
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x20 ], r10; spilling x53_0 to mem
mulx r10, rcx, r11; x42_1, x42_0<- arg1[1] * x14 (_0*_0)
xor rdx, rdx
adox rcx, rbx
adox r14, r10
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r10, rbx, r11; x49_1, x49_0<- arg1[2] * x14 (_0*_0)
adcx rbp, r13
adcx r8, r12
mov rdx, rcx;
add rdi, rbp; could be done better, if r0 has been u8 as well
adcx r8, r15
mov r15, rdx; preserving value of x75 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mulx r12, r13, [ rsi + 0x8 ]; x44_1, x44_0<- arg1[1] * arg2[0] (_0*_0)
test al, al
adox rbx, rdi
adox r8, r10
adcx r13, rbx
adcx r8, r12
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbp, r10, r9; x54_1, x54_0<- arg1[4] * x11 (_0*_0)
mov rdx, r11; x14 to rdx
mulx r9, r11, [ rsi + 0x18 ]; x55_1, x55_0<- arg1[3] * x14 (_0*_0)
mov rdi, r10;
xor r12, r12
adox rdi, [ rsp - 0x20 ]
adox rbp, [ rsp - 0x28 ]
adcx r11, rdi
adcx rbp, r9
shrd rcx, r14, 0x33; lo
shr r14, 0x33; x68_1>>=0x33
mov rbx, 0xffffffffffffffff ; moving imm to reg
and rcx, rbx; lo limb and'ed
adox rcx, r13
adox r8, r12
mov r13, rcx;
shrd r13, r8, 0x33; lo
shr r8, 0x33; x77_1>>=0x33
mov r10, rdx; preserving value of x14 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx rdi, r9, [ rax + 0x0 ]; x50_1, x50_0<- arg1[2] * arg2[0] (_0*_0)
test al, al
adox r9, r11
adox rbp, rdi
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r14, r11, [ rax + 0x8 ]; x51_1, x51_0<- arg1[1] * arg2[1] (_0*_0)
adcx r11, r9
adcx rbp, r14
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rdi, r8, r10; x61_1, x61_0<- arg1[4] * x14 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r9, r10, [ rax + 0x18 ]; x60_1, x60_0<- arg1[0] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r12, r14, [ rsi + 0x18 ]; x56_1, x56_0<- arg1[3] * arg2[0] (_0*_0)
and r13, rbx; lo limb and'ed
adox r10, r8
adox rdi, r9
adcx r13, r11
adc rbp, 0x0; add CF to r0's alloc
mov rdx, r13;
shrd rdx, rbp, 0x33; lo
shr rbp, 0x33; x86_1>>=0x33
mov r11, 0x7ffffffffffff ; moving imm to reg
and r13, r11; x94 <- x93&0x7ffffffffffff
adox r14, r10
adox rdi, r12
mov r8, rdx; preserving value of x86_0 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mulx r12, r9, [ rsi + 0x0 ]; x67_1, x67_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rdx + 0x10 ], r13; out1[2] = x94
mov r10, rdx; preserving value of out1 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r13, rbp, [ rax + 0x8 ]; x57_1, x57_0<- arg1[2] * arg2[1] (_0*_0)
adcx rbp, r14
adcx rdi, r13
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r13, r14, [ rax + 0x10 ]; x58_1, x58_0<- arg1[1] * arg2[2] (_0*_0)
xor rdx, rdx
adox r14, rbp
adox rdi, r13
and r8, rbx; lo limb and'ed
adox r8, r14
adox rdi, rdx
mov rbp, r8;
shrd r8, rdi, 0x33; lo
shr rdi, 0x33; x95_1>>=0x33
add r9, [ rsp - 0x30 ]; could be done better, if r0 has been u8 as well
adcx r12, [ rsp - 0x38 ]
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r14, r13, [ rsi + 0x18 ]; x63_1, x63_0<- arg1[3] * arg2[1] (_0*_0)
xor rdx, rdx
adox r13, r9
adox r12, r14
mov rdi, r13;
adcx rdi, [ rsp - 0x40 ]
adcx r12, [ rsp - 0x48 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r14, r9, [ rax + 0x18 ]; x65_1, x65_0<- arg1[1] * arg2[3] (_0*_0)
xor rdx, rdx
adox r9, rdi
adox r12, r14
and rbp, r11; x103 <- x102&0x7ffffffffffff
and r8, rbx; lo limb and'ed
adox r8, r9
adox r12, rdx
mov r13, r8;
shrd r13, r12, 0x33; lo
shr r12, 0x33; x104_1>>=0x33
mov rdi, 0x13 ; moving imm to reg
imul r13, rdi; lox108 = x105*0x13
and r15, r11; x76 <- x75&0x7ffffffffffff
lea r13, [ r13 + r15 ]
and rcx, r11; x85 <- x84&0x7ffffffffffff
mov r14, r13;
and r14, r11; x112 <- x109&0x7ffffffffffff
mov [ r10 + 0x0 ], r14; out1[0] = x112
shr r13, 0x33; x110 <- x109>> 0x33
and r8, r11; x107 <- x106&0x7ffffffffffff
mov [ r10 + 0x20 ], r8; out1[4] = x107
lea r13, [ r13 + rcx ]
mov [ r10 + 0x8 ], r13; out1[1] = x111
mov [ r10 + 0x18 ], rbp; out1[3] = x103
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.2273
; seed 2110633175094276 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 974786 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=294, initial num_batches=31): 103786 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.10647054840754791
; number reverted permutation / tried permutation: 70036 / 89934 =77.875%
; number reverted decision / tried decision: 56375 / 90065 =62.594%