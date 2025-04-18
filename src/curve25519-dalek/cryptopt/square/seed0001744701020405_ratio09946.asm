SECTION .text
	GLOBAL curve25519_dalek_square_CryptOpt
curve25519_dalek_square_CryptOpt:
mov rax, 0x13 ; moving imm to reg
mov r10, [ rsi + 0x18 ]; load m64 x11 to register64
imul r10, rax; lox11 = arg1[3]*0x13
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rcx, r11, r10; x28_1, x28_0<- x11 * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; load m64 x12 to register64
imul rdx, rax; lox12 = arg1[4]*0x13
mulx r9, r8, [ rsi + 0x8 ]; x17_1, x17_0<- arg1[1] * x12 (_0*_0)
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, rdx; preserving value of x12 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, r10; x20_1, x20_0<- arg1[2] * x11 (_0*_0)
test al, al
adox rbp, r8
adox r9, r12
mov rdx, 0x2 ; moving imm to reg
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r8, r9; __,tmp <- (a_0 in rdx) * b_hi
mulx r13, r12, rbp; hi,lo <- (a_0 in rdx) * b_lo
lea r13, [r13+r8]; hi += tmp
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rbp, r8, [ rsi + 0x18 ]; x34_1, x34_0<- arg1[1] * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r9, [ rsi + 0x20 ]; x33_1, x33_0<- arg1[0] * arg1[4] (_0*_0)
adcx r8, r9
adcx r14, rbp
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r9, rbp, rdx; x14_1, x14_0<- arg1[0]^2
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx rax, r15, rbx; x24_1, x24_0<- arg1[2] * x12 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], r14; spilling x40_1 to mem
mulx r14, rdi, [ rsi + 0x8 ]; x23_1, x23_0<- arg1[0] * arg1[1] (_0*_0)
add r15, rdi; could be done better, if r0 has been u8 as well
adcx r14, rax
test al, al
adox rbp, r12
adox r13, r9
mov rdx, 0x2 ; moving imm to reg
mulx rax, r12, r14; __,tmp <- (a_0 in rdx) * b_hi
mulx rax, r9, r15; hi,lo <- (a_0 in rdx) * b_lo
lea rax, [rax+r12]; hi += tmp
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rdi, r12, [ rsi + 0x10 ]; x26_1, x26_0<- arg1[0] * arg1[2] (_0*_0)
adcx r11, r12
adcx rdi, rcx
mov rdx, r10; x11 to rdx
mulx rcx, r10, [ rsi + 0x18 ]; x22_1, x22_0<- x11 * arg1[3] (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mulx r12, r15, rdi; __,tmp <- (a_0 in rdx) * b_hi
mulx r12, r14, r11; hi,lo <- (a_0 in rdx) * b_lo
lea r12, [r12+r15]; hi += tmp
mov r15, rbp;
shrd r15, r13, 0x33; lo
shr r13, 0x33; x52_1>>=0x33
xor r11, r11
adox r10, r9
adox rax, rcx
mov r9, 0xffffffffffffffff ; moving imm to reg
and r15, r9; lo limb and'ed
adox r15, r10
adox rax, r11
mov rdi, r15;
shrd rdi, rax, 0x33; lo
shr rax, 0x33; x55_1>>=0x33
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r13, rcx, rdx; x25_1, x25_0<- arg1[1]^2
xor rdx, rdx
adox rcx, r14
adox r12, r13
and rdi, r9; lo limb and'ed
adox rdi, rcx
adox r12, rdx
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r14, r11, [ rsi + 0x18 ]; x30_1, x30_0<- arg1[0] * arg1[3] (_0*_0)
mov rdx, rdi;
shrd rdx, r12, 0x33; lo
shr r12, 0x33; x58_1>>=0x33
mov r10, rdx; preserving value of x58_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r13, rax, [ rsi + 0x8 ]; x31_1, x31_0<- arg1[1] * arg1[2] (_0*_0)
mov rdx, rbx; x12 to rdx
mulx rcx, rbx, [ rsi + 0x20 ]; x29_1, x29_0<- x12 * arg1[4] (_0*_0)
add rax, r11; could be done better, if r0 has been u8 as well
adcx r14, r13
mov rdx, 0x2 ; moving imm to reg
mulx r13, r11, r14; __,tmp <- (a_0 in rdx) * b_hi
mulx r13, r12, rax; hi,lo <- (a_0 in rdx) * b_lo
lea r13, [r13+r11]; hi += tmp
and r10, r9; lo limb and'ed
adox rbx, r12
adox r13, rcx
adcx r10, rbx
adc r13, 0x0; add CF to r0's alloc
mov r11, r10;
mov rcx, 0x7ffffffffffff ; moving imm to reg
and r11, rcx; x76 <- x75&0x7ffffffffffff
mov rax, [ rsp - 0x48 ]; load m64 x40_1 to register64
mulx rbx, r14, rax; __,tmp <- (a_0 in rdx) * b_hi
mulx rbx, r12, r8; hi,lo <- (a_0 in rdx) * b_lo
lea rbx, [rbx+r14]; hi += tmp
mov r14, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r14 + 0x18 ], r11; out1[3] = x76
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rax, r8, rdx; x32_1, x32_0<- arg1[2]^2
shrd r10, r13, 0x33; lo
shr r13, 0x33; x61_1>>=0x33
xor rdx, rdx
adox r8, r12
adox rbx, rax
and r10, r9; lo limb and'ed
adox r10, r8
adox rbx, rdx
mov r11, r10;
shrd r11, rbx, 0x33; lo
shr rbx, 0x33; x64_1>>=0x33
and r10, rcx; x74 <- x73&0x7ffffffffffff
and r15, rcx; x70 <- x69&0x7ffffffffffff
mov r12, 0x13 ; moving imm to reg
imul r11, r12; lox66 = x65*0x13
mov [ r14 + 0x20 ], r10; out1[4] = x74
and rdi, rcx; x78 <- x77&0x7ffffffffffff
and rbp, rcx; x39 <- x38&0x7ffffffffffff
lea r11, [ r11 + rbp ]
mov rax, r11;
shr rax, 0x33; x71 <- x67>> 0x33
lea rax, [ rax + r15 ]
and r11, rcx; x68 <- x67&0x7ffffffffffff
mov [ r14 + 0x8 ], rax; out1[1] = x72
mov [ r14 + 0x10 ], rdi; out1[2] = x78
mov [ r14 + 0x0 ], r11; out1[0] = x68
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.9946
; seed 3580376608563915 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 36821 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=422, initial num_batches=31): 4877 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.1324515901252003
; number reverted permutation / tried permutation: 2946 / 3947 =74.639%
; number reverted decision / tried decision: 2673 / 4052 =65.967%