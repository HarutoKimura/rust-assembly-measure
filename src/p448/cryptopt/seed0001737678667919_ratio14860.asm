SECTION .text
	GLOBAL rust_fiat_p448_solinas_carry_mul
rust_fiat_p448_solinas_carry_mul:
sub rsp, 632
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x20 ]; saving arg2[4] in rdx.
mulx r11, r10, [ rsi + 0x38 ]; x30_1, x30_0<- arg2[4] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mulx r8, rcx, [ rax + 0x10 ]; x78_1, x78_0<- arg2[2] * arg1[5] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x30 ]; x76_1, x76_0<- arg2[1] * arg1[6] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x38 ]; x34_1, x34_0<- arg2[3] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rsi + 0x28 ]; x49_1, x49_0<- arg2[4] * arg1[5] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rax + 0x38 ]; x72_1, x72_0<- arg1[1] * arg2[7] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x48 ], rdi; spilling x72_1 to mem
mov [ rsp - 0x40 ], r15; spilling x72_0 to mem
mulx r15, rdi, [ rsi + 0x38 ]; x38_1, x38_0<- arg2[2] * arg1[7] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mov [ rsp - 0x38 ], r12; spilling x34_1 to mem
mov [ rsp - 0x30 ], rbp; spilling x34_0 to mem
mulx rbp, r12, [ rax + 0x0 ]; x84_1, x84_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp - 0x28 ], rbp; spilling x84_1 to mem
mov [ rsp - 0x20 ], r12; spilling x84_0 to mem
mulx r12, rbp, [ rsi + 0x18 ]; x61_1, x61_0<- arg1[3] * arg2[7] (_0*_0)
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mov [ rsp - 0x18 ], r12; spilling x61_1 to mem
mov [ rsp - 0x10 ], rbp; spilling x61_0 to mem
mulx rbp, r12, [ rax + 0x38 ]; x26_1, x26_0<- arg1[5] * arg2[7] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp - 0x8 ], rbp; spilling x26_1 to mem
mov [ rsp + 0x0 ], r12; spilling x26_0 to mem
mulx r12, rbp, [ rsi + 0x38 ]; x17_1, x17_0<- arg2[5] * arg1[7] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x8 ], r12; spilling x17_1 to mem
mov [ rsp + 0x10 ], rbp; spilling x17_0 to mem
mulx rbp, r12, [ rsi + 0x20 ]; x55_1, x55_0<- arg1[4] * arg2[6] (_0*_0)
mov rdx, [ rsi + 0x30 ]; arg1[6] to rdx
mov [ rsp + 0x18 ], rbp; spilling x55_1 to mem
mov [ rsp + 0x20 ], r12; spilling x55_0 to mem
mulx r12, rbp, [ rax + 0x38 ]; x21_1, x21_0<- arg1[6] * arg2[7] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp + 0x28 ], r11; spilling x30_1 to mem
mov [ rsp + 0x30 ], r10; spilling x30_0 to mem
mulx r10, r11, [ rsi + 0x30 ]; x46_1, x46_0<- arg2[2] * arg1[6] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x38 ], r10; spilling x46_1 to mem
mov [ rsp + 0x40 ], r11; spilling x46_0 to mem
mulx r11, r10, [ rsi + 0x38 ]; x13_1, x13_0<- arg2[6] * arg1[7] (_0*_0)
test al, al
adox r10, rbp
adox r12, r11
mov rdx, r10;
adcx rdx, r10
mov rbp, r12;
adcx rbp, r12
test al, al
adox r10, r13
mov r11, r14;
adox r11, r12
adcx r13, rdx
adcx rbp, r14
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mulx r12, r14, [ rsi + 0x30 ]; x43_1, x43_0<- arg1[6] * arg2[5] (_0*_0)
add rcx, r9; could be done better, if r0 has been u8 as well
adcx rbx, r8
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r9, r8, [ rsi + 0x30 ]; x45_1, x45_0<- arg2[3] * arg1[6] (_0*_0)
mov rdx, [ rsi + 0x38 ]; arg1[7] to rdx
mov [ rsp + 0x48 ], rbx; spilling x123_1 to mem
mov [ rsp + 0x50 ], rcx; spilling x123_0 to mem
mulx rcx, rbx, [ rax + 0x38 ]; x9_1, x9_0<- arg2[7] * arg1[7] (_0*_0)
mov rdx, r8;
add rdx, r10; could be done better, if r0 has been u8 as well
adcx r11, r9
mov r10, rdx; preserving value of x190_0 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mov [ rsp + 0x58 ], rcx; spilling x9_1 to mem
mov [ rsp + 0x60 ], rbx; spilling x9_0 to mem
mulx rbx, rcx, [ rsi + 0x30 ]; x44_1, x44_0<- arg2[4] * arg1[6] (_0*_0)
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mov [ rsp + 0x68 ], rbx; spilling x44_1 to mem
mov [ rsp + 0x70 ], rcx; spilling x44_0 to mem
mulx rcx, rbx, [ rsi + 0x28 ]; x47_1, x47_0<- arg1[5] * arg2[6] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp + 0x78 ], r15; spilling x38_1 to mem
mov [ rsp + 0x80 ], rdi; spilling x38_0 to mem
mulx rdi, r15, [ rsi + 0x28 ]; x48_1, x48_0<- arg1[5] * arg2[5] (_0*_0)
add r8, r13; could be done better, if r0 has been u8 as well
adcx rbp, r9
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r9, r13, [ rax + 0x28 ]; x56_1, x56_0<- arg1[4] * arg2[5] (_0*_0)
add r14, rbx; could be done better, if r0 has been u8 as well
adcx rcx, r12
mov rdx, r10;
add rdx, [ rsp + 0x80 ]; could be done better, if r0 has been u8 as well
adcx r11, [ rsp + 0x78 ]
mov r12, r13;
xor r10, r10
adox r12, rdx
adox r11, r9
mov rdx, [ rax + 0x30 ]; arg2[6] to rdx
mulx r10, rbx, [ rsi + 0x18 ]; x62_1, x62_0<- arg1[3] * arg2[6] (_0*_0)
mov rdx, r14;
adcx rdx, [ rsp + 0x30 ]
adcx rcx, [ rsp + 0x28 ]
mov r14, r15;
mov [ rsp + 0x88 ], rcx; spilling x114_1 to mem
xor rcx, rcx
adox r14, [ rsp + 0x60 ]
mov [ rsp + 0x90 ], rdx; spilling x114_0 to mem
mov rdx, rdi;
adox rdx, [ rsp + 0x58 ]
mov [ rsp + 0x98 ], r11; spilling x192_1 to mem
mov r11, r14;
adcx r11, [ rsp + 0x70 ]
adcx rdx, [ rsp + 0x68 ]
mov r14, r11;
mov [ rsp + 0xa0 ], r12; spilling x192_0 to mem
xor r12, r12
adox r14, [ rsp - 0x30 ]
adox rdx, [ rsp - 0x38 ]
mov rcx, rdx; preserving value of x221_1 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mulx r12, r11, [ rax + 0x30 ]; x22_1, x22_0<- arg1[6] * arg2[6] (_0*_0)
mov rdx, r11;
adcx rdx, [ rsp + 0x10 ]
adcx r12, [ rsp + 0x8 ]
mov r11, rdx;
test al, al
adox r11, [ rsp + 0x0 ]
adox r12, [ rsp - 0x8 ]
mov rdx, 0x2 ; moving imm to reg
mov [ rsp + 0xa8 ], r10; spilling x62_1 to mem
mov r10, [ rsp + 0x60 ]; load m64 x9_0 to register64
mov [ rsp + 0xb0 ], rbx; spilling x62_0 to mem
mov rbx, [ rsp + 0x58 ]; load m64 x9_1 to register64
mov [ rsp + 0xb8 ], rcx; spilling x221_1 to mem
mov [ rsp + 0xc0 ], r14; spilling x221_0 to mem
mov [ rsp + 0xc8 ], rbp; spilling x173_1 to mem
mulx rbp, rcx, rbx; __,tmp <- (a_0 in rdx) * b_hi
mulx rbp, r14, r10; hi,lo <- (a_0 in rdx) * b_lo
lea rbp, [rbp+rcx]; hi += tmp
adcx r14, r15
adcx rdi, rbp
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mulx r10, rcx, [ rax + 0x18 ]; x50_1, x50_0<- arg2[3] * arg1[5] (_0*_0)
mov rdx, r14;
add rdx, [ rsp + 0x70 ]; could be done better, if r0 has been u8 as well
adcx rdi, [ rsp + 0x68 ]
mov rbx, rdx;
test al, al
adox rbx, [ rsp - 0x30 ]
adox rdi, [ rsp - 0x38 ]
mov rdx, [ rsi + 0x28 ]; arg1[5] to rdx
mulx rbp, r15, [ rax + 0x8 ]; x79_1, x79_0<- arg2[1] * arg1[5] (_0*_0)
adcx r15, rbx
adcx rdi, rbp
mov rdx, r11;
xor r14, r14
adox rdx, rcx
mov rbx, r10;
adox rbx, r12
mov rbp, r11;
adcx rbp, r11
adcx r12, r12
xor r11, r11
adox rcx, rbp
adox r12, r10
mov r14, r8;
adcx r14, [ rsp + 0x80 ]
mov r10, [ rsp + 0x78 ]; load m64 x38_1 to register64
adcx r10, [ rsp + 0xc8 ]
mov r8, rcx;
xor rbp, rbp
adox r8, [ rsp + 0x40 ]
adox r12, [ rsp + 0x38 ]
adcx r13, r14
adcx r10, r9
mov r11, r15;
add r11, [ rsp + 0x20 ]; could be done better, if r0 has been u8 as well
adcx rdi, [ rsp + 0x18 ]
mov r9, rdx; preserving value of x160_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx rcx, r15, [ rsi + 0x20 ]; x83_1, x83_0<- arg1[4] * arg2[1] (_0*_0)
add r15, r13; could be done better, if r0 has been u8 as well
adcx r10, rcx
mov rdx, [ rsp + 0x20 ]; load m64 x55_0 to register64
add rdx, [ rsp + 0xc0 ]; could be done better, if r0 has been u8 as well
mov r14, [ rsp + 0x18 ]; load m64 x55_1 to register64
adcx r14, [ rsp + 0xb8 ]
mov r13, rdx; preserving value of x222_0 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mulx rbp, rcx, [ rsi + 0x38 ]; x42_1, x42_0<- arg2[1] * arg1[7] (_0*_0)
mov rdx, r13;
mov [ rsp + 0xd0 ], rdi; spilling x206_1 to mem
xor rdi, rdi
adox rdx, [ rsp - 0x10 ]
adox r14, [ rsp - 0x18 ]
mov r13, rdx; preserving value of x223_0 into a new reg
mov rdx, [ rsi + 0x18 ]; saving arg1[3] in rdx.
mov [ rsp + 0xd8 ], r14; spilling x223_1 to mem
mulx r14, rdi, [ rax + 0x10 ]; x87_1, x87_0<- arg1[3] * arg2[2] (_0*_0)
mov rdx, r15;
adcx rdx, [ rsp + 0xb0 ]
adcx r10, [ rsp + 0xa8 ]
test al, al
adox rdi, rdx
adox r10, r14
mov r15, rcx;
adcx r15, r8
adcx r12, rbp
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r14, r8, [ rax + 0x38 ]; x67_1, x67_0<- arg1[2] * arg2[7] (_0*_0)
mov rdx, r9;
mov [ rsp + 0xe0 ], r12; spilling x145_1 to mem
xor r12, r12
adox rdx, [ rsp + 0x40 ]
adox rbx, [ rsp + 0x38 ]
adcx rcx, rdx
adcx rbx, rbp
mov r9, [ rsp + 0xb0 ]; load m64 x62_0 to register64
xor rbp, rbp
adox r9, [ rsp + 0xa0 ]
mov r12, [ rsp + 0xa8 ]; load m64 x62_1 to register64
adox r12, [ rsp + 0x98 ]
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0xe8 ], r15; spilling x145_0 to mem
mulx r15, rbp, [ rsi + 0x10 ]; x92_1, x92_0<- arg1[2] * arg2[3] (_0*_0)
mov rdx, r8;
adcx rdx, r9
adcx r12, r14
add r8, rdi; could be done better, if r0 has been u8 as well
adcx r10, r14
mov rdi, rdx; preserving value of x194_0 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mulx r9, r14, [ rsi + 0x20 ]; x82_1, x82_0<- arg1[4] * arg2[2] (_0*_0)
xor rdx, rdx
adox rbp, r8
adox r10, r15
adcx r14, r11
adcx r9, [ rsp + 0xd0 ]
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r15, r11, [ rsi + 0x8 ]; x98_1, x98_0<- arg1[1] * arg2[4] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0xf0 ], r12; spilling x194_1 to mem
mulx r12, r8, [ rax + 0x8 ]; x101_1, x101_0<- arg1[1] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mov [ rsp + 0xf8 ], rdi; spilling x194_0 to mem
mov [ rsp + 0x100 ], rbx; spilling x162_1 to mem
mulx rbx, rdi, [ rsi + 0x20 ]; x54_1, x54_0<- arg1[4] * arg2[7] (_0*_0)
mov rdx, r14;
add rdx, [ rsp - 0x10 ]; could be done better, if r0 has been u8 as well
adcx r9, [ rsp - 0x18 ]
add r11, rbp; could be done better, if r0 has been u8 as well
adcx r10, r15
mov rbp, rdx; preserving value of x208_0 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mulx r15, r14, [ rsi + 0x20 ]; x81_1, x81_0<- arg1[4] * arg2[3] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x108 ], r10; spilling x181_1 to mem
mov [ rsp + 0x110 ], r11; spilling x181_0 to mem
mulx r11, r10, [ rax + 0x18 ]; x86_1, x86_0<- arg1[3] * arg2[3] (_0*_0)
add r14, [ rsp + 0x50 ]; could be done better, if r0 has been u8 as well
adcx r15, [ rsp + 0x48 ]
xor rdx, rdx
adox rdi, [ rsp + 0x90 ]
adox rbx, [ rsp + 0x88 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x118 ], rcx; spilling x162_0 to mem
mov [ rsp + 0x120 ], rbx; spilling x115_1 to mem
mulx rbx, rcx, [ rax + 0x30 ]; x96_1, x96_0<- arg1[1] * arg2[6] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x128 ], rbx; spilling x96_1 to mem
mov [ rsp + 0x130 ], rcx; spilling x96_0 to mem
mulx rcx, rbx, [ rax + 0x30 ]; x68_1, x68_0<- arg1[2] * arg2[6] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x138 ], rcx; spilling x68_1 to mem
mov [ rsp + 0x140 ], rbx; spilling x68_0 to mem
mulx rbx, rcx, [ rax + 0x20 ]; x85_1, x85_0<- arg1[3] * arg2[4] (_0*_0)
adcx r8, r13
adcx r12, [ rsp + 0xd8 ]
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp + 0x148 ], r12; spilling x224_1 to mem
mulx r12, r13, [ rsi + 0x10 ]; x90_1, x90_0<- arg1[2] * arg2[5] (_0*_0)
add r10, rbp; could be done better, if r0 has been u8 as well
adcx r9, r11
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx r11, rbp, [ rax + 0x28 ]; x63_1, x63_0<- arg1[3] * arg2[5] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp + 0x150 ], r9; spilling x209_1 to mem
mov [ rsp + 0x158 ], r10; spilling x209_0 to mem
mulx r10, r9, [ rsi + 0x10 ]; x94_1, x94_0<- arg1[2] * arg2[1] (_0*_0)
mov rdx, rdi;
mov [ rsp + 0x160 ], r8; spilling x224_0 to mem
xor r8, r8
adox rdx, r14
adox r15, [ rsp + 0x120 ]
adcx rcx, rdx
adcx r15, rbx
add rdi, r9; could be done better, if r0 has been u8 as well
adcx r10, [ rsp + 0x120 ]
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbx, r14, [ rax + 0x20 ]; x57_1, x57_0<- arg1[4] * arg2[4] (_0*_0)
mov rdx, r14;
add rdx, [ rsp + 0x118 ]; could be done better, if r0 has been u8 as well
mov r9, rbx;
adcx r9, [ rsp + 0x100 ]
mov r8, rdx; preserving value of x163_0 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0x168 ], r10; spilling x116_1 to mem
mov [ rsp + 0x170 ], rdi; spilling x116_0 to mem
mulx rdi, r10, [ rsi + 0x38 ]; x75_1, x75_0<- arg2[0] * arg1[7] (_0*_0)
test al, al
adox r13, rcx
adox r15, r12
mov rdx, [ rax + 0x38 ]; arg2[7] to rdx
mulx rcx, r12, [ rsi + 0x0 ]; x105_1, x105_0<- arg1[0] * arg2[7] (_0*_0)
mov rdx, r13;
adcx rdx, [ rsp + 0x130 ]
adcx r15, [ rsp + 0x128 ]
xor r13, r13
adox r10, rdx
adox r15, rdi
mov rdi, rbp;
adcx rdi, r8
adcx r9, r11
xor r8, r8
adox r12, r10
adox r15, rcx
mov r13, rdi;
adcx r13, [ rsp + 0x140 ]
adcx r9, [ rsp + 0x138 ]
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r10, rcx, [ rax + 0x10 ]; x93_1, x93_0<- arg1[2] * arg2[2] (_0*_0)
xor rdx, rdx
adox r14, [ rsp + 0xe8 ]
adox rbx, [ rsp + 0xe0 ]
adcx rbp, r14
adcx rbx, r11
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r11, r8, [ rax + 0x0 ]; x95_1, x95_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r14, rdi, [ rsi + 0x0 ]; x110_1, x110_0<- arg1[0] * arg2[2] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x178 ], r10; spilling x93_1 to mem
mov [ rsp + 0x180 ], rcx; spilling x93_0 to mem
mulx rcx, r10, [ rax + 0x10 ]; x100_1, x100_0<- arg1[1] * arg2[2] (_0*_0)
add r8, [ rsp + 0x160 ]; could be done better, if r0 has been u8 as well
adcx r11, [ rsp + 0x148 ]
mov rdx, r12;
shrd rdx, r15, 0x38; lo
shr r15, 0x38; x136_1>>=0x38
mov r15, rdx; preserving value of x136_0 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mov [ rsp + 0x188 ], rbx; spilling x147_1 to mem
mov [ rsp + 0x190 ], rbp; spilling x147_0 to mem
mulx rbp, rbx, [ rsi + 0x0 ]; x109_1, x109_0<- arg1[0] * arg2[3] (_0*_0)
test al, al
adox rdi, r8
adox r11, r14
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r8, r14, [ rsi + 0x0 ]; x111_1, x111_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, 0x40 ; moving imm to reg
mov [ rsp + 0x198 ], r11; spilling x226_1 to mem
bzhi r11, r15, rdx; x139 <- x136_0 (only least 0x40 bits)
adox r10, [ rsp + 0x170 ]
adox rcx, [ rsp + 0x168 ]
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp + 0x1a0 ], rdi; spilling x226_0 to mem
mulx rdi, r15, [ rax + 0x0 ]; x89_1, x89_0<- arg2[0] * arg1[3] (_0*_0)
xor rdx, rdx
adox r15, r10
adox rcx, rdi
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rdi, r10, [ rax + 0x0 ]; x102_1, x102_0<- arg2[0] * arg1[1] (_0*_0)
adcx r10, [ rsp + 0xf8 ]
adcx rdi, [ rsp + 0xf0 ]
add rbx, r15; could be done better, if r0 has been u8 as well
adcx rcx, rbp
mov rdx, 0xffffffffffffff ; moving imm to reg
and r12, rdx; x138 <- x137&0xffffffffffffff
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r15, rbp, [ rax + 0x0 ]; x112_1, x112_0<- arg1[0] * arg2[0] (_0*_0)
mov rdx, r13;
adox rdx, [ rsp - 0x40 ]
adox r9, [ rsp - 0x48 ]
mov r13, rdx; preserving value of x166_0 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mov [ rsp + 0x1a8 ], r12; spilling x138 to mem
mov [ rsp + 0x1b0 ], r8; spilling x111_1 to mem
mulx r8, r12, [ rsi + 0x10 ]; x91_1, x91_0<- arg1[2] * arg2[4] (_0*_0)
adcx r12, [ rsp + 0x158 ]
adcx r8, [ rsp + 0x150 ]
test al, al
adox rbp, r13
adox r9, r15
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mulx r13, r15, [ rsi + 0x8 ]; x97_1, x97_0<- arg1[1] * arg2[5] (_0*_0)
mov rdx, r11;
adcx rdx, rbp
adc r9, 0x0; add CF to r0's alloc
add r15, r12; could be done better, if r0 has been u8 as well
adcx r8, r13
mov r12, rdx;
shrd r12, r9, 0x38; lo
shr r9, 0x38; x185_1>>=0x38
mov rbp, 0xffffffffffffffff ; moving imm to reg
and r12, rbp; lo limb and'ed
mov r13, rbx;
mov r9, rdx; preserving value of x168_0 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mov [ rsp + 0x1b8 ], r8; spilling x211_1 to mem
mulx r8, rbp, [ rax + 0x20 ]; x108_1, x108_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp + 0x1c0 ], r15; spilling x211_0 to mem
mov [ rsp + 0x1c8 ], r13; spilling x121 to mem
mulx r13, r15, [ rsi + 0x18 ]; x88_1, x88_0<- arg1[3] * arg2[1] (_0*_0)
adox r15, [ rsp + 0x190 ]
adox r13, [ rsp + 0x188 ]
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp + 0x1d0 ], r8; spilling x108_1 to mem
mov [ rsp + 0x1d8 ], rbp; spilling x108_0 to mem
mulx rbp, r8, [ rax + 0x18 ]; x99_1, x99_0<- arg1[1] * arg2[3] (_0*_0)
mov rdx, r15;
adcx rdx, [ rsp + 0x140 ]
adcx r13, [ rsp + 0x138 ]
mov r15, rdx;
mov [ rsp + 0x1e0 ], rbp; spilling x99_1 to mem
xor rbp, rbp
adox r15, [ rsp + 0x180 ]
adox r13, [ rsp + 0x178 ]
adcx r14, r10
adcx rdi, [ rsp + 0x1b0 ]
mov r10, r15;
xor rdx, rdx
adox r10, [ rsp - 0x40 ]
adox r13, [ rsp - 0x48 ]
adcx r12, r14
adc rdi, 0x0; add CF to r0's alloc
test al, al
adox r8, r10
adox r13, [ rsp + 0x1e0 ]
mov rbp, r8;
adcx rbp, [ rsp - 0x20 ]
adcx r13, [ rsp - 0x28 ]
mov r15, rbp;
xor r14, r14
adox r15, [ rsp + 0x1d8 ]
adox r13, [ rsp + 0x1d0 ]
mov rdx, r12;
shrd rdx, rdi, 0x38; lo
shr rdi, 0x38; x215_1>>=0x38
mov r10, 0x40 ; moving imm to reg
bzhi r8, rdx, r10; x218 <- x215_0 (only least 0x40 bits)
adox r8, [ rsp + 0x1a0 ]
mov rbp, [ rsp + 0x198 ];
adox rbp, r14
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r14, rdi, [ rsi + 0x28 ]; x80_1, x80_0<- arg2[0] * arg1[5] (_0*_0)
shrd rbx, rcx, 0x38; lo
shr rcx, 0x38; x120_1>>=0x38
bzhi rdx, rbx, r10; x135 <- x120_0 (only least 0x40 bits)
adox rdx, r15
mov rcx, 0x0 ; moving imm to reg
adox r13, rcx
mov r15, rdx; preserving value of x155_0 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.
mulx rcx, rbx, [ rsi + 0x0 ]; x107_1, x107_0<- arg1[0] * arg2[5] (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp + 0x1e8 ], rcx; spilling x107_1 to mem
mulx rcx, r10, [ rax + 0x30 ]; x106_1, x106_0<- arg1[0] * arg2[6] (_0*_0)
mov rdx, r8;
mov [ rsp + 0x1f0 ], rcx; spilling x106_1 to mem
xor rcx, rcx
adox r11, r15
adox r13, rcx
mov r15, r11;
shrd r15, r13, 0x38; lo
shr r13, 0x38; x157_1>>=0x38
mov rcx, 0xffffffffffffffff ; moving imm to reg
and r15, rcx; lo limb and'ed
shrd r8, rbp, 0x38; lo
shr rbp, 0x38; x233_1>>=0x38
test al, al
adox rdi, [ rsp + 0x110 ]
adox r14, [ rsp + 0x108 ]
mov r13, 0x38 ; moving imm to reg
bzhi rbp, rdx, r13; x236 <- x235 (only least 0x38 bits)
mov rdx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rdx + 0x10 ], rbp; out1[2] = x236
mov rbp, rdx; preserving value of out1 into a new reg
mov rdx, [ rsi + 0x30 ]; saving arg1[6] in rdx.
mulx r13, rcx, [ rax + 0x0 ]; x77_1, x77_0<- arg2[0] * arg1[6] (_0*_0)
mov rdx, 0x38 ; moving imm to reg
bzhi rbp, [ rsp + 0x1c8 ], rdx; x122 <- x121 (only least 0x38 bits)
adox rcx, [ rsp + 0x1c0 ]
adox r13, [ rsp + 0x1b8 ]
xor rdx, rdx
adox rbx, rdi
adox r14, [ rsp + 0x1e8 ]
adcx r15, rbx
adc r14, 0x0; add CF to r0's alloc
lea rbp, [ rbp + r8 ]
mov rdi, r15;
shrd rdi, r14, 0x38; lo
shr r14, 0x38; x198_1>>=0x38
mov r8, 0x38 ; moving imm to reg
bzhi rbx, rbp, r8; x241 <- x237 (only least 0x38 bits)
mov r14, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r14 + 0x18 ], rbx; out1[3] = x241
bzhi rbx, r11, r8; x159 <- x158 (only least 0x38 bits)
adox r10, rcx
adox r13, [ rsp + 0x1f0 ]
mov r11, 0xffffffffffffffff ; moving imm to reg
and rdi, r11; lo limb and'ed
adox rdi, r10
adox r13, rdx
mov rcx, rdi;
shrd rcx, r13, 0x38; lo
shr r13, 0x38; x228_1>>=0x38
bzhi r10, rdi, r8; x231 <- x230 (only least 0x38 bits)
add rcx, [ rsp + 0x1a8 ]
mov [ r14 + 0x30 ], r10; out1[6] = x231
bzhi r13, rcx, r8; x239 <- x232 (only least 0x38 bits)
bzhi rdi, r9, r8; x187 <- x186 (only least 0x38 bits)
shr rcx, 0x38; x238 <- x232>> 0x38
mov r9, rcx;
lea r9, [ r9 + rbx ]
shr rbp, 0x38; x240 <- x237>> 0x38
lea r9, [ r9 + rbp ]
bzhi rbx, r9, r8; x246 <- x244 (only least 0x38 bits)
shr r9, 0x38; x245 <- x244>> 0x38
bzhi r10, r12, r8; x217 <- x216 (only least 0x38 bits)
bzhi rbp, r15, r8; x200 <- x199 (only least 0x38 bits)
lea rcx, [ rcx + rdi ]
lea r9, [ r9 + rbp ]
mov rdi, rcx;
shr rdi, 0x38; x248 <- x243>> 0x38
lea rdi, [ rdi + r10 ]
mov [ r14 + 0x8 ], rdi; out1[1] = x250
bzhi r15, rcx, r8; x249 <- x243 (only least 0x38 bits)
mov [ r14 + 0x0 ], r15; out1[0] = x249
mov [ r14 + 0x20 ], rbx; out1[4] = x246
mov [ r14 + 0x38 ], r13; out1[7] = x239
mov [ r14 + 0x28 ], r9; out1[5] = x247
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 632
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.4860
; seed 0521689987605358 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 272564 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=76, initial num_batches=31): 7303 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.026793707166023393
; number reverted permutation / tried permutation: 2844 / 4119 =69.046%
; number reverted decision / tried decision: 2190 / 3880 =56.443%