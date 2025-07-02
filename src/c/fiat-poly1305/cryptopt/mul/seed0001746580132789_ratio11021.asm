SECTION .text
	GLOBAL fiat_c_poly1305_carry_mul_CryptOpt
fiat_c_poly1305_carry_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x0 ]; saving arg2[0] in rdx.
mulx r11, r10, [ rsi + 0x8 ]; x28_1, x28_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, 0xa ; moving imm to reg
mov rcx, [ rax + 0x10 ]; load m64 x19 to register64
imul rcx, rdx; lox19 = arg2[2]*0xa
imul r8, [ rax + 0x8 ], 0x2; x25 <- arg2[1] * 0x2
mov r9, [ rax + 0x8 ]; load m64 x13 to register64
imul r9, rdx; lox13 = arg2[1]*0xa
mov rdx, r9; x13 to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x10 ]; x15_1, x15_0<- x13 * arg1[2] (_0*_0)
mov rdx, rcx; x19 to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rcx, [ rsi + 0x8 ]; x21_1, x21_0<- arg1[1] * x19 (_0*_0)
xor rdx, rdx
adox r9, rcx
adox rbp, rbx
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rcx, rbx, [ rax + 0x0 ]; x35_1, x35_0<- arg1[0] * arg2[0] (_0*_0)
adcx rbx, r9
adcx rbp, rcx
mov rdx, 0x5 ; moving imm to reg
mov r9, [ rax + 0x10 ]; load m64 x8 to register64
imul r9, rdx; lox8 = arg2[2]*0x5
mov rcx, rbx;
shrd rcx, rbp, 0x2c; lo
shr rbp, 0x2c; x38_1>>=0x2c
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x0 ]; x34_1, x34_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, r9; x8 to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r9, [ rsi + 0x10 ]; x10_1, x10_0<- x8 * arg1[2] (_0*_0)
xor rdx, rdx
adox r9, r10
adox r11, r13
adcx rbp, r9
adcx r11, r12
mov r10, 0xffffffffffffffff ; moving imm to reg
and rcx, r10; lo limb and'ed
adox rcx, rbp
adox r11, rdx
mov r12, rcx;
shrd r12, r11, 0x2b; lo
shr r11, 0x2b; x47_1>>=0x2b
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r9, r13, [ rax + 0x0 ]; x24_1, x24_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, r8; x25 to rdx
mulx rbp, r8, [ rsi + 0x8 ]; x27_1, x27_0<- arg1[1] * x25 (_0*_0)
xor rdx, rdx
adox r8, r13
adox r9, rbp
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r13, r11, [ rax + 0x10 ]; x32_1, x32_0<- arg1[0] * arg2[2] (_0*_0)
adcx r11, r8
adcx r9, r13
and r12, r10; lo limb and'ed
adox r12, r11
mov rdx, 0x0 ; moving imm to reg
adox r9, rdx
mov rbp, r12;
shrd rbp, r9, 0x2b; lo
shr r9, 0x2b; x52_1>>=0x2b
mov r8, 0x7ffffffffff ; moving imm to reg
and r12, r8; x55 <- x54&0x7ffffffffff
mov r13, 0x5 ; moving imm to reg
imul rbp, r13; lox56 = x53*0x5
mov r11, 0xfffffffffff ; moving imm to reg
and rbx, r11; x40 <- x39&0xfffffffffff
lea rbp, [ rbp + rbx ]
mov r9, rbp;
and r9, r11; x59 <- x57&0xfffffffffff
mov [ rdi + 0x0 ], r9; out1[0] = x59
shr rbp, 0x2c; x58 <- x57>> 0x2c
and rcx, r8; x49 <- x48&0x7ffffffffff
lea rbp, [ rbp + rcx ]
mov rbx, rbp;
and rbx, r8; x62 <- x60&0x7ffffffffff
shr rbp, 0x2b; x61 <- x60>> 0x2b
lea rbp, [ rbp + r12 ]
mov [ rdi + 0x8 ], rbx; out1[1] = x62
mov [ rdi + 0x10 ], rbp; out1[2] = x63
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1021
; seed 0013402559404978 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 399240 ms on 160000 evaluations.
; Time spent for assembling and measuring (initial batch_size=698, initial num_batches=31): 83826 ms
; number of used evaluations: 160000
; Ratio (time for assembling + measure)/(total runtime for 160000 evals): 0.20996393146979261
; number reverted permutation / tried permutation: 59315 / 79850 =74.283%
; number reverted decision / tried decision: 56880 / 80149 =70.968%