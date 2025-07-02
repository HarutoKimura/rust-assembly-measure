SECTION .text
	GLOBAL rust_fiat_p448_solinas_carry_mul_CryptOpt
rust_fiat_p448_solinas_carry_mul_CryptOpt:
sub rsp, 672
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x30 ]; saving arg2[6] in rdx.
mulx r11, r10, [ rsi + 0x38 ]; x13_1, x13_0<- arg2[6] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mulx r8, rcx, [ rax + 0x20 ]; x44_1, x44_0<- arg2[4] * arg1[6] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x28 ]; x48_1, x48_0<- arg1[5] * arg2[5] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x30 ]; x76_1, x76_0<- arg2[1] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rax + 0x28 ]; x43_1, x43_0<- arg1[6] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rax + 0x20 ]; x49_1, x49_0<- arg2[4] * arg1[5] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x48 ], r12; spilling x76_1 to mem
mov [ rsp - 0x40 ], rbp; spilling x76_0 to mem
mulx rbp, r12, [ rsi + 0x20 ]; x83_1, x83_0<- arg1[4] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp - 0x38 ], rbp; spilling x83_1 to mem
mov [ rsp - 0x30 ], r12; spilling x83_0 to mem
mulx r12, rbp, [ rax + 0x18 ]; x45_1, x45_0<- arg2[3] * arg1[6] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp - 0x28 ], r14; spilling x43_1 to mem
mov [ rsp - 0x20 ], r13; spilling x43_0 to mem
mulx r13, r14, [ rsi + 0x30 ]; x21_1, x21_0<- arg1[6] * arg2[7] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x18 ], r12; spilling x45_1 to mem
mov [ rsp - 0x10 ], rbp; spilling x45_0 to mem
mulx rbp, r12, [ rax + 0x20 ]; x57_1, x57_0<- arg1[4] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp - 0x8 ], rbp; spilling x57_1 to mem
mov [ rsp + 0x0 ], r12; spilling x57_0 to mem
mulx r12, rbp, [ rsi + 0x38 ]; x9_1, x9_0<- arg2[7] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x8 ], rdi; spilling x49_1 to mem
mov [ rsp + 0x10 ], r15; spilling x49_0 to mem
mulx r15, rdi, [ rsi + 0x10 ]; x68_1, x68_0<- arg1[2] * arg2[6] (_0*_0)
mov rdx, rbp;
mov [ rsp + 0x18 ], r15; spilling x68_1 to mem
xor r15, r15
adox rdx, r9
mov [ rsp + 0x20 ], rdi; spilling x68_0 to mem
mov rdi, rbx;
adox rdi, r12
mov r15, rdx; preserving value of x219_0 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0x28 ], r11; spilling x13_1 to mem
mov [ rsp + 0x30 ], r10; spilling x13_0 to mem
mulx r10, r11, [ rsi + 0x10 ]; x95_1, x95_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0x38 ], r10; spilling x95_1 to mem
mov [ rsp + 0x40 ], r11; spilling x95_0 to mem
mov [ rsp + 0x48 ], r13; spilling x21_1 to mem
mulx r13, r10, r12; __,tmp <- (a_0 in rdx) * b_hi
mulx r13, r11, rbp; hi,lo <- (a_0 in rdx) * b_lo
lea r13, [r13+r10]; hi += tmp
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbp, r10, [ rax + 0x0 ]; x112_1, x112_0<- arg1[0] * arg2[0] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x50 ], rbp; spilling x112_1 to mem
mulx rbp, r12, [ rax + 0x18 ]; x92_1, x92_0<- arg1[2] * arg2[3] (_0*_0)
adcx r11, r9
adcx rbx, r13
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r13, r9, [ rsi + 0x38 ]; x42_1, x42_0<- arg2[1] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x58 ], rbp; spilling x92_1 to mem
mov [ rsp + 0x60 ], r12; spilling x92_0 to mem
mulx r12, rbp, [ rsi + 0x20 ]; x54_1, x54_0<- arg1[4] * arg2[7] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x68 ], r10; spilling x112_0 to mem
mov [ rsp + 0x70 ], r12; spilling x54_1 to mem
mulx r12, r10, [ rsi + 0x28 ]; x50_1, x50_0<- arg2[3] * arg1[5] (_0*_0)
mov rdx, rcx;
add rdx, r15; could be done better, if r0 has been u8 as well
adcx rdi, r8
mov r15, rdx; preserving value of x220_0 into a new reg
mov rdx, [ rsi + 0x38 ]; saving arg1[7] in rdx.
mov [ rsp + 0x78 ], rdi; spilling x220_1 to mem
mov [ rsp + 0x80 ], rbp; spilling x54_0 to mem
mulx rbp, rdi, [ rax + 0x28 ]; x17_1, x17_0<- arg2[5] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x88 ], r15; spilling x220_0 to mem
mov [ rsp + 0x90 ], rbx; spilling x202_1 to mem
mulx rbx, r15, [ rsi + 0x30 ]; x22_1, x22_0<- arg1[6] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x98 ], r11; spilling x202_0 to mem
mov [ rsp + 0xa0 ], r13; spilling x42_1 to mem
mulx r13, r11, [ rsi + 0x28 ]; x26_1, x26_0<- arg1[5] * arg2[7] (_0*_0)
mov rdx, r14;
test al, al
adox rdx, [ rsp + 0x30 ]
mov [ rsp + 0xa8 ], r9; spilling x42_0 to mem
mov r9, [ rsp + 0x28 ]; load m64 x13_1 to register64
adox r9, [ rsp + 0x48 ]
mov r14, rdx;
adcx r14, rdx
mov [ rsp + 0xb0 ], r12; spilling x50_1 to mem
mov r12, r9;
adcx r12, r9
mov [ rsp + 0xb8 ], r10; spilling x50_0 to mem
mov r10, r14;
mov [ rsp + 0xc0 ], r13; spilling x26_1 to mem
xor r13, r13
adox r10, [ rsp + 0x10 ]
adox r12, [ rsp + 0x8 ]
adcx rdi, r15
adcx rbx, rbp
xor rbp, rbp
adox r11, rdi
adox rbx, [ rsp + 0xc0 ]
mov r13, r11;
adcx r13, r11
mov r15, rbx;
adcx r15, rbx
mov r14, r13;
test al, al
adox r14, [ rsp + 0xb8 ]
adox r15, [ rsp + 0xb0 ]
adcx rdx, [ rsp + 0x10 ]
adcx r9, [ rsp + 0x8 ]
mov rdi, rdx;
test al, al
adox rdi, [ rsp - 0x10 ]
adox r9, [ rsp - 0x18 ]
adcx r11, [ rsp + 0xb8 ]
adcx rbx, [ rsp + 0xb0 ]
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx rbp, r13, [ rsi + 0x30 ]; x46_1, x46_0<- arg2[2] * arg1[6] (_0*_0)
mov rdx, r13;
test al, al
adox rdx, r11
adox rbx, rbp
mov r11, rdx;
adcx r11, [ rsp + 0xa8 ]
adcx rbx, [ rsp + 0xa0 ]
test al, al
adox rcx, [ rsp + 0x98 ]
adox r8, [ rsp + 0x90 ]
adcx r13, r14
adcx r15, rbp
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mulx rbp, r14, [ rsi + 0x28 ]; x47_1, x47_0<- arg1[5] * arg2[6] (_0*_0)
mov rdx, r13;
test al, al
adox rdx, [ rsp + 0xa8 ]
adox r15, [ rsp + 0xa0 ]
mov r13, rdx; preserving value of x145_0 into a new reg
mov rdx, [ rsi + 0x38 ]; saving arg1[7] in rdx.
mov [ rsp + 0xc8 ], r9; spilling x190_1 to mem
mov [ rsp + 0xd0 ], rdi; spilling x190_0 to mem
mulx rdi, r9, [ rax + 0x20 ]; x30_1, x30_0<- arg2[4] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp + 0xd8 ], r12; spilling x172_1 to mem
mov [ rsp + 0xe0 ], r10; spilling x172_0 to mem
mulx r10, r12, [ rax + 0x18 ]; x34_1, x34_0<- arg2[3] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0xe8 ], r15; spilling x145_1 to mem
mov [ rsp + 0xf0 ], r13; spilling x145_0 to mem
mulx r13, r15, [ rax + 0x28 ]; x63_1, x63_0<- arg1[3] * arg2[5] (_0*_0)
mov rdx, r14;
adcx rdx, [ rsp - 0x20 ]
adcx rbp, [ rsp - 0x28 ]
mov r14, r12;
test al, al
adox r14, rcx
adox r8, r10
adcx r9, rdx
adcx rbp, rdi
mov rcx, r11;
xor rdi, rdi
adox rcx, [ rsp + 0x0 ]
adox rbx, [ rsp - 0x8 ]
mov r11, r15;
adcx r11, rcx
adcx rbx, r13
mov rdx, r9;
xor rcx, rcx
adox rdx, [ rsp + 0x80 ]
adox rbp, [ rsp + 0x70 ]
mov rdi, [ rsp + 0x0 ]; load m64 x57_0 to register64
adcx rdi, [ rsp + 0xf0 ]
mov r9, [ rsp - 0x8 ]; load m64 x57_1 to register64
adcx r9, [ rsp + 0xe8 ]
test al, al
adox r15, rdi
adox r9, r13
mov r13, rdx; preserving value of x115_0 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx rcx, rdi, [ rax + 0x8 ]; x94_1, x94_0<- arg1[2] * arg2[1] (_0*_0)
adcx r12, [ rsp + 0x88 ]
adcx r10, [ rsp + 0x78 ]
mov rdx, r13;
mov [ rsp + 0xf8 ], r10; spilling x221_1 to mem
xor r10, r10
adox rdx, rdi
adox rcx, rbp
mov rdi, rdx; preserving value of x116_0 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mov [ rsp + 0x100 ], r12; spilling x221_0 to mem
mulx r12, r10, [ rsi + 0x8 ]; x100_1, x100_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x108 ], r8; spilling x204_1 to mem
mov [ rsp + 0x110 ], r14; spilling x204_0 to mem
mulx r14, r8, [ rax + 0x0 ]; x89_1, x89_0<- arg2[0] * arg1[3] (_0*_0)
adcx r10, rdi
adcx rcx, r12
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mulx r12, rdi, [ rax + 0x10 ]; x38_1, x38_0<- arg2[2] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0x118 ], r12; spilling x38_1 to mem
mov [ rsp + 0x120 ], rdi; spilling x38_0 to mem
mulx rdi, r12, [ rax + 0x10 ]; x78_1, x78_0<- arg2[2] * arg1[5] (_0*_0)
test al, al
adox r12, [ rsp - 0x40 ]
adox rdi, [ rsp - 0x48 ]
adcx r8, r10
adcx rcx, r14
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mulx r10, r14, [ rsi + 0x8 ]; x72_1, x72_0<- arg1[1] * arg2[7] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x128 ], rcx; spilling x118_1 to mem
mov [ rsp + 0x130 ], r8; spilling x118_0 to mem
mulx r8, rcx, [ rsi + 0x20 ]; x81_1, x81_0<- arg1[4] * arg2[3] (_0*_0)
xor rdx, rdx
adox rcx, r12
adox rdi, r8
adcx r13, rcx
adcx rdi, rbp
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r12, rbp, [ rax + 0x10 ]; x93_1, x93_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx rcx, r8, [ rsi + 0x18 ]; x88_1, x88_0<- arg1[3] * arg2[1] (_0*_0)
xor rdx, rdx
adox r8, r15
adox r9, rcx
mov r15, r8;
adcx r15, [ rsp + 0x20 ]
adcx r9, [ rsp + 0x18 ]
test al, al
adox rbp, r15
adox r9, r12
mov r12, r11;
adcx r12, [ rsp + 0x20 ]
adcx rbx, [ rsp + 0x18 ]
mov r11, r14;
test al, al
adox r11, rbp
adox r9, r10
adcx r14, r12
adcx rbx, r10
mov r10, r14;
xor rcx, rcx
adox r10, [ rsp + 0x68 ]
adox rbx, [ rsp + 0x50 ]
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r15, r8, [ rax + 0x28 ]; x90_1, x90_0<- arg1[2] * arg2[5] (_0*_0)
mov rdx, [ rsp - 0x10 ]; load m64 x45_0 to register64
adcx rdx, [ rsp + 0xe0 ]
mov rbp, [ rsp - 0x18 ]; load m64 x45_1 to register64
adcx rbp, [ rsp + 0xd8 ]
mov r12, rdx;
xor r14, r14
adox r12, [ rsp + 0x120 ]
adox rbp, [ rsp + 0x118 ]
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r14, rcx, [ rsi + 0x18 ]; x85_1, x85_0<- arg1[3] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp + 0x138 ], rbx; spilling x167_1 to mem
mov [ rsp + 0x140 ], r10; spilling x167_0 to mem
mulx r10, rbx, [ rax + 0x28 ]; x56_1, x56_0<- arg1[4] * arg2[5] (_0*_0)
mov rdx, rbx;
adcx rdx, r12
adcx rbp, r10
mov r12, rdx; preserving value of x175_0 into a new reg
mov rdx, [ rax + 0x30 ]; saving arg2[6] in rdx.
mov [ rsp + 0x148 ], r9; spilling x151_1 to mem
mov [ rsp + 0x150 ], r11; spilling x151_0 to mem
mulx r11, r9, [ rsi + 0x18 ]; x62_1, x62_0<- arg1[3] * arg2[6] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp + 0x158 ], r11; spilling x62_1 to mem
mov [ rsp + 0x160 ], r9; spilling x62_0 to mem
mulx r9, r11, [ rax + 0x8 ]; x79_1, x79_0<- arg2[1] * arg1[5] (_0*_0)
xor rdx, rdx
adox r11, [ rsp + 0x110 ]
adox r9, [ rsp + 0x108 ]
adcx rcx, r13
adcx rdi, r14
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r14, r13, [ rax + 0x18 ]; x99_1, x99_0<- arg1[1] * arg2[3] (_0*_0)
test al, al
adox r8, rcx
adox rdi, r15
mov rdx, [ rsp + 0x120 ]; load m64 x38_0 to register64
adcx rdx, [ rsp + 0xd0 ]
mov r15, [ rsp + 0x118 ]; load m64 x38_1 to register64
adcx r15, [ rsp + 0xc8 ]
mov rcx, rdx; preserving value of x191_0 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0x168 ], r14; spilling x99_1 to mem
mov [ rsp + 0x170 ], r13; spilling x99_0 to mem
mulx r13, r14, [ rsi + 0x38 ]; x75_1, x75_0<- arg2[0] * arg1[7] (_0*_0)
test al, al
adox rbx, rcx
adox r15, r10
mov rdx, r12;
adcx rdx, [ rsp - 0x30 ]
adcx rbp, [ rsp - 0x38 ]
mov r10, rdx; preserving value of x176_0 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx rcx, r12, [ rax + 0x30 ]; x55_1, x55_0<- arg1[4] * arg2[6] (_0*_0)
mov rdx, r10;
test al, al
adox rdx, [ rsp + 0x160 ]
adox rbp, [ rsp + 0x158 ]
mov r10, rdx; preserving value of x177_0 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mov [ rsp + 0x178 ], rbp; spilling x177_1 to mem
mov [ rsp + 0x180 ], r15; spilling x192_1 to mem
mulx r15, rbp, [ rax + 0x30 ]; x96_1, x96_0<- arg1[1] * arg2[6] (_0*_0)
mov rdx, r12;
adcx rdx, r11
adcx r9, rcx
add rbp, r8; could be done better, if r0 has been u8 as well
adcx rdi, r15
test al, al
adox r14, rbp
adox rdi, r13
mov r11, rdx; preserving value of x206_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r13, r8, [ rax + 0x38 ]; x105_1, x105_0<- arg1[0] * arg2[7] (_0*_0)
adcx r8, r14
adcx rdi, r13
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbp, r15, [ rax + 0x0 ]; x84_1, x84_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r13, r14, [ rax + 0x20 ]; x108_1, x108_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, r8;
shrd rdx, rdi, 0x38; lo
shr rdi, 0x38; x136_1>>=0x38
mov rdi, rdx; preserving value of x136_0 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mov [ rsp + 0x188 ], r10; spilling x177_0 to mem
mov [ rsp + 0x190 ], rbx; spilling x192_0 to mem
mulx rbx, r10, [ rsi + 0x0 ]; x109_1, x109_0<- arg1[0] * arg2[3] (_0*_0)
test al, al
adox r10, [ rsp + 0x130 ]
adox rbx, [ rsp + 0x128 ]
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rdi, rdx; lo limb and'ed
mov rdx, r10;
shrd rdx, rbx, 0x38; lo
shr rbx, 0x38; x120_1>>=0x38
mov [ rsp + 0x198 ], rdi; spilling x139_0 to mem
mov rdi, 0x40 ; moving imm to reg
mov [ rsp + 0x1a0 ], r9; spilling x206_1 to mem
bzhi r9, rdx, rdi; x135 <- x120_0 (only least 0x40 bits)
mov rbx, [ rsp + 0x170 ]; load m64 x99_0 to register64
adox rbx, [ rsp + 0x150 ]
mov rdx, [ rsp + 0x168 ]; load m64 x99_1 to register64
adox rdx, [ rsp + 0x148 ]
xor rdi, rdi
adox r15, rbx
adox rdx, rbp
mov rbp, rdx; preserving value of x153_1 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx rdi, rbx, [ rax + 0x20 ]; x98_1, x98_0<- arg1[1] * arg2[4] (_0*_0)
adcx r14, r15
adcx rbp, r13
xor rdx, rdx
adox r12, [ rsp + 0x100 ]
adox rcx, [ rsp + 0xf8 ]
adcx r9, r14
adc rbp, 0x0; add CF to r0's alloc
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r15, r13, [ rsi + 0x20 ]; x82_1, x82_0<- arg1[4] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0x1a8 ], r8; spilling x137 to mem
mulx r8, r14, [ rsi + 0x18 ]; x61_1, x61_0<- arg1[3] * arg2[7] (_0*_0)
mov rdx, r14;
mov [ rsp + 0x1b0 ], rdi; spilling x98_1 to mem
xor rdi, rdi
adox rdx, r12
adox rcx, r8
mov r12, 0xffffffffffffff ; moving imm to reg
and r10, r12; x122 <- x121&0xffffffffffffff
adox r13, r11
adox r15, [ rsp + 0x1a0 ]
mov r11, [ rsp + 0x140 ]; load m64 x167_0 to register64
mov r12, r11;
adcx r12, [ rsp + 0x198 ]
mov [ rsp + 0x1b8 ], r10; spilling x122 to mem
mov r10, [ rsp + 0x138 ];
adc r10, 0x0; add CF to r0's alloc
mov r11, rdx; preserving value of x223_0 into a new reg
mov rdx, [ rsi + 0x28 ]; saving arg1[5] in rdx.
mov [ rsp + 0x1c0 ], rcx; spilling x223_1 to mem
mulx rcx, rdi, [ rax + 0x0 ]; x80_1, x80_0<- arg2[0] * arg1[5] (_0*_0)
mov rdx, r9;
add rdx, [ rsp + 0x198 ]; could be done better, if r0 has been u8 as well
adc rbp, 0x0; add CF to r0's alloc
mov r9, rdx;
shrd rdx, rbp, 0x38; lo
shr rbp, 0x38; x157_1>>=0x38
mov rbp, [ rsp + 0x160 ]; load m64 x62_0 to register64
mov [ rsp + 0x1c8 ], r9; spilling x158 to mem
xor r9, r9
adox rbp, [ rsp + 0x190 ]
mov [ rsp + 0x1d0 ], r11; spilling x223_0 to mem
mov r11, [ rsp + 0x158 ]; load m64 x62_1 to register64
adox r11, [ rsp + 0x180 ]
mov r9, rdx; preserving value of x157_0 into a new reg
mov rdx, [ rax + 0x38 ]; saving arg2[7] in rdx.
mov [ rsp + 0x1d8 ], rcx; spilling x80_1 to mem
mov [ rsp + 0x1e0 ], rdi; spilling x80_0 to mem
mulx rdi, rcx, [ rsi + 0x10 ]; x67_1, x67_0<- arg1[2] * arg2[7] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x1e8 ], r9; spilling x157_0 to mem
mov [ rsp + 0x1f0 ], r15; spilling x207_1 to mem
mulx r15, r9, [ rax + 0x10 ]; x87_1, x87_0<- arg1[3] * arg2[2] (_0*_0)
adcx r9, [ rsp + 0x188 ]
adcx r15, [ rsp + 0x178 ]
mov rdx, rcx;
mov [ rsp + 0x1f8 ], r13; spilling x207_0 to mem
xor r13, r13
adox rdx, rbp
adox r11, rdi
adcx rcx, r9
adcx r15, rdi
mov rbp, rcx;
add rbp, [ rsp + 0x60 ]; could be done better, if r0 has been u8 as well
adcx r15, [ rsp + 0x58 ]
xor rdi, rdi
adox rbx, rbp
adox r15, [ rsp + 0x1b0 ]
mov r13, rdx; preserving value of x194_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx rcx, r9, [ rsi + 0x0 ]; x111_1, x111_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, rbp, [ rax + 0x0 ]; x102_1, x102_0<- arg2[0] * arg1[1] (_0*_0)
adcx rbp, r13
adcx r11, rdi
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rdi, r13, [ rax + 0x18 ]; x86_1, x86_0<- arg1[3] * arg2[3] (_0*_0)
mov rdx, r12;
shrd rdx, r10, 0x38; lo
shr r10, 0x38; x185_1>>=0x38
xor r10, r10
adox r9, rbp
adox r11, rcx
mov rcx, 0xffffffffffffffff ; moving imm to reg
and rdx, rcx; lo limb and'ed
adox rdx, r9
adox r11, r10
adcx r14, [ rsp + 0x1f8 ]
adcx r8, [ rsp + 0x1f0 ]
mov rbp, rdx; preserving value of x197_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx r10, r9, [ rsi + 0x8 ]; x101_1, x101_0<- arg1[1] * arg2[1] (_0*_0)
xor rdx, rdx
adox r13, r14
adox r8, rdi
mov rdi, [ rsp + 0x1e8 ];
and rdi, rcx; lo limb and'ed
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rcx, r14, [ rax + 0x28 ]; x107_1, x107_0<- arg1[0] * arg2[5] (_0*_0)
mov rdx, rbx;
adox rdx, [ rsp + 0x1e0 ]
adox r15, [ rsp + 0x1d8 ]
adcx r14, rdx
adcx r15, rcx
xor rbx, rbx
adox rdi, r14
adox r15, rbx
mov rcx, rdi;
shrd rcx, r15, 0x38; lo
shr r15, 0x38; x198_1>>=0x38
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r15, r14, [ rsi + 0x30 ]; x77_1, x77_0<- arg2[0] * arg1[6] (_0*_0)
xor rdx, rdx
adox r9, [ rsp + 0x1d0 ]
adox r10, [ rsp + 0x1c0 ]
mov rbx, r9;
adcx rbx, [ rsp + 0x40 ]
adcx r10, [ rsp + 0x38 ]
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp + 0x200 ], r15; spilling x77_1 to mem
mulx r15, r9, [ rsi + 0x0 ]; x110_1, x110_0<- arg1[0] * arg2[2] (_0*_0)
xor rdx, rdx
adox r9, rbx
adox r10, r15
mov rbx, rbp;
shrd rbx, r11, 0x38; lo
shr r11, 0x38; x215_1>>=0x38
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r11, r15, [ rax + 0x20 ]; x91_1, x91_0<- arg1[2] * arg2[4] (_0*_0)
mov rdx, 0x40 ; moving imm to reg
mov [ rsp + 0x208 ], r14; spilling x77_0 to mem
bzhi r14, rbx, rdx; x218 <- x215_0 (only least 0x40 bits)
adox r14, r9
mov rbx, 0x0 ; moving imm to reg
adox r10, rbx
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rbx, r9, [ rax + 0x30 ]; x106_1, x106_0<- arg1[0] * arg2[6] (_0*_0)
mov rdx, r14;
shrd rdx, r10, 0x38; lo
shr r10, 0x38; x233_1>>=0x38
add rdx, [ rsp + 0x1b8 ]
mov r10, rdx; preserving value of x237 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.
mov [ rsp + 0x210 ], rbx; spilling x106_1 to mem
mov [ rsp + 0x218 ], r9; spilling x106_0 to mem
mulx r9, rbx, [ rsi + 0x8 ]; x97_1, x97_0<- arg1[1] * arg2[5] (_0*_0)
test al, al
adox r15, r13
adox r8, r11
mov rdx, 0x38 ; moving imm to reg
bzhi r13, r14, rdx; x236 <- x235 (only least 0x38 bits)
adox rbx, r15
adox r8, r9
mov r11, 0x40 ; moving imm to reg
bzhi r14, rcx, r11; x201 <- x198_0 (only least 0x40 bits)
bzhi rcx, r10, rdx; x241 <- x237 (only least 0x38 bits)
bzhi r9, [ rsp + 0x1a8 ], rdx; x138 <- x137 (only least 0x38 bits)
mov r15, rbx;
adox r15, [ rsp + 0x208 ]
adox r8, [ rsp + 0x200 ]
shr r10, 0x38; x240 <- x237>> 0x38
mov rbx, r15;
test al, al
adox rbx, [ rsp + 0x218 ]
adox r8, [ rsp + 0x210 ]
adcx r14, rbx
adc r8, 0x0; add CF to r0's alloc
mov r15, r14;
shrd r15, r8, 0x38; lo
shr r8, 0x38; x228_1>>=0x38
lea r9, [ r9 + r15 ]
mov rbx, r9;
shr rbx, 0x38; x238 <- x232>> 0x38
bzhi r8, r12, rdx; x187 <- x186 (only least 0x38 bits)
bzhi r15, [ rsp + 0x1c8 ], rdx; x159 <- x158 (only least 0x38 bits)
mov r12, rbx;
lea r12, [ r12 + r15 ]
lea rbx, [ rbx + r8 ]
bzhi r8, rbx, rdx; x249 <- x243 (only least 0x38 bits)
mov r15, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r15 + 0x0 ], r8; out1[0] = x249
lea r12, [ r12 + r10 ]
bzhi r10, r12, rdx; x246 <- x244 (only least 0x38 bits)
bzhi r8, rbp, rdx; x217 <- x216 (only least 0x38 bits)
shr rbx, 0x38; x248 <- x243>> 0x38
bzhi rbp, rdi, rdx; x200 <- x199 (only least 0x38 bits)
lea rbx, [ rbx + r8 ]
mov [ r15 + 0x10 ], r13; out1[2] = x236
shr r12, 0x38; x245 <- x244>> 0x38
lea r12, [ r12 + rbp ]
mov [ r15 + 0x28 ], r12; out1[5] = x247
bzhi r13, r14, rdx; x231 <- x230 (only least 0x38 bits)
mov [ r15 + 0x30 ], r13; out1[6] = x231
mov [ r15 + 0x18 ], rcx; out1[3] = x241
mov [ r15 + 0x8 ], rbx; out1[1] = x250
mov [ r15 + 0x20 ], r10; out1[4] = x246
bzhi rcx, r9, rdx; x239 <- x232 (only least 0x38 bits)
mov [ r15 + 0x38 ], rcx; out1[7] = x239
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 672
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.4028
; seed 3322443361737628 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 4857548 ms on 160000 evaluations.
; Time spent for assembling and measuring (initial batch_size=77, initial num_batches=31): 143266 ms
; number of used evaluations: 160000
; Ratio (time for assembling + measure)/(total runtime for 160000 evals): 0.029493481073166957
; number reverted permutation / tried permutation: 51619 / 79925 =64.584%
; number reverted decision / tried decision: 43013 / 80074 =53.717%