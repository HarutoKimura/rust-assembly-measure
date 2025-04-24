SECTION .text
	GLOBAL fiat_c_poly1305_carry_mul_CryptOpt
fiat_c_poly1305_carry_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r11, r10, [ rax + 0x0 ]; x35_1, x35_0<- arg1[0] * arg2[0] (_0*_0)
mov rdx, 0xa ; moving imm to reg
mov rcx, [ rax + 0x10 ]; load m64 x19 to register64
imul rcx, rdx; lox19 = arg2[2]*0xa
mov r8, [ rax + 0x8 ]; load m64 x13 to register64
imul r8, rdx; lox13 = arg2[1]*0xa
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, r8; x15_1, x15_0<- x13 * arg1[2] (_0*_0)
mov rdx, rcx; x19 to rdx
mulx r8, rcx, [ rsi + 0x8 ]; x21_1, x21_0<- arg1[1] * x19 (_0*_0)
mov rdx, 0x5 ; moving imm to reg
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov rbp, [ rax + 0x10 ]; load m64 x8 to register64
imul rbp, rdx; lox8 = arg2[2]*0x5
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
xor r12, r12
adox r9, rcx
adox r8, rbx
adcx r10, r9
adcx r8, r11
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rbx, r11, rbp; x10_1, x10_0<- x8 * arg1[2] (_0*_0)
mov rdx, r10;
shrd rdx, r8, 0x2c; lo
shr r8, 0x2c; x38_1>>=0x2c
mov rcx, rdx; preserving value of x38_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r9, rbp, [ rax + 0x0 ]; x28_1, x28_0<- arg2[0] * arg1[1] (_0*_0)
imul rdx, [ rax + 0x8 ], 0x2; x25 <- arg2[1] * 0x2
mulx r12, r8, [ rsi + 0x8 ]; x27_1, x27_0<- arg1[1] * x25 (_0*_0)
xor rdx, rdx
adox r11, rbp
adox r9, rbx
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbp, rbx, [ rax + 0x8 ]; x34_1, x34_0<- arg1[0] * arg2[1] (_0*_0)
adcx rbx, r11
adcx r9, rbp
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx rbp, r11, [ rsi + 0x10 ]; x24_1, x24_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rcx, rdx; lo limb and'ed
adox r8, r11
adox rbp, r12
adcx rcx, rbx
adc r9, 0x0; add CF to r0's alloc
mov r12, rcx;
shrd rcx, r9, 0x2b; lo
shr r9, 0x2b; x47_1>>=0x2b
and rcx, rdx; lo limb and'ed
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r11, rbx, [ rsi + 0x0 ]; x32_1, x32_0<- arg1[0] * arg2[2] (_0*_0)
adox rbx, r8
adox rbp, r11
mov rdx, 0x7ffffffffff ; moving imm to reg
and r12, rdx; x49 <- x48&0x7ffffffffff
adox rcx, rbx
mov r8, 0x0 ; moving imm to reg
adox rbp, r8
mov r9, rcx;
shrd r9, rbp, 0x2b; lo
shr rbp, 0x2b; x52_1>>=0x2b
mov r11, 0x5 ; moving imm to reg
imul r9, r11; lox56 = x53*0x5
mov rbx, 0xfffffffffff ; moving imm to reg
and r10, rbx; x40 <- x39&0xfffffffffff
lea r9, [ r9 + r10 ]
mov rbp, r9;
and rbp, rbx; x59 <- x57&0xfffffffffff
shr r9, 0x2c; x58 <- x57>> 0x2c
lea r9, [ r9 + r12 ]
mov r12, r9;
shr r12, 0x2b; x61 <- x60>> 0x2b
and rcx, rdx; x55 <- x54&0x7ffffffffff
lea r12, [ r12 + rcx ]
and r9, rdx; x62 <- x60&0x7ffffffffff
mov [ rdi + 0x0 ], rbp; out1[0] = x59
mov [ rdi + 0x8 ], r9; out1[1] = x62
mov [ rdi + 0x10 ], r12; out1[2] = x63
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.0741
; seed 1912231137144441 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 448517 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=698, initial num_batches=31): 41257 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.09198536510321793
; number reverted permutation / tried permutation: 30771 / 39868 =77.182%
; number reverted decision / tried decision: 28258 / 40131 =70.414%