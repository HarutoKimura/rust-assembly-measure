SECTION .text
	GLOBAL fiat_c_p448_solinas_carry_mul_CryptOpt
fiat_c_p448_solinas_carry_mul_CryptOpt:
sub rsp, 704
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x8 ]; saving arg2[1] in rdx.
mulx r11, r10, [ rsi + 0x30 ]; x76_1, x76_0<- arg2[1] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r8, rcx, [ rax + 0x8 ]; x88_1, x88_0<- arg1[3] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x38 ]; x9_1, x9_0<- arg2[7] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rax + 0x30 ]; x55_1, x55_0<- arg1[4] * arg2[6] (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r13, rbx; __,tmp <- (a_0 in rdx) * b_hi
mulx r15, r14, r9; hi,lo <- (a_0 in rdx) * b_lo
lea r15, [r15+r13]; hi += tmp
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r13, [ rax + 0x30 ]; x13_1, x13_0<- arg2[6] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp - 0x48 ], r8; spilling x88_1 to mem
mov [ rsp - 0x40 ], rcx; spilling x88_0 to mem
mulx rcx, r8, [ rax + 0x8 ]; x79_1, x79_0<- arg2[1] * arg1[5] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x38 ], r12; spilling x55_1 to mem
mov [ rsp - 0x30 ], rbp; spilling x55_0 to mem
mulx rbp, r12, [ rsi + 0x38 ]; x34_1, x34_0<- arg2[3] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x28 ], rcx; spilling x79_1 to mem
mov [ rsp - 0x20 ], r8; spilling x79_0 to mem
mulx r8, rcx, [ rsi + 0x28 ]; x78_1, x78_0<- arg2[2] * arg1[5] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x18 ], rbp; spilling x34_1 to mem
mov [ rsp - 0x10 ], r12; spilling x34_0 to mem
mulx r12, rbp, [ rsi + 0x0 ]; x109_1, x109_0<- arg1[0] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp - 0x8 ], r12; spilling x109_1 to mem
mov [ rsp + 0x0 ], rbp; spilling x109_0 to mem
mulx rbp, r12, [ rsi + 0x0 ]; x107_1, x107_0<- arg1[0] * arg2[5] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0x8 ], rbp; spilling x107_1 to mem
mov [ rsp + 0x10 ], r12; spilling x107_0 to mem
mulx r12, rbp, [ rsi + 0x38 ]; x30_1, x30_0<- arg2[4] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x18 ], r12; spilling x30_1 to mem
mov [ rsp + 0x20 ], rbp; spilling x30_0 to mem
mulx rbp, r12, [ rsi + 0x20 ]; x54_1, x54_0<- arg1[4] * arg2[7] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x28 ], rbp; spilling x54_1 to mem
mov [ rsp + 0x30 ], r12; spilling x54_0 to mem
mulx r12, rbp, [ rsi + 0x8 ]; x99_1, x99_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp + 0x38 ], r12; spilling x99_1 to mem
mov [ rsp + 0x40 ], rbp; spilling x99_0 to mem
mulx rbp, r12, [ rsi + 0x0 ]; x111_1, x111_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp + 0x48 ], rbp; spilling x111_1 to mem
mov [ rsp + 0x50 ], r12; spilling x111_0 to mem
mulx r12, rbp, [ rax + 0x28 ]; x43_1, x43_0<- arg1[6] * arg2[5] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp + 0x58 ], rdi; spilling x13_1 to mem
mov [ rsp + 0x60 ], r13; spilling x13_0 to mem
mulx r13, rdi, [ rsi + 0x28 ]; x48_1, x48_0<- arg1[5] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp + 0x68 ], r12; spilling x43_1 to mem
mov [ rsp + 0x70 ], rbp; spilling x43_0 to mem
mulx rbp, r12, [ rax + 0x30 ]; x106_1, x106_0<- arg1[0] * arg2[6] (_0*_0)
add r14, rdi; could be done better, if r0 has been u8 as well
mov rdx, r13;
adcx rdx, r15
mov r15, rdx; preserving value of x199_1 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mov [ rsp + 0x78 ], rbp; spilling x106_1 to mem
mov [ rsp + 0x80 ], r12; spilling x106_0 to mem
mulx r12, rbp, [ rax + 0x20 ]; x44_1, x44_0<- arg2[4] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp + 0x88 ], r15; spilling x199_1 to mem
mov [ rsp + 0x90 ], r14; spilling x199_0 to mem
mulx r14, r15, [ rax + 0x20 ]; x108_1, x108_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x98 ], r14; spilling x108_1 to mem
mov [ rsp + 0xa0 ], r15; spilling x108_0 to mem
mulx r15, r14, [ rax + 0x30 ]; x96_1, x96_0<- arg1[1] * arg2[6] (_0*_0)
xor rdx, rdx
adox rcx, r10
adox r11, r8
adcx r9, rdi
adcx r13, rbx
mov r10, rbp;
xor rbx, rbx
adox r10, r9
adox r13, r12
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mulx rdi, r8, [ rax + 0x30 ]; x47_1, x47_0<- arg1[5] * arg2[6] (_0*_0)
mov rdx, r8;
adcx rdx, [ rsp + 0x70 ]
adcx rdi, [ rsp + 0x68 ]
mov r9, rdx; preserving value of x113_0 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mulx rbx, r8, [ rax + 0x38 ]; x21_1, x21_0<- arg1[6] * arg2[7] (_0*_0)
mov rdx, r8;
mov [ rsp + 0xa8 ], r15; spilling x96_1 to mem
xor r15, r15
adox rdx, [ rsp + 0x60 ]
adox rbx, [ rsp + 0x58 ]
mov r8, r9;
adcx r8, [ rsp + 0x20 ]
adcx rdi, [ rsp + 0x18 ]
mov r9, r10;
mov [ rsp + 0xb0 ], r14; spilling x96_0 to mem
xor r14, r14
adox r9, [ rsp - 0x10 ]
adox r13, [ rsp - 0x18 ]
mov r15, rdx; preserving value of x132_0 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mulx r14, r10, [ rax + 0x18 ]; x45_1, x45_0<- arg2[3] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0xb8 ], r11; spilling x123_1 to mem
mov [ rsp + 0xc0 ], rcx; spilling x123_0 to mem
mulx rcx, r11, [ rax + 0x38 ]; x61_1, x61_0<- arg1[3] * arg2[7] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0xc8 ], rdi; spilling x114_1 to mem
mov [ rsp + 0xd0 ], r8; spilling x114_0 to mem
mulx r8, rdi, [ rax + 0x20 ]; x49_1, x49_0<- arg2[4] * arg1[5] (_0*_0)
adcx rbp, [ rsp + 0x90 ]
adcx r12, [ rsp + 0x88 ]
mov rdx, rbp;
add rdx, [ rsp - 0x10 ]; could be done better, if r0 has been u8 as well
adcx r12, [ rsp - 0x18 ]
mov rbp, r15;
mov [ rsp + 0xd8 ], rcx; spilling x61_1 to mem
xor rcx, rcx
adox rbp, rdi
mov [ rsp + 0xe0 ], r11; spilling x61_0 to mem
mov r11, r8;
adox r11, rbx
mov [ rsp + 0xe8 ], r13; spilling x218_1 to mem
mov r13, rdx;
adcx r13, [ rsp - 0x20 ]
adcx r12, [ rsp - 0x28 ]
mov rdx, r10;
add rdx, rbp; could be done better, if r0 has been u8 as well
adcx r11, r14
mov rbp, 0x2 ; moving imm to reg
xchg rdx, rbp; 0x2, swapping with x187_0, which is currently in rdx
mov [ rsp + 0xf0 ], r11; spilling x187_1 to mem
mov [ rsp + 0xf8 ], rbp; spilling x187_0 to mem
mulx rbp, rcx, rbx; __,tmp <- (a_0 in rdx) * b_hi
mulx rbp, r11, r15; hi,lo <- (a_0 in rdx) * b_lo
lea rbp, [rbp+rcx]; hi += tmp
test al, al
adox rdi, r11
adox rbp, r8
mov rcx, r9;
adcx rcx, [ rsp - 0x30 ]
mov r15, [ rsp + 0xe8 ]; load m64 x218_1 to register64
adcx r15, [ rsp - 0x38 ]
mov rbx, rcx;
test al, al
adox rbx, [ rsp + 0xe0 ]
adox r15, [ rsp + 0xd8 ]
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r8, r9, [ rsi + 0x20 ]; x82_1, x82_0<- arg1[4] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mulx rcx, r11, [ rsi + 0x38 ]; x17_1, x17_0<- arg2[5] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp + 0x100 ], r15; spilling x220_1 to mem
mov [ rsp + 0x108 ], rbx; spilling x220_0 to mem
mulx rbx, r15, [ rax + 0x30 ]; x22_1, x22_0<- arg1[6] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0x110 ], rbp; spilling x169_1 to mem
mov [ rsp + 0x118 ], rdi; spilling x169_0 to mem
mulx rdi, rbp, [ rsi + 0x18 ]; x85_1, x85_0<- arg1[3] * arg2[4] (_0*_0)
mov rdx, r13;
adcx rdx, [ rsp - 0x30 ]
adcx r12, [ rsp - 0x38 ]
xor r13, r13
adox r11, r15
adox rbx, rcx
adcx r9, rdx
adcx r12, r8
mov r8, [ rsp + 0xd0 ]; load m64 x114_0 to register64
mov rcx, r8;
test al, al
adox rcx, [ rsp + 0x30 ]
mov r15, [ rsp + 0xc8 ]; load m64 x114_1 to register64
adox r15, [ rsp + 0x28 ]
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mulx r13, r8, [ rax + 0x10 ]; x38_1, x38_0<- arg2[2] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x120 ], r13; spilling x38_1 to mem
mov [ rsp + 0x128 ], r8; spilling x38_0 to mem
mulx r8, r13, [ rax + 0x28 ]; x90_1, x90_0<- arg1[2] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0x130 ], rbx; spilling x133_1 to mem
mov [ rsp + 0x138 ], r11; spilling x133_0 to mem
mulx r11, rbx, [ rax + 0x18 ]; x81_1, x81_0<- arg1[4] * arg2[3] (_0*_0)
adcx rbx, [ rsp + 0xc0 ]
adcx r11, [ rsp + 0xb8 ]
mov rdx, rcx;
mov [ rsp + 0x140 ], r8; spilling x90_1 to mem
xor r8, r8
adox rdx, rbx
adox r11, r15
mov rbx, r9;
adcx rbx, [ rsp + 0xe0 ]
adcx r12, [ rsp + 0xd8 ]
test al, al
adox rbp, rdx
adox r11, rdi
adcx r13, rbp
adcx r11, [ rsp + 0x140 ]
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r9, rdi, [ rsi + 0x10 ]; x94_1, x94_0<- arg1[2] * arg2[1] (_0*_0)
add rcx, rdi; could be done better, if r0 has been u8 as well
adcx r9, r15
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mulx rbp, r15, [ rsi + 0x0 ]; x105_1, x105_0<- arg1[0] * arg2[7] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mulx r8, rdi, [ rax + 0x0 ]; x75_1, x75_0<- arg2[0] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x148 ], r12; spilling x205_1 to mem
mov [ rsp + 0x150 ], rbx; spilling x205_0 to mem
mulx rbx, r12, [ rsi + 0x28 ]; x26_1, x26_0<- arg1[5] * arg2[7] (_0*_0)
xor rdx, rdx
adox r12, [ rsp + 0x138 ]
adox rbx, [ rsp + 0x130 ]
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0x158 ], r9; spilling x116_1 to mem
mov [ rsp + 0x160 ], rcx; spilling x116_0 to mem
mov [ rsp + 0x168 ], rbp; spilling x105_1 to mem
mulx rbp, r9, rbx; __,tmp <- (a_0 in rdx) * b_hi
mulx rbp, rcx, r12; hi,lo <- (a_0 in rdx) * b_lo
lea rbp, [rbp+r9]; hi += tmp
mov r9, r13;
adcx r9, [ rsp + 0xb0 ]
adcx r11, [ rsp + 0xa8 ]
add rdi, r9; could be done better, if r0 has been u8 as well
adcx r11, r8
xor r13, r13
adox r10, [ rsp + 0x118 ]
adox r14, [ rsp + 0x110 ]
adcx r15, rdi
adcx r11, [ rsp + 0x168 ]
mov r8, r10;
test al, al
adox r8, [ rsp + 0x128 ]
adox r14, [ rsp + 0x120 ]
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx rdi, r9, [ rsi + 0x38 ]; x42_1, x42_0<- arg2[1] * arg1[7] (_0*_0)
mov rdx, r15;
shrd rdx, r11, 0x38; lo
shr r11, 0x38; x136_1>>=0x38
mov r10, rdx; preserving value of x136_0 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mulx r13, r11, [ rsi + 0x30 ]; x46_1, x46_0<- arg2[2] * arg1[6] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x170 ], r14; spilling x171_1 to mem
mov [ rsp + 0x178 ], r8; spilling x171_0 to mem
mulx r8, r14, [ rsi + 0x28 ]; x50_1, x50_0<- arg2[3] * arg1[5] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r10, rdx; lo limb and'ed
mov rdx, r14;
adox rdx, rcx
adox rbp, r8
mov rcx, r11;
adcx rcx, rdx
adcx rbp, r13
xor rdx, rdx
adox r12, r14
adox r8, rbx
adcx r11, r12
adcx r8, r13
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r13, rbx, [ rax + 0x20 ]; x57_1, x57_0<- arg1[4] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r12, r14, [ rax + 0x10 ]; x100_1, x100_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, r9;
mov [ rsp + 0x180 ], r10; spilling x139_0 to mem
xor r10, r10
adox rdx, rcx
adox rbp, rdi
adcx r14, [ rsp + 0x160 ]
adcx r12, [ rsp + 0x158 ]
mov rcx, rbx;
test al, al
adox rcx, rdx
adox rbp, r13
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x188 ], rbp; spilling x144_1 to mem
mulx rbp, r10, [ rax + 0x0 ]; x89_1, x89_0<- arg2[0] * arg1[3] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp + 0x190 ], rcx; spilling x144_0 to mem
mov [ rsp + 0x198 ], r8; spilling x159_1 to mem
mulx r8, rcx, [ rsi + 0x18 ]; x63_1, x63_0<- arg1[3] * arg2[5] (_0*_0)
adcx r10, r14
adcx r12, rbp
xor rdx, rdx
adox r9, r11
adox rdi, [ rsp + 0x198 ]
adcx rbx, r9
adcx rdi, r13
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r13, r11, [ rsi + 0x10 ]; x93_1, x93_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, rcx;
xor r14, r14
adox rdx, rbx
adox rdi, r8
adcx rcx, [ rsp + 0x190 ]
adcx r8, [ rsp + 0x188 ]
mov rbp, rcx;
test al, al
adox rbp, [ rsp - 0x40 ]
adox r8, [ rsp - 0x48 ]
mov r9, rdx; preserving value of x162_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx rcx, rbx, [ rax + 0x30 ]; x68_1, x68_0<- arg1[2] * arg2[6] (_0*_0)
mov rdx, rbx;
adcx rdx, rbp
adcx r8, rcx
test al, al
adox r11, rdx
adox r8, r13
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mulx rbp, r13, [ rsi + 0x8 ]; x72_1, x72_0<- arg1[1] * arg2[7] (_0*_0)
mov rdx, r13;
adcx rdx, r11
adcx r8, rbp
xor r11, r11
adox rbx, r9
adox rdi, rcx
adcx r13, rbx
adcx rdi, rbp
mov r14, rdx; preserving value of x149_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx rcx, r9, [ rsi + 0x8 ]; x101_1, x101_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, r14;
xor rbp, rbp
adox rdx, [ rsp + 0x40 ]
adox r8, [ rsp + 0x38 ]
mov r11, 0xffffffffffffff ; moving imm to reg
and r15, r11; x138 <- x137&0xffffffffffffff
mov r14, r10;
adox r14, [ rsp + 0x0 ]
adox r12, [ rsp - 0x8 ]
mov r10, rdx; preserving value of x150_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx rbp, rbx, [ rsi + 0x20 ]; x83_1, x83_0<- arg1[4] * arg2[1] (_0*_0)
adcx r9, [ rsp + 0x108 ]
adcx rcx, [ rsp + 0x100 ]
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0x1a0 ], r15; spilling x138 to mem
mulx r15, r11, [ rsi + 0x20 ]; x84_1, x84_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp + 0x1a8 ], rcx; spilling x221_1 to mem
mov [ rsp + 0x1b0 ], r9; spilling x221_0 to mem
mulx r9, rcx, [ rax + 0x0 ]; x112_1, x112_0<- arg1[0] * arg2[0] (_0*_0)
test al, al
adox rcx, r13
adox rdi, r9
mov rdx, r14;
shrd rdx, r12, 0x38; lo
shr r12, 0x38; x120_1>>=0x38
mov r13, rdx; preserving value of x120_0 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mulx r12, r9, [ rax + 0x10 ]; x87_1, x87_0<- arg1[3] * arg2[2] (_0*_0)
mov rdx, 0x40 ; moving imm to reg
mov [ rsp + 0x1b8 ], r12; spilling x87_1 to mem
bzhi r12, r13, rdx; x135 <- x120_0 (only least 0x40 bits)
adox r11, r10
adox r8, r15
mov r10, rcx;
test al, al
adox r10, [ rsp + 0x180 ]
mov r15, 0x0 ; moving imm to reg
adox rdi, r15
mov rcx, r10;
shrd rcx, rdi, 0x38; lo
shr rdi, 0x38; x182_1>>=0x38
bzhi r13, rcx, rdx; x185 <- x182_0 (only least 0x40 bits)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mulx rcx, rdi, [ rsi + 0x20 ]; x56_1, x56_0<- arg1[4] * arg2[5] (_0*_0)
mov rdx, rdi;
adox rdx, [ rsp + 0x178 ]
mov [ rsp + 0x1c0 ], r13; spilling x185_0 to mem
mov r13, rcx;
adox r13, [ rsp + 0x170 ]
mov r15, rdx; preserving value of x172_0 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mov [ rsp + 0x1c8 ], r9; spilling x87_0 to mem
mov [ rsp + 0x1d0 ], rbp; spilling x83_1 to mem
mulx rbp, r9, [ rax + 0x30 ]; x62_1, x62_0<- arg1[3] * arg2[6] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x1d8 ], rbp; spilling x62_1 to mem
mov [ rsp + 0x1e0 ], r9; spilling x62_0 to mem
mulx r9, rbp, [ rax + 0x18 ]; x86_1, x86_0<- arg1[3] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x1e8 ], r9; spilling x86_1 to mem
mov [ rsp + 0x1f0 ], rbp; spilling x86_0 to mem
mulx rbp, r9, [ rsi + 0x10 ]; x67_1, x67_0<- arg1[2] * arg2[7] (_0*_0)
mov rdx, r11;
test al, al
adox rdx, [ rsp + 0xa0 ]
adox r8, [ rsp + 0x98 ]
adcx r12, rdx
adc r8, 0x0; add CF to r0's alloc
add rbx, r15; could be done better, if r0 has been u8 as well
adcx r13, [ rsp + 0x1d0 ]
mov r11, rbx;
xor r15, r15
adox r11, [ rsp + 0x1e0 ]
adox r13, [ rsp + 0x1d8 ]
mov rdx, r11;
adcx rdx, [ rsp + 0x1c8 ]
adcx r13, [ rsp + 0x1b8 ]
mov rbx, r12;
add rbx, [ rsp + 0x180 ]; could be done better, if r0 has been u8 as well
adc r8, 0x0; add CF to r0's alloc
mov r12, rdx; preserving value of x175_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r15, r11, [ rax + 0x0 ]; x95_1, x95_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0x1f8 ], r8; spilling x154_1 to mem
mov [ rsp + 0x200 ], rbx; spilling x154_0 to mem
mulx rbx, r8, [ rsi + 0x8 ]; x98_1, x98_0<- arg1[1] * arg2[4] (_0*_0)
mov rdx, [ rsp + 0xf8 ]; load m64 x187_0 to register64
mov [ rsp + 0x208 ], rbx; spilling x98_1 to mem
mov rbx, rdx;
add rbx, [ rsp + 0x128 ]; could be done better, if r0 has been u8 as well
mov [ rsp + 0x210 ], r8; spilling x98_0 to mem
mov r8, [ rsp + 0xf0 ]; load m64 x187_1 to register64
adcx r8, [ rsp + 0x120 ]
mov rdx, r9;
test al, al
adox rdx, r12
adox r13, rbp
adcx rdi, rbx
adcx r8, rcx
mov rcx, rdi;
xor r12, r12
adox rcx, [ rsp + 0x1e0 ]
adox r8, [ rsp + 0x1d8 ]
mov rbx, [ rsp + 0x1f0 ]; load m64 x86_0 to register64
adcx rbx, [ rsp + 0x150 ]
mov rdi, [ rsp + 0x1e8 ]; load m64 x86_1 to register64
adcx rdi, [ rsp + 0x148 ]
mov r12, rdx; preserving value of x176_0 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mov [ rsp + 0x218 ], rdi; spilling x206_1 to mem
mov [ rsp + 0x220 ], rbx; spilling x206_0 to mem
mulx rbx, rdi, [ rsi + 0x0 ]; x110_1, x110_0<- arg1[0] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0x228 ], r13; spilling x176_1 to mem
mov [ rsp + 0x230 ], r12; spilling x176_0 to mem
mulx r12, r13, [ rsi + 0x8 ]; x102_1, x102_0<- arg2[0] * arg1[1] (_0*_0)
xor rdx, rdx
adox r9, rcx
adox r8, rbp
adcx r13, r9
adcx r8, r12
mov rbp, r13;
xor rcx, rcx
adox rbp, [ rsp + 0x50 ]
adox r8, [ rsp + 0x48 ]
mov rdx, rbp;
adcx rdx, [ rsp + 0x1c0 ]
adc r8, 0x0; add CF to r0's alloc
mov r12, rdx;
shrd r12, r8, 0x38; lo
shr r8, 0x38; x212_1>>=0x38
mov r9, 0x40 ; moving imm to reg
bzhi r13, r12, r9; x215 <- x212_0 (only least 0x40 bits)
mov rbp, rdx; preserving value of x194_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r12, r8, [ rax + 0x18 ]; x92_1, x92_0<- arg1[2] * arg2[3] (_0*_0)
adox r11, [ rsp + 0x1b0 ]
adox r15, [ rsp + 0x1a8 ]
xor rdx, rdx
adox rdi, r11
adox r15, rbx
adcx r8, [ rsp + 0x230 ]
adcx r12, [ rsp + 0x228 ]
mov rcx, 0x38 ; moving imm to reg
bzhi rbx, rbp, rcx; x214 <- x213 (only least 0x38 bits)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mulx rbp, r11, [ rax + 0x0 ]; x80_1, x80_0<- arg2[0] * arg1[5] (_0*_0)
mov rdx, [ rsp + 0x1f8 ];
mov r9, [ rsp + 0x200 ];
shrd r9, rdx, 0x38; lo
shr rdx, 0x38; x155_1>>=0x38
test al, al
adox r13, rdi
mov rdx, 0x0 ; moving imm to reg
adox r15, rdx
mov rdi, r13;
shrd rdi, r15, 0x38; lo
shr r15, 0x38; x230_1>>=0x38
mov r15, 0x40 ; moving imm to reg
bzhi rdx, r9, r15; x167 <- x155_0 (only least 0x40 bits)
mov r9, rdx; preserving value of x167_0 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mulx rcx, r15, [ rsi + 0x10 ]; x91_1, x91_0<- arg1[2] * arg2[4] (_0*_0)
mov rdx, 0x38 ; moving imm to reg
mov [ rsp + 0x238 ], rbx; spilling x214 to mem
bzhi rbx, r14, rdx; x122 <- x121 (only least 0x38 bits)
mov r14, r8;
adox r14, [ rsp + 0x210 ]
adox r12, [ rsp + 0x208 ]
lea rbx, [ rbx + rdi ]
xor r8, r8
adox r11, r14
adox r12, rbp
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, rbp, [ rax + 0x28 ]; x97_1, x97_0<- arg1[1] * arg2[5] (_0*_0)
mov rdx, r11;
adcx rdx, [ rsp + 0x10 ]
adcx r12, [ rsp + 0x8 ]
xor r14, r14
adox r9, rdx
adox r12, r14
mov r8, rbx;
shr r8, 0x38; x237 <- x234>> 0x38
test al, al
adox r15, [ rsp + 0x220 ]
adox rcx, [ rsp + 0x218 ]
adcx rbp, r15
adcx rcx, rdi
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mulx rdi, r11, [ rax + 0x0 ]; x77_1, x77_0<- arg2[0] * arg1[6] (_0*_0)
mov rdx, r9;
shrd rdx, r12, 0x38; lo
shr r12, 0x38; x195_1>>=0x38
xor r15, r15
adox r11, rbp
adox rcx, rdi
mov r14, r11;
adcx r14, [ rsp + 0x80 ]
adcx rcx, [ rsp + 0x78 ]
mov rbp, 0xffffffffffffffff ; moving imm to reg
and rdx, rbp; lo limb and'ed
mov rdi, [ rsp + 0x200 ];
adox rdx, r14
adox rcx, r15
mov r12, rdx;
shrd rdx, rcx, 0x38; lo
shr rcx, 0x38; x225_1>>=0x38
mov r11, 0x38 ; moving imm to reg
bzhi r14, r12, r11; x228 <- x227 (only least 0x38 bits)
bzhi r12, rdi, r11; x157 <- x156 (only least 0x38 bits)
add rdx, [ rsp + 0x1a0 ]
bzhi rdi, r10, r11; x184 <- x183 (only least 0x38 bits)
mov r10, rdx;
shr r10, 0x38; x235 <- x229>> 0x38
mov rcx, r10;
lea rcx, [ rcx + rdi ]
lea r8, [ r8 + r12 ]
lea r8, [ r8 + r10 ]
mov r12, r8;
shr r12, 0x38; x242 <- x241>> 0x38
bzhi rdi, r8, r11; x243 <- x241 (only least 0x38 bits)
mov r10, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r10 + 0x20 ], rdi; out1[4] = x243
bzhi r8, r9, r11; x197 <- x196 (only least 0x38 bits)
lea r12, [ r12 + r8 ]
bzhi r9, rbx, r11; x238 <- x234 (only least 0x38 bits)
bzhi rbx, rcx, r11; x246 <- x239 (only least 0x38 bits)
mov [ r10 + 0x18 ], r9; out1[3] = x238
bzhi rdi, r13, r11; x233 <- x232 (only least 0x38 bits)
shr rcx, 0x38; x245 <- x239>> 0x38
mov [ r10 + 0x0 ], rbx; out1[0] = x246
add rcx, [ rsp + 0x238 ]
mov [ r10 + 0x10 ], rdi; out1[2] = x233
bzhi r8, rdx, r11; x236 <- x229 (only least 0x38 bits)
mov [ r10 + 0x8 ], rcx; out1[1] = x247
mov [ r10 + 0x30 ], r14; out1[6] = x228
mov [ r10 + 0x38 ], r8; out1[7] = x236
mov [ r10 + 0x28 ], r12; out1[5] = x244
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 704
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.9330
; seed 4464138771747814 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 10005589 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=117, initial num_batches=31): 78671 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.007862705533877115
; number reverted permutation / tried permutation: 26976 / 40119 =67.240%
; number reverted decision / tried decision: 22097 / 39880 =55.409%