SECTION .text
	GLOBAL fiat_c_poly1305_carry_square_CryptOpt
fiat_c_poly1305_carry_square_CryptOpt:
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r10, rax, rdx; x23_1, x23_0<- arg1[0]^2
imul r11, [ rsi + 0x8 ], 0x2; x8 <- arg1[1] * 0x2
mov rdx, 0x14 ; moving imm to reg
mov rcx, [ rsi + 0x10 ]; load m64 x13 to register64
imul rcx, rdx; lox13 = arg1[2]*0x14
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r9, r8, rcx; x15_1, x15_0<- arg1[1] * x13 (_0*_0)
xor rdx, rdx
adox r8, rax
adox r10, r9
mov rax, 0x5 ; moving imm to reg
mov rcx, [ rsi + 0x10 ]; load m64 x4 to register64
imul rcx, rax; lox4 = arg1[2]*0x5
mov r9, r8;
shrd r9, r10, 0x2c; lo
shr r10, 0x2c; x25_1>>=0x2c
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r9, rdx; lo limb and'ed
mov rdx, rcx; x4 to rdx
mulx r10, rcx, [ rsi + 0x10 ]; x11_1, x11_0<- x4 * arg1[2] (_0*_0)
mov rdx, r11; x8 to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r11, [ rsi + 0x0 ]; x22_1, x22_0<- arg1[0] * x8 (_0*_0)
adox rcx, r11
adox rbx, r10
adcx r9, rcx
adc rbx, 0x0; add CF to r0's alloc
mov r10, r9;
shrd r9, rbx, 0x2b; lo
shr rbx, 0x2b; x32_1>>=0x2b
imul r11, [ rsi + 0x10 ], 0x2; x5 <- arg1[2] * 0x2
mulx rbx, rcx, [ rsi + 0x8 ]; x17_1, x17_0<- x8 * arg1[1] (_0*_0)
mov rdx, r11; x5 to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, r11, [ rsi + 0x0 ]; x21_1, x21_0<- arg1[0] * x5 (_0*_0)
xor rdx, rdx
adox rcx, r11
adox rbp, rbx
mov rbx, 0xffffffffffffffff ; moving imm to reg
and r9, rbx; lo limb and'ed
adox r9, rcx
adox rbp, rdx
mov r11, r9;
shrd r11, rbp, 0x2b; lo
shr rbp, 0x2b; x37_1>>=0x2b
imul r11, rax; lox41 = x38*0x5
mov rcx, 0xfffffffffff ; moving imm to reg
and r8, rcx; x27 <- x26&0xfffffffffff
lea r11, [ r11 + r8 ]
mov rbp, r11;
and rbp, rcx; x44 <- x42&0xfffffffffff
mov [ rdi + 0x0 ], rbp; out1[0] = x44
shr r11, 0x2c; x43 <- x42>> 0x2c
mov r8, 0x7ffffffffff ; moving imm to reg
and r10, r8; x34 <- x33&0x7ffffffffff
lea r11, [ r11 + r10 ]
mov rbp, r11;
shr rbp, 0x2b; x46 <- x45>> 0x2b
and r9, r8; x40 <- x39&0x7ffffffffff
lea rbp, [ rbp + r9 ]
mov [ rdi + 0x10 ], rbp; out1[2] = x48
and r11, r8; x47 <- x45&0x7ffffffffff
mov [ rdi + 0x8 ], r11; out1[1] = x47
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1265
; seed 1002202890886149 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 337669 ms on 160000 evaluations.
; Time spent for assembling and measuring (initial batch_size=846, initial num_batches=31): 79941 ms
; number of used evaluations: 160000
; Ratio (time for assembling + measure)/(total runtime for 160000 evals): 0.23674367501902752
; number reverted permutation / tried permutation: 59230 / 80020 =74.019%
; number reverted decision / tried decision: 66367 / 79979 =82.981%