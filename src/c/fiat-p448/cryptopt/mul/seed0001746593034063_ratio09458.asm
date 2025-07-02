SECTION .text
	GLOBAL fiat_c_p448_carry_mul_CryptOpt
fiat_c_p448_carry_mul_CryptOpt:
sub rsp, 680
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x38 ]; saving arg2[7] in rdx.
mulx r11, r10, [ rsi + 0x30 ]; x21_1, x21_0<- arg1[6] * arg2[7] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r8, rcx, [ rsi + 0x30 ]; x46_1, x46_0<- arg2[2] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rax + 0x8 ]; x83_1, x83_0<- arg1[4] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x30 ]; x45_1, x45_0<- arg2[3] * arg1[6] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rsi + 0x38 ]; x9_1, x9_0<- arg2[7] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rsi + 0x0 ]; x105_1, x105_0<- arg1[0] * arg2[7] (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov [ rsp - 0x48 ], rdi; spilling x105_1 to mem
mov [ rsp - 0x40 ], r15; spilling x105_0 to mem
mov [ rsp - 0x38 ], rbx; spilling x83_1 to mem
mulx rbx, rdi, r14; __,tmp <- (a_0 in rdx) * b_hi
mulx rbx, r15, r13; hi,lo <- (a_0 in rdx) * b_lo
lea rbx, [rbx+rdi]; hi += tmp
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp - 0x30 ], r9; spilling x83_0 to mem
mulx r9, rdi, [ rax + 0x38 ]; x26_1, x26_0<- arg1[5] * arg2[7] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp - 0x28 ], r8; spilling x46_1 to mem
mov [ rsp - 0x20 ], rcx; spilling x46_0 to mem
mulx rcx, r8, [ rax + 0x18 ]; x34_1, x34_0<- arg2[3] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp - 0x18 ], rcx; spilling x34_1 to mem
mov [ rsp - 0x10 ], r8; spilling x34_0 to mem
mulx r8, rcx, [ rax + 0x10 ]; x38_1, x38_0<- arg2[2] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp - 0x8 ], rbx; spilling x131_1 to mem
mov [ rsp + 0x0 ], r15; spilling x131_0 to mem
mulx r15, rbx, [ rax + 0x28 ]; x90_1, x90_0<- arg1[2] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x8 ], r15; spilling x90_1 to mem
mov [ rsp + 0x10 ], rbx; spilling x90_0 to mem
mulx rbx, r15, [ rax + 0x30 ]; x96_1, x96_0<- arg1[1] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x18 ], rbx; spilling x96_1 to mem
mov [ rsp + 0x20 ], r15; spilling x96_0 to mem
mulx r15, rbx, [ rsi + 0x0 ]; x106_1, x106_0<- arg1[0] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x28 ], r15; spilling x106_1 to mem
mov [ rsp + 0x30 ], rbx; spilling x106_0 to mem
mulx rbx, r15, [ rsi + 0x38 ]; x13_1, x13_0<- arg2[6] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0x38 ], r8; spilling x38_1 to mem
mov [ rsp + 0x40 ], rcx; spilling x38_0 to mem
mulx rcx, r8, [ rax + 0x28 ]; x56_1, x56_0<- arg1[4] * arg2[5] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0x48 ], rcx; spilling x56_1 to mem
mov [ rsp + 0x50 ], r8; spilling x56_0 to mem
mulx r8, rcx, [ rsi + 0x8 ]; x98_1, x98_0<- arg1[1] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x58 ], r8; spilling x98_1 to mem
mov [ rsp + 0x60 ], rcx; spilling x98_0 to mem
mulx rcx, r8, [ rax + 0x38 ]; x67_1, x67_0<- arg1[2] * arg2[7] (_0*_0)
add r15, r10; could be done better, if r0 has been u8 as well
adcx r11, rbx
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx rbx, r10, [ rsi + 0x28 ]; x49_1, x49_0<- arg2[4] * arg1[5] (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0x68 ], rcx; spilling x67_1 to mem
mov [ rsp + 0x70 ], r8; spilling x67_0 to mem
mov [ rsp + 0x78 ], r9; spilling x26_1 to mem
mulx r9, rcx, r11; __,tmp <- (a_0 in rdx) * b_hi
mulx r9, r8, r15; hi,lo <- (a_0 in rdx) * b_lo
lea r9, [r9+rcx]; hi += tmp
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp + 0x80 ], r9; spilling x168_1 to mem
mulx r9, rcx, [ rax + 0x28 ]; x17_1, x17_0<- arg2[5] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x88 ], r8; spilling x168_0 to mem
mov [ rsp + 0x90 ], rdi; spilling x26_0 to mem
mulx rdi, r8, [ rsi + 0x30 ]; x22_1, x22_0<- arg1[6] * arg2[6] (_0*_0)
test al, al
adox r15, r10
mov rdx, rbx;
adox rdx, r11
adcx rcx, r8
adcx rdi, r9
mov r11, rbp;
xor r9, r9
adox r11, r15
adox rdx, r12
mov r8, rdx; preserving value of x187_1 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mulx r9, r15, [ rsi + 0x28 ]; x50_1, x50_0<- arg2[3] * arg1[5] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0x98 ], r9; spilling x50_1 to mem
mov [ rsp + 0xa0 ], r15; spilling x50_0 to mem
mulx r15, r9, [ rax + 0x28 ]; x48_1, x48_0<- arg1[5] * arg2[5] (_0*_0)
adcx r13, r9
mov rdx, r15;
adcx rdx, r14
mov r14, rcx;
test al, al
adox r14, [ rsp + 0x90 ]
adox rdi, [ rsp + 0x78 ]
mov rcx, r11;
adcx rcx, [ rsp + 0x40 ]
adcx r8, [ rsp + 0x38 ]
mov r11, r9;
test al, al
adox r11, [ rsp + 0x0 ]
adox r15, [ rsp - 0x8 ]
mov r9, r14;
adcx r9, [ rsp + 0xa0 ]
mov [ rsp + 0xa8 ], r8; spilling x188_1 to mem
mov r8, rdi;
adcx r8, [ rsp + 0x98 ]
mov [ rsp + 0xb0 ], r8; spilling x158_1 to mem
xor r8, r8
adox r10, [ rsp + 0x88 ]
adox rbx, [ rsp + 0x80 ]
adcx rbp, r10
adcx rbx, r12
mov r12, rbp;
xor r10, r10
adox r12, [ rsp + 0x40 ]
adox rbx, [ rsp + 0x38 ]
mov r8, r12;
adcx r8, [ rsp + 0x50 ]
adcx rbx, [ rsp + 0x48 ]
mov rbp, rdx; preserving value of x216_1 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mulx r10, r12, [ rax + 0x20 ]; x44_1, x44_0<- arg2[4] * arg1[6] (_0*_0)
mov rdx, r12;
mov [ rsp + 0xb8 ], r9; spilling x158_0 to mem
xor r9, r9
adox rdx, r13
adox rbp, r10
adcx r12, r11
adcx r15, r10
mov r13, 0x2 ; moving imm to reg
xchg rdx, r13; 0x2, swapping with x217_0, which is currently in rdx
mulx r9, r11, rdi; __,tmp <- (a_0 in rdx) * b_hi
mulx r9, r10, r14; hi,lo <- (a_0 in rdx) * b_lo
lea r9, [r9+r11]; hi += tmp
mov r11, r13;
test al, al
adox r11, [ rsp - 0x10 ]
adox rbp, [ rsp - 0x18 ]
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rdi, r14, [ rax + 0x30 ]; x62_1, x62_0<- arg1[3] * arg2[6] (_0*_0)
mov rdx, r12;
adcx rdx, [ rsp - 0x10 ]
adcx r15, [ rsp - 0x18 ]
mov r13, r10;
add r13, [ rsp + 0xa0 ]; could be done better, if r0 has been u8 as well
adcx r9, [ rsp + 0x98 ]
mov r12, r13;
add r12, [ rsp - 0x20 ]; could be done better, if r0 has been u8 as well
adcx r9, [ rsp - 0x28 ]
mov r10, rdx; preserving value of x201_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mov [ rsp + 0xc0 ], rbp; spilling x218_1 to mem
mulx rbp, r13, [ rax + 0x0 ]; x102_1, x102_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, rcx;
mov [ rsp + 0xc8 ], r11; spilling x218_0 to mem
xor r11, r11
adox rdx, [ rsp + 0x50 ]
mov [ rsp + 0xd0 ], r15; spilling x201_1 to mem
mov r15, [ rsp + 0xa8 ]; load m64 x188_1 to register64
adox r15, [ rsp + 0x48 ]
mov rcx, rdx; preserving value of x189_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mov [ rsp + 0xd8 ], r10; spilling x201_0 to mem
mulx r10, r11, [ rsi + 0x38 ]; x42_1, x42_0<- arg2[1] * arg1[7] (_0*_0)
mov rdx, r14;
adcx rdx, rcx
adcx r15, rdi
mov rcx, rdx; preserving value of x190_0 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mov [ rsp + 0xe0 ], r10; spilling x42_1 to mem
mov [ rsp + 0xe8 ], r11; spilling x42_0 to mem
mulx r11, r10, [ rsi + 0x18 ]; x85_1, x85_0<- arg1[3] * arg2[4] (_0*_0)
mov rdx, rcx;
mov [ rsp + 0xf0 ], r11; spilling x85_1 to mem
xor r11, r11
adox rdx, [ rsp + 0x70 ]
adox r15, [ rsp + 0x68 ]
adcx r13, rdx
adcx r15, rbp
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mulx rcx, rbp, [ rsi + 0x28 ]; x47_1, x47_0<- arg1[5] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp + 0xf8 ], r15; spilling x192_1 to mem
mulx r15, r11, [ rsi + 0x30 ]; x43_1, x43_0<- arg1[6] * arg2[5] (_0*_0)
mov rdx, r8;
test al, al
adox rdx, [ rsp - 0x30 ]
adox rbx, [ rsp - 0x38 ]
mov r8, r12;
adcx r8, [ rsp + 0xe8 ]
adcx r9, [ rsp + 0xe0 ]
mov r12, rdx; preserving value of x173_0 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mov [ rsp + 0x100 ], r13; spilling x192_0 to mem
mov [ rsp + 0x108 ], r10; spilling x85_0 to mem
mulx r10, r13, [ rax + 0x20 ]; x57_1, x57_0<- arg1[4] * arg2[4] (_0*_0)
mov rdx, [ rsp - 0x20 ]; load m64 x46_0 to register64
add rdx, [ rsp + 0xb8 ]; could be done better, if r0 has been u8 as well
mov [ rsp + 0x110 ], rbx; spilling x173_1 to mem
mov rbx, [ rsp - 0x28 ]; load m64 x46_1 to register64
adcx rbx, [ rsp + 0xb0 ]
mov [ rsp + 0x118 ], r12; spilling x173_0 to mem
mov r12, r13;
add r12, r8; could be done better, if r0 has been u8 as well
adcx r9, r10
mov r8, rdx;
add r8, [ rsp + 0xe8 ]; could be done better, if r0 has been u8 as well
adcx rbx, [ rsp + 0xe0 ]
test al, al
adox r11, rbp
adox rcx, r15
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r15, rbp, [ rax + 0x8 ]; x111_1, x111_0<- arg1[0] * arg2[1] (_0*_0)
adcx r13, r8
adcx rbx, r10
test al, al
adox r14, [ rsp + 0x118 ]
adox rdi, [ rsp + 0x110 ]
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mulx r8, r10, [ rax + 0x10 ]; x78_1, x78_0<- arg2[2] * arg1[5] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp + 0x120 ], rdi; spilling x174_1 to mem
mov [ rsp + 0x128 ], r14; spilling x174_0 to mem
mulx r14, rdi, [ rsi + 0x30 ]; x76_1, x76_0<- arg2[1] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x130 ], r15; spilling x111_1 to mem
mov [ rsp + 0x138 ], rbp; spilling x111_0 to mem
mulx rbp, r15, [ rax + 0x8 ]; x94_1, x94_0<- arg1[2] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x140 ], rbx; spilling x161_1 to mem
mov [ rsp + 0x148 ], r13; spilling x161_0 to mem
mulx r13, rbx, [ rsi + 0x20 ]; x81_1, x81_0<- arg1[4] * arg2[3] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp + 0x150 ], r9; spilling x144_1 to mem
mov [ rsp + 0x158 ], r12; spilling x144_0 to mem
mulx r12, r9, [ rax + 0x20 ]; x30_1, x30_0<- arg2[4] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x160 ], rbp; spilling x94_1 to mem
mov [ rsp + 0x168 ], r15; spilling x94_0 to mem
mulx r15, rbp, [ rsi + 0x20 ]; x54_1, x54_0<- arg1[4] * arg2[7] (_0*_0)
adcx r9, r11
adcx rcx, r12
xor rdx, rdx
adox r10, rdi
adox r14, r8
adcx rbp, r9
adcx rcx, r15
test al, al
adox rbx, r10
adox r14, r13
mov r11, rbp;
adcx r11, rbx
adcx r14, rcx
mov r8, r11;
xor rdi, rdi
adox r8, [ rsp + 0x108 ]
adox r14, [ rsp + 0xf0 ]
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r12, r13, [ rsi + 0x38 ]; x75_1, x75_0<- arg2[0] * arg1[7] (_0*_0)
mov rdx, r8;
adcx rdx, [ rsp + 0x10 ]
adcx r14, [ rsp + 0x8 ]
mov r15, rdx;
test al, al
adox r15, [ rsp + 0x20 ]
adox r14, [ rsp + 0x18 ]
adcx rbp, [ rsp + 0x168 ]
adcx rcx, [ rsp + 0x160 ]
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r10, r9, [ rsi + 0x18 ]; x88_1, x88_0<- arg1[3] * arg2[1] (_0*_0)
test al, al
adox r13, r15
adox r14, r12
mov rdx, r13;
adcx rdx, [ rsp - 0x40 ]
adcx r14, [ rsp - 0x48 ]
mov rbx, rdx;
shrd rbx, r14, 0x38; lo
shr r14, 0x38; x136_1>>=0x38
mov r11, rdx; preserving value of x130_0 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.
mulx r12, r8, [ rsi + 0x18 ]; x63_1, x63_0<- arg1[3] * arg2[5] (_0*_0)
mov rdx, r8;
test al, al
adox rdx, [ rsp + 0x158 ]
mov r15, r12;
adox r15, [ rsp + 0x150 ]
mov r13, rdx; preserving value of x145_0 into a new reg
mov rdx, [ rsi + 0x28 ]; saving arg1[5] in rdx.
mulx rdi, r14, [ rax + 0x8 ]; x79_1, x79_0<- arg2[1] * arg1[5] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0x170 ], rcx; spilling x116_1 to mem
mov [ rsp + 0x178 ], rbp; spilling x116_0 to mem
mulx rbp, rcx, [ rax + 0x30 ]; x55_1, x55_0<- arg1[4] * arg2[6] (_0*_0)
mov rdx, 0xffffffffffffff ; moving imm to reg
and r11, rdx; x138 <- x137&0xffffffffffffff
adox r9, r13
adox r15, r10
mov r10, 0x40 ; moving imm to reg
bzhi r13, rbx, r10; x139 <- x136_0 (only least 0x40 bits)
adox r14, [ rsp + 0xd8 ]
adox rdi, [ rsp + 0xd0 ]
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r10, rbx, [ rsi + 0x8 ]; x101_1, x101_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, rcx;
mov [ rsp + 0x180 ], r11; spilling x138 to mem
xor r11, r11
adox rdx, r14
adox rdi, rbp
mov r14, rdx; preserving value of x203_0 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mov [ rsp + 0x188 ], r13; spilling x139_0 to mem
mulx r13, r11, [ rax + 0x10 ]; x82_1, x82_0<- arg1[4] * arg2[2] (_0*_0)
adcx r11, r14
adcx rdi, r13
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r13, r14, [ rax + 0x38 ]; x61_1, x61_0<- arg1[3] * arg2[7] (_0*_0)
mov rdx, r14;
add rdx, r11; could be done better, if r0 has been u8 as well
adcx rdi, r13
test al, al
adox rcx, [ rsp + 0xc8 ]
adox rbp, [ rsp + 0xc0 ]
adcx r14, rcx
adcx rbp, r13
mov r11, rdx; preserving value of x205_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx rcx, r13, [ rax + 0x30 ]; x68_1, x68_0<- arg1[2] * arg2[6] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x190 ], rdi; spilling x205_1 to mem
mov [ rsp + 0x198 ], r11; spilling x205_0 to mem
mulx r11, rdi, [ rax + 0x10 ]; x100_1, x100_0<- arg1[1] * arg2[2] (_0*_0)
add rdi, [ rsp + 0x178 ]; could be done better, if r0 has been u8 as well
adcx r11, [ rsp + 0x170 ]
test al, al
adox rbx, r14
adox rbp, r10
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r14, r10, [ rax + 0x0 ]; x89_1, x89_0<- arg2[0] * arg1[3] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x1a0 ], rbp; spilling x221_1 to mem
mov [ rsp + 0x1a8 ], rbx; spilling x221_0 to mem
mulx rbx, rbp, [ rax + 0x38 ]; x72_1, x72_0<- arg1[1] * arg2[7] (_0*_0)
adcx r10, rdi
adcx r11, r14
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r14, rdi, [ rax + 0x18 ]; x109_1, x109_0<- arg1[0] * arg2[3] (_0*_0)
add rdi, r10; could be done better, if r0 has been u8 as well
adcx r11, r14
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r14, r10, [ rax + 0x0 ]; x84_1, x84_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, r13;
test al, al
adox rdx, r9
adox r15, rcx
adcx r8, [ rsp + 0x148 ]
adcx r12, [ rsp + 0x140 ]
test al, al
adox r13, r8
adox r12, rcx
mov r9, rdx; preserving value of x147_0 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mulx r8, rcx, [ rsi + 0x0 ]; x112_1, x112_0<- arg1[0] * arg2[0] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0x1b0 ], r14; spilling x84_1 to mem
mov [ rsp + 0x1b8 ], r10; spilling x84_0 to mem
mulx r10, r14, [ rsi + 0x10 ]; x95_1, x95_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, rbp;
adcx rdx, r13
adcx r12, rbx
mov r13, rdx; preserving value of x164_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mov [ rsp + 0x1c0 ], r11; spilling x119_1 to mem
mov [ rsp + 0x1c8 ], rdi; spilling x119_0 to mem
mulx rdi, r11, [ rax + 0x10 ]; x93_1, x93_0<- arg1[2] * arg2[2] (_0*_0)
test al, al
adox r14, [ rsp + 0x1a8 ]
adox r10, [ rsp + 0x1a0 ]
adcx rcx, r13
adcx r12, r8
mov rdx, rcx;
xor r8, r8
adox rdx, [ rsp + 0x188 ]
adox r12, r8
mov r13, rdx;
shrd rdx, r12, 0x38; lo
shr r12, 0x38; x182_1>>=0x38
mov rcx, rdx; preserving value of x182_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r8, r12, [ rax + 0x18 ]; x99_1, x99_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, [ rsp + 0x138 ]; load m64 x111_0 to register64
add rdx, [ rsp + 0x100 ]; could be done better, if r0 has been u8 as well
mov [ rsp + 0x1d0 ], r13; spilling x183 to mem
mov r13, [ rsp + 0x130 ]; load m64 x111_1 to register64
adcx r13, [ rsp + 0xf8 ]
mov [ rsp + 0x1d8 ], r8; spilling x99_1 to mem
mov r8, 0x40 ; moving imm to reg
mov [ rsp + 0x1e0 ], r12; spilling x99_0 to mem
bzhi r12, rcx, r8; x185 <- x182_0 (only least 0x40 bits)
adox r12, rdx
mov rcx, 0x0 ; moving imm to reg
adox r13, rcx
mov rdx, r12;
shrd rdx, r13, 0x38; lo
shr r13, 0x38; x212_1>>=0x38
bzhi rcx, rdx, r8; x215 <- x212_0 (only least 0x40 bits)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r8, r13, [ rax + 0x18 ]; x92_1, x92_0<- arg1[2] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0x1e8 ], r8; spilling x92_1 to mem
mov [ rsp + 0x1f0 ], r13; spilling x92_0 to mem
mulx r13, r8, [ rsi + 0x0 ]; x108_1, x108_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp + 0x1f8 ], r13; spilling x108_1 to mem
mov [ rsp + 0x200 ], r8; spilling x108_0 to mem
mulx r8, r13, [ rsi + 0x0 ]; x110_1, x110_0<- arg1[0] * arg2[2] (_0*_0)
adox r13, r14
adox r10, r8
add rcx, r13; could be done better, if r0 has been u8 as well
adc r10, 0x0; add CF to r0's alloc
mov rdx, rcx;
shrd rdx, r10, 0x38; lo
shr r10, 0x38; x230_1>>=0x38
test al, al
adox r11, r9
adox r15, rdi
adcx rbp, r11
adcx r15, rbx
mov rbx, rdx; preserving value of x230_0 into a new reg
mov rdx, [ rsi + 0x28 ]; saving arg1[5] in rdx.
mulx rdi, r9, [ rax + 0x0 ]; x80_1, x80_0<- arg2[0] * arg1[5] (_0*_0)
mov rdx, 0xffffffffffffff ; moving imm to reg
and r12, rdx; x214 <- x213&0xffffffffffffff
mov r14, [ rsp + 0x1c0 ];
mov r8, [ rsp + 0x1c8 ];
shrd r8, r14, 0x38; lo
shr r14, 0x38; x120_1>>=0x38
mov r13, rbp;
xor r10, r10
adox r13, [ rsp + 0x1e0 ]
adox r15, [ rsp + 0x1d8 ]
mov r11, r13;
adcx r11, [ rsp + 0x1b8 ]
adcx r15, [ rsp + 0x1b0 ]
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r14, rbp, [ rax + 0x10 ]; x87_1, x87_0<- arg1[3] * arg2[2] (_0*_0)
add rbp, [ rsp + 0x128 ]; could be done better, if r0 has been u8 as well
adcx r14, [ rsp + 0x120 ]
mov rdx, rbp;
add rdx, [ rsp + 0x70 ]; could be done better, if r0 has been u8 as well
adcx r14, [ rsp + 0x68 ]
mov r13, 0xffffffffffffffff ; moving imm to reg
and r8, r13; lo limb and'ed
mov rbp, r11;
adox rbp, [ rsp + 0x200 ]
adox r15, [ rsp + 0x1f8 ]
adcx r8, rbp
adc r15, 0x0; add CF to r0's alloc
mov r11, rdx;
xor rbp, rbp
adox r11, [ rsp + 0x1f0 ]
adox r14, [ rsp + 0x1e8 ]
mov r10, r11;
adcx r10, [ rsp + 0x60 ]
adcx r14, [ rsp + 0x58 ]
mov rdx, r8;
add rdx, [ rsp + 0x188 ]; could be done better, if r0 has been u8 as well
adc r15, 0x0; add CF to r0's alloc
test al, al
adox r9, r10
adox r14, rdi
mov rdi, rdx;
shrd rdi, r15, 0x38; lo
shr r15, 0x38; x155_1>>=0x38
mov r8, rdx; preserving value of x154_0 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.
mulx r10, r11, [ rsi + 0x8 ]; x97_1, x97_0<- arg1[1] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mulx rbp, r15, [ rax + 0x0 ]; x77_1, x77_0<- arg2[0] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x208 ], rcx; spilling x232 to mem
mulx rcx, r13, [ rax + 0x20 ]; x91_1, x91_0<- arg1[2] * arg2[4] (_0*_0)
mov rdx, [ rsp + 0x1c8 ];
mov [ rsp + 0x210 ], r12; spilling x214 to mem
mov r12, rdx; preserving value of x121 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mov [ rsp + 0x218 ], rdi; spilling x155_0 to mem
mov [ rsp + 0x220 ], r14; spilling x179_1 to mem
mulx r14, rdi, [ rax + 0x18 ]; x86_1, x86_0<- arg1[3] * arg2[3] (_0*_0)
add rdi, [ rsp + 0x198 ]; could be done better, if r0 has been u8 as well
adcx r14, [ rsp + 0x190 ]
add r13, rdi; could be done better, if r0 has been u8 as well
adcx r14, rcx
mov rdx, 0x38 ; moving imm to reg
bzhi rcx, r12, rdx; x122 <- x121 (only least 0x38 bits)
adox r11, r13
adox r14, r10
lea rcx, [ rcx + rbx ]
xor r10, r10
adox r15, r11
adox r14, rbp
bzhi rbp, rcx, rdx; x238 <- x234 (only least 0x38 bits)
mov r12, r15;
adox r12, [ rsp + 0x30 ]
adox r14, [ rsp + 0x28 ]
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mulx r13, rdi, [ rsi + 0x0 ]; x107_1, x107_0<- arg1[0] * arg2[5] (_0*_0)
test al, al
adox rdi, r9
adox r13, [ rsp + 0x220 ]
mov rdx, 0xffffffffffffffff ; moving imm to reg
mov r9, [ rsp + 0x218 ];
and r9, rdx; lo limb and'ed
adox r9, rdi
adox r13, r10
mov rbx, r9;
shrd rbx, r13, 0x38; lo
shr r13, 0x38; x195_1>>=0x38
and rbx, rdx; lo limb and'ed
mov r11, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r11 + 0x18 ], rbp; out1[3] = x238
adox rbx, r12
adox r14, r10
mov r15, rbx;
shrd r15, r14, 0x38; lo
shr r14, 0x38; x225_1>>=0x38
mov rbp, 0x38 ; moving imm to reg
bzhi r12, [ rsp + 0x1d0 ], rbp; x184 <- x183 (only least 0x38 bits)
bzhi rdi, r8, rbp; x157 <- x156 (only least 0x38 bits)
add r15, [ rsp + 0x180 ]
bzhi r13, r15, rbp; x236 <- x229 (only least 0x38 bits)
bzhi r14, rbx, rbp; x228 <- x227 (only least 0x38 bits)
shr rcx, 0x38; x237 <- x234>> 0x38
shr r15, 0x38; x235 <- x229>> 0x38
mov r8, r15;
lea r8, [ r8 + r12 ]
lea rcx, [ rcx + rdi ]
lea rcx, [ rcx + r15 ]
bzhi r12, rcx, rbp; x243 <- x241 (only least 0x38 bits)
bzhi rdi, r8, rbp; x246 <- x239 (only least 0x38 bits)
mov [ r11 + 0x0 ], rdi; out1[0] = x246
mov [ r11 + 0x20 ], r12; out1[4] = x243
shr r8, 0x38; x245 <- x239>> 0x38
add r8, [ rsp + 0x210 ]
bzhi rbx, r9, rbp; x197 <- x196 (only least 0x38 bits)
shr rcx, 0x38; x242 <- x241>> 0x38
lea rcx, [ rcx + rbx ]
bzhi r15, [ rsp + 0x208 ], rbp; x233 <- x232 (only least 0x38 bits)
mov [ r11 + 0x30 ], r14; out1[6] = x228
mov [ r11 + 0x28 ], rcx; out1[5] = x244
mov [ r11 + 0x10 ], r15; out1[2] = x233
mov [ r11 + 0x8 ], r8; out1[1] = x247
mov [ r11 + 0x38 ], r13; out1[7] = x236
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 680
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.9458
; seed 1903994629001288 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 4949883 ms on 160000 evaluations.
; Time spent for assembling and measuring (initial batch_size=118, initial num_batches=31): 156713 ms
; number of used evaluations: 160000
; Ratio (time for assembling + measure)/(total runtime for 160000 evals): 0.031659940245052254
; number reverted permutation / tried permutation: 53168 / 80034 =66.432%
; number reverted decision / tried decision: 43444 / 79965 =54.329%