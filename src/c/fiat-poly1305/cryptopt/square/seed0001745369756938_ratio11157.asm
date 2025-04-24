SECTION .text
	GLOBAL fiat_c_poly1305_carry_square_CryptOpt
fiat_c_poly1305_carry_square_CryptOpt:
mov rax, 0x5 ; moving imm to reg
mov r10, [ rsi + 0x10 ]; load m64 x4 to register64
imul r10, rax; lox4 = arg1[2]*0x5
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rcx, r11, rdx; x23_1, x23_0<- arg1[0]^2
mov rdx, 0x14 ; moving imm to reg
mov r8, [ rsi + 0x10 ]; load m64 x13 to register64
imul r8, rdx; lox13 = arg1[2]*0x14
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, r8; x15_1, x15_0<- arg1[1] * x13 (_0*_0)
test al, al
adox r9, r11
adox rcx, rbx
mov rdx, r9;
shrd r9, rcx, 0x2c; lo
shr rcx, 0x2c; x25_1>>=0x2c
mov r11, 0xffffffffffffffff ; moving imm to reg
and r9, r11; lo limb and'ed
imul r8, [ rsi + 0x8 ], 0x2; x8 <- arg1[1] * 0x2
mov rbx, rdx; preserving value of x26 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rcx, r10; x11_1, x11_0<- x4 * arg1[2] (_0*_0)
mov rdx, r8; x8 to rdx
mulx r10, r8, [ rsi + 0x0 ]; x22_1, x22_0<- arg1[0] * x8 (_0*_0)
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
xor r12, r12
adox rcx, r8
adox r10, rbp
adcx r9, rcx
adc r10, 0x0; add CF to r0's alloc
mov rbp, r9;
shrd rbp, r10, 0x2b; lo
shr r10, 0x2b; x32_1>>=0x2b
and rbp, r11; lo limb and'ed
imul r8, [ rsi + 0x10 ], 0x2; x5 <- arg1[2] * 0x2
mulx r10, rcx, [ rsi + 0x8 ]; x17_1, x17_0<- x8 * arg1[1] (_0*_0)
mov rdx, r8; x5 to rdx
mulx r12, r8, [ rsi + 0x0 ]; x21_1, x21_0<- arg1[0] * x5 (_0*_0)
xor rdx, rdx
adox rcx, r8
adox r12, r10
adcx rbp, rcx
adc r12, 0x0; add CF to r0's alloc
mov r10, 0xfffffffffff ; moving imm to reg
and rbx, r10; x27 <- x26&0xfffffffffff
mov r8, rbp;
mov rcx, 0x7ffffffffff ; moving imm to reg
and r8, rcx; x40 <- x39&0x7ffffffffff
shrd rbp, r12, 0x2b; lo
shr r12, 0x2b; x37_1>>=0x2b
imul rbp, rax; lox41 = x38*0x5
lea rbp, [ rbp + rbx ]
mov rbx, rbp;
shr rbx, 0x2c; x43 <- x42>> 0x2c
and rbp, r10; x44 <- x42&0xfffffffffff
and r9, rcx; x34 <- x33&0x7ffffffffff
lea rbx, [ rbx + r9 ]
mov r12, rbx;
shr r12, 0x2b; x46 <- x45>> 0x2b
lea r12, [ r12 + r8 ]
and rbx, rcx; x47 <- x45&0x7ffffffffff
mov [ rdi + 0x8 ], rbx; out1[1] = x47
mov [ rdi + 0x10 ], r12; out1[2] = x48
mov [ rdi + 0x0 ], rbp; out1[0] = x44
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1157
; seed 1897986938339889 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 168279 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=846, initial num_batches=31): 39571 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.23515114779621937
; number reverted permutation / tried permutation: 29312 / 39886 =73.489%
; number reverted decision / tried decision: 33537 / 40113 =83.606%