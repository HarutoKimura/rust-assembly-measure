SECTION .text
	GLOBAL fiat_c_curve25519_carry_square_CryptOpt
fiat_c_curve25519_carry_square_CryptOpt:
mov rax, 0x26 ; moving imm to reg
mov r10, [ rsi + 0x20 ]; load m64 x5 to register64
imul r10, rax; lox5 = arg1[4]*0x26
mov rdx, r10; x5 to rdx
mulx r11, r10, [ rsi + 0x8 ]; x32_1, x32_0<- arg1[1] * x5 (_0*_0)
mov rcx, rdx; preserving value of x5 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r9, r8, rdx; x46_1, x46_0<- arg1[0]^2
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, rdx; x30_1, x30_0<- arg1[2]^2
mov rdx, [ rsi + 0x18 ]; load m64 x10 to register64
imul rdx, rax; lox10 = arg1[3]*0x26
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, [ rsi + 0x10 ]; x29_1, x29_0<- arg1[2] * x10 (_0*_0)
mov rdx, [ rsi + 0x10 ]; load m64 arg1[2] to register64
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov r14, rdx; load m64 x14 to register64
shl r14, 0x1; x14 <- arg1[2] * 0x2
mov rdx, rcx; x5 to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, rcx, [ rsi + 0x10 ]; x27_1, x27_0<- arg1[2] * x5 (_0*_0)
mov rax, 0x13 ; moving imm to reg
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov rdi, [ rsi + 0x18 ]; load m64 x9 to register64
imul rdi, rax; lox9 = arg1[3]*0x13
mov rax, rdx; preserving value of x5 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mov [ rsp - 0x48 ], rbp; spilling x30_1 to mem
mov [ rsp - 0x40 ], rbx; spilling x30_0 to mem
mulx rbx, rbp, rdi; x25_1, x25_0<- x9 * arg1[3] (_0*_0)
xor rdx, rdx
adox rbp, rcx
adox r15, rbx
adcx r12, r10
adcx r11, r13
add r8, r12; could be done better, if r0 has been u8 as well
adcx r11, r9
mov r10, r8;
shrd r10, r11, 0x33; lo
shr r11, 0x33; x49_1>>=0x33
mov r9, 0xffffffffffffffff ; moving imm to reg
and r10, r9; lo limb and'ed
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rcx, r13, rdx; x37_1, x37_0<- arg1[1]^2
imul rdx, [ rsi + 0x8 ], 0x2; x17 <- arg1[1] * 0x2
mulx rbx, rdi, [ rsi + 0x0 ]; x45_1, x45_0<- arg1[0] * x17 (_0*_0)
xor r12, r12
adox rdi, rbp
adox r15, rbx
mov rdx, rax; x5 to rdx
mulx rbp, rax, [ rsi + 0x18 ]; x23_1, x23_0<- arg1[3] * x5 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbx, r11, r14; x43_1, x43_0<- arg1[0] * x14 (_0*_0)
adcx rax, r13
adcx rcx, rbp
xor rdx, rdx
adox r10, rdi
adox r15, rdx
mov r12, r10;
shrd r12, r15, 0x33; lo
shr r15, 0x33; x62_1>>=0x33
test al, al
adox r11, rax
adox rcx, rbx
and r12, r9; lo limb and'ed
adox r12, r11
adox rcx, rdx
mov r13, r12;
shrd r13, rcx, 0x33; lo
shr rcx, 0x33; x67_1>>=0x33
and r13, r9; lo limb and'ed
imul rdi, [ rsi + 0x18 ], 0x2; x11 <- arg1[3] * 0x2
mov rbp, 0x13 ; moving imm to reg
mov rbx, [ rsi + 0x20 ]; load m64 x4 to register64
imul rbx, rbp; lox4 = arg1[4]*0x13
mov rdx, r14; x14 to rdx
mulx rax, r14, [ rsi + 0x8 ]; x36_1, x36_0<- arg1[1] * x14 (_0*_0)
mov rdx, rbx; x4 to rdx
mulx r15, rbx, [ rsi + 0x20 ]; x20_1, x20_0<- x4 * arg1[4] (_0*_0)
xor r11, r11
adox rbx, r14
adox rax, r15
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r14, rcx, rdi; x42_1, x42_0<- arg1[0] * x11 (_0*_0)
adcx rcx, rbx
adcx rax, r14
imul rdx, [ rsi + 0x20 ], 0x2; x6 <- arg1[4] * 0x2
mulx rbx, r15, [ rsi + 0x0 ]; x41_1, x41_0<- arg1[0] * x6 (_0*_0)
xor r14, r14
adox r13, rcx
adox rax, r14
mov r11, r13;
shrd r13, rax, 0x33; lo
shr rax, 0x33; x72_1>>=0x33
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rax, rcx, rdi; x34_1, x34_0<- arg1[1] * x11 (_0*_0)
mov rdx, rcx;
add rdx, [ rsp - 0x40 ]; could be done better, if r0 has been u8 as well
adcx rax, [ rsp - 0x48 ]
test al, al
adox r15, rdx
adox rax, rbx
and r13, r9; lo limb and'ed
adox r13, r15
adox rax, r14
mov rdi, r13;
shrd r13, rax, 0x33; lo
shr rax, 0x33; x77_1>>=0x33
mov rbx, 0x7ffffffffffff ; moving imm to reg
and rdi, rbx; x80 <- x79&0x7ffffffffffff
mov rcx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rcx + 0x20 ], rdi; out1[4] = x80
imul r13, rbp; lox81 = x78*0x13
and r8, rbx; x51 <- x50&0x7ffffffffffff
lea r13, [ r13 + r8 ]
and r10, rbx; x64 <- x63&0x7ffffffffffff
mov rdx, r13;
shr rdx, 0x33; x83 <- x82>> 0x33
lea rdx, [ rdx + r10 ]
and r13, rbx; x84 <- x82&0x7ffffffffffff
mov r15, rdx;
and r15, rbx; x87 <- x85&0x7ffffffffffff
and r11, rbx; x74 <- x73&0x7ffffffffffff
mov [ rcx + 0x8 ], r15; out1[1] = x87
shr rdx, 0x33; x86 <- x85>> 0x33
and r12, rbx; x69 <- x68&0x7ffffffffffff
lea rdx, [ rdx + r12 ]
mov [ rcx + 0x0 ], r13; out1[0] = x84
mov [ rcx + 0x18 ], r11; out1[3] = x74
mov [ rcx + 0x10 ], rdx; out1[2] = x88
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1076
; seed 3353991416450531 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 707234 ms on 160000 evaluations.
; Time spent for assembling and measuring (initial batch_size=434, initial num_batches=31): 88484 ms
; number of used evaluations: 160000
; Ratio (time for assembling + measure)/(total runtime for 160000 evals): 0.12511276324384857
; number reverted permutation / tried permutation: 59161 / 80282 =73.691%
; number reverted decision / tried decision: 58041 / 79717 =72.809%