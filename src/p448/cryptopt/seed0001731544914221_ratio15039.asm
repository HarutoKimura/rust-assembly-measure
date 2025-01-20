SECTION .text
	GLOBAL rust_fiat_p448_solinas_carry_mul_CryptOpt
rust_fiat_p448_solinas_carry_mul_CryptOpt:
sub rsp, 608
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x38 ]; saving arg2[7] in rdx.
mulx r11, r10, [ rsi + 0x30 ]; x21_1, x21_0<- arg1[6] * arg2[7] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mulx r8, rcx, [ rax + 0x20 ]; x44_1, x44_0<- arg2[4] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rax + 0x0 ]; x80_1, x80_0<- arg2[0] * arg1[5] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rax + 0x8 ]; x76_1, x76_0<- arg2[1] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rax + 0x30 ]; x22_1, x22_0<- arg1[6] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rsi + 0x20 ]; x56_1, x56_0<- arg1[4] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp - 0x48 ], rbx; spilling x80_1 to mem
mov [ rsp - 0x40 ], r9; spilling x80_0 to mem
mulx r9, rbx, [ rax + 0x38 ]; x9_1, x9_0<- arg2[7] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp - 0x38 ], r14; spilling x22_1 to mem
mov [ rsp - 0x30 ], r13; spilling x22_0 to mem
mulx r13, r14, [ rax + 0x8 ]; x79_1, x79_0<- arg2[1] * arg1[5] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x28 ], r12; spilling x76_1 to mem
mov [ rsp - 0x20 ], rbp; spilling x76_0 to mem
mulx rbp, r12, [ rsi + 0x20 ]; x83_1, x83_0<- arg1[4] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp - 0x18 ], rbp; spilling x83_1 to mem
mov [ rsp - 0x10 ], r12; spilling x83_0 to mem
mulx r12, rbp, [ rax + 0x18 ]; x34_1, x34_0<- arg2[3] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp - 0x8 ], rdi; spilling x56_1 to mem
mov [ rsp + 0x0 ], r15; spilling x56_0 to mem
mulx r15, rdi, [ rax + 0x10 ]; x38_1, x38_0<- arg2[2] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x8 ], r13; spilling x79_1 to mem
mov [ rsp + 0x10 ], r14; spilling x79_0 to mem
mulx r14, r13, [ rax + 0x38 ]; x67_1, x67_0<- arg1[2] * arg2[7] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0x18 ], r14; spilling x67_1 to mem
mov [ rsp + 0x20 ], r13; spilling x67_0 to mem
mulx r13, r14, [ rax + 0x28 ]; x48_1, x48_0<- arg1[5] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x28 ], r15; spilling x38_1 to mem
mov [ rsp + 0x30 ], rdi; spilling x38_0 to mem
mulx rdi, r15, [ rax + 0x30 ]; x62_1, x62_0<- arg1[3] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp + 0x38 ], rdi; spilling x62_1 to mem
mov [ rsp + 0x40 ], r15; spilling x62_0 to mem
mulx r15, rdi, [ rsi + 0x20 ]; x82_1, x82_0<- arg1[4] * arg2[2] (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0x48 ], r15; spilling x82_1 to mem
mov [ rsp + 0x50 ], rdi; spilling x82_0 to mem
mov [ rsp + 0x58 ], r12; spilling x34_1 to mem
mulx r12, r15, r9; __,tmp <- (a_0 in rdx) * b_hi
mulx r12, rdi, rbx; hi,lo <- (a_0 in rdx) * b_lo
lea r12, [r12+r15]; hi += tmp
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0x60 ], rbp; spilling x34_0 to mem
mulx rbp, r15, [ rax + 0x30 ]; x47_1, x47_0<- arg1[5] * arg2[6] (_0*_0)
add rdi, r14; could be done better, if r0 has been u8 as well
mov rdx, r13;
adcx rdx, r12
mov r12, rdx; preserving value of x202_1 into a new reg
mov rdx, [ rax + 0x30 ]; saving arg2[6] in rdx.
mov [ rsp + 0x68 ], rbp; spilling x47_1 to mem
mov [ rsp + 0x70 ], r15; spilling x47_0 to mem
mulx r15, rbp, [ rsi + 0x38 ]; x13_1, x13_0<- arg2[6] * arg1[7] (_0*_0)
xor rdx, rdx
adox rbp, r10
adox r11, r15
mov r10, rbp;
adcx r10, rbp
mov r15, r11;
adcx r15, r11
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0x78 ], r15; spilling x171_1 to mem
mov [ rsp + 0x80 ], r10; spilling x171_0 to mem
mulx r10, r15, [ rsi + 0x28 ]; x49_1, x49_0<- arg2[4] * arg1[5] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x88 ], r12; spilling x202_1 to mem
mov [ rsp + 0x90 ], rdi; spilling x202_0 to mem
mulx rdi, r12, [ rax + 0x0 ]; x102_1, x102_0<- arg2[0] * arg1[1] (_0*_0)
xor rdx, rdx
adox rbp, r15
mov [ rsp + 0x98 ], rdi; spilling x102_1 to mem
mov rdi, r10;
adox rdi, r11
adcx rbx, r14
adcx r13, r9
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r14, r9, [ rsi + 0x8 ]; x98_1, x98_0<- arg1[1] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp + 0xa0 ], r14; spilling x98_1 to mem
mulx r14, r11, [ rax + 0x18 ]; x45_1, x45_0<- arg2[3] * arg1[6] (_0*_0)
mov rdx, rcx;
mov [ rsp + 0xa8 ], r9; spilling x98_0 to mem
xor r9, r9
adox rdx, rbx
adox r13, r8
mov rbx, r11;
adcx rbx, rbp
adcx rdi, r14
mov rbp, rdx; preserving value of x220_0 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0xb0 ], r12; spilling x102_0 to mem
mulx r12, r9, [ rsi + 0x0 ]; x112_1, x112_0<- arg1[0] * arg2[0] (_0*_0)
mov rdx, rbp;
mov [ rsp + 0xb8 ], r12; spilling x112_1 to mem
xor r12, r12
adox rdx, [ rsp + 0x60 ]
adox r13, [ rsp + 0x58 ]
adcx rcx, [ rsp + 0x90 ]
adcx r8, [ rsp + 0x88 ]
mov rbp, rcx;
mov [ rsp + 0xc0 ], r9; spilling x112_0 to mem
xor r9, r9
adox rbp, [ rsp + 0x60 ]
adox r8, [ rsp + 0x58 ]
adcx r15, [ rsp + 0x80 ]
adcx r10, [ rsp + 0x78 ]
mov r12, rbx;
xor rcx, rcx
adox r12, [ rsp + 0x30 ]
adox rdi, [ rsp + 0x28 ]
mov r9, rbp;
adcx r9, [ rsp + 0x10 ]
adcx r8, [ rsp + 0x8 ]
test al, al
adox r11, r15
adox r10, r14
mov r14, r11;
adcx r14, [ rsp + 0x30 ]
adcx r10, [ rsp + 0x28 ]
mov rbx, r12;
add rbx, [ rsp + 0x0 ]; could be done better, if r0 has been u8 as well
adcx rdi, [ rsp - 0x8 ]
mov rbp, r14;
add rbp, [ rsp + 0x0 ]; could be done better, if r0 has been u8 as well
adcx r10, [ rsp - 0x8 ]
mov r15, rbp;
xor r12, r12
adox r15, [ rsp - 0x10 ]
adox r10, [ rsp - 0x18 ]
mov rcx, rdx; preserving value of x221_0 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mulx r14, r11, [ rax + 0x28 ]; x43_1, x43_0<- arg1[6] * arg2[5] (_0*_0)
mov rdx, r15;
adcx rdx, [ rsp + 0x40 ]
adcx r10, [ rsp + 0x38 ]
mov rbp, rdx; preserving value of x177_0 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mulx r12, r15, [ rsi + 0x28 ]; x78_1, x78_0<- arg2[2] * arg1[5] (_0*_0)
xor rdx, rdx
adox r11, [ rsp + 0x70 ]
adox r14, [ rsp + 0x68 ]
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0xc8 ], r10; spilling x177_1 to mem
mov [ rsp + 0xd0 ], rbp; spilling x177_0 to mem
mulx rbp, r10, [ rsi + 0x38 ]; x30_1, x30_0<- arg2[4] * arg1[7] (_0*_0)
adcx r10, r11
adcx r14, rbp
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx rbp, r11, [ rsi + 0x20 ]; x81_1, x81_0<- arg1[4] * arg2[3] (_0*_0)
xor rdx, rdx
adox r15, [ rsp - 0x20 ]
adox r12, [ rsp - 0x28 ]
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0xd8 ], rdi; spilling x192_1 to mem
mov [ rsp + 0xe0 ], rbx; spilling x192_0 to mem
mulx rbx, rdi, [ rax + 0x38 ]; x54_1, x54_0<- arg1[4] * arg2[7] (_0*_0)
adcx rdi, r10
adcx r14, rbx
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx rbx, r10, [ rsi + 0x18 ]; x85_1, x85_0<- arg1[3] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp + 0xe8 ], r8; spilling x205_1 to mem
mov [ rsp + 0xf0 ], r9; spilling x205_0 to mem
mulx r9, r8, [ rsi + 0x38 ]; x17_1, x17_0<- arg2[5] * arg1[7] (_0*_0)
xor rdx, rdx
adox r8, [ rsp - 0x30 ]
adox r9, [ rsp - 0x38 ]
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp + 0xf8 ], r13; spilling x221_1 to mem
mov [ rsp + 0x100 ], rcx; spilling x221_0 to mem
mulx rcx, r13, [ rsi + 0x10 ]; x94_1, x94_0<- arg1[2] * arg2[1] (_0*_0)
mov rdx, rdi;
adcx rdx, r13
adcx rcx, r14
mov r13, rdx; preserving value of x116_0 into a new reg
mov rdx, [ rax + 0x38 ]; saving arg2[7] in rdx.
mov [ rsp + 0x108 ], rcx; spilling x116_1 to mem
mov [ rsp + 0x110 ], rbx; spilling x85_1 to mem
mulx rbx, rcx, [ rsi + 0x28 ]; x26_1, x26_0<- arg1[5] * arg2[7] (_0*_0)
add rcx, r8; could be done better, if r0 has been u8 as well
adcx r9, rbx
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx rbx, r8, [ rax + 0x28 ]; x90_1, x90_0<- arg1[2] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0x118 ], r13; spilling x116_0 to mem
mov [ rsp + 0x120 ], rbx; spilling x90_1 to mem
mulx rbx, r13, [ rax + 0x18 ]; x50_1, x50_0<- arg2[3] * arg1[5] (_0*_0)
add r11, r15; could be done better, if r0 has been u8 as well
adcx r12, rbp
mov rdx, rcx;
xor rbp, rbp
adox rdx, rcx
mov r15, r9;
adox r15, r9
adcx rdi, r11
adcx r12, r14
mov r14, r13;
xor r11, r11
adox r14, rdx
adox r15, rbx
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r11, rbp, [ rsi + 0x30 ]; x46_1, x46_0<- arg2[2] * arg1[6] (_0*_0)
adcx rcx, r13
adcx rbx, r9
mov rdx, rbp;
xor r9, r9
adox rdx, r14
adox r15, r11
adcx r10, rdi
adcx r12, [ rsp + 0x110 ]
add rbp, rcx; could be done better, if r0 has been u8 as well
adcx rbx, r11
add r8, r10; could be done better, if r0 has been u8 as well
adcx r12, [ rsp + 0x120 ]
mov r13, rdx; preserving value of x144_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r14, rdi, [ rax + 0x30 ]; x96_1, x96_0<- arg1[1] * arg2[6] (_0*_0)
xor rdx, rdx
adox rdi, r8
adox r12, r14
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r11, r9, [ rsi + 0x38 ]; x75_1, x75_0<- arg2[0] * arg1[7] (_0*_0)
adcx r9, rdi
adcx r12, r11
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r10, rcx, [ rax + 0x10 ]; x100_1, x100_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mulx r14, r8, [ rsi + 0x0 ]; x105_1, x105_0<- arg1[0] * arg2[7] (_0*_0)
xor rdx, rdx
adox r8, r9
adox r12, r14
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mulx r11, rdi, [ rax + 0x8 ]; x42_1, x42_0<- arg2[1] * arg1[7] (_0*_0)
mov rdx, r8;
mov r9, rdi;
adcx r9, r13
adcx r15, r11
add rcx, [ rsp + 0x118 ]; could be done better, if r0 has been u8 as well
adcx r10, [ rsp + 0x108 ]
mov r13, rdx; preserving value of x137 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mov [ rsp + 0x128 ], r15; spilling x145_1 to mem
mulx r15, r14, [ rax + 0x0 ]; x89_1, x89_0<- arg2[0] * arg1[3] (_0*_0)
test al, al
adox r14, rcx
adox r10, r15
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r15, rcx, [ rax + 0x20 ]; x57_1, x57_0<- arg1[4] * arg2[4] (_0*_0)
adcx rdi, rbp
adcx rbx, r11
mov rdx, rcx;
xor rbp, rbp
adox rdx, rdi
adox rbx, r15
shrd r8, r12, 0x38; lo
shr r12, 0x38; x136_1>>=0x38
xor r11, r11
adox rcx, r9
adox r15, [ rsp + 0x128 ]
mov rbp, rdx; preserving value of x163_0 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mulx rdi, r9, [ rsi + 0x10 ]; x93_1, x93_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mulx r11, r12, [ rsi + 0x18 ]; x63_1, x63_0<- arg1[3] * arg2[5] (_0*_0)
mov rdx, r12;
adcx rdx, rcx
adcx r15, r11
add r12, rbp; could be done better, if r0 has been u8 as well
adcx rbx, r11
mov rbp, rdx; preserving value of x147_0 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx r11, rcx, [ rax + 0x30 ]; x55_1, x55_0<- arg1[4] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x130 ], r13; spilling x137 to mem
mov [ rsp + 0x138 ], r8; spilling x136_0 to mem
mulx r8, r13, [ rsi + 0x0 ]; x109_1, x109_0<- arg1[0] * arg2[3] (_0*_0)
test al, al
adox r13, r14
adox r10, r8
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r8, r14, [ rax + 0x8 ]; x88_1, x88_0<- arg1[3] * arg2[1] (_0*_0)
mov rdx, rcx;
adcx rdx, [ rsp + 0x100 ]
mov [ rsp + 0x140 ], rbx; spilling x164_1 to mem
mov rbx, r11;
adcx rbx, [ rsp + 0xf8 ]
mov [ rsp + 0x148 ], rbx; spilling x222_1 to mem
mov rbx, r13;
mov [ rsp + 0x150 ], r12; spilling x164_0 to mem
mov r12, rdx; preserving value of x222_0 into a new reg
mov rdx, [ rax + 0x30 ]; saving arg2[6] in rdx.
mov [ rsp + 0x158 ], rbx; spilling x121 to mem
mov [ rsp + 0x160 ], rdi; spilling x93_1 to mem
mulx rdi, rbx, [ rsi + 0x10 ]; x68_1, x68_0<- arg1[2] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x168 ], r12; spilling x222_0 to mem
mov [ rsp + 0x170 ], r9; spilling x93_0 to mem
mulx r9, r12, [ rsi + 0x8 ]; x72_1, x72_0<- arg1[1] * arg2[7] (_0*_0)
shrd r13, r10, 0x38; lo
shr r10, 0x38; x120_1>>=0x38
xor rdx, rdx
adox r14, rbp
adox r15, r8
mov rbp, rbx;
adcx rbp, r14
adcx r15, rdi
mov r8, rbp;
add r8, [ rsp + 0x170 ]; could be done better, if r0 has been u8 as well
adcx r15, [ rsp + 0x160 ]
mov r10, r12;
add r10, r8; could be done better, if r0 has been u8 as well
adcx r15, r9
mov r14, 0x38 ; moving imm to reg
bzhi rbp, [ rsp + 0x158 ], r14; x122 <- x121 (only least 0x38 bits)
adox rbx, [ rsp + 0x150 ]
adox rdi, [ rsp + 0x140 ]
add r12, rbx; could be done better, if r0 has been u8 as well
adcx rdi, r9
test al, al
adox rcx, [ rsp + 0xf0 ]
adox r11, [ rsp + 0xe8 ]
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r8, r9, [ rsi + 0x8 ]; x99_1, x99_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r14, rbx, [ rax + 0x0 ]; x84_1, x84_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, r12;
adcx rdx, [ rsp + 0xc0 ]
adcx rdi, [ rsp + 0xb8 ]
xor r12, r12
adox r9, r10
adox r15, r8
adcx rbx, r9
adcx r15, r14
mov r10, rcx;
xor r8, r8
adox r10, [ rsp + 0x50 ]
adox r11, [ rsp + 0x48 ]
mov r12, 0xffffffffffffffff ; moving imm to reg
mov rcx, [ rsp + 0x138 ];
and rcx, r12; lo limb and'ed
mov r14, rcx;
adox r14, rdx
adox rdi, r8
mov rdx, [ rsp + 0xe0 ]; load m64 x192_0 to register64
mov r9, rdx;
adcx r9, [ rsp + 0x40 ]
mov r12, [ rsp + 0xd8 ]; load m64 x192_1 to register64
adcx r12, [ rsp + 0x38 ]
mov rdx, r14;
shrd rdx, rdi, 0x38; lo
shr rdi, 0x38; x185_1>>=0x38
mov r8, 0x40 ; moving imm to reg
mov [ rsp + 0x178 ], rbp; spilling x122 to mem
bzhi rbp, rdx, r8; x188 <- x185_0 (only least 0x40 bits)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r8, rdi, [ rax + 0x20 ]; x108_1, x108_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0x180 ], r13; spilling x120_0 to mem
mov [ rsp + 0x188 ], rbp; spilling x188_0 to mem
mulx rbp, r13, [ rsi + 0x10 ]; x95_1, x95_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x190 ], rbp; spilling x95_1 to mem
mov [ rsp + 0x198 ], r13; spilling x95_0 to mem
mulx r13, rbp, [ rsi + 0x18 ]; x61_1, x61_0<- arg1[3] * arg2[7] (_0*_0)
adox rdi, rbx
adox r15, r8
mov rdx, rbp;
xor rbx, rbx
adox rdx, r10
adox r11, r13
adcx rbp, [ rsp + 0x168 ]
adcx r13, [ rsp + 0x148 ]
mov r10, r9;
xor r8, r8
adox r10, [ rsp + 0x20 ]
adox r12, [ rsp + 0x18 ]
mov rbx, r10;
adcx rbx, [ rsp + 0xb0 ]
adcx r12, [ rsp + 0x98 ]
mov r9, rdx; preserving value of x208_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx r8, r10, [ rsi + 0x0 ]; x111_1, x111_0<- arg1[0] * arg2[1] (_0*_0)
test al, al
adox r10, rbx
adox r12, r8
mov rdx, r10;
adcx rdx, [ rsp + 0x188 ]
adc r12, 0x0; add CF to r0's alloc
mov rbx, rdx; preserving value of x197_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx r10, r8, [ rsi + 0x8 ]; x101_1, x101_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, rbx;
shrd rdx, r12, 0x38; lo
shr r12, 0x38; x215_1>>=0x38
mov r12, 0xffffffffffffffff ; moving imm to reg
mov [ rsp + 0x1a0 ], r14; spilling x186 to mem
mov r14, [ rsp + 0x180 ];
and r14, r12; lo limb and'ed
and rdx, r12; lo limb and'ed
adox r14, rdi
mov r12, 0x0 ; moving imm to reg
adox r15, r12
adcx rcx, r14
adc r15, 0x0; add CF to r0's alloc
mov rdi, rdx; preserving value of x218_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r12, r14, [ rax + 0x10 ]; x110_1, x110_0<- arg1[0] * arg2[2] (_0*_0)
xor rdx, rdx
adox r8, rbp
adox r13, r10
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r10, rbp, [ rsi + 0x18 ]; x87_1, x87_0<- arg1[3] * arg2[2] (_0*_0)
mov rdx, rcx;
shrd rdx, r15, 0x38; lo
shr r15, 0x38; x157_1>>=0x38
mov r15, r8;
add r15, [ rsp + 0x198 ]; could be done better, if r0 has been u8 as well
adcx r13, [ rsp + 0x190 ]
xor r8, r8
adox r14, r15
adox r13, r12
mov r12, rdx; preserving value of x157_0 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mulx r8, r15, [ rsi + 0x10 ]; x92_1, x92_0<- arg1[2] * arg2[3] (_0*_0)
adcx rdi, r14
adc r13, 0x0; add CF to r0's alloc
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp + 0x1a8 ], rbx; spilling x216 to mem
mulx rbx, r14, [ rax + 0x0 ]; x77_1, x77_0<- arg2[0] * arg1[6] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x1b0 ], rbx; spilling x77_1 to mem
mov [ rsp + 0x1b8 ], r14; spilling x77_0 to mem
mulx r14, rbx, [ rsi + 0x18 ]; x86_1, x86_0<- arg1[3] * arg2[3] (_0*_0)
test al, al
adox rbp, [ rsp + 0xd0 ]
adox r10, [ rsp + 0xc8 ]
mov rdx, rdi;
shrd rdx, r13, 0x38; lo
shr r13, 0x38; x233_1>>=0x38
mov r13, rdx; preserving value of x233_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mov [ rsp + 0x1c0 ], rcx; spilling x158 to mem
mov [ rsp + 0x1c8 ], r14; spilling x86_1 to mem
mulx r14, rcx, [ rax + 0x28 ]; x97_1, x97_0<- arg1[1] * arg2[5] (_0*_0)
mov rdx, rbp;
mov [ rsp + 0x1d0 ], r14; spilling x97_1 to mem
xor r14, r14
adox rdx, [ rsp + 0x20 ]
adox r10, [ rsp + 0x18 ]
adcx r15, rdx
adcx r10, r8
mov r8, r15;
xor rbp, rbp
adox r8, [ rsp + 0xa8 ]
adox r10, [ rsp + 0xa0 ]
mov r14, r8;
adcx r14, [ rsp - 0x40 ]
adcx r10, [ rsp - 0x48 ]
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r8, r15, [ rax + 0x28 ]; x107_1, x107_0<- arg1[0] * arg2[5] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x1d8 ], rdi; spilling x235 to mem
mulx rdi, rbp, [ rsi + 0x0 ]; x106_1, x106_0<- arg1[0] * arg2[6] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and r12, rdx; lo limb and'ed
adox r15, r14
adox r10, r8
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r8, r14, [ rax + 0x20 ]; x91_1, x91_0<- arg1[2] * arg2[4] (_0*_0)
adcx r12, r15
adc r10, 0x0; add CF to r0's alloc
xor rdx, rdx
adox rbx, r9
adox r11, [ rsp + 0x1c8 ]
adcx r14, rbx
adcx r11, r8
mov r9, 0x38 ; moving imm to reg
bzhi r15, [ rsp + 0x1c0 ], r9; x159 <- x158 (only least 0x38 bits)
mov r8, r12;
shrd r8, r10, 0x38; lo
shr r10, 0x38; x198_1>>=0x38
test al, al
adox rcx, r14
adox r11, [ rsp + 0x1d0 ]
mov rbx, rcx;
adcx rbx, [ rsp + 0x1b8 ]
adcx r11, [ rsp + 0x1b0 ]
bzhi r14, r12, r9; x200 <- x199 (only least 0x38 bits)
bzhi r10, [ rsp + 0x130 ], r9; x138 <- x137 (only least 0x38 bits)
mov rcx, 0xffffffffffffffff ; moving imm to reg
and r8, rcx; lo limb and'ed
adox rbp, rbx
adox r11, rdi
adcx r8, rbp
adc r11, 0x0; add CF to r0's alloc
mov rdi, r8;
shrd r8, r11, 0x38; lo
shr r11, 0x38; x228_1>>=0x38
bzhi r12, rdi, r9; x231 <- x230 (only least 0x38 bits)
add r13, [ rsp + 0x178 ]
mov rbx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rbx + 0x30 ], r12; out1[6] = x231
lea r10, [ r10 + r8 ]
mov rbp, r10;
shr rbp, 0x38; x238 <- x232>> 0x38
mov rdi, rbp;
lea rdi, [ rdi + r15 ]
mov r15, r13;
shr r15, 0x38; x240 <- x237>> 0x38
lea rdi, [ rdi + r15 ]
bzhi r11, [ rsp + 0x1a0 ], r9; x187 <- x186 (only least 0x38 bits)
bzhi r12, r10, r9; x239 <- x232 (only least 0x38 bits)
bzhi r8, rdi, r9; x246 <- x244 (only least 0x38 bits)
bzhi r10, r13, r9; x241 <- x237 (only least 0x38 bits)
mov [ rbx + 0x18 ], r10; out1[3] = x241
mov [ rbx + 0x38 ], r12; out1[7] = x239
lea rbp, [ rbp + r11 ]
bzhi r13, [ rsp + 0x1a8 ], r9; x217 <- x216 (only least 0x38 bits)
shr rdi, 0x38; x245 <- x244>> 0x38
lea rdi, [ rdi + r14 ]
mov r14, rbp;
shr r14, 0x38; x248 <- x243>> 0x38
mov [ rbx + 0x20 ], r8; out1[4] = x246
bzhi r15, [ rsp + 0x1d8 ], r9; x236 <- x235 (only least 0x38 bits)
bzhi r11, rbp, r9; x249 <- x243 (only least 0x38 bits)
lea r14, [ r14 + r13 ]
mov [ rbx + 0x0 ], r11; out1[0] = x249
mov [ rbx + 0x8 ], r14; out1[1] = x250
mov [ rbx + 0x28 ], rdi; out1[5] = x247
mov [ rbx + 0x10 ], r15; out1[2] = x236
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 608
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.5039
; seed 4446495894908587 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 2454801 ms on 80000 evaluations.
; Time spent for assembling and measuring (initial batch_size=76, initial num_batches=31): 72312 ms
; number of used evaluations: 80000
; Ratio (time for assembling + measure)/(total runtime for 80000 evals): 0.029457377604131658
; number reverted permutation / tried permutation: 26330 / 39728 =66.276%
; number reverted decision / tried decision: 22142 / 40271 =54.982%