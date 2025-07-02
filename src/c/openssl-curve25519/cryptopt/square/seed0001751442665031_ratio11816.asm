SECTION .text
	GLOBAL open_ssl_curve25519_fe51_square_CryptOpt
open_ssl_curve25519_fe51_square_CryptOpt:
imul rax, [ rsi + 0x0 ], 0x2; x13 <- arg1[0] * 0x2
mov r10, [ rsi + 0x8 ]; load m64 arg1[1] to register64
lea r11, [r10 + r10]; x28 <- arg1[1] * 2 
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rcx, r10, r11; x30_1, x30_0<- x28 * arg1[2] (_0*_0)
mov rdx, rax; x13 to rdx
mulx r8, rax, [ rsi + 0x18 ]; x20_1, x20_0<- arg1[3] * x13 (_0*_0)
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x10 ]; x18_1, x18_0<- arg1[2] * x13 (_0*_0)
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
xor rbp, rbp
adox r10, rax
adox r8, rcx
mov rcx, rdx; preserving value of x13 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx rbp, rax, rdx; x26_1, x26_0<- arg1[1]^2
adcx rax, r9
adcx rbx, rbp
imul rdx, [ rsi + 0x18 ], 0x2; x37 <- arg1[3] * 0x2
mov r9, 0x13 ; moving imm to reg
mov rbp, [ rsi + 0x20 ]; load m64 x23 to register64
imul rbp, r9; lox23 = arg1[4]*0x13
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, rbp; x39_1, x39_0<- x23 * x37 (_0*_0)
xor rdx, rdx
adox r12, rax
adox rbx, r13
mov rax, r12;
shrd rax, rbx, 0x33; lo
shr rbx, 0x33; x49_1>>=0x33
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbx, r13, rdx; x12_1, x12_0<- arg1[0]^2
mov rdx, [ rsi + 0x18 ]; load m64 x33 to register64
imul rdx, r9; lox33 = arg1[3]*0x13
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov r14, [ rsi + 0x10 ]; load m64 arg1[2] to register64
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
lea r15, [r14 + r14]; x42 <- arg1[2] * 2 
mulx r9, r14, [ rsi + 0x18 ]; x35_1, x35_0<- x33 * arg1[3] (_0*_0)
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mov [ rsp - 0x48 ], r11; spilling x28 to mem
mulx r11, rdi, r15; x44_1, x44_0<- x33 * x42 (_0*_0)
xor rdx, rdx
adox r13, rdi
adox r11, rbx
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, rbx, rcx; x16_1, x16_0<- x13 * arg1[1] (_0*_0)
adcx rbx, r14
adcx r9, rdi
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rdi, r14, rbp; x25_1, x25_0<- x23 * arg1[4] (_0*_0)
xor rdx, rdx
adox r14, r10
adox r8, rdi
mov r10, 0xffffffffffffffff ; moving imm to reg
and rax, r10; lo limb and'ed
adox rax, r14
adox r8, rdx
mov rdi, rax;
shrd rdi, r8, 0x33; lo
shr r8, 0x33; x61_1>>=0x33
mov rdx, rbp; x23 to rdx
mulx r14, rbp, [ rsp - 0x48 ]; x32_1, x32_0<- x23 * x28 (_0*_0)
add rbp, r13; could be done better, if r0 has been u8 as well
adcx r11, r14
mov r13, rbp;
shrd r13, r11, 0x33; lo
shr r11, 0x33; x56_1>>=0x33
mov r8, 0x7ffffffffffff ; moving imm to reg
and rbp, r8; x60 <- x59&0x7ffffffffffff
and rdi, r10; lo limb and'ed
mulx r11, r14, r15; x47_1, x47_0<- x23 * x42 (_0*_0)
and r12, r8; x55 <- x54&0x7ffffffffffff
and r13, r10; lo limb and'ed
adox r14, rbx
adox r9, r11
adcx r13, r14
adc r9, 0x0; add CF to r0's alloc
mov rdx, r13;
shrd rdx, r9, 0x33; lo
shr r9, 0x33; x68_1>>=0x33
lea r12, [ r12 + rdx ]
and r13, r8; x72 <- x71&0x7ffffffffffff
mov r15, r12;
shr r15, 0x33; x79 <- x70>> 0x33
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r11, rbx, rdx; x41_1, x41_0<- arg1[2]^2
mov rdx, [ rsp - 0x48 ]; x28 to rdx
mulx r9, r14, [ rsi + 0x18 ]; x31_1, x31_0<- arg1[3] * x28 (_0*_0)
xor rdx, rdx
adox rbx, r14
adox r9, r11
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r14, r11, rcx; x22_1, x22_0<- arg1[4] * x13 (_0*_0)
adcx r11, rbx
adcx r9, r14
add rdi, r11; could be done better, if r0 has been u8 as well
adc r9, 0x0; add CF to r0's alloc
mov rdx, rdi;
shrd rdx, r9, 0x33; lo
shr r9, 0x33; x73_1>>=0x33
and rdi, r8; x78 <- x77&0x7ffffffffffff
and rax, r8; x67 <- x66&0x7ffffffffffff
mov rcx, 0x13 ; moving imm to reg
imul rdx, rcx; lox75 = x74*0x13
lea r15, [ r15 + rax ]
lea rdx, [ rdx + rbp ]
mov rbp, rdx;
shr rbp, 0x33; x82 <- x76>> 0x33
mov rbx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbx + 0x18 ], r15; out1[3] = x80
mov [ rbx + 0x20 ], rdi; out1[4] = x78
and r12, r8; x81 <- x70&0x7ffffffffffff
mov [ rbx + 0x10 ], r12; out1[2] = x81
and rdx, r8; x84 <- x76&0x7ffffffffffff
lea rbp, [ rbp + r13 ]
mov [ rbx + 0x8 ], rbp; out1[1] = x83
mov [ rbx + 0x0 ], rdx; out1[0] = x84
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1816
; seed 3542806373094084 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 315914 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=444, initial num_batches=31): 43900 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.13896186936951196
; number reverted permutation / tried permutation: 30627 / 39864 =76.829%
; number reverted decision / tried decision: 30881 / 40135 =76.943%
;
; === NATURAL MUTATION DISTRIBUTION ANALYSIS ===
; Study Goal: Measure inherent mutation preferences without forced ratios
; Total Evaluations: 79999 (excluding initial)
; Total Mutations: 79999
;
; NATURAL DISTRIBUTION:
;   Permutation: 39864 mutations (49.8%)
;   Decision:    40135 mutations (50.2%)
;
; FALLBACK ANALYSIS:
;   Original Intended Permutations: 39864
;   Decision→Permutation Fallbacks: 0
;   Fallback Rate: 0.0% of total mutations
;
; SUCCESS RATES (mutations kept):
;   Permutation Success: 9237/39864 (23.2%)
;   Decision Success:    9254/40135 (23.1%)
;
; KEY FINDING: Natural P/D ratio = 49.8%/50.2% for this implementation
; Time-series data: 79999 mutations recorded with timestamps