SECTION .text
	GLOBAL rust_fiat_poly1305_carry_mul_CryptOpt
rust_fiat_poly1305_carry_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r11, r10, [ rax + 0x0 ]; x28_1, x28_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r8, rcx, [ rsi + 0x10 ]; x24_1, x24_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0xa ; moving imm to reg
mov r9, [ rax + 0x8 ]; load m64 x13 to register64
imul r9, rdx; lox13 = arg2[1]*0xa
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, [ rax + 0x10 ]; load m64 x19 to register64
imul rbx, rdx; lox19 = arg2[2]*0xa
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
imul rbp, [ rax + 0x8 ], 0x2; x25 <- arg2[1] * 0x2
mov rdx, r9; x13 to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, r9, [ rsi + 0x10 ]; x15_1, x15_0<- x13 * arg1[2] (_0*_0)
mov rdx, rbx; x19 to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, rbx, [ rsi + 0x8 ]; x21_1, x21_0<- arg1[1] * x19 (_0*_0)
mov rdx, rbp; x25 to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, rbp, [ rsi + 0x8 ]; x27_1, x27_0<- arg1[1] * x25 (_0*_0)
xor rdx, rdx
adox r9, rbx
adox r13, r12
adcx rbp, rcx
adcx r8, r14
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r12, rcx, [ rax + 0x0 ]; x35_1, x35_0<- arg1[0] * arg2[0] (_0*_0)
add rcx, r9; could be done better, if r0 has been u8 as well
adcx r13, r12
mov rdx, rcx;
shrd rdx, r13, 0x2c; lo
shr r13, 0x2c; x38_1>>=0x2c
mov rbx, 0x5 ; moving imm to reg
mov r14, [ rax + 0x10 ]; load m64 x8 to register64
imul r14, rbx; lox8 = arg2[2]*0x5
mov r9, rdx; preserving value of x38_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r13, r12, r14; x10_1, x10_0<- x8 * arg1[2] (_0*_0)
test al, al
adox r12, r10
adox r11, r13
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r14, r10, [ rsi + 0x0 ]; x34_1, x34_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r9, rdx; lo limb and'ed
adox r10, r12
adox r11, r14
adcx r9, r10
adc r11, 0x0; add CF to r0's alloc
mov r13, r9;
shrd r13, r11, 0x2b; lo
shr r11, 0x2b; x47_1>>=0x2b
and r13, rdx; lo limb and'ed
mov r12, 0xfffffffffff ; moving imm to reg
and rcx, r12; x40 <- x39&0xfffffffffff
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r10, r14, [ rsi + 0x0 ]; x32_1, x32_0<- arg1[0] * arg2[2] (_0*_0)
adox r14, rbp
adox r8, r10
adcx r13, r14
adc r8, 0x0; add CF to r0's alloc
mov rdx, r13;
shrd rdx, r8, 0x2b; lo
shr r8, 0x2b; x52_1>>=0x2b
imul rdx, rbx; lox56 = x53*0x5
lea rdx, [ rdx + rcx ]
mov rbp, rdx;
shr rbp, 0x2c; x58 <- x57>> 0x2c
and rdx, r12; x59 <- x57&0xfffffffffff
mov [ rdi + 0x0 ], rdx; out1[0] = x59
mov r11, 0x7ffffffffff ; moving imm to reg
and r9, r11; x49 <- x48&0x7ffffffffff
lea rbp, [ rbp + r9 ]
and r13, r11; x55 <- x54&0x7ffffffffff
mov rcx, rbp;
shr rcx, 0x2b; x61 <- x60>> 0x2b
lea rcx, [ rcx + r13 ]
mov [ rdi + 0x10 ], rcx; out1[2] = x63
and rbp, r11; x62 <- x60&0x7ffffffffff
mov [ rdi + 0x8 ], rbp; out1[1] = x62
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.3486
; seed 2658040133474538 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 20516 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=564, initial num_batches=31): 4093 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.19950282706180542
; number reverted permutation / tried permutation: 3183 / 3939 =80.807%
; number reverted decision / tried decision: 2899 / 4060 =71.404%