SECTION .text
	GLOBAL open_ssl_curve25519_fe51_mul_CryptOpt
open_ssl_curve25519_fe51_mul_CryptOpt:
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r11, r10, [ rax + 0x10 ]; x15_1, x15_0<- arg2[2] * arg1[0] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r8, rcx, [ rsi + 0x8 ]; x35_1, x35_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov r9, [ rax + 0x18 ]; load m64 x42 to register64
imul r9, rdx; lox42 = arg2[3]*0x13
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, r9; x78_1, x78_0<- arg1[4] * x42 (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, [ rsi + 0x8 ]; x33_1, x33_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, r9; x61_1, x61_0<- arg1[3] * x42 (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], r15; spilling x61_1 to mem
mulx r15, rdi, [ rsi + 0x10 ]; x48_1, x48_0<- arg1[2] * arg2[0] (_0*_0)
test al, al
adox r10, r12
adox r13, r11
adcx rdi, r10
adcx r13, r15
mov rdx, 0x13 ; moving imm to reg
mov r11, [ rax + 0x20 ]; load m64 x27 to register64
imul r11, rdx; lox27 = arg2[4]*0x13
mov r12, [ rax + 0x8 ]; load m64 x72 to register64
imul r12, rdx; lox72 = arg2[1]*0x13
mov rdx, r11; x27 to rdx
mulx r15, r11, [ rsi + 0x10 ]; x46_1, x46_0<- arg1[2] * x27 (_0*_0)
mov [ rsp - 0x40 ], r12; spilling x72 to mem
mulx r12, r10, [ rsi + 0x18 ]; x63_1, x63_0<- arg1[3] * x27 (_0*_0)
mov [ rsp - 0x38 ], r14; spilling x61_0 to mem
xor r14, r14
adox r10, rdi
adox r13, r12
adcx rbx, r10
adcx r13, rbp
mov rbp, rbx;
shrd rbx, r13, 0x33; lo
shr r13, 0x33; x84_1>>=0x33
mov rdi, rdx; preserving value of x27 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mulx r10, r12, [ rsi + 0x0 ]; x19_1, x19_0<- arg2[3] * arg1[0] (_0*_0)
test al, al
adox r12, rcx
adox r8, r10
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r13, rcx, [ rsi + 0x10 ]; x50_1, x50_0<- arg1[2] * arg2[1] (_0*_0)
adcx rcx, r12
adcx r8, r13
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r12, r10, [ rsi + 0x18 ]; x65_1, x65_0<- arg1[3] * arg2[0] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r14, r13, [ rsi + 0x8 ]; x31_1, x31_0<- arg1[1] * arg2[0] (_0*_0)
xor rdx, rdx
adox r10, rcx
adox r8, r12
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r12, rcx, [ rax + 0x8 ]; x11_1, x11_0<- arg2[1] * arg1[0] (_0*_0)
adcx rcx, r13
adcx r14, r12
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r12, r13, [ rsi + 0x0 ]; x7_1, x7_0<- arg2[0] * arg1[0] (_0*_0)
mov rdx, 0x7ffffffffffff ; moving imm to reg
and rbp, rdx; x88 <- x87&0x7ffffffffffff
mov rdx, rdi; x27 to rdx
mov [ rsp - 0x30 ], rbp; spilling x88 to mem
mulx rbp, rdi, [ rsi + 0x8 ]; x29_1, x29_0<- arg1[1] * x27 (_0*_0)
adox r13, rdi
adox rbp, r12
adcx r11, rcx
adcx r14, r15
mulx rcx, r15, [ rsi + 0x20 ]; x80_1, x80_0<- arg1[4] * x27 (_0*_0)
xor rdx, rdx
adox r15, r10
adox r8, rcx
mov r10, 0xffffffffffffffff ; moving imm to reg
and rbx, r10; lo limb and'ed
mov r12, r11;
adox r12, [ rsp - 0x38 ]
adox r14, [ rsp - 0x48 ]
mov rdx, r9; x42 to rdx
mulx rdi, r9, [ rsi + 0x10 ]; x44_1, x44_0<- arg1[2] * x42 (_0*_0)
adcx r9, r13
adcx rbp, rdi
xor rdx, rdx
adox rbx, r15
adox r8, rdx
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r11, r13, [ rsp - 0x40 ]; x74_1, x74_0<- arg1[4] * x72 (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov rcx, [ rax + 0x10 ]; load m64 x57 to register64
imul rcx, rdx; lox57 = arg2[2]*0x13
mov rdx, rcx; x57 to rdx
mulx r15, rcx, [ rsi + 0x18 ]; x59_1, x59_0<- arg1[3] * x57 (_0*_0)
test al, al
adox rcx, r9
adox rbp, r15
adcx r13, rcx
adcx rbp, r11
mov rdi, r13;
shrd rdi, rbp, 0x33; lo
shr rbp, 0x33; x89_1>>=0x33
and rdi, r10; lo limb and'ed
mov r9, 0x7ffffffffffff ; moving imm to reg
and r13, r9; x93 <- x92&0x7ffffffffffff
mulx r15, r11, [ rsi + 0x20 ]; x76_1, x76_0<- arg1[4] * x57 (_0*_0)
adox r11, r12
adox r14, r15
adcx rdi, r11
adc r14, 0x0; add CF to r0's alloc
mov r12, rdi;
shrd r12, r14, 0x33; lo
shr r14, 0x33; x99_1>>=0x33
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rbp, rcx, [ rax + 0x10 ]; x52_1, x52_0<- arg1[2] * arg2[2] (_0*_0)
add r12, [ rsp - 0x30 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r11, r15, [ rax + 0x18 ]; x37_1, x37_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r10, r14, [ rax + 0x20 ]; x23_1, x23_0<- arg2[4] * arg1[0] (_0*_0)
xor rdx, rdx
adox r14, r15
adox r11, r10
adcx rcx, r14
adcx r11, rbp
mov rbp, rbx;
and rbp, r9; x98 <- x97&0x7ffffffffffff
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r10, r15, [ rsi + 0x20 ]; x82_1, x82_0<- arg1[4] * arg2[0] (_0*_0)
mov rdx, r12;
shr rdx, 0x33; x110 <- x101>> 0x33
lea rdx, [ rdx + rbp ]
shrd rbx, r8, 0x33; lo
shr r8, 0x33; x94_1>>=0x33
mov r14, 0xffffffffffffffff ; moving imm to reg
and rbx, r14; lo limb and'ed
mov rbp, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbp + 0x18 ], rdx; out1[3] = x111
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r14, r8, [ rax + 0x8 ]; x67_1, x67_0<- arg1[3] * arg2[1] (_0*_0)
adox r8, rcx
adox r11, r14
adcx r15, r8
adcx r11, r10
add rbx, r15; could be done better, if r0 has been u8 as well
adc r11, 0x0; add CF to r0's alloc
mov rdx, rbx;
shrd rdx, r11, 0x33; lo
shr r11, 0x33; x104_1>>=0x33
mov rcx, 0x13 ; moving imm to reg
imul rdx, rcx; lox106 = x105*0x13
and rbx, r9; x109 <- x108&0x7ffffffffffff
lea rdx, [ rdx + r13 ]
and rdi, r9; x103 <- x102&0x7ffffffffffff
mov [ rbp + 0x20 ], rbx; out1[4] = x109
mov r13, rdx;
shr r13, 0x33; x113 <- x107>> 0x33
and rdx, r9; x115 <- x107&0x7ffffffffffff
and r12, r9; x112 <- x101&0x7ffffffffffff
mov [ rbp + 0x10 ], r12; out1[2] = x112
lea r13, [ r13 + rdi ]
mov [ rbp + 0x0 ], rdx; out1[0] = x115
mov [ rbp + 0x8 ], r13; out1[1] = x114
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1932
; seed 0580991827812816 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 487745 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=310, initial num_batches=31): 48439 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.09931214056525438
; number reverted permutation / tried permutation: 30736 / 40097 =76.654%
; number reverted decision / tried decision: 25541 / 39902 =64.009%
;
; === NATURAL MUTATION DISTRIBUTION ANALYSIS ===
; Study Goal: Measure inherent mutation preferences without forced ratios
; Total Evaluations: 79999 (excluding initial)
; Total Mutations: 79999
;
; NATURAL DISTRIBUTION:
;   Permutation: 40097 mutations (50.1%)
;   Decision:    39902 mutations (49.9%)
;
; FALLBACK ANALYSIS:
;   Original Intended Permutations: 40097
;   Decision→Permutation Fallbacks: 0
;   Fallback Rate: 0.0% of total mutations
;
; SUCCESS RATES (mutations kept):
;   Permutation Success: 9361/40097 (23.3%)
;   Decision Success:    14361/39902 (36.0%)
;
; KEY FINDING: Natural P/D ratio = 50.1%/49.9% for this implementation
; Time-series data: 79999 mutations recorded with timestamps