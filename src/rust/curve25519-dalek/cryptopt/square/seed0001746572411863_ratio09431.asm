SECTION .text
	GLOBAL curve25519_dalek_square_CryptOpt
curve25519_dalek_square_CryptOpt:
mov rax, 0x13 ; moving imm to reg
mov r10, [ rsi + 0x18 ]; load m64 x11 to register64
imul r10, rax; lox11 = arg1[3]*0x13
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rcx, r11, r10; x20_1, x20_0<- arg1[2] * x11 (_0*_0)
mov rdx, [ rsi + 0x20 ]; load m64 x12 to register64
imul rdx, rax; lox12 = arg1[4]*0x13
mulx r9, r8, [ rsi + 0x8 ]; x17_1, x17_0<- arg1[1] * x12 (_0*_0)
add r11, r8; could be done better, if r0 has been u8 as well
adcx r9, rcx
mulx r8, rcx, [ rsi + 0x10 ]; x24_1, x24_0<- arg1[2] * x12 (_0*_0)
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, rdx; preserving value of x12 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x0 ]; x23_1, x23_0<- arg1[0] * arg1[1] (_0*_0)
xor rdx, rdx
adox rcx, rbp
adox r12, r8
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbp, r8, rdx; x14_1, x14_0<- arg1[0]^2
mov rdx, 0x2 ; moving imm to reg
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r13, r9; __,tmp <- (a_0 in rdx) * b_hi
mulx r15, r14, r11; hi,lo <- (a_0 in rdx) * b_lo
lea r15, [r15+r13]; hi += tmp
adcx r8, r14
adcx r15, rbp
mov r13, r8;
shrd r13, r15, 0x33; lo
shr r15, 0x33; x52_1>>=0x33
mov r11, 0xffffffffffffffff ; moving imm to reg
and r13, r11; lo limb and'ed
mulx r14, r9, r12; __,tmp <- (a_0 in rdx) * b_hi
mulx r14, rbp, rcx; hi,lo <- (a_0 in rdx) * b_lo
lea r14, [r14+r9]; hi += tmp
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rcx, r9, [ rsi + 0x10 ]; x26_1, x26_0<- arg1[0] * arg1[2] (_0*_0)
mov rdx, r10; x11 to rdx
mulx r12, r10, [ rsi + 0x18 ]; x22_1, x22_0<- x11 * arg1[3] (_0*_0)
mulx rax, r15, [ rsi + 0x20 ]; x28_1, x28_0<- x11 * arg1[4] (_0*_0)
adox r15, r9
adox rcx, rax
adcx r10, rbp
adcx r14, r12
xor rdx, rdx
adox r13, r10
adox r14, rdx
mov rbp, 0x2 ; moving imm to reg
mov rdx, rbp; 0x2 to rdx
mulx r12, rbp, rcx; __,tmp <- (a_0 in rdx) * b_hi
mulx r12, r9, r15; hi,lo <- (a_0 in rdx) * b_lo
lea r12, [r12+rbp]; hi += tmp
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rax, rbp, rdx; x25_1, x25_0<- arg1[1]^2
mov rdx, r13;
adcx rbp, r9
adcx r12, rax
shrd r13, r14, 0x33; lo
shr r14, 0x33; x55_1>>=0x33
and r13, r11; lo limb and'ed
adox r13, rbp
mov r15, 0x0 ; moving imm to reg
adox r12, r15
mov rcx, r13;
shrd rcx, r12, 0x33; lo
shr r12, 0x33; x58_1>>=0x33
mov r10, rdx; preserving value of x69 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx rax, r9, [ rsi + 0x18 ]; x30_1, x30_0<- arg1[0] * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r14, rbp, [ rsi + 0x8 ]; x34_1, x34_0<- arg1[1] * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r15, r12, [ rsi + 0x8 ]; x31_1, x31_0<- arg1[1] * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r11, [ rsi + 0x0 ]; x33_1, x33_0<- arg1[0] * arg1[4] (_0*_0)
mov rdx, rbx; x12 to rdx
mov [ rsp - 0x48 ], r13; spilling x77 to mem
mulx r13, rbx, [ rsi + 0x20 ]; x29_1, x29_0<- x12 * arg1[4] (_0*_0)
add r12, r9; could be done better, if r0 has been u8 as well
adcx rax, r15
add rbp, r11; could be done better, if r0 has been u8 as well
adcx rdi, r14
mov rdx, 0x2 ; moving imm to reg
mulx r15, r9, rdi; __,tmp <- (a_0 in rdx) * b_hi
mulx r15, r14, rbp; hi,lo <- (a_0 in rdx) * b_lo
lea r15, [r15+r9]; hi += tmp
mulx rbp, r9, rax; __,tmp <- (a_0 in rdx) * b_hi
mulx rbp, r11, r12; hi,lo <- (a_0 in rdx) * b_lo
lea rbp, [rbp+r9]; hi += tmp
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r12, r9, rdx; x32_1, x32_0<- arg1[2]^2
xor rdx, rdx
adox r9, r14
adox r15, r12
adcx rbx, r11
adcx rbp, r13
mov r13, 0xffffffffffffffff ; moving imm to reg
and rcx, r13; lo limb and'ed
adox rcx, rbx
adox rbp, rdx
mov rax, rcx;
shrd rax, rbp, 0x33; lo
shr rbp, 0x33; x61_1>>=0x33
and rax, r13; lo limb and'ed
adox rax, r9
adox r15, rdx
mov rdi, rax;
shrd rdi, r15, 0x33; lo
shr r15, 0x33; x64_1>>=0x33
mov r14, 0x7ffffffffffff ; moving imm to reg
and r8, r14; x39 <- x38&0x7ffffffffffff
mov r11, 0x13 ; moving imm to reg
imul rdi, r11; lox66 = x65*0x13
and rax, r14; x74 <- x73&0x7ffffffffffff
mov r12, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r12 + 0x20 ], rax; out1[4] = x74
lea rdi, [ rdi + r8 ]
mov r9, rdi;
shr r9, 0x33; x71 <- x67>> 0x33
and rdi, r14; x68 <- x67&0x7ffffffffffff
and r10, r14; x70 <- x69&0x7ffffffffffff
lea r9, [ r9 + r10 ]
mov [ r12 + 0x8 ], r9; out1[1] = x72
and rcx, r14; x76 <- x75&0x7ffffffffffff
mov [ r12 + 0x18 ], rcx; out1[3] = x76
mov rbx, [ rsp - 0x48 ];
and rbx, r14; x78 <- x77&0x7ffffffffffff
mov [ r12 + 0x10 ], rbx; out1[2] = x78
mov [ r12 + 0x0 ], rdi; out1[0] = x68
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.9431
; seed 4064717036078969 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 765844 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=447, initial num_batches=31): 111396 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.14545521019946622
; number reverted permutation / tried permutation: 66056 / 89880 =73.494%
; number reverted decision / tried decision: 57774 / 90119 =64.109%