SECTION .text
	GLOBAL bls12_mul_CryptOpt
bls12_mul_CryptOpt:
sub rsp, 2896
mov rax, [ r8 + 0x8 ]; load m64 x710 to register64
imul rax, [ rdx + 0x20 ]; lox710 = arg4[1]*arg2[4]
mov r10, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r11, [ r8 + 0x18 ]; x51_1, x51_0<- arg4[3] * arg2[0] (_0*_0)
mov rdx, [ r10 + 0x20 ]; arg2[4] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, r11, [ r8 + 0x28 ]; x699_1, x699_0<- arg4[5] * arg2[4] (_0*_0)
mov rdx, [ r8 + 0x8 ]; load m64 x884 to register64
imul rdx, [ r10 + 0x28 ]; lox884 = arg4[1]*arg2[5]
mov r11, [ r8 + 0x8 ]; load m64 x57 to register64
imul r11, [ r10 + 0x0 ]; lox57 = arg4[1]*arg2[0]
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov r12, [ r8 + 0x0 ]; load m64 x61 to register64
imul r12, [ r10 + 0x0 ]; lox61 = arg4[0]*arg2[0]
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov r13, rdx; preserving value of x884 into a new reg
mov rdx, [ r10 + 0x20 ]; saving arg2[4] in rdx.
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, [ r8 + 0x10 ]; x708_1, x708_0<- arg4[2] * arg2[4] (_0*_0)
mov rdx, [ r10 + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x50 ], r9; spilling arg5 to mem
mulx r9, r14, [ r8 + 0x8 ]; x537_1, x537_0<- arg4[1] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x0 ]; arg4[0] to rdx
mov [ rsp - 0x48 ], rcx; spilling arg3 to mem
mulx rcx, r14, [ r10 + 0x8 ]; x193_1, x193_0<- arg4[0] * arg2[1] (_0*_0)
mov rdx, [ r10 + 0x28 ]; arg2[5] to rdx
mov [ rsp - 0x40 ], rsi; spilling arg1 to mem
mulx rsi, r14, [ r8 + 0x20 ]; x876_1, x876_0<- arg4[4] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x20 ]; load m64 x701 to register64
imul rdx, [ r10 + 0x20 ]; lox701 = arg4[4]*arg2[4]
mov r14, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp - 0x38 ], rdi; spilling out1 to mem
mov rdi, r12;
imul rdi, r14; lox108 = x61*0x60fec0aec070003
mov r14, rdx; preserving value of x701 into a new reg
mov rdx, [ r10 + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp - 0x30 ], rbp; spilling x699_1 to mem
mov [ rsp - 0x28 ], rsi; spilling x876_1 to mem
mulx rsi, rbp, [ r8 + 0x10 ]; x55_1, x55_0<- arg4[2] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x533 to register64
imul rdx, [ r10 + 0x18 ]; lox533 = arg4[2]*arg2[3]
mov rbp, rdx; preserving value of x533 into a new reg
mov rdx, [ r8 + 0x10 ]; saving arg4[2] in rdx.
mov [ rsp - 0x20 ], r14; spilling x701 to mem
mov [ rsp - 0x18 ], r15; spilling x708_1 to mem
mulx r15, r14, [ r10 + 0x28 ]; x882_1, x882_0<- arg4[2] * arg2[5] (_0*_0)
mov rdx, [ r10 + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x10 ], rbp; spilling x533 to mem
mulx rbp, r14, [ r8 + 0x0 ]; x366_1, x366_0<- arg4[0] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x8 ]; arg4[1] to rdx
mov [ rsp - 0x8 ], rsi; spilling x55_1 to mem
mulx rsi, r14, [ r10 + 0x28 ]; x885_1, x885_0<- arg4[1] * arg2[5] (_0*_0)
mov rdx, [ r10 + 0x28 ]; arg2[5] to rdx
mov [ rsp + 0x0 ], rbp; spilling x366_1 to mem
mulx rbp, r14, [ r8 + 0x18 ]; x879_1, x879_0<- arg4[3] * arg2[5] (_0*_0)
mov rdx, [ r10 + 0x8 ]; arg2[1] to rdx
mov [ rsp + 0x8 ], rbp; spilling x879_1 to mem
mulx rbp, r14, [ r8 + 0x20 ]; x181_1, x181_0<- arg4[4] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x10 ]; arg4[2] to rdx
mov [ rsp + 0x10 ], rbp; spilling x181_1 to mem
mulx rbp, r14, [ r10 + 0x8 ]; x187_1, x187_0<- arg4[2] * arg2[1] (_0*_0)
mov rdx, [ r10 + 0x8 ]; arg2[1] to rdx
mov [ rsp + 0x18 ], rbp; spilling x187_1 to mem
mulx rbp, r14, [ r8 + 0x18 ]; x184_1, x184_0<- arg4[3] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x28 ]; load m64 x697 to register64
imul rdx, [ r10 + 0x20 ]; lox697 = arg4[5]*arg2[4]
mov r14, rdx; preserving value of x697 into a new reg
mov rdx, [ r10 + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0x20 ], rbp; spilling x184_1 to mem
mov [ rsp + 0x28 ], rsi; spilling x886 to mem
mulx rsi, rbp, [ r8 + 0x8 ]; x59_1, x59_0<- arg4[1] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x356 to register64
imul rdx, [ r10 + 0x10 ]; lox356 = arg4[3]*arg2[2]
mov rbp, -0x760c000300030003 ; moving imm to reg
mov [ rsp + 0x30 ], r14; spilling x697 to mem
mov r14, r12;
imul r14, rbp; lox94 = x61*-0x760c000300030003
mov rbp, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x38 ], r15; spilling x883 to mem
mov r15, r12;
imul r15, rbp; lox102 = x61*0x2a880aa4ed33c7c3
mov rbp, 0x1a0111ea397fe69a ; moving imm to reg
xchg rdx, rbp; 0x1a0111ea397fe69a, swapping with x356, which is currently in rdx
mov [ rsp + 0x40 ], r15; spilling x102 to mem
mov [ rsp + 0x48 ], rbp; spilling x356 to mem
mulx rbp, r15, r14; x97_1, x97_0<- x94 * 0x1a0111ea397fe69a (_0*_0)
mov r15, 0x64774b84f38512bf ; moving imm to reg
mov rdx, r14; x94 to rdx
mov [ rsp + 0x50 ], rsi; spilling x59_1 to mem
mulx rsi, r14, r15; x103_1, x103_0<- x94 * 0x64774b84f38512bf (_0*_0)
mov r14, 0x299338752f97f97b ; moving imm to reg
mov r15, r12;
imul r15, r14; lox99 = x61*0x299338752f97f97b
mov r14, rdx; preserving value of x94 into a new reg
mov rdx, [ r10 + 0x18 ]; saving arg2[3] in rdx.
mov [ rsp + 0x58 ], rbx; spilling x52 to mem
mov [ rsp + 0x60 ], r15; spilling x99 to mem
mulx r15, rbx, [ r8 + 0x0 ]; x540_1, x540_0<- arg4[0] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x20 ]; arg4[4] to rdx
mov [ rsp + 0x68 ], rsi; spilling x104 to mem
mulx rsi, rbx, [ r10 + 0x10 ]; x354_1, x354_0<- arg4[4] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x28 ]; arg4[5] to rdx
mov [ rsp + 0x70 ], rbp; spilling x97_1 to mem
mulx rbp, rbx, [ r10 + 0x10 ]; x351_1, x351_0<- arg4[5] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x878 to register64
imul rdx, [ r10 + 0x28 ]; lox878 = arg4[3]*arg2[5]
mov rbx, rdx; preserving value of x878 into a new reg
mov rdx, [ r10 + 0x18 ]; saving arg2[3] in rdx.
mov [ rsp + 0x78 ], rbp; spilling x351_1 to mem
mov [ rsp + 0x80 ], rcx; spilling x194 to mem
mulx rcx, rbp, [ r8 + 0x18 ]; x531_1, x531_0<- arg4[3] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x20 ]; arg4[4] to rdx
mov [ rsp + 0x88 ], rbx; spilling x878 to mem
mulx rbx, rbp, [ r10 + 0x18 ]; x528_1, x528_0<- arg4[4] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x0 ]; arg4[0] to rdx
mov [ rsp + 0x90 ], rbx; spilling x529 to mem
mulx rbx, rbp, [ r10 + 0x28 ]; x888_1, x888_0<- arg4[0] * arg2[5] (_0*_0)
mov rdx, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x98 ], rsi; spilling x355 to mem
mulx rsi, rbp, r14; x100_1, x100_0<- x94 * 0x4b1ba7b6434bacd7 (_0*_0)
mov rbp, [ r8 + 0x8 ]; load m64 x536 to register64
imul rbp, [ r10 + 0x18 ]; lox536 = arg4[1]*arg2[3]
lea r13, [ r13 + rbx ]
mov rdx, [ r10 + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0xa0 ], rsi; spilling x101 to mem
mov [ rsp + 0xa8 ], r13; spilling x890 to mem
mulx r13, rsi, [ r8 + 0x28 ]; x525_1, x525_0<- arg4[5] * arg2[3] (_0*_0)
lea rbp, [ rbp + r15 ]
mov rdx, [ r8 + 0x28 ]; arg4[5] to rdx
mov [ rsp + 0xb0 ], r13; spilling x525_1 to mem
mulx r13, rsi, [ r10 + 0x8 ]; x178_1, x178_0<- arg4[5] * arg2[1] (_0*_0)
mov rdx, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0xb8 ], r13; spilling x178_1 to mem
mulx r13, rsi, r14; x111_1, x111_0<- x94 * 0xb9feffffffffaaab (_0*_0)
mov rdx, [ r10 + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0xc0 ], rcx; spilling x532 to mem
mulx rcx, rsi, [ r8 + 0x0 ]; x63_1, x63_0<- arg4[0] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x0 ]; arg4[0] to rdx
mov [ rsp + 0xc8 ], rbp; spilling x542 to mem
mulx rbp, rsi, [ r10 + 0x20 ]; x714_1, x714_0<- arg4[0] * arg2[4] (_0*_0)
lea rax, [ rax + rbp ]
lea r11, [ r11 + rcx ]
mov rdx, [ r8 + 0x8 ]; load m64 x189 to register64
imul rdx, [ r10 + 0x8 ]; lox189 = arg4[1]*arg2[1]
mov rsi, rdx; preserving value of x189 into a new reg
mov rdx, [ r10 + 0x10 ]; saving arg2[2] in rdx.
mov [ rsp + 0xd0 ], r11; spilling x65 to mem
mov [ rsp + 0xd8 ], rax; spilling x716 to mem
mulx rax, r11, [ r8 + 0x10 ]; x360_1, x360_0<- arg4[2] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x28 ]; load m64 x871 to register64
imul rdx, [ r10 + 0x28 ]; lox871 = arg4[5]*arg2[5]
lea rdi, [ rdi + r13 ]
mov r11, rdx; preserving value of x871 into a new reg
mov rdx, [ r8 + 0x8 ]; saving arg4[1] in rdx.
mov [ rsp + 0xe0 ], rax; spilling x361 to mem
mov [ rsp + 0xe8 ], r9; spilling x538 to mem
mulx r9, rax, [ r10 + 0x8 ]; x190_1, x190_0<- arg4[1] * arg2[1] (_0*_0)
cmp rdi, r13
mov rdx, [ r10 + 0x20 ]; arg2[4] to rdx
mulx rax, r13, [ r8 + 0x8 ]; x711_1, x711_0<- arg4[1] * arg2[4] (_0*_0)
mov rdx, [ rsp + 0x80 ]; load m64 x194 to register64
lea rsi, [ rsi + rdx ]; r8/64 + m8
setc r13b;
cmp rsi, rdx
setc dl;
cmp [ rsp + 0xa8 ], rbx
mov rbx, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0xf0 ], r11; spilling x871 to mem
setc r11b;
mov byte [ rsp + 0xf8 ], dl; spilling byte x196 to mem
mov rdx, r12;
imul rdx, rbx; lox105 = x61*0x4cc7c19e39811d94
mov rbx, rdx; preserving value of x105 into a new reg
mov rdx, [ r10 + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0x100 ], r9; spilling x190_1 to mem
mov byte [ rsp + 0x108 ], r13b; spilling byte x114 to mem
mulx r13, r9, [ r8 + 0x20 ]; x47_1, x47_0<- arg4[4] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x707 to register64
imul rdx, [ r10 + 0x20 ]; lox707 = arg4[2]*arg2[4]
mov r9, [ rsp + 0x0 ];
mov [ rsp + 0x110 ], r13; spilling x48 to mem
mov r13, [ rsp + 0x70 ];
mov [ rsp + 0x118 ], r13; spilling x98 to mem
movzx r13, r11b;
add r13, [ rsp + 0x28 ]
mov r11, [ r8 + 0x8 ]; load m64 x362 to register64
imul r11, [ r10 + 0x10 ]; lox362 = arg4[1]*arg2[2]
mov [ rsp + 0x120 ], r13; spilling x893 to mem
mov r13, 0x1eabfffeb153ffff ; moving imm to reg
xchg rdx, r14; x94, swapping with x707, which is currently in rdx
mov [ rsp + 0x128 ], r14; spilling x707 to mem
mov [ rsp + 0x130 ], rax; spilling x711_1 to mem
mulx rax, r14, r13; x109_1, x109_0<- x94 * 0x1eabfffeb153ffff (_0*_0)
cmp [ rsp + 0xd8 ], rbp
mov rbp, rbx;
lea rbp, [ rbp + rax ]
lea r11, [ r11 + r9 ]
mov r14, [ rsp + 0x130 ];
mov rax, rdx; preserving value of x94 into a new reg
mov rdx, [ r8 + 0x28 ]; saving arg4[5] in rdx.
mov [ rsp + 0x138 ], r11; spilling x368 to mem
mulx r11, r13, [ r10 + 0x0 ]; x43_1, x43_0<- arg4[5] * arg2[0] (_0*_0)
adc r14, 0x0; add CF to r0's alloc
mov rdx, [ r8 + 0x8 ]; arg4[1] to rdx
mov [ rsp + 0x140 ], r11; spilling x43_1 to mem
mulx r11, r13, [ r10 + 0x10 ]; x363_1, x363_0<- arg4[1] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x186 to register64
imul rdx, [ r10 + 0x8 ]; lox186 = arg4[2]*arg2[1]
mov r13, [ r8 + 0x10 ]; load m64 x359 to register64
imul r13, [ r10 + 0x10 ]; lox359 = arg4[2]*arg2[2]
add r14, [ rsp + 0x128 ]
rcr byte [ rsp + 0x108 ], 1
adc rbp, 0x0
cmp qword r12, 0x0
mov [ rsp + 0x148 ], rdx; spilling x186 to mem
setne dl; setCC x133 to reg (rdx)
mov byte [ rsp + 0x150 ], dl; spilling byte x133 to mem
mov rdx, [ r8 + 0x10 ]; load m64 x53 to register64
imul rdx, [ r10 + 0x0 ]; lox53 = arg4[2]*arg2[0]
mov [ rsp + 0x158 ], r14; spilling x720 to mem
mov r14, [ rsp - 0x8 ];
mov [ rsp + 0x160 ], r14; spilling x56 to mem
mov r14, [ r8 + 0x18 ]; load m64 x704 to register64
imul r14, [ r10 + 0x20 ]; lox704 = arg4[3]*arg2[4]
cmp [ rsp + 0xc8 ], r15
setc r15b;
mov [ rsp + 0x168 ], r14; spilling x704 to mem
mov r14, [ r8 + 0x0 ]; load m64 x192 to register64
imul r14, [ r10 + 0x8 ]; lox192 = arg4[0]*arg2[1]
cmp rbp, rbx
movzx rbx, r15b;
mov [ rsp + 0x170 ], r14; spilling x192 to mem
mov r14, [ rsp + 0xe8 ]; load m64 x538 to register64
lea rbx, [ rbx + r14 ]; r8/64 + m8
mov r14, [ rsp - 0x18 ];
setc r15b;
cmp [ rsp + 0x138 ], r9
mov r9, [ rsp + 0x100 ];
adc r11, 0x0; add CF to r0's alloc
cmp [ rsp + 0xd0 ], rcx
mov rcx, [ rsp + 0x50 ];
adc rcx, 0x0; add CF to r0's alloc
mov byte [ rsp + 0x178 ], r15b; spilling byte x118 to mem
mov r15, r13;
lea r15, [ r15 + r11 ]
mov r11, rdx;
lea r11, [ r11 + rcx ]
add rbx, [ rsp - 0x10 ]
mov rcx, [ rsp + 0x128 ]; load m64 x707 to register64
cmp [ rsp + 0x158 ], rcx
mov rcx, rdx; preserving value of x53 into a new reg
mov rdx, [ r8 + 0x10 ]; saving arg4[2] in rdx.
mov [ rsp + 0x180 ], rbx; spilling x546 to mem
mov [ rsp + 0x188 ], r15; spilling x372 to mem
mulx r15, rbx, [ r10 + 0x18 ]; x534_1, x534_0<- arg4[2] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x18 ]; arg4[3] to rdx
mov [ rsp + 0x190 ], r15; spilling x534_1 to mem
mulx r15, rbx, [ r10 + 0x20 ]; x705_1, x705_0<- arg4[3] * arg2[4] (_0*_0)
mov rdx, r14;
adc rdx, 0x0; add CF to r0's alloc
cmp r11, rcx
movzx rcx, byte [ rsp + 0xf8 ]; load byte memx196 to register64
lea r9, [ r9 + rcx ]; r64+m8
mov rcx, [ rsp + 0x148 ]; load m64 x186 to register64
lea r9, [ r9 + rcx ]; r8/64 + m8
mov rbx, rdx;
mov [ rsp + 0x198 ], r15; spilling x705_1 to mem
mov r15, [ rsp + 0x168 ]; load m64 x704 to register64
lea rbx, [ rbx + r15 ]; r8/64 + m8
mov [ rsp + 0x1a0 ], rbx; spilling x726 to mem
setc bl;
cmp r9, rcx
setc cl;
cmp rdx, r14
setc r14b;
cmp [ rsp + 0x1a0 ], r15
mov r15, 0x6730d2a0f6b0f624 ; moving imm to reg
mov rdx, rax; x94 to rdx
mov byte [ rsp + 0x1a8 ], cl; spilling byte x200 to mem
mulx rcx, rax, r15; x106_1, x106_0<- x94 * 0x6730d2a0f6b0f624 (_0*_0)
mov rdx, [ rsp + 0xd0 ];
movzx rax, byte [ rsp + 0x150 ]; load byte memx133 to register64
lea rdx, [ rdx + rax ]; r64+m8
mov rax, rdx;
lea rax, [ rax + rdi ]
mov r15, rax;
mov [ rsp + 0x1b0 ], rcx; spilling x106_1 to mem
mov rcx, [ rsp + 0x170 ]; load m64 x192 to register64
lea r15, [ r15 + rcx ]; r8/64 + m8
mov rcx, 0x299338752f97f97b ; moving imm to reg
mov byte [ rsp + 0x1b8 ], r14b; spilling byte x724 to mem
setc r14b;
mov byte [ rsp + 0x1c0 ], bl; spilling byte x70 to mem
mov rbx, r15;
imul rbx, rcx; lox272 = x224*0x299338752f97f97b
cmp rax, rdi
mov rdi, -0x760c000300030003 ; moving imm to reg
setc cl;
mov [ rsp + 0x1c8 ], rbx; spilling x272 to mem
mov rbx, r15;
imul rbx, rdi; lox267 = x224*-0x760c000300030003
mov rdi, [ r8 + 0x10 ]; load m64 x881 to register64
imul rdi, [ r10 + 0x28 ]; lox881 = arg4[2]*arg2[5]
cmp qword r15, 0x0
mov byte [ rsp + 0x1d0 ], cl; spilling byte x139 to mem
setne cl; setCC x306 to reg (rcx)
mov byte [ rsp + 0x1d8 ], cl; spilling byte x306 to mem
mov rcx, 0x60fec0aec070003 ; moving imm to reg
mov byte [ rsp + 0x1e0 ], r14b; spilling byte x727 to mem
mov r14, r15;
imul r14, rcx; lox281 = x224*0x60fec0aec070003
mov rcx, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x1e8 ], r14; spilling x281 to mem
mov r14, r15;
imul r14, rcx; lox275 = x224*0x2a880aa4ed33c7c3
mov rcx, [ r8 + 0x18 ]; load m64 x49 to register64
imul rcx, [ r10 + 0x0 ]; lox49 = arg4[3]*arg2[0]
mov [ rsp + 0x1f0 ], r14; spilling x275 to mem
mov r14, [ rsp + 0x198 ];
mov [ rsp + 0x1f8 ], r14; spilling x706 to mem
mov r14, rdi;
add r14, [ rsp + 0x120 ]
mov [ rsp + 0x200 ], r14; spilling x894 to mem
movzx r14, byte [ rsp + 0x1c0 ];
add r14, [ rsp + 0x160 ]
mov [ rsp + 0x208 ], rbx; spilling x267 to mem
mov rbx, rcx;
lea rbx, [ rbx + r14 ]
cmp [ rsp + 0x188 ], r13
mov r13, 0x4b1ba7b6434bacd7 ; moving imm to reg
xchg rdx, r13; 0x4b1ba7b6434bacd7, swapping with x135, which is currently in rdx
mov [ rsp + 0x210 ], rbx; spilling x75 to mem
mov [ rsp + 0x218 ], r14; spilling x72 to mem
mulx r14, rbx, [ rsp + 0x208 ]; x273_1, x273_0<- x267 * 0x4b1ba7b6434bacd7 (_0*_0)
setc bl;
cmp [ rsp + 0x210 ], rcx
setc cl;
cmp r15, rax
setc al;
mov rdx, [ r8 + 0x18 ]; load m64 x530 to register64
imul rdx, [ r10 + 0x18 ]; lox530 = arg4[3]*arg2[3]
mov byte [ rsp + 0x220 ], cl; spilling byte x76 to mem
mov rcx, [ rsp - 0x10 ]; load m64 x533 to register64
cmp [ rsp + 0x180 ], rcx
mov rcx, [ rsp + 0x190 ];
mov byte [ rsp + 0x228 ], al; spilling byte x225 to mem
mov rax, rcx;
adc rax, 0x0; add CF to r0's alloc
mov [ rsp + 0x230 ], r14; spilling x273_1 to mem
mov r14, [ rsp + 0x18 ];
mov [ rsp + 0x238 ], r14; spilling x188 to mem
mov r14, 0x1eabfffeb153ffff ; moving imm to reg
xchg rdx, r14; 0x1eabfffeb153ffff, swapping with x530, which is currently in rdx
mov byte [ rsp + 0x240 ], bl; spilling byte x373 to mem
mov [ rsp + 0x248 ], rax; spilling x549 to mem
mulx rax, rbx, [ rsp + 0x208 ]; x282_1, x282_0<- x267 * 0x1eabfffeb153ffff (_0*_0)
mov rbx, r14;
add rbx, [ rsp + 0x248 ]
movzx rdx, byte [ rsp + 0x1e0 ];
rcr byte [ rsp + 0x1b8 ], 1
adc rdx, 0x0
add rdx, [ rsp + 0x1f8 ]
mov [ rsp + 0x250 ], rbx; spilling x552 to mem
movzx rbx, byte [ rsp + 0x240 ];
add rbx, [ rsp + 0xe0 ]
mov [ rsp + 0x258 ], rax; spilling x283 to mem
mov rax, rbx;
add rax, [ rsp + 0x48 ]
cmp rax, [ rsp + 0x48 ]
mov [ rsp + 0x260 ], rdx; spilling x730 to mem
movzx rdx, byte [ rsp + 0x1a8 ];
mov [ rsp + 0x268 ], rax; spilling x378 to mem
mov rax, [ rsp + 0x238 ]; load m64 x188 to register64
lea rdx, [ rdx + rax ]; r8/64 + m8
mov [ rsp + 0x270 ], rdx; spilling x202 to mem
mov rdx, [ rsp + 0x230 ];
mov [ rsp + 0x278 ], rdx; spilling x274 to mem
mov rdx, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x280 ], rbx; spilling x375 to mem
mulx rbx, rax, [ rsp + 0x208 ]; x276_1, x276_0<- x267 * 0x64774b84f38512bf (_0*_0)
mov rax, [ rsp - 0x20 ];
mov rdx, [ rsp + 0x260 ]; load m64 x730 to register64
lea rax, [ rax + rdx ]; r8/64 + m8
mov [ rsp + 0x288 ], rax; spilling x733 to mem
setc al;
cmp [ rsp + 0x248 ], rcx
mov rcx, [ rsp + 0x1b0 ];
mov byte [ rsp + 0x290 ], al; spilling byte x379 to mem
mov rax, [ rsp + 0x40 ]; load m64 x102 to register64
lea rcx, [ rcx + rax ]; r8/64 + m8
mov [ rsp + 0x298 ], rbx; spilling x277 to mem
setc bl;
cmp [ rsp + 0x250 ], r14
mov r14, 0xb9feffffffffaaab ; moving imm to reg
mov byte [ rsp + 0x2a0 ], bl; spilling byte x550 to mem
mov rbx, rdx; preserving value of x730 into a new reg
mov rdx, [ rsp + 0x208 ]; saving x267 in rdx.
mov [ rsp + 0x2a8 ], rcx; spilling x120 to mem
mulx rax, rcx, r14; x284_1, x284_0<- x267 * 0xb9feffffffffaaab (_0*_0)
mov rcx, rax;
mov r14, [ rsp + 0x1e8 ]; load m64 x281 to register64
lea rcx, [ rcx + r14 ]; r8/64 + m8
mov r14, [ rsp + 0x238 ]; load m64 x188 to register64
mov [ rsp + 0x2b0 ], rcx; spilling x286 to mem
setc cl;
cmp [ rsp + 0x270 ], r14
mov r14, [ rsp + 0x2a8 ];
mov byte [ rsp + 0x2b8 ], cl; spilling byte x553 to mem
movzx rcx, byte [ rsp + 0x178 ]; load byte memx118 to register64
lea r14, [ r14 + rcx ]; r64+m8
mov rcx, [ rsp + 0x1c8 ];
mov [ rsp + 0x2c0 ], r14; spilling x121 to mem
mov r14, [ rsp + 0x298 ]; load m64 x277 to register64
lea rcx, [ rcx + r14 ]; r8/64 + m8
setc r14b;
cmp r13, [ rsp + 0xd0 ]
movzx r13, byte [ rsp + 0x1d0 ];
adc r13, 0x0; add CF to r0's alloc
lea r13, [ r13 + r11 ]
mov [ rsp + 0x2c8 ], rcx; spilling x297 to mem
mov rcx, [ rsp + 0x2c0 ]; load m64 x121 to register64
cmp rcx, [ rsp + 0x40 ]
mov byte [ rsp + 0x2d0 ], r14b; spilling byte x203 to mem
setc r14b;
cmp r13, r11
mov r11, [ rsp + 0x280 ]; load m64 x375 to register64
mov byte [ rsp + 0x2d8 ], r14b; spilling byte x122 to mem
setc r14b;
cmp r11, [ rsp + 0xe0 ]
movzx r11, byte [ rsp + 0x290 ];
adc r11, 0x0; add CF to r0's alloc
mov [ rsp + 0x2e0 ], r11; spilling x381 to mem
mov r11, [ r8 + 0x18 ]; load m64 x183 to register64
imul r11, [ r10 + 0x8 ]; lox183 = arg4[3]*arg2[1]
cmp [ rsp + 0x2b0 ], rax
lea r13, [ r13 + rbp ]
mov rax, 0x48669f39fb24c32 ; moving imm to reg
mov byte [ rsp + 0x2e8 ], r14b; spilling byte x143 to mem
setc r14b;
mov [ rsp + 0x2f0 ], r13; spilling x145 to mem
mov r13, r15;
imul r13, rax; lox268 = x224*0x48669f39fb24c32
mov rax, r11;
add rax, [ rsp + 0x270 ]
mov [ rsp + 0x2f8 ], r13; spilling x268 to mem
mov r13, rdx; preserving value of x267 into a new reg
mov rdx, [ r8 + 0x20 ]; saving arg4[4] in rdx.
mov byte [ rsp + 0x300 ], r14b; spilling byte x287 to mem
mov [ rsp + 0x308 ], rax; spilling x205 to mem
mulx rax, r14, [ r10 + 0x20 ]; x702_1, x702_0<- arg4[4] * arg2[4] (_0*_0)
cmp [ rsp + 0x308 ], r11
mov rdx, [ rsp - 0x20 ]; load m64 x701 to register64
setc r11b;
cmp [ rsp + 0x288 ], rdx
mov rdx, 0x48669f39fb24c32 ; moving imm to reg
setc r14b;
imul r12, rdx; lox95 = x61*0x48669f39fb24c32
cmp [ rsp + 0x200 ], rdi
mov rdi, [ rsp + 0x38 ];
adc rdi, 0x0; add CF to r0's alloc
mov rdx, rdi;
add rdx, [ rsp + 0x88 ]
cmp rbx, [ rsp + 0x1f8 ]
mov rbx, [ rsp + 0x20 ];
mov [ rsp + 0x310 ], rdx; spilling x900 to mem
mov rdx, [ rsp + 0x2f0 ];
mov [ rsp + 0x318 ], r12; spilling x95 to mem
movzx r12, byte [ rsp + 0x228 ]; load byte memx225 to register64
lea rdx, [ rdx + r12 ]; r64+m8
movzx r12, r14b;
adc r12, 0x0; add CF to r0's alloc
lea r12, [ r12 + rax ]
movzx r14, r11b;
rcr byte [ rsp + 0x2d0 ], 1
adc r14, 0x0
mov r11, r12;
add r11, [ rsp + 0x30 ]
mov [ rsp + 0x320 ], r11; spilling x740 to mem
mov r11, 0x6730d2a0f6b0f624 ; moving imm to reg
xchg rdx, r11; 0x6730d2a0f6b0f624, swapping with x227, which is currently in rdx
mov [ rsp + 0x328 ], r11; spilling x227 to mem
mov [ rsp + 0x330 ], rbx; spilling x185 to mem
mulx rbx, r11, r13; x279_1, x279_0<- x267 * 0x6730d2a0f6b0f624 (_0*_0)
mov r11, [ r8 + 0x0 ]; load m64 x365 to register64
imul r11, [ r10 + 0x10 ]; lox365 = arg4[0]*arg2[2]
mov rdx, [ r8 + 0x20 ]; load m64 x180 to register64
imul rdx, [ r10 + 0x8 ]; lox180 = arg4[4]*arg2[1]
cmp [ rsp + 0x2f0 ], rbp
movzx rbp, byte [ rsp + 0x2e8 ];
adc rbp, 0x0; add CF to r0's alloc
add r14, [ rsp + 0x330 ]
add rbp, [ rsp + 0x210 ]
mov [ rsp + 0x338 ], r11; spilling x365 to mem
mov r11, rdx;
lea r11, [ r11 + r14 ]
mov [ rsp + 0x340 ], r11; spilling x212 to mem
movzx r11, byte [ rsp + 0x2b8 ];
rcr byte [ rsp + 0x2a0 ], 1
adc r11, 0x0
cmp r12, rax
setc al;
cmp rbp, [ rsp + 0x210 ]
setc r12b;
mov byte [ rsp + 0x348 ], al; spilling byte x738 to mem
mov rax, [ r8 + 0x28 ]; load m64 x523 to register64
imul rax, [ r10 + 0x18 ]; lox523 = arg4[5]*arg2[3]
cmp rdi, [ rsp + 0x38 ]
setc dil;
mov byte [ rsp + 0x350 ], r12b; spilling byte x150 to mem
mov r12, [ r8 + 0x20 ]; load m64 x527 to register64
imul r12, [ r10 + 0x18 ]; lox527 = arg4[4]*arg2[3]
mov byte [ rsp + 0x358 ], dil; spilling byte x898 to mem
mov rdi, [ rsp + 0x218 ]; load m64 x72 to register64
cmp rdi, [ rsp + 0x160 ]
mov rdi, [ rsp + 0xc0 ]; load m64 x532 to register64
lea r11, [ r11 + rdi ]; r8/64 + m8
mov [ rsp + 0x360 ], rax; spilling x523 to mem
mov rax, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0x368 ], rbx; spilling x279_1 to mem
setc bl;
imul r15, rax; lox278 = x224*0x4cc7c19e39811d94
mov rax, r12;
lea rax, [ rax + r11 ]
mov [ rsp + 0x370 ], r15; spilling x278 to mem
mov r15, [ rsp + 0x60 ];
add r15, [ rsp + 0x68 ]
mov [ rsp + 0x378 ], rax; spilling x559 to mem
movzx rax, bl;
rcr byte [ rsp + 0x220 ], 1
adc rax, 0x0
mov rbx, [ rsp + 0x368 ];
rcr byte [ rsp + 0x2d8 ], 1
adc r15, 0x0
lea rbp, [ rbp + rcx ]
add rbx, [ rsp + 0x1f0 ]
cmp r11, rdi
mov rdi, rdx; preserving value of x180 into a new reg
mov rdx, [ r8 + 0x18 ]; saving arg4[3] in rdx.
mov [ rsp + 0x380 ], rbp; spilling x152 to mem
mulx rbp, r11, [ r10 + 0x10 ]; x357_1, x357_0<- arg4[3] * arg2[2] (_0*_0)
setc dl;
cmp [ rsp + 0x378 ], r12
mov r12, [ rsp + 0x370 ];
mov r11, [ rsp + 0x258 ]; load m64 x283 to register64
lea r12, [ r12 + r11 ]; r8/64 + m8
movzx r11, dl;
adc r11, 0x0; add CF to r0's alloc
add r11, [ rsp + 0x90 ]
rcr byte [ rsp + 0x300 ], 1
adc r12, 0x0
mov rdx, [ rsp + 0x318 ];
add rdx, [ rsp + 0xa0 ]
cmp r12, [ rsp + 0x370 ]
adc rbx, 0x0; add CF to r0's alloc
mov [ rsp + 0x388 ], rbx; spilling x294 to mem
mov rbx, r11;
add rbx, [ rsp + 0x360 ]
cmp r15, [ rsp + 0x60 ]
mov [ rsp + 0x390 ], rax; spilling x78 to mem
mov rax, rsi;
mov [ rsp + 0x398 ], rbp; spilling x357_1 to mem
mov rbp, [ rsp + 0x328 ]; load m64 x227 to register64
lea rax, [ rax + rbp ]; r8/64 + m8
adc rdx, 0x0; add CF to r0's alloc
mov [ rsp + 0x3a0 ], rdx; spilling x129 to mem
mov rdx, [ rsp + 0x2f8 ];
add rdx, [ rsp + 0x278 ]
mov [ rsp + 0x3a8 ], rdx; spilling x301 to mem
mov rdx, [ rsp + 0x88 ]; load m64 x878 to register64
cmp [ rsp + 0x310 ], rdx
movzx rdx, byte [ rsp + 0x358 ];
adc rdx, 0x0; add CF to r0's alloc
cmp rbx, [ rsp + 0x360 ]
mov [ rsp + 0x3b0 ], rdx; spilling x903 to mem
mov rdx, [ rsp + 0x398 ];
mov [ rsp + 0x3b8 ], rax; spilling x230 to mem
setc al;
cmp rbp, [ rsp + 0x2f0 ]
mov rbp, rdx;
mov byte [ rsp + 0x3c0 ], al; spilling byte x567 to mem
mov rax, [ rsp + 0x2e0 ]; load m64 x381 to register64
lea rbp, [ rbp + rax ]; r8/64 + m8
mov rax, [ rsp + 0x3b8 ];
mov [ rsp + 0x3c8 ], rbp; spilling x382 to mem
movzx rbp, byte [ rsp + 0x1d8 ]; load byte memx306 to register64
lea rax, [ rax + rbp ]; r64+m8
mov rbp, rax;
mov [ rsp + 0x3d0 ], rdx; spilling x358 to mem
mov rdx, [ rsp + 0x2b0 ]; load m64 x286 to register64
lea rbp, [ rbp + rdx ]; r8/64 + m8
mov [ rsp + 0x3d8 ], rbp; spilling x311 to mem
mov rbp, [ rsp + 0x3c8 ]; load m64 x382 to register64
mov [ rsp + 0x3e0 ], rax; spilling x308 to mem
setc al;
cmp rbp, [ rsp + 0x3d0 ]
mov byte [ rsp + 0x3e8 ], al; spilling byte x228 to mem
setc al;
mov rbp, [ r8 + 0x20 ]; load m64 x353 to register64
imul rbp, [ r10 + 0x10 ]; lox353 = arg4[4]*arg2[2]
cmp [ rsp + 0x3d8 ], rdx
mov rdx, [ rsp + 0x10 ];
mov [ rsp + 0x3f0 ], rdx; spilling x182 to mem
mov rdx, [ rsp + 0x8 ];
mov [ rsp + 0x3f8 ], rdx; spilling x880 to mem
mov rdx, rbp;
mov byte [ rsp + 0x400 ], al; spilling byte x383 to mem
mov rax, [ rsp + 0x3c8 ]; load m64 x382 to register64
lea rdx, [ rdx + rax ]; r8/64 + m8
mov rax, [ rsp + 0xb8 ];
mov [ rsp + 0x408 ], rax; spilling x179 to mem
setc al;
cmp rdx, rbp
movzx rbp, byte [ rsp + 0x400 ];
adc rbp, 0x0; add CF to r0's alloc
mov byte [ rsp + 0x410 ], al; spilling byte x312 to mem
mov rax, [ rsp + 0x3d8 ];
add rax, [ rsp + 0x338 ]
add rbp, [ rsp + 0x98 ]
mov [ rsp + 0x418 ], rbp; spilling x389 to mem
mov rbp, -0x760c000300030003 ; moving imm to reg
mov [ rsp + 0x420 ], rdx; spilling x385 to mem
mov rdx, rax;
imul rdx, rbp; lox441 = x397*-0x760c000300030003
mov rbp, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0x428 ], rdx; spilling x441 to mem
mov rdx, rax;
imul rdx, rbp; lox452 = x397*0x4cc7c19e39811d94
mov rbp, [ r8 + 0x28 ]; load m64 x349 to register64
imul rbp, [ r10 + 0x10 ]; lox349 = arg4[5]*arg2[2]
mov [ rsp + 0x430 ], rdx; spilling x452 to mem
mov rdx, [ rsp + 0x3b0 ];
add rdx, [ rsp + 0x3f8 ]
mov [ rsp + 0x438 ], rdx; spilling x904 to mem
mov rdx, [ rsp + 0x418 ]; load m64 x389 to register64
cmp rdx, [ rsp + 0x98 ]
mov [ rsp + 0x440 ], rbp; spilling x349 to mem
setc bpl;
cmp qword rax, 0x0
setne dl; setCC x480 to reg (rdx)
mov byte [ rsp + 0x448 ], dl; spilling byte x480 to mem
mov rdx, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov byte [ rsp + 0x450 ], bpl; spilling byte x390 to mem
mov rbp, rax;
imul rbp, rdx; lox449 = x397*0x2a880aa4ed33c7c3
mov rdx, [ r8 + 0x20 ]; load m64 x875 to register64
imul rdx, [ r10 + 0x28 ]; lox875 = arg4[4]*arg2[5]
cmp r11, [ rsp + 0x90 ]
mov r11, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x458 ], rbp; spilling x449 to mem
mov rbp, rdx; preserving value of x875 into a new reg
mov rdx, [ rsp + 0x428 ]; saving x441 in rdx.
mov [ rsp + 0x460 ], rax; spilling x397 to mem
mov [ rsp + 0x468 ], rbx; spilling x566 to mem
mulx rbx, rax, r11; x458_1, x458_0<- x441 * 0xb9feffffffffaaab (_0*_0)
mov rax, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x470 ], rbx; spilling x458_1 to mem
mulx rbx, r11, rax; x453_1, x453_0<- x441 * 0x6730d2a0f6b0f624 (_0*_0)
setc r11b;
cmp [ rsp + 0x340 ], rdi
mov rdi, [ rsp + 0x78 ];
mov rax, [ rsp + 0x418 ];
mov byte [ rsp + 0x478 ], r11b; spilling byte x564 to mem
mov r11, [ rsp + 0x440 ]; load m64 x349 to register64
lea rax, [ rax + r11 ]; r8/64 + m8
mov [ rsp + 0x480 ], rax; spilling x392 to mem
setc al;
mov [ rsp + 0x488 ], rbp; spilling x875 to mem
mov rbp, [ r8 + 0x28 ]; load m64 x40 to register64
imul rbp, [ r10 + 0x0 ]; lox40 = arg4[5]*arg2[0]
mov [ rsp + 0x490 ], rbp; spilling x40 to mem
mov rbp, 0x1eabfffeb153ffff ; moving imm to reg
mov byte [ rsp + 0x498 ], al; spilling byte x213 to mem
mov [ rsp + 0x4a0 ], rdi; spilling x352 to mem
mulx rdi, rax, rbp; x456_1, x456_0<- x441 * 0x1eabfffeb153ffff (_0*_0)
mov rax, [ r8 + 0x20 ]; load m64 x45 to register64
imul rax, [ r10 + 0x0 ]; lox45 = arg4[4]*arg2[0]
mov rbp, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x4a8 ], rdi; spilling x456_1 to mem
mov [ rsp + 0x4b0 ], rax; spilling x45 to mem
mulx rax, rdi, rbp; x447_1, x447_0<- x441 * 0x4b1ba7b6434bacd7 (_0*_0)
mov rdi, [ rsp + 0x390 ];
add rdi, [ rsp + 0x58 ]
add rbx, [ rsp + 0x458 ]
movzx rbp, byte [ rsp + 0x450 ];
add rbp, [ rsp + 0x4a0 ]
cmp r14, [ rsp + 0x330 ]
movzx r14, byte [ rsp + 0x498 ];
adc r14, 0x0; add CF to r0's alloc
cmp rdi, [ rsp + 0x58 ]
mov [ rsp + 0x4b8 ], rax; spilling x447_1 to mem
mov rax, [ rsp + 0x3f0 ]; load m64 x182 to register64
lea r14, [ r14 + rax ]; r8/64 + m8
mov [ rsp + 0x4c0 ], rbx; spilling x467 to mem
mov rbx, [ rsp + 0x4b0 ]; load m64 x45 to register64
lea rdi, [ rdi + rbx ]; r8/64 + m8
mov [ rsp + 0x4c8 ], rbp; spilling x395 to mem
setc bpl;
cmp rdi, rbx
movzx rbx, bpl;
adc rbx, 0x0; add CF to r0's alloc
cmp r14, rax
mov rax, [ rsp + 0x408 ];
adc rax, 0x0; add CF to r0's alloc
add rbx, [ rsp + 0x110 ]
mov rbp, [ r8 + 0x28 ]; load m64 x176 to register64
imul rbp, [ r10 + 0x8 ]; lox176 = arg4[5]*arg2[1]
cmp [ rsp + 0x3b8 ], rsi
setc sil;
cmp [ rsp + 0x380 ], rcx
lea r14, [ r14 + rbp ]
movzx rcx, byte [ rsp + 0x350 ];
adc rcx, 0x0; add CF to r0's alloc
mov [ rsp + 0x4d0 ], rcx; spilling x155 to mem
mov rcx, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0x4d8 ], rbx; spilling x86 to mem
mov rbx, [ rsp + 0x460 ];
imul rbx, rcx; lox442 = x397*0x48669f39fb24c32
cmp r14, rbp
adc rax, 0x0; add CF to r0's alloc
movzx rbp, sil;
rcr byte [ rsp + 0x3e8 ], 1
adc rbp, 0x0
mov rsi, [ rsp + 0x4d8 ];
add rsi, [ rsp + 0x490 ]
add rbp, [ rsp + 0x380 ]
cmp rsi, [ rsp + 0x490 ]
mov rcx, rbp;
lea rcx, [ rcx + r9 ]
mov [ rsp + 0x4e0 ], rax; spilling x223 to mem
setc al;
cmp rbp, [ rsp + 0x380 ]
mov rbp, [ rsp + 0x3e0 ]; load m64 x308 to register64
mov [ rsp + 0x4e8 ], rbx; spilling x442 to mem
setc bl;
cmp rbp, [ rsp + 0x3b8 ]
movzx rbp, byte [ rsp + 0x410 ];
adc rbp, 0x0; add CF to r0's alloc
lea rbp, [ rbp + rcx ]
mov byte [ rsp + 0x4f0 ], al; spilling byte x90 to mem
mov rax, rdi;
add rax, [ rsp + 0x4d0 ]
cmp rbp, rcx
lea rbp, [ rbp + r12 ]
mov [ rsp + 0x4f8 ], rbp; spilling x318 to mem
mov rbp, [ rsp + 0x488 ];
mov byte [ rsp + 0x500 ], bl; spilling byte x235 to mem
mov rbx, [ rsp + 0x438 ]; load m64 x904 to register64
lea rbp, [ rbp + rbx ]; r8/64 + m8
mov [ rsp + 0x508 ], rbp; spilling x907 to mem
setc bpl;
cmp rcx, r9
mov r9, rax;
lea r9, [ r9 + r15 ]
mov rcx, [ rsp - 0x28 ];
mov byte [ rsp + 0x510 ], bpl; spilling byte x316 to mem
movzx rbp, byte [ rsp + 0x500 ];
adc rbp, 0x0; add CF to r0's alloc
lea rbp, [ rbp + r9 ]
cmp rbx, [ rsp + 0x3f8 ]
mov rbx, [ rsp + 0x488 ]; load m64 x875 to register64
mov [ rsp + 0x518 ], rbp; spilling x241 to mem
setc bpl;
cmp [ rsp + 0x508 ], rbx
movzx rbx, bpl;
adc rbx, 0x0; add CF to r0's alloc
lea rbx, [ rbx + rcx ]
mov rbp, rbx;
add rbp, [ rsp + 0xf0 ]
cmp [ rsp + 0x480 ], r11
setc r11b;
cmp r9, r15
setc r15b;
cmp rax, rdi
movzx rdi, r15b;
adc rdi, 0x0; add CF to r0's alloc
cmp [ rsp + 0x518 ], r9
mov rax, 0x1a0111ea397fe69a ; moving imm to reg
mulx r15, r9, rax; x444_1, x444_0<- x441 * 0x1a0111ea397fe69a (_0*_0)
mov r9, [ rsp + 0x140 ];
mov rax, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp + 0x520 ], rbp; spilling x914 to mem
setc bpl;
mov [ rsp + 0x528 ], r15; spilling x445 to mem
mov r15, [ rsp + 0x460 ];
imul r15, rax; lox455 = x397*0x60fec0aec070003
lea rdi, [ rdi + rsi ]
cmp rdi, rsi
mov rsi, [ rsp + 0x3a0 ]; load m64 x129 to register64
lea rdi, [ rdi + rsi ]; r8/64 + m8
setc al;
cmp rdi, rsi
mov byte [ rsp + 0x530 ], bpl; spilling byte x242 to mem
mov rbp, [ rsp + 0x470 ];
lea r15, [ r15 + rbp ]
mov [ rsp + 0x538 ], r15; spilling x460 to mem
setc r15b;
mov [ rsp + 0x540 ], r9; spilling x44 to mem
mov r9, [ r8 + 0x0 ]; load m64 x539 to register64
imul r9, [ r10 + 0x18 ]; lox539 = arg4[0]*arg2[3]
mov [ rsp + 0x548 ], r9; spilling x539 to mem
mov r9, [ rsp + 0x460 ]; load m64 x397 to register64
cmp r9, [ rsp + 0x3d8 ]
mov byte [ rsp + 0x550 ], r11b; spilling byte x393 to mem
mov r11, [ rsp + 0x4f8 ];
adc r11, 0x0; add CF to r0's alloc
mov byte [ rsp + 0x558 ], al; spilling byte x164 to mem
mov rax, r11;
add rax, [ rsp + 0x138 ]
mov [ rsp + 0x560 ], rax; spilling x403 to mem
mov rax, [ rsp + 0x110 ]; load m64 x48 to register64
cmp [ rsp + 0x4d8 ], rax
movzx rax, r15b;
mov [ rsp + 0x568 ], r11; spilling x400 to mem
movzx r11, byte [ rsp + 0x558 ]; load byte memx164 to register64
lea rax, [ rax + r11 ]; r64+m8
setc r11b;
cmp rbx, rcx
mov rcx, [ rsp + 0x4c8 ];
movzx rbx, byte [ rsp + 0x550 ]; load byte memx393 to register64
lea rcx, [ rcx + rbx ]; r64+m8
movzx rbx, r11b;
mov r15, [ rsp + 0x540 ]; load m64 x44 to register64
lea rbx, [ rbx + r15 ]; r8/64 + m8
mov r15, [ rsp + 0x518 ];
mov r11, [ rsp + 0x308 ]; load m64 x205 to register64
lea r15, [ r15 + r11 ]; r8/64 + m8
mov [ rsp + 0x570 ], rcx; spilling x396 to mem
setc cl;
cmp r15, r11
movzx r11, byte [ rsp + 0x4f0 ]; load byte memx90 to register64
lea rbx, [ rbx + r11 ]; r64+m8
movzx r11, byte [ rsp + 0x530 ];
adc r11, 0x0; add CF to r0's alloc
lea r11, [ r11 + rdi ]
lea rax, [ rax + rbx ]
mov byte [ rsp + 0x578 ], cl; spilling byte x912 to mem
mov rcx, [ rsp + 0x560 ];
rcr byte [ rsp + 0x448 ], 1
adc rcx, 0x0
mov [ rsp + 0x580 ], rax; spilling x170 to mem
mov rax, rcx;
add rax, [ rsp + 0x538 ]
cmp rcx, [ rsp + 0x560 ]
setc cl;
cmp rax, [ rsp + 0x538 ]
mov byte [ rsp + 0x588 ], cl; spilling byte x483 to mem
mov rcx, rax;
mov [ rsp + 0x590 ], r11; spilling x248 to mem
mov r11, [ rsp + 0x548 ]; load m64 x539 to register64
lea rcx, [ rcx + r11 ]; r8/64 + m8
setc r11b;
cmp qword rcx, 0x0
mov [ rsp + 0x598 ], rax; spilling x485 to mem
setne al; setCC x654 to reg (rax)
mov byte [ rsp + 0x5a0 ], al; spilling byte x654 to mem
mov rax, 0x60fec0aec070003 ; moving imm to reg
mov byte [ rsp + 0x5a8 ], r11b; spilling byte x486 to mem
mov r11, rcx;
imul r11, rax; lox629 = x571*0x60fec0aec070003
mov rax, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0x5b0 ], r11; spilling x629 to mem
mov r11, rcx;
imul r11, rax; lox616 = x571*0x48669f39fb24c32
mov rax, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x5b8 ], r11; spilling x616 to mem
mov r11, rcx;
imul r11, rax; lox620 = x571*0x299338752f97f97b
cmp rcx, [ rsp + 0x598 ]
setc al;
cmp [ rsp + 0x4f8 ], r12
movzx r12, byte [ rsp + 0x510 ];
adc r12, 0x0; add CF to r0's alloc
mov [ rsp + 0x5c0 ], r11; spilling x620 to mem
mov r11, [ rsp + 0x590 ];
add r11, [ rsp + 0x340 ]
cmp r11, [ rsp + 0x340 ]
mov byte [ rsp + 0x5c8 ], al; spilling byte x572 to mem
mov rax, -0x760c000300030003 ; moving imm to reg
mov [ rsp + 0x5d0 ], r12; spilling x321 to mem
setc r12b;
mov [ rsp + 0x5d8 ], r11; spilling x251 to mem
mov r11, rcx;
imul r11, rax; lox615 = x571*-0x760c000300030003
mov rax, [ rsp + 0x4a8 ];
mov byte [ rsp + 0x5e0 ], r12b; spilling byte x252 to mem
mov r12, 0x1eabfffeb153ffff ; moving imm to reg
xchg rdx, r12; 0x1eabfffeb153ffff, swapping with x441, which is currently in rdx
mov [ rsp + 0x5e8 ], rax; spilling x457 to mem
mov [ rsp + 0x5f0 ], rcx; spilling x571 to mem
mulx rcx, rax, r11; x630_1, x630_0<- x615 * 0x1eabfffeb153ffff (_0*_0)
mov rax, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov rdx, r11; x615 to rdx
mov [ rsp + 0x5f8 ], rcx; spilling x630_1 to mem
mulx rcx, r11, rax; x621_1, x621_0<- x615 * 0x4b1ba7b6434bacd7 (_0*_0)
mov r11, [ rsp + 0x388 ]; load m64 x294 to register64
cmp r11, [ rsp + 0x1f0 ]
mov rax, 0x1a0111ea397fe69a ; moving imm to reg
mov [ rsp + 0x600 ], rcx; spilling x621_1 to mem
mulx r11, rcx, rax; x618_1, x618_0<- x615 * 0x1a0111ea397fe69a (_0*_0)
mov rcx, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x608 ], r11; spilling x618_1 to mem
mulx r11, rax, rcx; x632_1, x632_0<- x615 * 0xb9feffffffffaaab (_0*_0)
setc al;
cmp rsi, [ rsp + 0x318 ]
mov rsi, 0x1a0111ea397fe69a ; moving imm to reg
xchg rdx, r13; x267, swapping with x615, which is currently in rdx
mov [ rsp + 0x610 ], r11; spilling x632_1 to mem
mulx r11, rcx, rsi; x270_1, x270_0<- x267 * 0x1a0111ea397fe69a (_0*_0)
movzx rdx, byte [ rsp + 0x5a8 ];
movzx rcx, byte [ rsp + 0x588 ]; load byte memx483 to register64
lea rdx, [ rdx + rcx ]; r64+m8
mov rcx, [ rsp + 0x560 ]; load m64 x403 to register64
setc sil;
cmp rcx, [ rsp + 0x138 ]
mov rcx, [ rsp + 0x568 ]; load m64 x400 to register64
mov [ rsp + 0x618 ], rdx; spilling x488 to mem
setc dl;
cmp rcx, [ rsp + 0x4f8 ]
mov rcx, 0x64774b84f38512bf ; moving imm to reg
xchg rdx, r13; x615, swapping with x404, which is currently in rdx
mov byte [ rsp + 0x620 ], al; spilling byte x295 to mem
mov byte [ rsp + 0x628 ], sil; spilling byte x130 to mem
mulx rsi, rax, rcx; x624_1, x624_0<- x615 * 0x64774b84f38512bf (_0*_0)
mov rax, [ rsp + 0x5f8 ];
mov rcx, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x630 ], rsi; spilling x624_1 to mem
mov [ rsp + 0x638 ], rax; spilling x631 to mem
mulx rax, rsi, rcx; x627_1, x627_0<- x615 * 0x6730d2a0f6b0f624 (_0*_0)
mov rdx, r15;
mov rsi, [ rsp + 0x5d0 ]; load m64 x321 to register64
lea rdx, [ rdx + rsi ]; r8/64 + m8
mov rsi, 0x64774b84f38512bf ; moving imm to reg
xchg rdx, r12; x441, swapping with x322, which is currently in rdx
mov [ rsp + 0x640 ], rax; spilling x627_1 to mem
mulx rax, rcx, rsi; x450_1, x450_0<- x441 * 0x64774b84f38512bf (_0*_0)
movzx rdx, r13b;
adc rdx, 0x0; add CF to r0's alloc
mov r13, r12;
add r13, [ rsp + 0x388 ]
mov rcx, 0x299338752f97f97b ; moving imm to reg
imul r9, rcx; lox446 = x397*0x299338752f97f97b
lea rdx, [ rdx + r13 ]
mov rsi, [ rsp + 0x430 ];
add rsi, [ rsp + 0x5e8 ]
cmp [ rsp + 0x538 ], rbp
adc rsi, 0x0; add CF to r0's alloc
cmp rdx, r13
movzx rbp, byte [ rsp + 0x628 ];
mov rcx, [ rsp + 0x118 ]; load m64 x98 to register64
lea rbp, [ rbp + rcx ]; r8/64 + m8
setc cl;
cmp rsi, [ rsp + 0x430 ]
mov [ rsp + 0x648 ], r11; spilling x271 to mem
mov r11, rbp;
mov byte [ rsp + 0x650 ], cl; spilling byte x408 to mem
mov rcx, [ rsp + 0x580 ]; load m64 x170 to register64
lea r11, [ r11 + rcx ]; r8/64 + m8
mov [ rsp + 0x658 ], r9; spilling x446 to mem
mov r9, [ rsp + 0x188 ]; load m64 x372 to register64
lea rdx, [ rdx + r9 ]; r8/64 + m8
mov [ rsp + 0x660 ], rax; spilling x450_1 to mem
mov rax, [ rsp + 0x4c0 ];
adc rax, 0x0; add CF to r0's alloc
mov [ rsp + 0x668 ], rax; spilling x468 to mem
mov rax, [ rsp + 0x600 ];
cmp r11, rbp
setc bpl;
cmp rdx, r9
mov r9, [ rsp + 0x4b8 ];
mov byte [ rsp + 0x670 ], bpl; spilling byte x174 to mem
mov rbp, [ rsp + 0x2c8 ];
mov [ rsp + 0x678 ], rax; spilling x622 to mem
movzx rax, byte [ rsp + 0x620 ]; load byte memx295 to register64
lea rbp, [ rbp + rax ]; r64+m8
setc al;
cmp rbp, [ rsp + 0x1c8 ]
mov byte [ rsp + 0x680 ], al; spilling byte x411 to mem
mov rax, [ rsp + 0x660 ];
mov [ rsp + 0x688 ], r9; spilling x448 to mem
mov r9, [ rsp + 0x658 ]; load m64 x446 to register64
lea rax, [ rax + r9 ]; r8/64 + m8
mov [ rsp + 0x690 ], rax; spilling x471 to mem
mov rax, rdx;
mov r9, [ rsp + 0x618 ]; load m64 x488 to register64
lea rax, [ rax + r9 ]; r8/64 + m8
mov r9, rax;
lea r9, [ r9 + rsi ]
mov [ rsp + 0x698 ], rax; spilling x489 to mem
setc al;
cmp r9, rsi
mov rsi, r9;
mov byte [ rsp + 0x6a0 ], al; spilling byte x299 to mem
movzx rax, byte [ rsp + 0x5c8 ]; load byte memx572 to register64
lea rsi, [ rsi + rax ]; r64+m8
mov rax, [ rsp + 0x3a8 ];
mov [ rsp + 0x6a8 ], rsi; spilling x574 to mem
movzx rsi, byte [ rsp + 0x6a0 ]; load byte memx299 to register64
lea rax, [ rax + rsi ]; r64+m8
mov rsi, [ rsp + 0x4e8 ];
mov [ rsp + 0x6b0 ], rax; spilling x302 to mem
mov rax, [ rsp + 0x688 ]; load m64 x448 to register64
lea rsi, [ rsi + rax ]; r8/64 + m8
mov rax, [ rsp + 0x668 ]; load m64 x468 to register64
mov [ rsp + 0x6b8 ], rsi; spilling x475 to mem
setc sil;
cmp rax, [ rsp + 0x458 ]
mov byte [ rsp + 0x6c0 ], sil; spilling byte x493 to mem
mov rsi, [ rsp + 0x5b8 ];
mov rax, [ rsp + 0x678 ]; load m64 x622 to register64
lea rsi, [ rsi + rax ]; r8/64 + m8
setc al;
cmp r13, [ rsp + 0x388 ]
movzx r13, al;
mov [ rsp + 0x6c8 ], rsi; spilling x649 to mem
mov rsi, [ rsp + 0x690 ]; load m64 x471 to register64
lea r13, [ r13 + rsi ]; r8/64 + m8
setc sil;
cmp r13, [ rsp + 0x658 ]
movzx rax, byte [ rsp + 0x680 ];
mov byte [ rsp + 0x6d0 ], sil; spilling byte x326 to mem
movzx rsi, byte [ rsp + 0x650 ]; load byte memx408 to register64
lea rax, [ rax + rsi ]; r64+m8
setc sil;
cmp r12, r15
movzx r15, byte [ rsp + 0x6d0 ];
adc r15, 0x0; add CF to r0's alloc
add r15, [ rsp + 0x5d8 ]
mov r12, r15;
lea r12, [ r12 + rbp ]
lea rax, [ rax + r12 ]
cmp r15, [ rsp + 0x5d8 ]
mov r15, rax;
mov byte [ rsp + 0x6d8 ], sil; spilling byte x473 to mem
mov rsi, [ rsp + 0x268 ]; load m64 x378 to register64
lea r15, [ r15 + rsi ]; r8/64 + m8
mov [ rsp + 0x6e0 ], r15; spilling x417 to mem
setc r15b;
cmp rax, r12
setc al;
cmp [ rsp + 0x6e0 ], rsi
setc sil;
cmp rcx, rbx
mov rbx, [ rsp + 0x4e0 ];
adc rbx, 0x0; add CF to r0's alloc
cmp [ rsp + 0x590 ], rdi
movzx rdi, byte [ rsp + 0x5e0 ];
adc rdi, 0x0; add CF to r0's alloc
lea rdi, [ rdi + r11 ]
mov rcx, [ rsp + 0x6b8 ];
rcr byte [ rsp + 0x6d8 ], 1
adc rcx, 0x0
cmp rdi, r11
mov r11, [ rsp + 0x610 ];
lea rdi, [ rdi + r14 ]
mov [ rsp + 0x6e8 ], rcx; spilling x476 to mem
movzx rcx, byte [ rsp + 0x670 ]; load byte memx174 to register64
lea rbx, [ rbx + rcx ]; r64+m8
setc cl;
cmp rdi, r14
movzx r14, cl;
lea r14, [ r14 + rbx ]
setc cl;
cmp r12, rbp
movzx rbp, cl;
lea rbp, [ rbp + r14 ]
movzx r12, r15b;
adc r12, 0x0; add CF to r0's alloc
lea r12, [ r12 + rdi ]
mov r15, [ rsp + 0x6a8 ];
add r15, [ rsp + 0xc8 ]
mov rbx, r12;
add rbx, [ rsp + 0x6b0 ]
cmp r12, rdi
mov rdi, r11;
mov rcx, [ rsp + 0x5b0 ]; load m64 x629 to register64
lea rdi, [ rdi + rcx ]; r8/64 + m8
setc cl;
cmp rdi, r11
setc r11b;
mov r14, [ r8 + 0x0 ]; load m64 x713 to register64
imul r14, [ r10 + 0x20 ]; lox713 = arg4[0]*arg2[4]
cmp rbx, [ rsp + 0x6b0 ]
setc r12b;
cmp [ rsp + 0x698 ], rdx
movzx rdx, byte [ rsp + 0x6c0 ];
adc rdx, 0x0; add CF to r0's alloc
add rdx, [ rsp + 0x6e0 ]
mov byte [ rsp + 0x6f0 ], r11b; spilling byte x635 to mem
mov r11, rdx;
add r11, [ rsp + 0x668 ]
cmp r11, [ rsp + 0x668 ]
mov byte [ rsp + 0x6f8 ], cl; spilling byte x337 to mem
setc cl;
cmp rdx, [ rsp + 0x6e0 ]
setc dl;
cmp rbp, [ rsp + 0x4e0 ]
mov byte [ rsp + 0x700 ], r12b; spilling byte x340 to mem
mov r12, r15;
mov [ rsp + 0x708 ], r14; spilling x713 to mem
movzx r14, byte [ rsp + 0x5a0 ]; load byte memx654 to register64
lea r12, [ r12 + r14 ]; r64+m8
movzx r14, sil;
movzx rax, al
lea r14, [ r14 + rax ]
setc al;
cmp r12, r15
mov rsi, [ rsp + 0x6b0 ]; load m64 x302 to register64
mov byte [ rsp + 0x710 ], al; spilling byte x265 to mem
setc al;
cmp rsi, [ rsp + 0x2f8 ]
lea r14, [ r14 + rbx ]
movzx rsi, cl;
movzx rdx, dl
lea rsi, [ rsi + rdx ]
setc cl;
cmp [ rsp + 0x6a8 ], r9
setc r9b;
cmp r14, rbx
lea r12, [ r12 + rdi ]
mov rbx, r12;
mov rdx, [ rsp + 0x708 ]; load m64 x713 to register64
lea rbx, [ rbx + rdx ]; r8/64 + m8
setc dl;
cmp r12, rdi
setc dil;
cmp rbx, r12
setc r12b;
cmp r15, [ rsp + 0xc8 ]
movzx r15, cl;
mov byte [ rsp + 0x718 ], r12b; spilling byte x746 to mem
mov r12, [ rsp + 0x648 ]; load m64 x271 to register64
lea r15, [ r15 + r12 ]; r8/64 + m8
movzx r12, r9b;
adc r12, 0x0; add CF to r0's alloc
lea r12, [ r12 + r11 ]
cmp r12, r11
mov r11, 0x4cc7c19e39811d94 ; moving imm to reg
setc cl;
mov r9, [ rsp + 0x5f0 ];
imul r9, r11; lox626 = x571*0x4cc7c19e39811d94
cmp qword rbx, 0x0
setne r11b; setCC x828 to reg (r11)
mov byte [ rsp + 0x720 ], r11b; spilling byte x828 to mem
mov r11, -0x760c000300030003 ; moving imm to reg
mov byte [ rsp + 0x728 ], cl; spilling byte x582 to mem
mov rcx, rbx;
imul rcx, r11; lox789 = x745*-0x760c000300030003
mov r11, r9;
add r11, [ rsp + 0x638 ]
mov [ rsp + 0x730 ], r11; spilling x637 to mem
mov r11, 0x6730d2a0f6b0f624 ; moving imm to reg
xchg rdx, rcx; x789, swapping with x422, which is currently in rdx
mov byte [ rsp + 0x738 ], al; spilling byte x657 to mem
mov byte [ rsp + 0x740 ], dil; spilling byte x660 to mem
mulx rdi, rax, r11; x801_1, x801_0<- x789 * 0x6730d2a0f6b0f624 (_0*_0)
mov rax, [ rsp - 0x30 ];
mov r11, 0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0x748 ], rax; spilling x700 to mem
mov byte [ rsp + 0x750 ], cl; spilling byte x422 to mem
mulx rcx, rax, r11; x804_1, x804_0<- x789 * 0x1eabfffeb153ffff (_0*_0)
mov rax, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x758 ], rcx; spilling x804_1 to mem
mulx rcx, r11, rax; x798_1, x798_0<- x789 * 0x64774b84f38512bf (_0*_0)
mov r11, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x760 ], rcx; spilling x798_1 to mem
mulx rcx, rax, r11; x795_1, x795_0<- x789 * 0x4b1ba7b6434bacd7 (_0*_0)
mov rax, [ r8 + 0x0 ]; load m64 x887 to register64
imul rax, [ r10 + 0x28 ]; lox887 = arg4[0]*arg2[5]
add r14, [ rsp + 0x420 ]
lea rsi, [ rsi + r14 ]
mov r11, rsi;
lea r11, [ r11 + r13 ]
cmp rsi, r14
movzx rsi, byte [ rsp + 0x700 ];
mov [ rsp + 0x768 ], rcx; spilling x795_1 to mem
movzx rcx, byte [ rsp + 0x6f8 ]; load byte memx337 to register64
lea rsi, [ rsi + rcx ]; r64+m8
lea rsi, [ rsi + rbp ]
mov rcx, rsi;
lea rcx, [ rcx + r15 ]
mov [ rsp + 0x770 ], rax; spilling x887 to mem
setc al;
cmp rsi, rbp
mov rbp, 0x1a0111ea397fe69a ; moving imm to reg
mov byte [ rsp + 0x778 ], al; spilling byte x504 to mem
mulx rax, rsi, rbp; x792_1, x792_0<- x789 * 0x1a0111ea397fe69a (_0*_0)
setc sil;
cmp r14, [ rsp + 0x420 ]
movzx r14, byte [ rsp + 0x750 ];
adc r14, 0x0; add CF to r0's alloc
mov rbp, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x780 ], rax; spilling x792_1 to mem
mov rax, rbx;
imul rax, rbp; lox797 = x745*0x2a880aa4ed33c7c3
lea r14, [ r14 + rcx ]
mov rbp, r14;
add rbp, [ rsp + 0x480 ]
mov [ rsp + 0x788 ], rbp; spilling x431 to mem
mov rbp, rax;
lea rbp, [ rbp + rdi ]
mov rdi, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x790 ], rbp; spilling x815 to mem
mov byte [ rsp + 0x798 ], sil; spilling byte x344 to mem
mulx rsi, rbp, rdi; x806_1, x806_0<- x789 * 0xb9feffffffffaaab (_0*_0)
cmp r11, r13
mov r13, 0x60fec0aec070003 ; moving imm to reg
setc dl;
mov rbp, rbx;
imul rbp, r13; lox803 = x745*0x60fec0aec070003
movzx rdi, dl;
rcr byte [ rsp + 0x778 ], 1
adc rdi, 0x0
lea rbp, [ rbp + rsi ]
add r12, [ rsp + 0x180 ]
cmp rcx, r15
mov r15, [ rsp + 0x570 ];
movzx rdx, byte [ rsp + 0x710 ]; load byte memx265 to register64
lea r15, [ r15 + rdx ]; r64+m8
setc dl;
cmp r12, [ rsp + 0x180 ]
movzx r13, byte [ rsp + 0x740 ];
mov [ rsp + 0x7a0 ], rbp; spilling x808 to mem
movzx rbp, byte [ rsp + 0x738 ]; load byte memx657 to register64
lea r13, [ r13 + rbp ]; r64+m8
movzx rbp, byte [ rsp + 0x728 ];
adc rbp, 0x0; add CF to r0's alloc
lea r13, [ r13 + r12 ]
mov [ rsp + 0x7a8 ], rbp; spilling x587 to mem
mov rbp, [ rsp + 0x730 ];
rcr byte [ rsp + 0x6f0 ], 1
adc rbp, 0x0
mov [ rsp + 0x7b0 ], rbp; spilling x638 to mem
mov rbp, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0x7b8 ], r13; spilling x663 to mem
mov r13, rbx;
imul r13, rbp; lox790 = x745*0x48669f39fb24c32
rcr byte [ rsp + 0x798 ], 1
adc r15, 0x0
movzx rbp, dl;
lea rbp, [ rbp + r15 ]
add rdi, [ rsp + 0x788 ]
cmp rdi, [ rsp + 0x788 ]
setc dl;
cmp r14, rcx
mov rcx, [ rsp + 0x7b8 ];
mov r14, [ rsp + 0x7b0 ]; load m64 x638 to register64
lea rcx, [ rcx + r14 ]; r8/64 + m8
adc rbp, 0x0; add CF to r0's alloc
cmp [ rsp + 0x7b8 ], r12
mov r12, rcx;
movzx r15, byte [ rsp + 0x718 ]; load byte memx746 to register64
lea r12, [ r12 + r15 ]; r64+m8
mov r15, r12;
mov [ rsp + 0x7c0 ], r13; spilling x790 to mem
mov r13, [ rsp + 0xd8 ]; load m64 x716 to register64
lea r15, [ r15 + r13 ]; r8/64 + m8
mov byte [ rsp + 0x7c8 ], dl; spilling byte x511 to mem
mov rdx, [ rsp + 0x758 ];
mov [ rsp + 0x7d0 ], rdx; spilling x805 to mem
setc dl;
cmp rcx, r14
mov [ rsp + 0x7d8 ], rbp; spilling x437 to mem
mov rbp, r11;
mov [ rsp + 0x7e0 ], r15; spilling x751 to mem
mov r15, [ rsp + 0x7a8 ]; load m64 x587 to register64
lea rbp, [ rbp + r15 ]; r8/64 + m8
movzx r15, byte [ rsp + 0x348 ];
mov [ rsp + 0x7e8 ], rbp; spilling x588 to mem
mov rbp, [ rsp + 0x748 ]; load m64 x700 to register64
lea r15, [ r15 + rbp ]; r8/64 + m8
movzx rbp, dl;
adc rbp, 0x0; add CF to r0's alloc
mov rdx, [ rsp + 0x7e8 ];
add rdx, [ rsp + 0x250 ]
mov [ rsp + 0x7f0 ], r15; spilling x743 to mem
mov r15, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0x7f8 ], rdx; spilling x591 to mem
mov rdx, rbx;
imul rdx, r15; lox800 = x745*0x4cc7c19e39811d94
mov r15, [ rsp + 0x480 ]; load m64 x392 to register64
cmp [ rsp + 0x788 ], r15
mov r15, [ rsp + 0x7e0 ];
mov [ rsp + 0x800 ], rbp; spilling x669 to mem
movzx rbp, byte [ rsp + 0x720 ]; load byte memx828 to register64
lea r15, [ r15 + rbp ]; r64+m8
mov rbp, [ rsp + 0x7d8 ];
adc rbp, 0x0; add CF to r0's alloc
cmp [ rsp + 0x7e0 ], r13
setc r13b;
cmp [ rsp + 0x7a0 ], rsi
mov rsi, rdx;
mov [ rsp + 0x808 ], rbp; spilling x438 to mem
mov rbp, [ rsp + 0x7d0 ]; load m64 x805 to register64
lea rsi, [ rsi + rbp ]; r8/64 + m8
mov rbp, r15;
mov byte [ rsp + 0x810 ], r13b; spilling byte x752 to mem
mov r13, [ rsp + 0x7a0 ]; load m64 x808 to register64
lea rbp, [ rbp + r13 ]; r8/64 + m8
mov [ rsp + 0x818 ], rsi; spilling x811 to mem
mov rsi, rbp;
mov [ rsp + 0x820 ], r15; spilling x830 to mem
mov r15, [ rsp + 0x770 ]; load m64 x887 to register64
lea rsi, [ rsi + r15 ]; r8/64 + m8
mov r15, [ rsp + 0x818 ];
adc r15, 0x0; add CF to r0's alloc
mov [ rsp + 0x828 ], r15; spilling x812 to mem
mov r15, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x830 ], rbp; spilling x833 to mem
mov rbp, rsi;
imul rbp, r15; lox968 = x919*0x299338752f97f97b
mov r15, -0x760c000300030003 ; moving imm to reg
mov [ rsp + 0x838 ], rbp; spilling x968 to mem
mov rbp, rsi;
imul rbp, r15; lox963 = x919*-0x760c000300030003
mov r15, [ rsp + 0x820 ]; load m64 x830 to register64
cmp r15, [ rsp + 0x7e0 ]
mov r15, [ rsp + 0x30 ]; load m64 x697 to register64
mov [ rsp + 0x840 ], rbp; spilling x963 to mem
setc bpl;
cmp [ rsp + 0x320 ], r15
mov r15, 0x1eabfffeb153ffff ; moving imm to reg
mov byte [ rsp + 0x848 ], bpl; spilling byte x831 to mem
mov rbp, rdx; preserving value of x800 into a new reg
mov rdx, [ rsp + 0x840 ]; saving x963 in rdx.
mov [ rsp + 0x850 ], rsi; spilling x919 to mem
mulx r13, rsi, r15; x978_1, x978_0<- x963 * 0x1eabfffeb153ffff (_0*_0)
mov rsi, 0x1a0111ea397fe69a ; moving imm to reg
mov [ rsp + 0x858 ], r13; spilling x978_1 to mem
mulx r13, r15, rsi; x966_1, x966_0<- x963 * 0x1a0111ea397fe69a (_0*_0)
mov r15, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x860 ], r13; spilling x966_1 to mem
mulx r13, rsi, r15; x969_1, x969_0<- x963 * 0x4b1ba7b6434bacd7 (_0*_0)
mov rsi, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x868 ], r13; spilling x969_1 to mem
mulx r13, r15, rsi; x980_1, x980_0<- x963 * 0xb9feffffffffaaab (_0*_0)
mov r15, [ rsp + 0x800 ];
mov rsi, [ rsp + 0x7f8 ]; load m64 x591 to register64
lea r15, [ r15 + rsi ]; r8/64 + m8
mov [ rsp + 0x870 ], r15; spilling x670 to mem
mov r15, [ rsp + 0x7f0 ];
adc r15, 0x0; add CF to r0's alloc
mov [ rsp + 0x878 ], r15; spilling x744 to mem
mov r15, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x880 ], r13; spilling x980_1 to mem
mov r13, [ rsp + 0x5f0 ];
imul r13, r15; lox623 = x571*0x2a880aa4ed33c7c3
cmp [ rsp + 0x7e8 ], r11
mov r11, [ rsp + 0x640 ];
setc r15b;
cmp rsi, [ rsp + 0x250 ]
mov [ rsp + 0x888 ], r11; spilling x628 to mem
movzx r11, r15b;
adc r11, 0x0; add CF to r0's alloc
mov r15, r13;
add r15, [ rsp + 0x888 ]
add rdi, [ rsp + 0x6e8 ]
mov [ rsp + 0x890 ], r15; spilling x641 to mem
mov r15, [ rsp + 0x880 ];
cmp [ rsp + 0x870 ], rsi
lea r11, [ r11 + rdi ]
mov rsi, [ rsp + 0x630 ];
mov [ rsp + 0x898 ], r15; spilling x981 to mem
mov r15, [ rsp + 0x860 ];
mov [ rsp + 0x8a0 ], r15; spilling x967 to mem
setc r15b;
cmp r14, r9
mov r9, [ rsp + 0x890 ];
adc r9, 0x0; add CF to r0's alloc
mov r14, r9;
add r14, [ rsp + 0x870 ]
mov [ rsp + 0x8a8 ], r11; spilling x595 to mem
mov r11, 0x48669f39fb24c32 ; moving imm to reg
mov byte [ rsp + 0x8b0 ], r15b; spilling byte x671 to mem
mov r15, [ rsp + 0x850 ];
imul r15, r11; lox964 = x919*0x48669f39fb24c32
cmp r12, rcx
movzx rcx, byte [ rsp + 0x810 ];
adc rcx, 0x0; add CF to r0's alloc
mov r12, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x8b8 ], r15; spilling x964 to mem
mulx r15, r11, r12; x975_1, x975_0<- x963 * 0x6730d2a0f6b0f624 (_0*_0)
add rsi, [ rsp + 0x5c0 ]
cmp r9, r13
adc rsi, 0x0; add CF to r0's alloc
cmp rsi, [ rsp + 0x5c0 ]
setc r13b;
cmp r14, r9
mov r9, 0x64774b84f38512bf ; moving imm to reg
mulx r12, r11, r9; x972_1, x972_0<- x963 * 0x64774b84f38512bf (_0*_0)
lea rcx, [ rcx + r14 ]
mov rdx, rcx;
mov r11, [ rsp + 0x158 ]; load m64 x720 to register64
lea rdx, [ rdx + r11 ]; r8/64 + m8
movzx r9, r13b;
mov [ rsp + 0x8c0 ], r15; spilling x975_1 to mem
mov r15, [ rsp + 0x6c8 ]; load m64 x649 to register64
lea r9, [ r9 + r15 ]; r8/64 + m8
setc r15b;
cmp rdx, r11
movzx r11, r15b;
movzx r13, byte [ rsp + 0x8b0 ]; load byte memx671 to register64
lea r11, [ r11 + r13 ]; r64+m8
mov r13, [ rsp + 0xb0 ];
movzx r15, byte [ rsp + 0x478 ]; load byte memx564 to register64
lea r13, [ r13 + r15 ]; r64+m8
mov r15, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x8c8 ], r13; spilling x569 to mem
setc r13b;
mov [ rsp + 0x8d0 ], r9; spilling x650 to mem
mov r9, [ rsp + 0x850 ];
imul r9, r15; lox971 = x919*0x2a880aa4ed33c7c3
mov r15, [ rsp + 0x4e8 ]; load m64 x442 to register64
cmp [ rsp + 0x6e8 ], r15
mov r15, [ rsp + 0x830 ]; load m64 x833 to register64
mov [ rsp + 0x8d8 ], r9; spilling x971 to mem
setc r9b;
cmp r15, [ rsp + 0x7a0 ]
mov byte [ rsp + 0x8e0 ], r13b; spilling byte x759 to mem
mov r13, [ rsp + 0x838 ]; load m64 x968 to register64
lea r12, [ r12 + r13 ]; r8/64 + m8
mov [ rsp + 0x8e8 ], r12; spilling x993 to mem
movzx r12, r9b;
mov [ rsp + 0x8f0 ], r11; spilling x676 to mem
mov r11, [ rsp + 0x528 ]; load m64 x445 to register64
lea r12, [ r12 + r11 ]; r8/64 + m8
setc r11b;
cmp [ rsp + 0x828 ], rbp
mov rbp, [ rsp + 0x790 ];
adc rbp, 0x0; add CF to r0's alloc
movzx r9, r11b;
rcr byte [ rsp + 0x848 ], 1
adc r9, 0x0
cmp [ rsp + 0x850 ], r15
lea r9, [ r9 + rdx ]
mov r15, r9;
mov r11, [ rsp + 0x828 ]; load m64 x812 to register64
lea r15, [ r15 + r11 ]; r8/64 + m8
mov [ rsp + 0x8f8 ], r12; spilling x479 to mem
mov r12, r15;
adc r12, 0x0; add CF to r0's alloc
cmp rbp, rax
mov rax, r12;
mov [ rsp + 0x900 ], rbp; spilling x816 to mem
mov rbp, [ rsp + 0xa8 ]; load m64 x890 to register64
lea rax, [ rax + rbp ]; r8/64 + m8
mov [ rsp + 0x908 ], rax; spilling x925 to mem
setc al;
cmp r15, r11
setc r11b;
cmp r9, rdx
mov rdx, [ rsp + 0x8a8 ];
mov r9, [ rsp + 0x378 ]; load m64 x559 to register64
lea rdx, [ rdx + r9 ]; r8/64 + m8
mov byte [ rsp + 0x910 ], al; spilling byte x817 to mem
movzx rax, r11b;
adc rax, 0x0; add CF to r0's alloc
cmp [ rsp + 0x908 ], rbp
mov rbp, rdx;
mov r11, [ rsp + 0x8f0 ]; load m64 x676 to register64
lea rbp, [ rbp + r11 ]; r8/64 + m8
setc r11b;
cmp rcx, r14
setc r14b;
cmp rbp, rdx
mov rcx, rdx; preserving value of x598 into a new reg
mov rdx, [ r10 + 0x28 ]; saving arg2[5] in rdx.
mov byte [ rsp + 0x918 ], r11b; spilling byte x926 to mem
mov [ rsp + 0x920 ], rax; spilling x843 to mem
mulx rax, r11, [ r8 + 0x28 ]; x873_1, x873_0<- arg4[5] * arg2[5] (_0*_0)
lea rbp, [ rbp + rsi ]
setc dl;
cmp rbp, rsi
movzx rsi, r14b;
movzx r11, byte [ rsp + 0x8e0 ]; load byte memx759 to register64
lea rsi, [ rsi + r11 ]; r64+m8
setc r11b;
cmp rdi, [ rsp + 0x6e8 ]
lea rsi, [ rsi + rbp ]
mov r14, rsi;
mov [ rsp + 0x928 ], rax; spilling x873_1 to mem
mov rax, [ rsp + 0x1a0 ]; load m64 x726 to register64
lea r14, [ r14 + rax ]; r8/64 + m8
mov byte [ rsp + 0x930 ], dl; spilling byte x678 to mem
movzx rdx, byte [ rsp + 0x7c8 ];
adc rdx, 0x0; add CF to r0's alloc
cmp r14, rax
mov rax, [ rsp + 0x808 ]; load m64 x438 to register64
lea rdx, [ rdx + rax ]; r8/64 + m8
mov byte [ rsp + 0x938 ], r11b; spilling byte x681 to mem
mov r11, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp + 0x940 ], rdx; spilling x517 to mem
setc dl;
mov rax, [ rsp + 0x850 ];
imul rax, r11; lox977 = x919*0x60fec0aec070003
mov r11, [ rsp + 0x940 ]; load m64 x517 to register64
cmp r11, [ rsp + 0x808 ]
mov byte [ rsp + 0x948 ], dl; spilling byte x766 to mem
setc dl;
cmp rcx, r9
setc r9b;
cmp [ rsp + 0x8a8 ], rdi
mov rdi, [ rsp + 0x8f8 ]; load m64 x479 to register64
lea r11, [ r11 + rdi ]; r8/64 + m8
mov rcx, [ rsp + 0x808 ]; load m64 x438 to register64
mov [ rsp + 0x950 ], rax; spilling x977 to mem
setc al;
cmp rcx, [ rsp + 0x570 ]
movzx rcx, r9b;
movzx rax, al
lea rcx, [ rcx + rax ]
mov r9, [ rsp + 0x5b8 ]; load m64 x616 to register64
setc al;
cmp [ rsp + 0x8d0 ], r9
mov r9, [ rsp + 0x8c8 ];
mov [ rsp + 0x958 ], rcx; spilling x601 to mem
movzx rcx, byte [ rsp + 0x3c0 ]; load byte memx567 to register64
lea r9, [ r9 + rcx ]; r64+m8
mov rcx, [ rsp + 0x608 ];
mov [ rsp + 0x960 ], rcx; spilling x619 to mem
setc cl;
cmp r11, rdi
movzx rdi, al;
lea rdi, [ rdi + r9 ]
movzx rax, dl;
lea rax, [ rax + rdi ]
movzx rdx, cl;
mov rdi, [ rsp + 0x960 ]; load m64 x619 to register64
lea rdx, [ rdx + rdi ]; r8/64 + m8
adc rax, 0x0; add CF to r0's alloc
mov rcx, 0x4cc7c19e39811d94 ; moving imm to reg
mov rdi, [ rsp + 0x850 ];
imul rdi, rcx; lox974 = x919*0x4cc7c19e39811d94
mov rcx, r11;
add rcx, [ rsp + 0x958 ]
mov [ rsp + 0x968 ], rdx; spilling x653 to mem
mov rdx, r14;
add rdx, [ rsp + 0x920 ]
cmp qword [ rsp + 0x850 ], 0x0
mov [ rsp + 0x970 ], rdi; spilling x974 to mem
setne dil; setCC x1002 to reg (rdi)
mov [ rsp + 0x978 ], rax; spilling x610 to mem
movzx rax, dil;
add rax, [ rsp + 0x908 ]
cmp rdx, r14
setc r14b;
cmp rcx, r11
mov r11, [ rsp + 0x950 ];
mov rdi, [ rsp + 0x898 ]; load m64 x981 to register64
lea r11, [ r11 + rdi ]; r8/64 + m8
mov byte [ rsp + 0x980 ], r14b; spilling byte x845 to mem
mov r14, [ rsp + 0x978 ];
adc r14, 0x0; add CF to r0's alloc
mov [ rsp + 0x988 ], r14; spilling x611 to mem
mov r14, rax;
lea r14, [ r14 + r11 ]
mov [ rsp + 0x990 ], r14; spilling x1007 to mem
mov r14, 0x299338752f97f97b ; moving imm to reg
imul rbx, r14; lox794 = x745*0x299338752f97f97b
cmp r11, rdi
movzx rdi, byte [ rsp + 0x938 ];
movzx r14, byte [ rsp + 0x930 ]; load byte memx678 to register64
lea rdi, [ rdi + r14 ]; r64+m8
mov r14, [ rsp + 0x468 ]; load m64 x566 to register64
lea rcx, [ rcx + r14 ]; r8/64 + m8
lea rdi, [ rdi + rcx ]
mov [ rsp + 0x998 ], rbx; spilling x794 to mem
mov rbx, rdi;
mov [ rsp + 0x9a0 ], rcx; spilling x605 to mem
mov rcx, [ rsp + 0x8d0 ]; load m64 x650 to register64
lea rbx, [ rbx + rcx ]; r8/64 + m8
mov [ rsp + 0x9a8 ], rbx; spilling x687 to mem
setc bl;
cmp r12, r15
movzx r15, byte [ rsp + 0x918 ];
adc r15, 0x0; add CF to r0's alloc
mov r12, [ rsp + 0x858 ];
cmp rdi, [ rsp + 0x9a0 ]
mov rdi, -0x4601000000005555 ; moving imm to reg
mov [ rsp + 0x9b0 ], r15; spilling x928 to mem
setc r15b;
cmp qword [ rsp + 0x990 ], rdi
mov rdi, [ rsp + 0x970 ]; load m64 x974 to register64
lea r12, [ r12 + rdi ]; r8/64 + m8
mov byte [ rsp + 0x9b8 ], r15b; spilling byte x685 to mem
setc r15b;
cmp rsi, rbp
setc bpl;
cmp [ rsp + 0x9a8 ], rcx
movzx rcx, bl;
lea rcx, [ rcx + r12 ]
movzx rsi, byte [ rsp + 0x9b8 ];
adc rsi, 0x0; add CF to r0's alloc
cmp [ rsp + 0x9a0 ], r14
movzx r14, bpl;
movzx rbx, byte [ rsp + 0x948 ]; load byte memx766 to register64
lea r14, [ r14 + rbx ]; r64+m8
setc bl;
cmp rcx, rdi
movzx rdi, bl;
mov r12, [ rsp + 0x988 ]; load m64 x611 to register64
lea rdi, [ rdi + r12 ]; r8/64 + m8
lea rsi, [ rsi + rdi ]
setc r12b;
cmp rdi, r9
mov r9, [ rsp + 0x878 ];
adc r9, 0x0; add CF to r0's alloc
mov rbp, 0x0 ; moving imm to reg
mov rbx, 0xffffffffffffffff ; moving imm to reg
mov byte [ rsp + 0x9c0 ], r12b; spilling byte x987 to mem
mov r12, rbp;
test r15b, r15b; testing x1047
cmovnz r12, rbx; if !ZF, x1048<- 0xffffffffffffffff (nzVar)
mov r15, [ rsp + 0x760 ];
mov rbp, 0x4601000000005555 ; moving imm to reg
add rbp, [ rsp + 0x990 ]
add rdx, [ rsp + 0x900 ]
cmp rdx, [ rsp + 0x900 ]
movzx rbx, byte [ rsp + 0x980 ];
adc rbx, 0x0; add CF to r0's alloc
add r14, [ rsp + 0x9a8 ]
add r15, [ rsp + 0x998 ]
mov [ rsp + 0x9c8 ], rbp; spilling x1091 to mem
mov rbp, r14;
add rbp, [ rsp + 0x288 ]
rcr byte [ rsp + 0x910 ], 1
adc r15, 0x0
lea rbx, [ rbx + rbp ]
mov [ rsp + 0x9d0 ], r12; spilling x1048 to mem
mov r12, rbx;
lea r12, [ r12 + r15 ]
mov [ rsp + 0x9d8 ], r9; spilling x782 to mem
mov r9, rsi;
add r9, [ rsp + 0x968 ]
cmp r12, r15
mov [ rsp + 0x9e0 ], r9; spilling x694 to mem
setc r9b;
cmp rsi, rdi
mov rdi, [ rsp + 0x868 ];
mov rsi, rdx;
mov byte [ rsp + 0x9e8 ], r9b; spilling byte x855 to mem
mov r9, [ rsp + 0x9b0 ]; load m64 x928 to register64
lea rsi, [ rsi + r9 ]; r8/64 + m8
mov r9, rsi;
mov [ rsp + 0x9f0 ], rdi; spilling x970 to mem
mov rdi, [ rsp + 0x200 ]; load m64 x894 to register64
lea r9, [ r9 + rdi ]; r8/64 + m8
mov [ rsp + 0x9f8 ], r9; spilling x932 to mem
mov r9, [ rsp + 0x9d8 ];
adc r9, 0x0; add CF to r0's alloc
cmp rbp, [ rsp + 0x288 ]
mov [ rsp + 0xa00 ], r9; spilling x783 to mem
setc r9b;
cmp [ rsp + 0x9f8 ], rdi
setc dil;
cmp r14, [ rsp + 0x9a8 ]
mov r14, [ rsp + 0x8b8 ];
mov byte [ rsp + 0xa08 ], dil; spilling byte x933 to mem
mov rdi, [ rsp + 0x9f0 ]; load m64 x970 to register64
lea r14, [ r14 + rdi ]; r8/64 + m8
movzx rdi, r9b;
adc rdi, 0x0; add CF to r0's alloc
mov r9, [ rsp + 0x9e0 ]; load m64 x694 to register64
cmp r9, [ rsp + 0x968 ]
mov [ rsp + 0xa10 ], r14; spilling x997 to mem
setc r14b;
cmp rax, [ rsp + 0x908 ]
setc al;
cmp rbx, rbp
lea rdi, [ rdi + r9 ]
movzx rbp, byte [ rsp + 0x9e8 ];
adc rbp, 0x0; add CF to r0's alloc
cmp [ rsp + 0x990 ], r11
movzx r11, al;
adc r11, 0x0; add CF to r0's alloc
movzx rbx, r14b;
add rbx, [ rsp + 0xa00 ]
mov r14, rdi;
add r14, [ rsp + 0x320 ]
lea rbp, [ rbp + r14 ]
add r11, [ rsp + 0x9f8 ]
mov rax, [ rsp + 0x8c0 ];
cmp rsi, rdx
movzx rdx, byte [ rsp + 0xa08 ];
adc rdx, 0x0; add CF to r0's alloc
lea rdx, [ rdx + r12 ]
mov rsi, [ rsp + 0x768 ];
mov [ rsp + 0xa18 ], rbx; spilling x784 to mem
mov rbx, rdx;
add rbx, [ rsp + 0x310 ]
mov [ rsp + 0xa20 ], rbp; spilling x858 to mem
mov rbp, r11;
lea rbp, [ rbp + rcx ]
mov [ rsp + 0xa28 ], rsi; spilling x796 to mem
mov rsi, -0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0xa30 ], rax; spilling x976 to mem
mov rax, rbp;
lea rax, [ rax + rsi ]
cmp rbx, [ rsp + 0x310 ]
setc sil;
cmp r11, [ rsp + 0x9f8 ]
setc r11b;
cmp rdx, r12
mov r12, [ rsp + 0x928 ];
setc dl;
cmp rbp, rcx
movzx rcx, r11b;
adc rcx, 0x0; add CF to r0's alloc
mov r11, [ rsp + 0x8d8 ];
add r11, [ rsp + 0xa30 ]
lea rcx, [ rcx + rbx ]
mov [ rsp + 0xa38 ], rax; spilling x1049 to mem
mov rax, 0x1eabfffeb153ffff ; moving imm to reg
cmp qword rbp, rax
setc al;
cmp rcx, rbx
movzx rbx, byte [ rsp + 0x9c0 ]; load byte memx987 to register64
lea r11, [ r11 + rbx ]; r64+m8
setc bl;
cmp r11, [ rsp + 0x8d8 ]
mov byte [ rsp + 0xa40 ], al; spilling byte x1050 to mem
mov rax, [ rsp + 0x8e8 ];
adc rax, 0x0; add CF to r0's alloc
lea rcx, [ rcx + r11 ]
mov byte [ rsp + 0xa48 ], bl; spilling byte x1019 to mem
mov rbx, [ rsp + 0x520 ]; load m64 x914 to register64
cmp rbx, [ rsp + 0xf0 ]
mov byte [ rsp + 0xa50 ], dl; spilling byte x937 to mem
setc dl;
cmp rax, r13
mov r13, -0x6730d2a0f6b0f624 ; moving imm to reg
mov byte [ rsp + 0xa58 ], dl; spilling byte x915 to mem
mov rdx, rcx;
lea rdx, [ rdx + r13 ]
setc r13b;
cmp rcx, r11
movzx r11, byte [ rsp + 0x578 ]; load byte memx912 to register64
lea r12, [ r12 + r11 ]; r64+m8
mov r11, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0xa60 ], rdx; spilling x1056 to mem
setc dl;
cmp qword rcx, r11
movzx r11, sil;
mov byte [ rsp + 0xa68 ], dl; spilling byte x1022 to mem
movzx rdx, byte [ rsp + 0xa50 ]; load byte memx937 to register64
lea r11, [ r11 + rdx ]; r64+m8
setc sil;
cmp r15, [ rsp + 0x998 ]
movzx r15, byte [ rsp + 0xa58 ]; load byte memx915 to register64
lea r12, [ r12 + r15 ]; r64+m8
mov rdx, [ rsp + 0x7c0 ];
mov r15, [ rsp + 0xa28 ]; load m64 x796 to register64
lea rdx, [ rdx + r15 ]; r8/64 + m8
adc rdx, 0x0; add CF to r0's alloc
mov r15, rdx;
add r15, [ rsp + 0xa20 ]
cmp r15, rdx
mov byte [ rsp + 0xa70 ], sil; spilling byte x1057 to mem
setc sil;
cmp rdx, [ rsp + 0x7c0 ]
mov rdx, [ rsp + 0x780 ];
mov [ rsp + 0xa78 ], r12; spilling x918 to mem
setc r12b;
cmp rdi, r9
movzx r9, r12b;
lea r9, [ r9 + rdx ]
mov rdi, [ rsp + 0xa18 ];
adc rdi, 0x0; add CF to r0's alloc
cmp [ rsp + 0xa20 ], r14
movzx r12, sil;
adc r12, 0x0; add CF to r0's alloc
cmp r14, [ rsp + 0x320 ]
adc rdi, 0x0; add CF to r0's alloc
lea r12, [ r12 + rdi ]
movzx r14, r13b;
add r14, [ rsp + 0xa10 ]
lea r11, [ r11 + r15 ]
cmp r11, r15
movzx r13, byte [ rsp + 0xa68 ];
movzx r15, byte [ rsp + 0xa48 ]; load byte memx1019 to register64
lea r13, [ r13 + r15 ]; r64+m8
mov r15, [ rsp + 0x508 ]; load m64 x907 to register64
lea r11, [ r11 + r15 ]; r8/64 + m8
lea r13, [ r13 + r11 ]
mov rsi, r13;
lea rsi, [ rsi + rax ]
setc dl;
cmp rsi, rax
setc al;
cmp r13, r11
mov r13, -0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0xa80 ], r14; spilling x998 to mem
mov r14, rsi;
lea r14, [ r14 + r13 ]
movzx r13, al;
adc r13, 0x0; add CF to r0's alloc
cmp r11, r15
mov r15, r12;
lea r15, [ r15 + r9 ]
movzx r11, dl;
adc r11, 0x0; add CF to r0's alloc
mov rdx, 0x64774b84f38512bf ; moving imm to reg
cmp qword rsi, rdx
lea r11, [ r11 + r15 ]
mov rax, 0x0 ; moving imm to reg
mov rdx, 0xffffffffffffffff ; moving imm to reg
mov [ rsp + 0xa88 ], r14; spilling x1063 to mem
mov r14, rax;
cmovc r14, rdx; if CF, x1065<- 0xffffffffffffffff (nzVar)
cmp rdi, [ rsp + 0x878 ]
mov rax, [ rsp + 0xa78 ];
adc rax, 0x0; add CF to r0's alloc
mov rdx, r11;
lea rdx, [ rdx + rbx ]
lea r13, [ r13 + rdx ]
cmp rdx, rbx
mov rbx, r13;
mov [ rsp + 0xa90 ], r14; spilling x1065 to mem
mov r14, [ rsp + 0xa80 ]; load m64 x998 to register64
lea rbx, [ rbx + r14 ]; r8/64 + m8
mov [ rsp + 0xa98 ], rax; spilling x956 to mem
mov rax, 0x4b1ba7b6434bacd7 ; moving imm to reg
setc r14b;
cmp qword rbx, rax
setc al;
cmp r13, rdx
setc dl;
cmp r12, rdi
mov rdi, [ rsp + 0xa98 ];
adc rdi, 0x0; add CF to r0's alloc
cmp r15, r9
mov r9, [ rsp + 0xa38 ];
mov r12, [ rsp + 0x9d0 ]; load m64 x1048 to register64
lea r9, [ r9 + r12 ]; r8/64 + m8
mov r12, -0x4b1ba7b6434bacd7 ; moving imm to reg
mov r13, rbx;
lea r13, [ r13 + r12 ]
adc rdi, 0x0; add CF to r0's alloc
cmp [ rsp + 0xa38 ], r9
mov r12, 0x0 ; moving imm to reg
mov byte [ rsp + 0xaa0 ], al; spilling byte x1071 to mem
mov rax, 0xffffffffffffffff ; moving imm to reg
mov [ rsp + 0xaa8 ], r13; spilling x1070 to mem
mov r13, r12;
cmovc r13, rax; if CF, x1054<- 0xffffffffffffffff (nzVar)
cmp r11, r15
adc rdi, 0x0; add CF to r0's alloc
movzx r15, byte [ rsp + 0xa70 ]; load byte memx1057 to register64
mov r11, r12;
test r15, r15; testing x1057
cmovnz r11, rax; if !ZF, x1058<- 0xffffffffffffffff (nzVar)
movzx r15, r14b;
lea r15, [ r15 + rdi ]
movzx r14, byte [ rsp + 0xa40 ]; load byte memx1050 to register64
mov rdi, r12;
test r14, r14; testing x1050
cmovnz rdi, rax; if !ZF, x1051<- 0xffffffffffffffff (nzVar)
lea r13, [ r13 + rdi ]
add r13, [ rsp + 0xa60 ]
mov r14, [ rsp + 0x8b8 ]; load m64 x964 to register64
cmp [ rsp + 0xa80 ], r14
setc r14b;
cmp [ rsp + 0xa60 ], r13
mov rdi, r12;
cmovc rdi, rax; if CF, x1061<- 0xffffffffffffffff (nzVar)
lea rdi, [ rdi + r11 ]
cmp rbx, [ rsp + 0xa80 ]
movzx r11, r14b;
mov r12, [ rsp + 0x8a0 ]; load m64 x967 to register64
lea r11, [ r11 + r12 ]; r8/64 + m8
movzx r12, dl;
adc r12, 0x0; add CF to r0's alloc
lea r12, [ r12 + r15 ]
cmp r12, r15
lea r12, [ r12 + r11 ]
setc dl;
cmp r12, r11
mov r14, -0x1a0111ea397fe69a ; moving imm to reg
mov r11, r12;
lea r11, [ r11 + r14 ]
setc r14b;
cmp r15, [ rsp + 0xa78 ]
mov r15, [ rsp + 0xa88 ]; load m64 x1063 to register64
lea rdi, [ rdi + r15 ]; r8/64 + m8
movzx rax, dl;
adc rax, 0x0; add CF to r0's alloc
cmp r15, rdi
mov r15, 0x0 ; moving imm to reg
mov rdx, 0xffffffffffffffff ; moving imm to reg
mov byte [ rsp + 0xab0 ], r14b; spilling byte x1043 to mem
mov r14, r15;
cmovc r14, rdx; if CF, x1068<- 0xffffffffffffffff (nzVar)
mov r15, [ rsp + 0xa90 ]; load m64 x1065 to register64
lea r14, [ r14 + r15 ]; r8/64 + m8
mov r15, [ rsp + 0xaa8 ]; load m64 x1070 to register64
lea r14, [ r14 + r15 ]; r8/64 + m8
cmp r15, r14
mov r15, 0x0 ; moving imm to reg
mov [ rsp + 0xab8 ], rax; spilling x1045 to mem
movzx rax, byte [ rsp + 0xaa0 ]; load byte memx1071 to register64
mov [ rsp + 0xac0 ], r11; spilling x1077 to mem
setc r11b;
mov [ rsp + 0xac8 ], r14; spilling x1073 to mem
mov r14, r15;
test rax, rax; testing x1071
cmovnz r14, rdx; if !ZF, x1072<- 0xffffffffffffffff (nzVar)
mov rax, r15;
test r11b, r11b; testing x1074
cmovnz rax, rdx; if !ZF, x1075<- 0xffffffffffffffff (nzVar)
lea rax, [ rax + r14 ]
add rax, [ rsp + 0xac0 ]
mov r11, 0x1a0111ea397fe69a ; moving imm to reg
cmp qword r12, r11
mov r14, r15;
cmovc r14, rdx; if CF, x1079<- 0xffffffffffffffff (nzVar)
cmp [ rsp + 0xac0 ], rax
mov r15, [ rsp + 0xab8 ];
movzx rdx, byte [ rsp + 0xab0 ]; load byte memx1043 to register64
lea r15, [ r15 + rdx ]; r64+m8
mov rdx, 0x0 ; moving imm to reg
mov r11, 0xffffffffffffffff ; moving imm to reg
cmovc rdx, r11; if CF, x1082<- 0xffffffffffffffff (nzVar)
lea rdx, [ rdx + r14 ]
lea rdx, [ rdx + r15 ]
cmp r15, rdx
cmovc r9, rbp; if CF, x1086<- x1014 (nzVar)
mov rbp, [ rsp - 0x38 ]; load m64 out1 to register64
mov [ rbp + 0x8 ], r9; out1[1] = x1086
mov r14, [ rsp + 0x9c8 ];
cmovc r14, [ rsp + 0x990 ]; if CF, x1092<- x1007 (nzVar)
cmovc rdi, rsi; if CF, x1088<- x1028 (nzVar)
mov [ rbp + 0x18 ], rdi; out1[3] = x1088
mov rsi, [ rsp + 0xac8 ];
cmovc rsi, rbx; if CF, x1089<- x1035 (nzVar)
cmovc rax, r12; if CF, x1102<- x1042 (nzVar)
mov [ rbp + 0x20 ], rsi; out1[4] = x1089
mov [ rbp + 0x28 ], rax; out1[5] = x1102
cmovc r13, rcx; if CF, x1087<- x1021 (nzVar)
mov [ rbp + 0x0 ], r14; out1[0] = x1092
mov [ rbp + 0x10 ], r13; out1[2] = x1087
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 2896
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.6057
; seed 2229578463495950 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 35780261 ms on 180000 evaluations.
; Time spent for assembling and measuring (initial batch_size=55, initial num_batches=31): 380130 ms
; number of used evaluations: 180000
; Ratio (time for assembling + measure)/(total runtime for 180000 evals): 0.010624014173624949
; number reverted permutation / tried permutation: 69179 / 90189 =76.704%
; number reverted decision / tried decision: 58355 / 89810 =64.976%