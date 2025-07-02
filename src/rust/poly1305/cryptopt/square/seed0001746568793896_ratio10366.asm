SECTION .text
	GLOBAL rust_fiat_poly1305_carry_square_CryptOpt
rust_fiat_poly1305_carry_square_CryptOpt:
imul rax, [ rsi + 0x8 ], 0x2; x8 <- arg1[1] * 0x2
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r11, r10, rdx; x23_1, x23_0<- arg1[0]^2
mov rdx, 0x14 ; moving imm to reg
mov rcx, [ rsi + 0x10 ]; load m64 x13 to register64
imul rcx, rdx; lox13 = arg1[2]*0x14
mov rdx, rcx; x13 to rdx
mulx r8, rcx, [ rsi + 0x8 ]; x15_1, x15_0<- arg1[1] * x13 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, rax; x22_1, x22_0<- arg1[0] * x8 (_0*_0)
xor rdx, rdx
adox rcx, r10
adox r11, r8
mov r10, rcx;
shrd r10, r11, 0x2c; lo
shr r11, 0x2c; x25_1>>=0x2c
mov r8, 0xffffffffffffffff ; moving imm to reg
and r10, r8; lo limb and'ed
mov r11, 0x5 ; moving imm to reg
mov rdx, [ rsi + 0x10 ]; load m64 x4 to register64
imul rdx, r11; lox4 = arg1[2]*0x5
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x10 ]; x11_1, x11_0<- x4 * arg1[2] (_0*_0)
xor rdx, rdx
adox rbp, r9
adox rbx, r12
adcx r10, rbp
adc rbx, 0x0; add CF to r0's alloc
mov r9, r10;
shrd r10, rbx, 0x2b; lo
shr rbx, 0x2b; x32_1>>=0x2b
and r10, r8; lo limb and'ed
mov rdx, rax; x8 to rdx
mulx r12, rax, [ rsi + 0x8 ]; x17_1, x17_0<- x8 * arg1[1] (_0*_0)
imul rdx, [ rsi + 0x10 ], 0x2; x5 <- arg1[2] * 0x2
mulx rbx, rbp, [ rsi + 0x0 ]; x21_1, x21_0<- arg1[0] * x5 (_0*_0)
xor rdx, rdx
adox rax, rbp
adox rbx, r12
adcx r10, rax
adc rbx, 0x0; add CF to r0's alloc
mov r12, r10;
shrd r12, rbx, 0x2b; lo
shr rbx, 0x2b; x37_1>>=0x2b
mov rbp, 0x7ffffffffff ; moving imm to reg
and r10, rbp; x40 <- x39&0x7ffffffffff
imul r12, r11; lox41 = x38*0x5
mov rax, 0xffffffffffd ; moving imm to reg
and rcx, rax; x27 <- x26&0xffffffffffd
and r9, rbp; x34 <- x33&0x7ffffffffff
lea r12, [ r12 + rcx ]
mov rbx, 0xfffffffffff ; moving imm to reg
mov rcx, r12;
and rcx, rbx; x44 <- x42&0xfffffffffff
shr r12, 0x2c; x43 <- x42>> 0x2c
lea r12, [ r12 + r9 ]
mov r9, r12;
and r9, rbp; x47 <- x45&0x7ffffffffff
mov [ rdi + 0x8 ], r9; out1[1] = x47
shr r12, 0x2b; x46 <- x45>> 0x2b
lea r12, [ r12 + r10 ]
mov [ rdi + 0x10 ], r12; out1[2] = x48
mov [ rdi + 0x0 ], rcx; out1[0] = x44
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0366
; seed 0807375852553299 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 379580 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=906, initial num_batches=31): 93265 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.24570578007271193
; number reverted permutation / tried permutation: 67211 / 89968 =74.705%
; number reverted decision / tried decision: 75321 / 90031 =83.661%