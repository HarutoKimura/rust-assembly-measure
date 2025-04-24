SECTION .text
	GLOBAL fiat_c_curve25519_carry_square_CryptOpt
fiat_c_curve25519_carry_square_CryptOpt:
mov rax, [ rsi + 0x8 ]; load m64 arg1[1] to register64
lea r10, [rax + rax]; x17 <- arg1[1] * 2 
mov rax, 0x26 ; moving imm to reg
mov r11, [ rsi + 0x18 ]; load m64 x10 to register64
imul r11, rax; lox10 = arg1[3]*0x26
mov rdx, r11; x10 to rdx
mulx rcx, r11, [ rsi + 0x10 ]; x29_1, x29_0<- arg1[2] * x10 (_0*_0)
mov r8, [ rsi + 0x20 ]; load m64 x5 to register64
imul r8, rax; lox5 = arg1[4]*0x26
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, r8; x32_1, x32_0<- arg1[1] * x5 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, rdx; x46_1, x46_0<- arg1[0]^2
xor rdx, rdx
adox r11, r9
adox rbx, rcx
adcx rbp, r11
adcx rbx, r12
mov rdx, r8; x5 to rdx
mulx rcx, r8, [ rsi + 0x18 ]; x23_1, x23_0<- arg1[3] * x5 (_0*_0)
mov r9, 0x13 ; moving imm to reg
mov r12, [ rsi + 0x18 ]; load m64 x9 to register64
imul r12, r9; lox9 = arg1[3]*0x13
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r11, [ rsi + 0x10 ]; x27_1, x27_0<- arg1[2] * x5 (_0*_0)
mov rdx, r12; x9 to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r12, [ rsi + 0x18 ]; x25_1, x25_0<- x9 * arg1[3] (_0*_0)
test al, al
adox r12, r11
adox r13, r14
mov rdx, r10; x17 to rdx
mulx r11, r10, [ rsi + 0x0 ]; x45_1, x45_0<- arg1[0] * x17 (_0*_0)
mov rdx, rbp;
shrd rdx, rbx, 0x33; lo
shr rbx, 0x33; x49_1>>=0x33
add r10, r12; could be done better, if r0 has been u8 as well
adcx r13, r11
mov r14, 0xffffffffffffffff ; moving imm to reg
and rdx, r14; lo limb and'ed
mov r12, rdx; preserving value of x60_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx rbx, r11, rdx; x37_1, x37_0<- arg1[1]^2
adox r12, r10
mov rdx, 0x0 ; moving imm to reg
adox r13, rdx
mov r10, r12;
shrd r10, r13, 0x33; lo
shr r13, 0x33; x62_1>>=0x33
add r8, r11; could be done better, if r0 has been u8 as well
adcx rbx, rcx
imul rcx, [ rsi + 0x10 ], 0x2; x14 <- arg1[2] * 0x2
mov rdx, rcx; x14 to rdx
mulx r11, rcx, [ rsi + 0x0 ]; x43_1, x43_0<- arg1[0] * x14 (_0*_0)
xor r13, r13
adox rcx, r8
adox rbx, r11
mov r8, [ rsi + 0x20 ]; load m64 x4 to register64
imul r8, r9; lox4 = arg1[4]*0x13
mulx r13, r11, [ rsi + 0x8 ]; x36_1, x36_0<- arg1[1] * x14 (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx rax, r15, r8; x20_1, x20_0<- x4 * arg1[4] (_0*_0)
xor rdx, rdx
adox r15, r11
adox r13, rax
and r10, r14; lo limb and'ed
adox r10, rcx
adox rbx, rdx
mov rcx, r10;
shrd rcx, rbx, 0x33; lo
shr rbx, 0x33; x67_1>>=0x33
and rcx, r14; lo limb and'ed
mov r8, [ rsi + 0x18 ]; load m64 arg1[3] to register64
mov r11, r8; load m64 x11 to register64
shl r11, 0x1; x11 <- arg1[3] * 0x2
mov rdx, r11; x11 to rdx
mulx r8, r11, [ rsi + 0x0 ]; x42_1, x42_0<- arg1[0] * x11 (_0*_0)
mulx rbx, rax, [ rsi + 0x8 ]; x34_1, x34_0<- arg1[1] * x11 (_0*_0)
xor rdx, rdx
adox r11, r15
adox r13, r8
adcx rcx, r11
adc r13, 0x0; add CF to r0's alloc
imul r15, [ rsi + 0x20 ], 0x2; x6 <- arg1[4] * 0x2
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r11, r8, rdx; x30_1, x30_0<- arg1[2]^2
xor rdx, rdx
adox r8, rax
adox rbx, r11
mov rax, rcx;
shrd rax, r13, 0x33; lo
shr r13, 0x33; x72_1>>=0x33
and rax, r14; lo limb and'ed
mov rdx, r15; x6 to rdx
mulx r11, r15, [ rsi + 0x0 ]; x41_1, x41_0<- arg1[0] * x6 (_0*_0)
mov rdx, 0x7ffffffffffff ; moving imm to reg
and rbp, rdx; x51 <- x50&0x7ffffffffffff
adox r15, r8
adox rbx, r11
adcx rax, r15
adc rbx, 0x0; add CF to r0's alloc
mov r8, rax;
shrd r8, rbx, 0x33; lo
shr rbx, 0x33; x77_1>>=0x33
imul r8, r9; lox81 = x78*0x13
and rax, rdx; x80 <- x79&0x7ffffffffffff
lea r8, [ r8 + rbp ]
and r10, rdx; x69 <- x68&0x7ffffffffffff
mov r13, r8;
and r13, rdx; x84 <- x82&0x7ffffffffffff
shr r8, 0x33; x83 <- x82>> 0x33
and r12, rdx; x64 <- x63&0x7ffffffffffff
lea r8, [ r8 + r12 ]
mov r11, r8;
shr r11, 0x33; x86 <- x85>> 0x33
lea r11, [ r11 + r10 ]
mov [ rdi + 0x10 ], r11; out1[2] = x88
and r8, rdx; x87 <- x85&0x7ffffffffffff
and rcx, rdx; x74 <- x73&0x7ffffffffffff
mov [ rdi + 0x0 ], r13; out1[0] = x84
mov [ rdi + 0x18 ], rcx; out1[3] = x74
mov [ rdi + 0x20 ], rax; out1[4] = x80
mov [ rdi + 0x8 ], r8; out1[1] = x87
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1286
; seed 1514946090670396 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 3089884 ms on 800000 evaluations.
; Time spent for assembling and measuring (initial batch_size=430, initial num_batches=31): 441439 ms
; number of used evaluations: 800000
; Ratio (time for assembling + measure)/(total runtime for 800000 evals): 0.1428658810492562
; number reverted permutation / tried permutation: 290350 / 399479 =72.682%
; number reverted decision / tried decision: 293823 / 400520 =73.360%