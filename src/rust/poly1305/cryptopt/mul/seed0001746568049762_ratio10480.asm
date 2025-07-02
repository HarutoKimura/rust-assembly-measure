SECTION .text
	GLOBAL rust_fiat_poly1305_carry_mul_CryptOpt
rust_fiat_poly1305_carry_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r11, r10, [ rax + 0x0 ]; x28_1, x28_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, 0x5 ; moving imm to reg
mov rcx, [ rax + 0x10 ]; load m64 x8 to register64
imul rcx, rdx; lox8 = arg2[2]*0x5
mov r8, 0xa ; moving imm to reg
mov r9, [ rax + 0x8 ]; load m64 x13 to register64
imul r9, r8; lox13 = arg2[1]*0xa
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, r9; x15_1, x15_0<- x13 * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, r9, rcx; x10_1, x10_0<- x8 * arg1[2] (_0*_0)
mov rdx, [ rax + 0x10 ]; load m64 x19 to register64
imul rdx, r8; lox19 = arg2[2]*0xa
xor rcx, rcx
adox r9, r10
adox r11, r12
mulx r12, r10, [ rsi + 0x8 ]; x21_1, x21_0<- arg1[1] * x19 (_0*_0)
adcx rbx, r10
adcx r12, rbp
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r10, rbp, [ rsi + 0x0 ]; x35_1, x35_0<- arg1[0] * arg2[0] (_0*_0)
xor rdx, rdx
adox rbp, rbx
adox r12, r10
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rbx, rcx, [ rax + 0x0 ]; x24_1, x24_0<- arg2[0] * arg1[2] (_0*_0)
imul rdx, [ rax + 0x8 ], 0x2; x25 <- arg2[1] * 0x2
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r10, [ rsi + 0x8 ]; x27_1, x27_0<- arg1[1] * x25 (_0*_0)
add r10, rcx; could be done better, if r0 has been u8 as well
adcx rbx, r13
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r13, rcx, [ rsi + 0x0 ]; x34_1, x34_0<- arg1[0] * arg2[1] (_0*_0)
xor rdx, rdx
adox rcx, r9
adox r11, r13
mov r9, rbp;
shrd r9, r12, 0x2c; lo
shr r12, 0x2c; x38_1>>=0x2c
mov r13, 0xffffffffffffffff ; moving imm to reg
and r9, r13; lo limb and'ed
adox r9, rcx
adox r11, rdx
mov rcx, r9;
shrd r9, r11, 0x2b; lo
shr r11, 0x2b; x47_1>>=0x2b
and r9, r13; lo limb and'ed
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r11, r12, [ rax + 0x10 ]; x32_1, x32_0<- arg1[0] * arg2[2] (_0*_0)
mov rdx, 0x7ffffffffff ; moving imm to reg
and rcx, rdx; x49 <- x48&0x7ffffffffff
adox r12, r10
adox rbx, r11
adcx r9, r12
adc rbx, 0x0; add CF to r0's alloc
mov r10, r9;
shrd r10, rbx, 0x2b; lo
shr rbx, 0x2b; x52_1>>=0x2b
mov r11, 0x5 ; moving imm to reg
imul r10, r11; lox56 = x53*0x5
mov r12, 0xfffffffffff ; moving imm to reg
and rbp, r12; x40 <- x39&0xfffffffffff
lea r10, [ r10 + rbp ]
mov rbx, r10;
shr rbx, 0x2c; x58 <- x57>> 0x2c
lea rbx, [ rbx + rcx ]
mov rcx, rbx;
and rcx, rdx; x62 <- x60&0x7ffffffffff
and r10, r12; x59 <- x57&0xfffffffffff
mov [ rdi + 0x0 ], r10; out1[0] = x59
shr rbx, 0x2b; x61 <- x60>> 0x2b
mov [ rdi + 0x8 ], rcx; out1[1] = x62
and r9, rdx; x55 <- x54&0x7ffffffffff
lea rbx, [ rbx + r9 ]
mov [ rdi + 0x10 ], rbx; out1[2] = x63
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0480
; seed 0221412352294864 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 451582 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=726, initial num_batches=31): 95980 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.2125416867811383
; number reverted permutation / tried permutation: 68822 / 89816 =76.626%
; number reverted decision / tried decision: 63783 / 90183 =70.726%