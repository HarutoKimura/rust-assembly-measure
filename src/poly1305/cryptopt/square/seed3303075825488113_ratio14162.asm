SECTION .text
	GLOBAL rust_fiat_poly1305_carry_square_CryptOpt
rust_fiat_poly1305_carry_square_CryptOpt:
imul rax, [ rsi + 0x8 ], 0x2; x8 <- arg1[1] * 0x2
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r11, r10, rax; x22_1, x22_0<- arg1[0] * x8 (_0*_0)
mov rdx, 0x14 ; moving imm to reg
mov rcx, [ rsi + 0x10 ]; load m64 x13 to register64
imul rcx, rdx; lox13 = arg1[2]*0x14
mov rdx, rcx; x13 to rdx
mulx r8, rcx, [ rsi + 0x8 ]; x15_1, x15_0<- arg1[1] * x13 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, rdx; x23_1, x23_0<- arg1[0]^2
xor rdx, rdx
adox rcx, r9
adox rbx, r8
mov r8, rcx;
mov r9, 0x5 ; moving imm to reg
mov rdx, [ rsi + 0x10 ]; load m64 x4 to register64
imul rdx, r9; lox4 = arg1[2]*0x5
shrd rcx, rbx, 0x2c; lo
shr rbx, 0x2c; x25_1>>=0x2c
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov rbp, 0xffffffffffffffff ; moving imm to reg
and rcx, rbp; lo limb and'ed
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbx, [ rsi + 0x10 ]; x11_1, x11_0<- x4 * arg1[2] (_0*_0)
mov rdx, 0xffffffffffd ; moving imm to reg
and r8, rdx; x27 <- x26&0xffffffffffd
adox rbx, r10
adox r11, r12
adcx rcx, rbx
adc r11, 0x0; add CF to r0's alloc
mov r10, rcx;
shrd r10, r11, 0x2b; lo
shr r11, 0x2b; x32_1>>=0x2b
and r10, rbp; lo limb and'ed
imul r12, [ rsi + 0x10 ], 0x2; x5 <- arg1[2] * 0x2
mov rdx, r12; x5 to rdx
mulx rbx, r12, [ rsi + 0x0 ]; x21_1, x21_0<- arg1[0] * x5 (_0*_0)
mov rdx, rax; x8 to rdx
mulx r11, rax, [ rsi + 0x8 ]; x17_1, x17_0<- x8 * arg1[1] (_0*_0)
add rax, r12; could be done better, if r0 has been u8 as well
adcx rbx, r11
xor rdx, rdx
adox r10, rax
adox rbx, rdx
mov r12, r10;
shrd r12, rbx, 0x2b; lo
shr rbx, 0x2b; x37_1>>=0x2b
imul r12, r9; lox41 = x38*0x5
lea r12, [ r12 + r8 ]
mov r8, 0xfffffffffff ; moving imm to reg
mov r11, r12;
and r11, r8; x44 <- x42&0xfffffffffff
shr r12, 0x2c; x43 <- x42>> 0x2c
mov [ rdi + 0x0 ], r11; out1[0] = x44
mov rax, 0x7ffffffffff ; moving imm to reg
and rcx, rax; x34 <- x33&0x7ffffffffff
lea r12, [ r12 + rcx ]
mov rbx, r12;
shr rbx, 0x2b; x46 <- x45>> 0x2b
and r10, rax; x40 <- x39&0x7ffffffffff
lea rbx, [ rbx + r10 ]
and r12, rax; x47 <- x45&0x7ffffffffff
mov [ rdi + 0x8 ], r12; out1[1] = x47
mov [ rdi + 0x10 ], rbx; out1[2] = x48
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.4162
; seed 3303075825488113 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 361778 ms on 20000 evaluations.
; Time spent for assembling and measuring (initial batch_size=674, initial num_batches=31): 10019 ms
; number of used evaluations: 20000
; Ratio (time for assembling + measure)/(total runtime for 20000 evals): 0.027693779057875272
; number reverted permutation / tried permutation: 7614 / 10023 =75.965%
; number reverted decision / tried decision: 8144 / 9976 =81.636%