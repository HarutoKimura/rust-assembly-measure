SECTION .text
	GLOBAL bls12_mul_CryptOpt
bls12_mul_CryptOpt:
sub rsp, 3056
; rdi contains out1
; rsi contains arg1
; rdx contains arg2
; rcx contains arg3
; r8 contains arg4
; r9 contains arg5


; fr: rax,r10,r11
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ r8 + 0x28 ]; saving arg4[5] in rdx.

; fr: r10,r11

; fr: r11

mulx r11, r10, [ rax + 0x28 ]; x933_1, x933_0<- arg4[5] * arg2[5] (_0*_0)

mov rdx, [ rax + 0x0 ]; arg2[0] to rdx

; fr: none.
; freeing x933_0 (r10) no dependants anymore

; fr: none.

; stacking up for calSv-rbx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem

mulx rbx, r10, [ r8 + 0x0 ]; x68_1, x68_0<- arg4[0] * arg2[0] (_0*_0)

mov rdx, [ rax + 0x0 ]; arg2[0] to rdx

; fr: none.
; freeing x68_0 (r10) no dependants anymore

; fr: none.

; stacking up for calSv-rbp
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem

mulx rbp, r10, [ r8 + 0x10 ]; x58_1, x58_0<- arg4[2] * arg2[0] (_0*_0)





mov rdx, [ rax + 0x10 ]; arg2[2] to rdx

; fr: none.
; freeing x58_0 (r10) no dependants anymore

; fr: none.

; stacking up for calSv-r12
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem

mulx r12, r10, [ r8 + 0x28 ]; x375_1, x375_0<- arg4[5] * arg2[2] (_0*_0)

mov rdx, [ rax + 0x20 ]; arg2[4] to rdx

; fr: none.
; freeing x375_0 (r10) no dependants anymore

; fr: none.

; stacking up for calSv-r13
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem

mulx r13, r10, [ r8 + 0x18 ]; x755_1, x755_0<- arg4[3] * arg2[4] (_0*_0)

mov rdx, [ r8 + 0x18 ]; arg4[3] to rdx

; fr: none.
; freeing x755_0 (r10) no dependants anymore

; fr: none.

; stacking up for calSv-r14
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem

mulx r14, r10, [ rax + 0x28 ]; x941_1, x941_0<- arg4[3] * arg2[5] (_0*_0)

mov rdx, [ r8 + 0x28 ]; arg4[5] to rdx

; fr: none.
; freeing x941_0 (r10) no dependants anymore

; fr: none.

; stacking up for calSv-r15
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem

mulx r15, r10, [ rax + 0x0 ]; x43_1, x43_0<- arg4[5] * arg2[0] (_0*_0)

mov rdx, [ r8 + 0x10 ]; arg4[2] to rdx

; fr: none.
; freeing x43_0 (r10) no dependants anymore

; fr: none.

; stacking up for arg5
mov [ rsp - 0x50 ], r9; spilling arg5 to mem

mulx r9, r10, [ rax + 0x8 ]; x202_1, x202_0<- arg4[2] * arg2[1] (_0*_0)


; fr: rdx
mov rdx, [ r8 + 0x10 ]; load m64 x56 to register64


imul rdx, [ rax + 0x0 ]; lox56 = arg4[2]*arg2[0]


; fr: none.
; freeing x202_0 (r10) no dependants anymore
mov r10, rdx; preserving value of x56 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.

; fr: none.

; stacking up for arg3
mov [ rsp - 0x48 ], rcx; spilling arg3 to mem

; fr: none.

; stacking up for arg1
mov [ rsp - 0x40 ], rsi; spilling arg1 to mem

mulx rsi, rcx, [ r8 + 0x10 ]; x945_1, x945_0<- arg4[2] * arg2[5] (_0*_0)


; fr: rdx
mov rdx, [ r8 + 0x18 ]; load m64 x754 to register64


imul rdx, [ rax + 0x20 ]; lox754 = arg4[3]*arg2[4]


; fr: none.
; freeing x945_0 (rcx) no dependants anymore
mov rcx, rdx; preserving value of x754 into a new reg
mov rdx, [ r8 + 0x20 ]; saving arg4[4] in rdx.

; fr: none.

; stacking up for out1
mov [ rsp - 0x38 ], rdi; spilling out1 to mem

; fr: none.

; stacking up for x56
mov [ rsp - 0x30 ], r10; spilling x56 to mem

mulx r10, rdi, [ rax + 0x20 ]; x751_1, x751_0<- arg4[4] * arg2[4] (_0*_0)

mov rdx, [ r8 + 0x20 ]; arg4[4] to rdx

; fr: none.
; freeing x751_0 (rdi) no dependants anymore

; fr: none.

; stacking up for x754
mov [ rsp - 0x28 ], rcx; spilling x754 to mem

mulx rcx, rdi, [ rax + 0x0 ]; x48_1, x48_0<- arg4[4] * arg2[0] (_0*_0)


; fr: rdx
mov rdx, [ r8 + 0x0 ]; load m64 x209 to register64


imul rdx, [ rax + 0x8 ]; lox209 = arg4[0]*arg2[1]


; fr: none.
; freeing x48_0 (rdi) no dependants anymore
mov rdi, [ r8 + 0x18 ]; load m64 x197 to register64


imul rdi, [ rax + 0x8 ]; lox197 = arg4[3]*arg2[1]


; fr: none.

; stacking up for x197
mov [ rsp - 0x20 ], rdi; spilling x197 to mem
mov rdi, rdx; preserving value of x209 into a new reg
mov rdx, [ r8 + 0x0 ]; saving arg4[0] in rdx.

; fr: none.

; stacking up for x58_1
mov [ rsp - 0x18 ], rbp; spilling x58_1 to mem

; fr: none.

; stacking up for x43_1
mov [ rsp - 0x10 ], r15; spilling x43_1 to mem

mulx r15, rbp, [ rax + 0x18 ]; x581_1, x581_0<- arg4[0] * arg2[3] (_0*_0)





mov rdx, [ rax + 0x28 ]; arg2[5] to rdx

; fr: none.
; freeing x581_0 (rbp) no dependants anymore

; fr: none.

; stacking up for x209
mov [ rsp - 0x8 ], rdi; spilling x209 to mem

mulx rdi, rbp, [ r8 + 0x8 ]; x949_1, x949_0<- arg4[1] * arg2[5] (_0*_0)


; fr: rdx
mov rdx, [ r8 + 0x8 ]; load m64 x762 to register64


imul rdx, [ rax + 0x20 ]; lox762 = arg4[1]*arg2[4]


; fr: none.
; freeing x949_0 (rbp) no dependants anymore
mov rbp, [ r8 + 0x8 ]; load m64 x948 to register64


imul rbp, [ rax + 0x28 ]; lox948 = arg4[1]*arg2[5]


; fr: none.

; stacking up for x948
mov [ rsp + 0x0 ], rbp; spilling x948 to mem
mov rbp, rdx; preserving value of x762 into a new reg
mov rdx, [ r8 + 0x10 ]; saving arg4[2] in rdx.

; fr: none.

; stacking up for x949_1
mov [ rsp + 0x8 ], rdi; spilling x949_1 to mem

; fr: none.

; stacking up for x755_1
mov [ rsp + 0x10 ], r13; spilling x755_1 to mem

mulx r13, rdi, [ rax + 0x18 ]; x573_1, x573_0<- arg4[2] * arg2[3] (_0*_0)


; fr: rdx
mov rdx, [ r8 + 0x10 ]; load m64 x758 to register64


imul rdx, [ rax + 0x20 ]; lox758 = arg4[2]*arg2[4]


; fr: none.
; freeing x573_0 (rdi) no dependants anymore
mov rdi, rdx; preserving value of x758 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.

; fr: none.

; stacking up for x49
mov [ rsp + 0x18 ], rcx; spilling x49 to mem

; fr: none.

; stacking up for x581_1
mov [ rsp + 0x20 ], r15; spilling x581_1 to mem

mulx r15, rcx, [ r8 + 0x28 ]; x747_1, x747_0<- arg4[5] * arg2[4] (_0*_0)

mov rdx, [ rax + 0x8 ]; arg2[1] to rdx

; fr: none.
; freeing x747_0 (rcx) no dependants anymore

; fr: none.

; stacking up for x758
mov [ rsp + 0x28 ], rdi; spilling x758 to mem

mulx rdi, rcx, [ r8 + 0x0 ]; x210_1, x210_0<- arg4[0] * arg2[1] (_0*_0)


; fr: rdx
mov rdx, [ r8 + 0x8 ]; load m64 x390 to register64


imul rdx, [ rax + 0x10 ]; lox390 = arg4[1]*arg2[2]






; fr: none.
; freeing x210_0 (rcx) no dependants anymore
mov rcx, [ r8 + 0x20 ]; load m64 x564 to register64


imul rcx, [ rax + 0x18 ]; lox564 = arg4[4]*arg2[3]






; fr: none.

; stacking up for x564
mov [ rsp + 0x30 ], rcx; spilling x564 to mem
mov rcx, [ r8 + 0x28 ]; load m64 x745 to register64


imul rcx, [ rax + 0x20 ]; lox745 = arg4[5]*arg2[4]


; fr: none.

; stacking up for x745
mov [ rsp + 0x38 ], rcx; spilling x745 to mem
mov rcx, rdx; preserving value of x390 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.

; fr: none.

; stacking up for x203
mov [ rsp + 0x40 ], r9; spilling x203 to mem

; fr: none.

; stacking up for x210_1
mov [ rsp + 0x48 ], rdi; spilling x210_1 to mem

mulx rdi, r9, [ r8 + 0x0 ]; x395_1, x395_0<- arg4[0] * arg2[2] (_0*_0)





mov rdx, [ rax + 0x18 ]; arg2[3] to rdx

; fr: none.
; freeing x395_0 (r9) no dependants anymore

; fr: none.

; stacking up for x574
mov [ rsp + 0x50 ], r13; spilling x574 to mem

mulx r13, r9, [ r8 + 0x8 ]; x577_1, x577_0<- arg4[1] * arg2[3] (_0*_0)





mov rdx, [ rax + 0x20 ]; arg2[4] to rdx

; fr: none.
; freeing x577_0 (r9) no dependants anymore

; fr: none.

; stacking up for x390
mov [ rsp + 0x58 ], rcx; spilling x390 to mem

mulx rcx, r9, [ r8 + 0x8 ]; x763_1, x763_0<- arg4[1] * arg2[4] (_0*_0)

mov rdx, [ r8 + 0x18 ]; arg4[3] to rdx

; fr: none.
; freeing x763_0 (r9) no dependants anymore

; fr: none.

; stacking up for x945_1
mov [ rsp + 0x60 ], rsi; spilling x945_1 to mem

mulx rsi, r9, [ rax + 0x0 ]; x53_1, x53_0<- arg4[3] * arg2[0] (_0*_0)


; fr: rdx
mov rdx, [ r8 + 0x28 ]; load m64 x931 to register64


imul rdx, [ rax + 0x28 ]; lox931 = arg4[5]*arg2[5]


; fr: none.
; freeing x53_0 (r9) no dependants anymore
mov r9, [ r8 + 0x20 ]; load m64 x193 to register64


imul r9, [ rax + 0x8 ]; lox193 = arg4[4]*arg2[1]


; fr: none.

; stacking up for x193
mov [ rsp + 0x68 ], r9; spilling x193 to mem
mov r9, rdx; preserving value of x931 into a new reg
mov rdx, [ r8 + 0x20 ]; saving arg4[4] in rdx.

; fr: none.

; stacking up for x53_1
mov [ rsp + 0x70 ], rsi; spilling x53_1 to mem

; fr: none.

; stacking up for x751_1
mov [ rsp + 0x78 ], r10; spilling x751_1 to mem

mulx r10, rsi, [ rax + 0x8 ]; x194_1, x194_0<- arg4[4] * arg2[1] (_0*_0)

; renamed x578 to x579 





mov rdx, [ rax + 0x20 ]; arg2[4] to rdx

; fr: none.
; freeing x194_0 (rsi) no dependants anymore

; fr: none.

; stacking up for x931
mov [ rsp + 0x80 ], r9; spilling x931 to mem

mulx r9, rsi, [ r8 + 0x0 ]; x767_1, x767_0<- arg4[0] * arg2[4] (_0*_0)

mov rdx, [ r8 + 0x10 ]; arg4[2] to rdx

; fr: none.
; freeing x767_0 (rsi) no dependants anymore

; fr: none.

; stacking up for x195
mov [ rsp + 0x88 ], r10; spilling x195 to mem

mulx r10, rsi, [ rax + 0x20 ]; x759_1, x759_0<- arg4[2] * arg2[4] (_0*_0)









mov rdx, [ rax + 0x18 ]; arg2[3] to rdx

; fr: none.
; freeing x759_0 (rsi) no dependants anymore

; fr: none.

; stacking up for x376
mov [ rsp + 0x90 ], r12; spilling x376 to mem

mulx r12, rsi, [ r8 + 0x18 ]; x569_1, x569_0<- arg4[3] * arg2[3] (_0*_0)


; fr: rdx
mov rdx, [ r8 + 0x28 ]; load m64 x559 to register64


imul rdx, [ rax + 0x18 ]; lox559 = arg4[5]*arg2[3]


; fr: none.
; freeing x569_0 (rsi) no dependants anymore
mov rsi, [ r8 + 0x28 ]; load m64 x40 to register64


imul rsi, [ rax + 0x0 ]; lox40 = arg4[5]*arg2[0]






; fr: none.

; stacking up for x40
mov [ rsp + 0x98 ], rsi; spilling x40 to mem
mov rsi, [ r8 + 0x20 ]; load m64 x936 to register64


imul rsi, [ rax + 0x28 ]; lox936 = arg4[4]*arg2[5]

; renamed x768 to x769 


; fr: none.

; stacking up for x559
mov [ rsp + 0xa0 ], rdx; spilling x559 to mem
mov rdx, [ r8 + 0x8 ]; load m64 x576 to register64


imul rdx, [ rax + 0x18 ]; lox576 = arg4[1]*arg2[3]


; fr: none.

; stacking up for x936
mov [ rsp + 0xa8 ], rsi; spilling x936 to mem
mov rsi, [ r8 + 0x0 ]; load m64 x766 to register64


imul rsi, [ rax + 0x20 ]; lox766 = arg4[0]*arg2[4]


; fr: none.

; stacking up for x766
mov [ rsp + 0xb0 ], rsi; spilling x766 to mem
mov rsi, [ r8 + 0x20 ]; load m64 x750 to register64


imul rsi, [ rax + 0x20 ]; lox750 = arg4[4]*arg2[4]

; renamed x748 to x749 





; renamed x934 to x935 






; fr: none.

; stacking up for x935
mov [ rsp + 0xb8 ], r11; spilling x935 to mem
mov r11, [ r8 + 0x18 ]; load m64 x568 to register64


imul r11, [ rax + 0x18 ]; lox568 = arg4[3]*arg2[3]

; renamed x760 to x761 


; fr: none.

; stacking up for x749
mov [ rsp + 0xc0 ], r15; spilling x749 to mem
mov r15, rdx; preserving value of x576 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.

; fr: none.

; stacking up for x750
mov [ rsp + 0xc8 ], rsi; spilling x750 to mem

; fr: none.

; stacking up for x568
mov [ rsp + 0xd0 ], r11; spilling x568 to mem

mulx r11, rsi, [ r8 + 0x20 ]; x379_1, x379_0<- arg4[4] * arg2[2] (_0*_0)

mov rdx, [ r8 + 0x8 ]; arg4[1] to rdx

; fr: none.
; freeing x379_0 (rsi) no dependants anymore

; fr: none.

; stacking up for x761
mov [ rsp + 0xd8 ], r10; spilling x761 to mem

mulx r10, rsi, [ rax + 0x10 ]; x391_1, x391_0<- arg4[1] * arg2[2] (_0*_0)

mov rdx, [ r8 + 0x20 ]; arg4[4] to rdx

; fr: none.
; freeing x391_0 (rsi) no dependants anymore

; fr: none.

; stacking up for x579
mov [ rsp + 0xe0 ], r13; spilling x579 to mem

mulx r13, rsi, [ rax + 0x28 ]; x937_1, x937_0<- arg4[4] * arg2[5] (_0*_0)

; renamed x570 to x571 


; fr: rdx
mov rdx, [ r8 + 0x0 ]; load m64 x580 to register64


imul rdx, [ rax + 0x18 ]; lox580 = arg4[0]*arg2[3]


; fr: none.
; freeing x937_0 (rsi) no dependants anymore
mov rsi, rdx; preserving value of x580 into a new reg
mov rdx, [ r8 + 0x10 ]; saving arg4[2] in rdx.

; fr: none.

; stacking up for x571
mov [ rsp + 0xe8 ], r12; spilling x571 to mem

; fr: none.

; stacking up for x576
mov [ rsp + 0xf0 ], r15; spilling x576 to mem

mulx r15, r12, [ rax + 0x10 ]; x387_1, x387_0<- arg4[2] * arg2[2] (_0*_0)

mov rdx, [ r8 + 0x18 ]; arg4[3] to rdx

; fr: none.
; freeing x387_0 (r12) no dependants anymore

; fr: none.

; stacking up for x580
mov [ rsp + 0xf8 ], rsi; spilling x580 to mem

mulx rsi, r12, [ rax + 0x10 ]; x383_1, x383_0<- arg4[3] * arg2[2] (_0*_0)














; fr: rdx
mov rdx, [ r8 + 0x10 ]; load m64 x572 to register64


imul rdx, [ rax + 0x18 ]; lox572 = arg4[2]*arg2[3]






; fr: none.
; freeing x383_0 (r12) no dependants anymore
mov r12, rdx; preserving value of x572 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.

; fr: none.

; stacking up for x380
mov [ rsp + 0x100 ], r11; spilling x380 to mem

; fr: none.

; stacking up for x764
mov [ rsp + 0x108 ], rcx; spilling x764 to mem

mulx rcx, r11, [ r8 + 0x28 ]; x561_1, x561_0<- arg4[5] * arg2[3] (_0*_0)

; renamed x392 to x393 


; fr: rdx
mov rdx, [ r8 + 0x0 ]; load m64 x394 to register64


imul rdx, [ rax + 0x10 ]; lox394 = arg4[0]*arg2[2]


; fr: none.
; freeing x561_0 (r11) no dependants anymore
mov r11, rdx; preserving value of x394 into a new reg
mov rdx, [ r8 + 0x8 ]; saving arg4[1] in rdx.

; fr: none.

; stacking up for x572
mov [ rsp + 0x110 ], r12; spilling x572 to mem

; fr: none.

; stacking up for x393
mov [ rsp + 0x118 ], r10; spilling x393 to mem

mulx r10, r12, [ rax + 0x8 ]; x206_1, x206_0<- arg4[1] * arg2[1] (_0*_0)

mov rdx, [ r8 + 0x8 ]; arg4[1] to rdx

; fr: none.
; freeing x206_0 (r12) no dependants anymore

; fr: none.

; stacking up for x394
mov [ rsp + 0x120 ], r11; spilling x394 to mem

mulx r11, r12, [ rax + 0x0 ]; x63_1, x63_0<- arg4[1] * arg2[0] (_0*_0)










; fr: rdx
mov rdx, [ r8 + 0x0 ]; load m64 x66 to register64


imul rdx, [ rax + 0x0 ]; lox66 = arg4[0]*arg2[0]





















; renamed x938 to x939 


; fr: none.
; freeing x63_0 (r12) no dependants anymore
mov r12, -0x760c000300030003 ; moving imm to reg


; fr: none.

; stacking up for x939
mov [ rsp + 0x128 ], r13; spilling x939 to mem
mov r13, rdx;


imul r13, r12; lox100 = x66*-0x760c000300030003



; r__rm_rm_rmf
lea rbp, [ rbp + r9 ]

; renamed x562 to x563 



cmp rbp, r9


; fr: none.
; freeing x769 (r9) no dependants anymore
mov r9, 0x48669f39fb24c32 ; moving imm to reg

; fr: none.

setc r12b;


; fr: none.

; stacking up for x563
mov [ rsp + 0x130 ], rcx; spilling x563 to mem
mov rcx, rdx;


imul rcx, r9; lox101 = x66*0x48669f39fb24c32

; renamed x396 to x397 

; renamed x64 to x65 



; fr: none.

mov r9, [ rsp + 0x78 ];




; fr: none.

; stacking up for x207
mov [ rsp + 0x138 ], r10; spilling x207 to mem
mov r10, 0x4cc7c19e39811d94 ; moving imm to reg


; fr: none.

; stacking up for x65
mov [ rsp + 0x140 ], r11; spilling x65 to mem
mov r11, rdx;


imul r11, r10; lox114 = x66*0x4cc7c19e39811d94



; fr: none.

mov r10, [ rsp + 0x60 ];



; renamed x752 to x753 


; fr: none.

; stacking up for x753
mov [ rsp + 0x148 ], r9; spilling x753 to mem
mov r9, [ r8 + 0x8 ]; load m64 x61 to register64


imul r9, [ rax + 0x0 ]; lox61 = arg4[1]*arg2[0]


; fr: none.

; stacking up for x101
mov [ rsp + 0x150 ], rcx; spilling x101 to mem
mov rcx, 0x299338752f97f97b ; moving imm to reg


; fr: none.

; stacking up for x771
mov byte [ rsp + 0x158 ], r12b; spilling byte x771 to mem
mov r12, rdx;


imul r12, rcx; lox106 = x66*0x299338752f97f97b



; fr: none.

mov rcx, [ rsp + 0x20 ];



; renamed x942 to x943 

; renamed x69 to x70 


; fr: none.

; stacking up for x943
mov [ rsp + 0x160 ], r14; spilling x943 to mem
mov r14, 0x6730d2a0f6b0f624 ; moving imm to reg
xchg rdx, r14; 0x6730d2a0f6b0f624, swapping with x66, which is currently in rdx

; fr: none.

; stacking up for x106
mov [ rsp + 0x168 ], r12; spilling x106 to mem

; fr: none.

; stacking up for x114
mov [ rsp + 0x170 ], r11; spilling x114 to mem

mulx r11, r12, r13; x115_1, x115_0<- x100 * 0x6730d2a0f6b0f624 (_0*_0)



; r__rm_rm_rmf
lea r9, [ r9 + rbx ]



cmp r9, rbx


; fr: none.
; freeing x70 (rbx) no dependants anymore
mov rbx, 0x1eabfffeb153ffff ; moving imm to reg
mov rdx, rbx; 0x1eabfffeb153ffff to rdx

; fr: rbx

; fr: none.
; freeing x115_0 (r12) no dependants anymore

mulx r12, rbx, r13; x119_1, x119_0<- x100 * 0x1eabfffeb153ffff (_0*_0)






; fr: none.
; freeing x119_0 (rbx) no dependants anymore
mov rbx, 0x60fec0aec070003 ; moving imm to reg

; fr: none.

setc dl;


; fr: none.

; stacking up for x115_1
mov [ rsp + 0x178 ], r11; spilling x115_1 to mem
mov r11, r14;


imul r11, rbx; lox118 = x66*0x60fec0aec070003

; renamed x946 to x947 

; renamed x388 to x389 


; fr: none.

mov rbx, 0xb9feffffffffaaab ; moving imm to reg
xchg rdx, r13; x100, swapping with x72, which is currently in rdx

; fr: none.

; stacking up for x947
mov [ rsp + 0x180 ], r10; spilling x947 to mem

; fr: none.

; stacking up for x389
mov [ rsp + 0x188 ], r15; spilling x389 to mem

mulx r15, r10, rbx; x122_1, x122_0<- x100 * 0xb9feffffffffaaab (_0*_0)





; renamed x49 to x50 

; renamed x384 to x385 



; fr: none.
; freeing x122_0 (r10) no dependants anymore
mov r10, [ rsp + 0x48 ];





; fr: none.

mov rbx, [ rsp + 0x10 ];




; fr: none.

; stacking up for x385
mov [ rsp + 0x190 ], rsi; spilling x385 to mem
mov rsi, rdx; preserving value of x100 into a new reg
mov rdx, [ r8 + 0x28 ]; saving arg4[5] in rdx.

; fr: none.

; stacking up for x72
mov byte [ rsp + 0x198 ], r13b; spilling byte x72 to mem

; fr: none.

; stacking up for x118
mov [ rsp + 0x1a0 ], r11; spilling x118 to mem

mulx r11, r13, [ rax + 0x8 ]; x190_1, x190_0<- arg4[5] * arg2[1] (_0*_0)

; renamed x756 to x757 

; renamed x211 to x212 

mov rdx, [ rax + 0x28 ]; arg2[5] to rdx

; fr: none.
; freeing x190_0 (r13) no dependants anymore

; fr: none.

; stacking up for x757
mov [ rsp + 0x1a8 ], rbx; spilling x757 to mem

mulx rbx, r13, [ r8 + 0x0 ]; x953_1, x953_0<- arg4[0] * arg2[5] (_0*_0)

; renamed x582 to x583 




; fr: rdx
mov rdx, rdi;
; r__rm_rm_rmf
add rdx, [ rsp + 0x58 ]

; renamed x574 to x575 


; fr: none.
; freeing x953_0 (r13) no dependants anymore
mov r13, 0x1a0111ea397fe69a ; moving imm to reg
xchg rdx, rsi; x100, swapping with x398, which is currently in rdx

; fr: none.

; stacking up for x212
mov [ rsp + 0x1b0 ], r10; spilling x212 to mem

; fr: none.

; stacking up for x123
mov [ rsp + 0x1b8 ], r15; spilling x123 to mem

mulx r15, r10, r13; x103_1, x103_0<- x100 * 0x1a0111ea397fe69a (_0*_0)

; renamed x120 to x121 



cmp qword r14, 0x0

; fr: none.
; freeing x103_0 (r10) no dependants anymore
setne r10b; setCC x145 to reg (r10)







; fr: none.

mov r13, [ rsp - 0x10 ];






; fr: none.

; stacking up for x583
mov [ rsp + 0x1c0 ], rcx; spilling x583 to mem
movzx rcx, r10b;
; r__rm_rm_rmf
lea rcx, [ rcx + r9 ]







cmp rsi, rdi


; fr: none.
; freeing x397 (rdi) no dependants anymore
mov rdi, 0x64774b84f38512bf ; moving imm to reg

; fr: none.
; freeing x145 (r10b) no dependants anymore

; fr: none.

; stacking up for x104
mov [ rsp + 0x1c8 ], r15; spilling x104 to mem

mulx r15, r10, rdi; x111_1, x111_0<- x100 * 0x64774b84f38512bf (_0*_0)




; fr: none.
; freeing x111_0 (r10) no dependants anymore
mov r10, [ rsp + 0x118 ];
;should save CF(x399) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
add r12, [ rsp + 0x170 ]

; renamed x954 to x955 



; fr: none.

mov rdi, [ rsp + 0x178 ];





cmp rcx, r9





; renamed x116 to x117 

; renamed x44 to x45 


; fr: none.
; freeing x71 (r9) no dependants anymore
mov r9, rdx; preserving value of x100 into a new reg
mov rdx, [ r8 + 0x18 ]; saving arg4[3] in rdx.

; fr: none.

; stacking up for x45
mov [ rsp + 0x1d0 ], r13; spilling x45 to mem

; fr: none.

; stacking up for x191
mov [ rsp + 0x1d8 ], r11; spilling x191 to mem

mulx r11, r13, [ rax + 0x8 ]; x198_1, x198_0<- arg4[3] * arg2[1] (_0*_0)


; fr: rdx
setc dl;

; fr: none.
; freeing x198_0 (r13) no dependants anymore
mov r13, [ r8 + 0x10 ]; load m64 x386 to register64


imul r13, [ rax + 0x10 ]; lox386 = arg4[2]*arg2[2]




; fr: none.

; stacking up for x128
mov [ rsp + 0x1e0 ], r12; spilling x128 to mem
mov r12, r13;
; r__rm_rm_rmf
lea r12, [ r12 + r10 ]


; fr: none.
; freeing x401 (r10) no dependants anymore
mov r10, 0x2a880aa4ed33c7c3 ; moving imm to reg



imul r14, r10; lox110 = x66*0x2a880aa4ed33c7c3

; renamed x104 to x105 



; fr: none.

mov r10, [ rsp + 0x8 ];




; fr: none.

; stacking up for x950
mov [ rsp + 0x1e8 ], r10; spilling x950 to mem
mov r10, [ r8 + 0x20 ]; load m64 x378 to register64


imul r10, [ rax + 0x10 ]; lox378 = arg4[4]*arg2[2]

; renamed x764 to x765 









; renamed x199 to x200 




; fr: none.

; stacking up for x378
mov [ rsp + 0x1f0 ], r10; spilling x378 to mem
mov r10, [ rsp + 0x108 ];
; r__rm_rm_rmf
rcr byte [ rsp + 0x158 ], 1
adc r10, 0x0


; fr: none.

; stacking up for x200
mov [ rsp + 0x1f8 ], r11; spilling x200 to mem
mov r11, [ r8 + 0x8 ]; load m64 x205 to register64


imul r11, [ rax + 0x8 ]; lox205 = arg4[1]*arg2[1]



; fr: none.

; stacking up for x955
mov [ rsp + 0x200 ], rbx; spilling x955 to mem
mov rbx, [ rsp - 0x18 ];






; fr: none.

; stacking up for x148
mov byte [ rsp + 0x208 ], dl; spilling byte x148 to mem
mov rdx, r14;
; r__rm_rm_rmf
lea rdx, [ rdx + rdi ]




; fr: none.
; freeing x117 (rdi) no dependants anymore
mov rdi, [ rsp + 0xf0 ];
; r__rm_rm_rmf
add rdi, [ rsp + 0x1c0 ]

; renamed x112 to x113 



cmp r12, r13




; fr: none.
; freeing x386 (r13) no dependants anymore
mov r13, [ rsp + 0x168 ]; load m64 x106 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r13 ]; r8/64 + m8


; fr: none.

; stacking up for x136
mov [ rsp + 0x210 ], r15; spilling x136 to mem
setc r15b;


cmp rdi, [ rsp + 0x1c0 ]

; renamed x59 to x60 


; fr: none.

; stacking up for x132
mov [ rsp + 0x218 ], rdx; spilling x132 to mem
mov rdx, 0x4b1ba7b6434bacd7 ; moving imm to reg

; fr: none.

; stacking up for x60
mov [ rsp + 0x220 ], rbx; spilling x60 to mem

; fr: none.

; stacking up for x403
mov byte [ rsp + 0x228 ], r15b; spilling byte x403 to mem

mulx r15, rbx, r9; x107_1, x107_0<- x100 * 0x4b1ba7b6434bacd7 (_0*_0)

; renamed x123 to x124 





; renamed x108 to x109 




; fr: none.
; freeing x100 (r9) no dependants anymore
mov r9, [ rsp + 0x1b0 ]; load m64 x212 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r9 ]; r8/64 + m8

mov rdx, [ rax + 0x18 ]; arg2[3] to rdx

; fr: none.
; freeing x107_0 (rbx) no dependants anymore

; fr: none.

; stacking up for x213
mov [ rsp + 0x230 ], r11; spilling x213 to mem

mulx r11, rbx, [ r8 + 0x20 ]; x565_1, x565_0<- arg4[4] * arg2[3] (_0*_0)




; fr: rdx
mov rdx, [ rsp + 0x1a0 ];

; fr: none.
; freeing x565_0 (rbx) no dependants anymore
mov rbx, [ rsp + 0x1b8 ]; load m64 x124 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + rbx ]; r8/64 + m8



; r__rm_rm_rmf
lea rcx, [ rcx + rdx ]





; renamed x566 to x567 




; fr: none.

; stacking up for x567
mov [ rsp + 0x238 ], r11; spilling x567 to mem
mov r11, [ rsp + 0xe0 ];
;should save CF(x585) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r11, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
add r15, [ rsp + 0x150 ]



; r__rm_rm_rmf
add r10, [ rsp + 0x28 ]



cmp rcx, rdx




; fr: none.

; stacking up for x140
mov [ rsp + 0x240 ], r15; spilling x140 to mem
movzx r15, byte [ rsp + 0x208 ];
;should save CF(x151) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc



cmp [ rsp + 0x230 ], r9




; fr: none.
; freeing x212 (r9) no dependants anymore
mov r9, [ rsp + 0x110 ]; load m64 x572 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r9 ]; r8/64 + m8


; fr: none.

; stacking up for x153
mov [ rsp + 0x248 ], r15; spilling x153 to mem
setc r15b;

; fr: none.

; stacking up for x588
mov [ rsp + 0x250 ], r11; spilling x588 to mem
mov r11, [ r8 + 0x18 ]; load m64 x940 to register64


imul r11, [ rax + 0x28 ]; lox940 = arg4[3]*arg2[5]


; fr: none.

; stacking up for x940
mov [ rsp + 0x258 ], r11; spilling x940 to mem
mov r11, [ r8 + 0x18 ]; load m64 x382 to register64


imul r11, [ rax + 0x10 ]; lox382 = arg4[3]*arg2[2]



cmp r10, [ rsp + 0x28 ]




; fr: none.

; stacking up for x382
mov [ rsp + 0x260 ], r11; spilling x382 to mem
mov r11, [ rsp + 0x140 ];

; fr: none.

; stacking up for x214
mov byte [ rsp + 0x268 ], r15b; spilling byte x214 to mem
movzx r15, byte [ rsp + 0x198 ]; load byte memx72 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r15 ]; r64+m8




; fr: none.
; freeing x72 (r15) no dependants anymore
mov r15, [ rsp - 0x30 ]; load m64 x56 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r15 ]; r8/64 + m8




; fr: none.

; stacking up for x75
mov [ rsp + 0x270 ], r11; spilling x75 to mem
mov r11, [ rsp + 0xd8 ];
;should save CF(x775) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r11, 0x0; add CF to r0's alloc



cmp [ rsp + 0x270 ], r15

; renamed x207 to x208 




; fr: none.
; freeing x56 (r15) no dependants anymore
mov r15, r11;

; fr: none.

; stacking up for x774
mov [ rsp + 0x278 ], r10; spilling x774 to mem
mov r10, [ rsp - 0x28 ]; load m64 x754 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r10 ]; r8/64 + m8


; fr: none.

; stacking up for x780
mov [ rsp + 0x280 ], r15; spilling x780 to mem
setc r15b;


cmp r11, [ rsp + 0xd8 ]


; fr: none.
; freeing x777 (r11) no dependants anymore
setc r11b;


cmp [ rsp + 0x280 ], r10




; fr: none.
; freeing x754 (r10) no dependants anymore
mov r10, rcx;

; fr: none.

; stacking up for x76
mov byte [ rsp + 0x288 ], r15b; spilling byte x76 to mem
mov r15, [ rsp - 0x8 ]; load m64 x209 to register64
; r__rm_rm_rmf
lea r10, [ r10 + r15 ]; r8/64 + m8




; fr: none.
; freeing x209 (r15) no dependants anymore
mov r15, [ rsp + 0x138 ];

; fr: none.

; stacking up for x242
mov [ rsp + 0x290 ], r10; spilling x242 to mem
movzx r10, byte [ rsp + 0x268 ]; load byte memx214 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r10 ]; r64+m8


; fr: none.
; freeing x214 (r10) no dependants anymore
setc r10b;


cmp [ rsp + 0x250 ], r9




; fr: none.
; freeing x572 (r9) no dependants anymore
mov r9, [ rsp + 0x0 ];

; fr: none.

; stacking up for x216
mov [ rsp + 0x298 ], r15; spilling x216 to mem
mov r15, [ rsp + 0x200 ]; load m64 x955 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r15 ]; r8/64 + m8

; renamed x203 to x204 




; fr: none.

; stacking up for x956
mov [ rsp + 0x2a0 ], r9; spilling x956 to mem
movzx r9, r10b;
; r__rm_rm_rmf
movzx r11, r11b
lea r9, [ r9 + r11 ]


; fr: none.
; freeing x778 (r11b) no dependants anymore
setc r11b;

; fr: none.
; freeing x781 (r10b) no dependants anymore
mov r10, [ r8 + 0x18 ]; load m64 x51 to register64


imul r10, [ rax + 0x0 ]; lox51 = arg4[3]*arg2[0]




; fr: none.

; stacking up for x783
mov [ rsp + 0x2a8 ], r9; spilling x783 to mem
movzx r9, byte [ rsp + 0x228 ];
; r__rm_rm_rmf
add r9, [ rsp + 0x188 ]


; fr: none.

; stacking up for x589
mov byte [ rsp + 0x2b0 ], r11b; spilling byte x589 to mem
mov r11, 0x2a880aa4ed33c7c3 ; moving imm to reg


; fr: none.

; stacking up for x51
mov [ rsp + 0x2b8 ], r10; spilling x51 to mem
mov r10, [ rsp + 0x290 ];


imul r10, r11; lox295 = x242*0x2a880aa4ed33c7c3


; fr: none.

mov r11, 0x48669f39fb24c32 ; moving imm to reg


; fr: none.

; stacking up for x295
mov [ rsp + 0x2c0 ], r10; spilling x295 to mem
mov r10, [ rsp + 0x290 ];


imul r10, r11; lox286 = x242*0x48669f39fb24c32


; fr: none.

mov r11, [ r8 + 0x10 ]; load m64 x944 to register64


imul r11, [ rax + 0x28 ]; lox944 = arg4[2]*arg2[5]



cmp rdx, rbx




; fr: none.
; freeing x124 (rbx) no dependants anymore
mov rbx, [ rsp + 0x1e0 ];
;should save CF(x126) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rbx, 0x0; add CF to r0's alloc


; fr: none.
; freeing x125 (rdx) no dependants anymore
mov rdx, 0x60fec0aec070003 ; moving imm to reg


; fr: none.

; stacking up for x286
mov [ rsp + 0x2c8 ], r10; spilling x286 to mem
mov r10, [ rsp + 0x290 ];


imul r10, rdx; lox303 = x242*0x60fec0aec070003


; fr: none.

mov rdx, [ r8 + 0x10 ]; load m64 x201 to register64


imul rdx, [ rax + 0x8 ]; lox201 = arg4[2]*arg2[1]



cmp r9, [ rsp + 0x188 ]




; fr: none.

; stacking up for x303
mov [ rsp + 0x2d0 ], r10; spilling x303 to mem
movzx r10, byte [ rsp + 0x288 ];

; fr: none.

; stacking up for x129
mov [ rsp + 0x2d8 ], rbx; spilling x129 to mem
mov rbx, [ rsp + 0x220 ]; load m64 x60 to register64
; r__rm_rm_rmf
lea r10, [ r10 + rbx ]; r8/64 + m8




; fr: none.

; stacking up for x944
mov [ rsp + 0x2e0 ], r11; spilling x944 to mem
mov r11, [ rsp + 0x260 ]; load m64 x382 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r11 ]; r8/64 + m8




; fr: none.

; stacking up for x408
mov [ rsp + 0x2e8 ], r9; spilling x408 to mem
mov r9, r10;

; fr: none.

; stacking up for x201
mov [ rsp + 0x2f0 ], rdx; spilling x201 to mem
mov rdx, [ rsp + 0x2b8 ]; load m64 x51 to register64
; r__rm_rm_rmf
lea r9, [ r9 + rdx ]; r8/64 + m8


; fr: none.

; stacking up for x81
mov [ rsp + 0x2f8 ], r9; spilling x81 to mem
setc r9b;


cmp qword [ rsp + 0x290 ], 0x0

; fr: none.

; stacking up for x78
mov [ rsp + 0x300 ], r10; spilling x78 to mem
setne r10b; setCC x330 to reg (r10)



cmp [ rsp + 0x2f8 ], rdx


; fr: none.
; freeing x51 (rdx) no dependants anymore
mov rdx, 0x4cc7c19e39811d94 ; moving imm to reg

; fr: none.

; stacking up for x330
mov byte [ rsp + 0x308 ], r10b; spilling byte x330 to mem
setc r10b;


; fr: none.

; stacking up for x406
mov byte [ rsp + 0x310 ], r9b; spilling byte x406 to mem
mov r9, [ rsp + 0x290 ];


imul r9, rdx; lox299 = x242*0x4cc7c19e39811d94



cmp [ rsp + 0x2a0 ], r15




; fr: none.
; freeing x955 (r15) no dependants anymore
mov r15, [ rsp + 0x2f0 ];

; fr: none.

mov rdx, [ rsp + 0x298 ]; load m64 x216 to register64
; r__rm_rm_rmf
lea r15, [ r15 + rdx ]; r8/64 + m8


; fr: none.
; freeing x216 (rdx) no dependants anymore
mov rdx, -0x760c000300030003 ; moving imm to reg

; fr: none.

; stacking up for x299
mov [ rsp + 0x318 ], r9; spilling x299 to mem
setc r9b;


; fr: none.

; stacking up for x82
mov byte [ rsp + 0x320 ], r10b; spilling byte x82 to mem
mov r10, [ rsp + 0x290 ];


imul r10, rdx; lox285 = x242*-0x760c000300030003



cmp r15, [ rsp + 0x2f0 ]

; renamed x950 to x951 




; fr: none.

mov rdx, [ rsp + 0x40 ];
;should save CF(x218) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rdx, 0x0; add CF to r0's alloc




; fr: none.

; stacking up for x220
mov [ rsp + 0x328 ], rdx; spilling x220 to mem
movzx rdx, r9b;
; r__rm_rm_rmf
add rdx, [ rsp + 0x1e8 ]



; r__rm_rm_rmf
add rdx, [ rsp + 0x2e0 ]



cmp rdx, [ rsp + 0x2e0 ]


; fr: none.
; freeing x957 (r9b) no dependants anymore
mov r9, 0x6730d2a0f6b0f624 ; moving imm to reg
xchg rdx, r9; 0x6730d2a0f6b0f624, swapping with x960, which is currently in rdx

; fr: none.

; stacking up for x960
mov [ rsp + 0x330 ], r9; spilling x960 to mem

; fr: none.

; stacking up for x217
mov [ rsp + 0x338 ], r15; spilling x217 to mem

mulx r15, r9, r10; x300_1, x300_0<- x285 * 0x6730d2a0f6b0f624 (_0*_0)


; fr: none.
; freeing x300_0 (r9) no dependants anymore
mov r9, 0x64774b84f38512bf ; moving imm to reg
mov rdx, r9; 0x64774b84f38512bf to rdx

; fr: r9

; fr: none.

; stacking up for x300_1
mov [ rsp + 0x340 ], r15; spilling x300_1 to mem

mulx r15, r9, r10; x296_1, x296_0<- x285 * 0x64774b84f38512bf (_0*_0)








; fr: none.
; freeing x296_0 (r9) no dependants anymore
movzx r9, byte [ rsp + 0x2b0 ];

; fr: none.

mov rdx, [ rsp + 0x50 ]; load m64 x575 to register64
; r__rm_rm_rmf
lea r9, [ r9 + rdx ]; r8/64 + m8


; fr: none.

; stacking up for x591
mov [ rsp + 0x348 ], r9; spilling x591 to mem
mov r9, [ rsp + 0x170 ]; load m64 x114 to register64

; fr: none.

; stacking up for x297
mov [ rsp + 0x350 ], r15; spilling x297 to mem
setc r15b;


cmp [ rsp + 0x2d8 ], r9


; fr: none.
; freeing x114 (r9) no dependants anymore
mov r9, 0x1a0111ea397fe69a ; moving imm to reg
xchg rdx, r9; 0x1a0111ea397fe69a, swapping with x575, which is currently in rdx

; fr: none.

; stacking up for x961
mov byte [ rsp + 0x358 ], r15b; spilling byte x961 to mem

; fr: none.

; stacking up for x575
mov [ rsp + 0x360 ], r9; spilling x575 to mem

mulx r9, r15, r10; x288_1, x288_0<- x285 * 0x1a0111ea397fe69a (_0*_0)


; fr: none.
; freeing x288_0 (r15) no dependants anymore
mov r15, 0x1eabfffeb153ffff ; moving imm to reg
mov rdx, r10; x285 to rdx

; fr: r10

; fr: none.

; stacking up for x288_1
mov [ rsp + 0x368 ], r9; spilling x288_1 to mem

mulx r9, r10, r15; x304_1, x304_0<- x285 * 0x1eabfffeb153ffff (_0*_0)




; fr: none.
; freeing x304_0 (r10) no dependants anymore
mov r10, [ rsp + 0x218 ];
;should save CF(x130) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc

; renamed x297 to x298 


; fr: none.

mov r15, [ rsp + 0x348 ]; load m64 x591 to register64


cmp r15, [ rsp + 0x360 ]






; fr: none.

; stacking up for x305
mov [ rsp + 0x370 ], r9; spilling x305 to mem
setc r9b;


cmp r10, r14




; fr: none.
; freeing x110 (r14) no dependants anymore
movzx r14, byte [ rsp + 0x358 ];

; fr: none.

; stacking up for x592
mov byte [ rsp + 0x378 ], r9b; spilling byte x592 to mem
mov r9, [ rsp + 0x180 ]; load m64 x947 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r9 ]; r8/64 + m8




; fr: none.

; stacking up for x963
mov [ rsp + 0x380 ], r14; spilling x963 to mem
mov r14, [ rsp + 0x210 ];
;should save CF(x134) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r14, 0x0; add CF to r0's alloc




; fr: none.

; stacking up for x137
mov [ rsp + 0x388 ], r14; spilling x137 to mem
mov r14, [ rsp + 0x258 ];
; r__rm_rm_rmf
add r14, [ rsp + 0x380 ]



; r__rm_rm_rmf
add r15, [ rsp + 0xd0 ]



cmp [ rsp + 0x388 ], r13


; fr: none.
; freeing x106 (r13) no dependants anymore
mov r13, 0x4b1ba7b6434bacd7 ; moving imm to reg

; fr: none.

; stacking up for x966
mov [ rsp + 0x390 ], r14; spilling x966 to mem

; fr: none.

; stacking up for x594
mov [ rsp + 0x398 ], r15; spilling x594 to mem

mulx r15, r14, r13; x292_1, x292_0<- x285 * 0x4b1ba7b6434bacd7 (_0*_0)






; fr: none.
; freeing x292_0 (r14) no dependants anymore
setc r14b;


cmp [ rsp + 0x380 ], r9




; fr: none.
; freeing x947 (r9) no dependants anymore
movzx r9, r14b;

; fr: none.

mov r13, [ rsp + 0x240 ]; load m64 x140 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r13 ]; r8/64 + m8

; renamed x293 to x294 




; fr: none.
; freeing x140 (r13) no dependants anymore
mov r13, [ rsp - 0x20 ];

; fr: none.
; freeing x138 (r14b) no dependants anymore
mov r14, [ rsp + 0x328 ]; load m64 x220 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r14 ]; r8/64 + m8




; fr: none.

; stacking up for x141
mov [ rsp + 0x3a0 ], r9; spilling x141 to mem
mov r9, [ rsp + 0x2a8 ];

; fr: none.

; stacking up for x223
mov [ rsp + 0x3a8 ], r13; spilling x223 to mem
mov r13, [ rsp + 0x1a8 ]; load m64 x757 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r13 ]; r8/64 + m8




; fr: none.

; stacking up for x294
mov [ rsp + 0x3b0 ], r15; spilling x294 to mem
mov r15, r9;

; fr: none.

mov r13, [ rsp + 0xc8 ]; load m64 x750 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r13 ]; r8/64 + m8


; fr: none.

; stacking up for x787
mov [ rsp + 0x3b8 ], r15; spilling x787 to mem
setc r15b;


cmp r14, [ rsp + 0x40 ]


; fr: none.
; freeing x220 (r14) no dependants anymore
mov r14, [ rsp + 0xd0 ]; load m64 x568 to register64

; fr: none.

; stacking up for x964
mov byte [ rsp + 0x3c0 ], r15b; spilling byte x964 to mem
setc r15b;


cmp [ rsp + 0x398 ], r14




; fr: none.
; freeing x568 (r14) no dependants anymore
mov r14, [ rsp + 0x2c8 ];

; fr: none.

; stacking up for x221
mov byte [ rsp + 0x3c8 ], r15b; spilling byte x221 to mem
mov r15, [ rsp + 0x3b0 ]; load m64 x294 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r15 ]; r8/64 + m8


; fr: none.
; freeing x294 (r15) no dependants anymore
setc r15b;


cmp [ rsp + 0x3b8 ], r13


; fr: none.
; freeing x750 (r13) no dependants anymore
mov r13, [ rsp - 0x20 ]; load m64 x197 to register64

; fr: none.

; stacking up for x325
mov [ rsp + 0x3d0 ], r14; spilling x325 to mem
setc r14b;


cmp [ rsp + 0x3a8 ], r13




; fr: none.
; freeing x197 (r13) no dependants anymore
movzx r13, r15b;

; fr: none.

; stacking up for x788
mov byte [ rsp + 0x3d8 ], r14b; spilling byte x788 to mem
movzx r14, byte [ rsp + 0x378 ]; load byte memx592 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r14 ]; r64+m8




; fr: none.
; freeing x592 (r14) no dependants anymore
mov r14, [ rsp + 0x248 ];

; fr: none.
; freeing x595 (r15b) no dependants anymore
mov r15, [ rsp + 0x270 ]; load m64 x75 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r15 ]; r8/64 + m8


; fr: none.

; stacking up for x597
mov [ rsp + 0x3e0 ], r13; spilling x597 to mem
setc r13b;


cmp r14, r15


; fr: none.
; freeing x75 (r15) no dependants anymore
mov r15, 0xb9feffffffffaaab ; moving imm to reg

; fr: none.

; stacking up for x224
mov byte [ rsp + 0x3e8 ], r13b; spilling byte x224 to mem

; fr: none.

; stacking up for x154
mov [ rsp + 0x3f0 ], r14; spilling x154 to mem

mulx r14, r13, r15; x307_1, x307_0<- x285 * 0xb9feffffffffaaab (_0*_0)


; fr: none.
; freeing x285 (rdx) no dependants anymore
setc dl;


cmp r9, [ rsp + 0x1a8 ]


; fr: none.
; freeing x784 (r9) no dependants anymore
setc r9b;


cmp [ rsp + 0x300 ], rbx



; fr: none.
; freeing x60 (rbx) no dependants anymore
mov rbx, [ rsp + 0x368 ];



; renamed x289 to x290 




; fr: none.
; freeing x307_0 (r13) no dependants anymore
movzx r13, byte [ rsp + 0x320 ];
;should save CF(x79) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r13, 0x0; add CF to r0's alloc



cmp [ rsp + 0x2e8 ], r11








; fr: none.
; freeing x382 (r11) no dependants anymore
movzx r11, byte [ rsp + 0x310 ];
;should save CF(x409) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r11, 0x0; add CF to r0's alloc


; fr: none.

mov r15, [ rsp + 0x150 ]; load m64 x101 to register64


cmp [ rsp + 0x3a0 ], r15




; fr: none.
; freeing x101 (r15) no dependants anymore
mov r15, [ rsp + 0x190 ]; load m64 x385 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r15 ]; r8/64 + m8



; fr: none.

; stacking up for x290
mov [ rsp + 0x3f8 ], rbx; spilling x290 to mem
mov rbx, [ rsp + 0x70 ];




; fr: none.

; stacking up for x308
mov [ rsp + 0x400 ], r14; spilling x308 to mem
mov r14, 0x299338752f97f97b ; moving imm to reg

; fr: none.

; stacking up for x785
mov byte [ rsp + 0x408 ], r9b; spilling byte x785 to mem
setc r9b;


; fr: none.

; stacking up for x155
mov byte [ rsp + 0x410 ], dl; spilling byte x155 to mem
mov rdx, [ rsp + 0x290 ];


imul rdx, r14; lox291 = x242*0x299338752f97f97b




; fr: none.

movzx r14, r9b;
; r__rm_rm_rmf
add r14, [ rsp + 0x1c8 ]




; fr: none.
; freeing x142 (r9b) no dependants anymore
mov r9, rdx;
; r__rm_rm_rmf
add r9, [ rsp + 0x350 ]



cmp [ rsp + 0x290 ], rcx




; fr: none.
; freeing x150 (rcx) no dependants anymore
mov rcx, [ rsp + 0x3e0 ];

; fr: none.

; stacking up for x144
mov [ rsp + 0x418 ], r14; spilling x144 to mem
mov r14, [ rsp + 0xe8 ]; load m64 x571 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r14 ]; r8/64 + m8




; fr: none.

; stacking up for x321
mov [ rsp + 0x420 ], r9; spilling x321 to mem
mov r9, rcx;

; fr: none.

; stacking up for x412
mov [ rsp + 0x428 ], r11; spilling x412 to mem
mov r11, [ rsp + 0x30 ]; load m64 x564 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r11 ]; r8/64 + m8


; fr: none.

; stacking up for x84
mov [ rsp + 0x430 ], r13; spilling x84 to mem
mov r13, [ rsp + 0x258 ]; load m64 x940 to register64

; fr: none.

; stacking up for x601
mov [ rsp + 0x438 ], r9; spilling x601 to mem
setc r9b;


cmp [ rsp + 0x390 ], r13




; fr: none.
; freeing x940 (r13) no dependants anymore
movzx r13, byte [ rsp + 0x3e8 ];

; fr: none.

; stacking up for x243
mov byte [ rsp + 0x440 ], r9b; spilling byte x243 to mem
movzx r9, byte [ rsp + 0x3c8 ]; load byte memx221 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r9 ]; r64+m8


; fr: none.
; freeing x221 (r9) no dependants anymore
setc r9b;


cmp rcx, r14




; fr: none.
; freeing x571 (r14) no dependants anymore
mov r14, [ rsp + 0x1f8 ]; load m64 x200 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r14 ]; r8/64 + m8

; renamed x54 to x55 


; fr: none.
; freeing x598 (rcx) no dependants anymore
setc cl;


cmp [ rsp + 0x438 ], r11




; fr: none.
; freeing x564 (r11) no dependants anymore
mov r11, rbx;

; fr: none.

; stacking up for x599
mov byte [ rsp + 0x448 ], cl; spilling byte x599 to mem
mov rcx, [ rsp + 0x430 ]; load m64 x84 to register64
; r__rm_rm_rmf
lea r11, [ r11 + rcx ]; r8/64 + m8


; fr: none.
; freeing x84 (rcx) no dependants anymore
setc cl;


cmp r11, rbx


; fr: none.
; freeing x55 (rbx) no dependants anymore
setc bl;

; fr: none.

; stacking up for x602
mov byte [ rsp + 0x450 ], cl; spilling byte x602 to mem
mov rcx, [ r8 + 0x20 ]; load m64 x46 to register64


imul rcx, [ rax + 0x0 ]; lox46 = arg4[4]*arg2[0]




; fr: none.

; stacking up for x86
mov byte [ rsp + 0x458 ], bl; spilling byte x86 to mem
mov rbx, rcx;
; r__rm_rm_rmf
lea rbx, [ rbx + r11 ]



cmp [ rsp + 0x428 ], r15




; fr: none.
; freeing x385 (r15) no dependants anymore
mov r15, [ rsp + 0x3f0 ];

; fr: none.
; freeing x85 (r11) no dependants anymore
mov r11, [ rsp + 0x2d8 ]; load m64 x129 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r11 ]; r8/64 + m8


; fr: none.

; stacking up for x967
mov byte [ rsp + 0x460 ], r9b; spilling byte x967 to mem
setc r9b;


cmp r15, r11

; renamed x305 to x306 




; fr: none.
; freeing x129 (r11) no dependants anymore
mov r11, r15;

; fr: none.

; stacking up for x413
mov byte [ rsp + 0x468 ], r9b; spilling byte x413 to mem
movzx r9, byte [ rsp + 0x440 ]; load byte memx243 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r9 ]; r64+m8




; fr: none.
; freeing x243 (r9) no dependants anymore
movzx r9, byte [ rsp + 0x410 ];
;should save CF(x158) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r9, 0x0; add CF to r0's alloc



cmp r13, r14




; fr: none.
; freeing x200 (r14) no dependants anymore
mov r14, [ rsp + 0x318 ];

; fr: none.

; stacking up for x160
mov [ rsp + 0x470 ], r9; spilling x160 to mem
mov r9, [ rsp + 0x370 ]; load m64 x306 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r9 ]; r8/64 + m8




; fr: none.
; freeing x306 (r9) no dependants anymore
movzx r9, byte [ rsp + 0x3d8 ];

; fr: none.

; stacking up for x313
mov [ rsp + 0x478 ], r14; spilling x313 to mem
movzx r14, byte [ rsp + 0x408 ]; load byte memx785 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r14 ]; r64+m8


; fr: none.
; freeing x785 (r14) no dependants anymore
setc r14b;


cmp rbx, rcx




; fr: none.
; freeing x46 (rcx) no dependants anymore
mov rcx, [ rsp + 0x148 ]; load m64 x753 to register64
; r__rm_rm_rmf
lea r9, [ r9 + rcx ]; r8/64 + m8




; fr: none.

; stacking up for x228
mov byte [ rsp + 0x480 ], r14b; spilling byte x228 to mem
movzx r14, byte [ rsp + 0x460 ];

; fr: none.

; stacking up for x245
mov [ rsp + 0x488 ], r11; spilling x245 to mem
movzx r11, byte [ rsp + 0x3c0 ]; load byte memx964 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r11 ]; r64+m8

; renamed x308 to x309 


; fr: none.
; freeing x964 (r11) no dependants anymore
setc r11b;


cmp r9, rcx




; fr: none.
; freeing x753 (rcx) no dependants anymore
mov rcx, [ rsp + 0x160 ]; load m64 x943 to register64
; r__rm_rm_rmf
lea r14, [ r14 + rcx ]; r8/64 + m8




; fr: none.

; stacking up for x89
mov byte [ rsp + 0x490 ], r11b; spilling byte x89 to mem
mov r11, r14;

; fr: none.

mov rcx, [ rsp + 0xa8 ]; load m64 x936 to register64
; r__rm_rm_rmf
lea r11, [ r11 + rcx ]; r8/64 + m8




; fr: none.

; stacking up for x973
mov [ rsp + 0x498 ], r11; spilling x973 to mem
mov r11, [ rsp + 0x38 ]; load m64 x745 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r11 ]; r8/64 + m8


; fr: none.

; stacking up for x794
mov [ rsp + 0x4a0 ], r9; spilling x794 to mem
setc r9b;


cmp [ rsp + 0x498 ], rcx

; renamed x380 to x381 


; fr: none.
; freeing x936 (rcx) no dependants anymore
setc cl;


cmp r14, [ rsp + 0x160 ]


; fr: none.
; freeing x970 (r14) no dependants anymore
setc r14b;

; fr: none.

; stacking up for x792
mov byte [ rsp + 0x4a8 ], r9b; spilling byte x792 to mem
mov r9, [ r8 + 0x28 ]; load m64 x373 to register64


imul r9, [ rax + 0x10 ]; lox373 = arg4[5]*arg2[2]



cmp [ rsp + 0x488 ], r15

; renamed x376 to x377 




; fr: none.
; freeing x157 (r15) no dependants anymore
mov r15, [ rsp + 0x470 ];

; fr: none.

; stacking up for x971
mov byte [ rsp + 0x4b0 ], r14b; spilling byte x971 to mem
mov r14, [ rsp + 0x2f8 ]; load m64 x81 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r14 ]; r8/64 + m8




; fr: none.

; stacking up for x974
mov byte [ rsp + 0x4b8 ], cl; spilling byte x974 to mem
movzx rcx, byte [ rsp + 0x450 ];

; fr: none.

; stacking up for x373
mov [ rsp + 0x4c0 ], r9; spilling x373 to mem
movzx r9, byte [ rsp + 0x448 ]; load byte memx599 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r9 ]; r64+m8




; fr: none.
; freeing x599 (r9) no dependants anymore
mov r9, r15;
; r__rm_rm_rmf
lea r9, [ r9 + r10 ]




; fr: none.

; stacking up for x164
mov [ rsp + 0x4c8 ], r9; spilling x164 to mem
mov r9, [ rsp + 0x238 ]; load m64 x567 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r9 ]; r8/64 + m8




; fr: none.

; stacking up for x605
mov [ rsp + 0x4d0 ], rcx; spilling x605 to mem
mov rcx, [ rsp + 0x1f0 ];

; fr: none.

mov r9, [ rsp + 0x428 ]; load m64 x412 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r9 ]; r8/64 + m8


; fr: none.
; freeing x412 (r9) no dependants anymore
setc r9b;


cmp rcx, [ rsp + 0x1f0 ]




; fr: none.

; stacking up for x246
mov byte [ rsp + 0x4d8 ], r9b; spilling byte x246 to mem
mov r9, [ rsp + 0x4d0 ];

; fr: none.

; stacking up for x415
mov [ rsp + 0x4e0 ], rcx; spilling x415 to mem
mov rcx, [ rsp + 0xa0 ]; load m64 x559 to register64
; r__rm_rm_rmf
lea r9, [ r9 + rcx ]; r8/64 + m8




; fr: none.

; stacking up for x608
mov [ rsp + 0x4e8 ], r9; spilling x608 to mem
movzx r9, byte [ rsp + 0x490 ];

; fr: none.

movzx rcx, byte [ rsp + 0x458 ]; load byte memx86 to register64
; r__rm_rm_rmf
lea r9, [ r9 + rcx ]; r64+m8




; fr: none.
; freeing x86 (rcx) no dependants anymore
mov rcx, [ rsp + 0x68 ]; load m64 x193 to register64
; r__rm_rm_rmf
lea r13, [ r13 + rcx ]; r8/64 + m8




; fr: none.

; stacking up for x230
mov [ rsp + 0x4f0 ], r13; spilling x230 to mem
movzx r13, byte [ rsp + 0x468 ];
;should save CF(x416) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r13, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
add r13, [ rsp + 0x100 ]



cmp r15, r14




; fr: none.
; freeing x81 (r14) no dependants anymore
mov r14, r13;

; fr: none.
; freeing x161 (r15) no dependants anymore
mov r15, [ rsp + 0x4c0 ]; load m64 x373 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r15 ]; r8/64 + m8

; renamed x195 to x196 




; fr: none.

; stacking up for x422
mov [ rsp + 0x4f8 ], r14; spilling x422 to mem
mov r14, [ rsp + 0x18 ]; load m64 x50 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r14 ]; r8/64 + m8


; fr: none.

; stacking up for x92
mov [ rsp + 0x500 ], r9; spilling x92 to mem
setc r9b;


cmp [ rsp + 0x4f0 ], rcx


; fr: none.
; freeing x193 (rcx) no dependants anymore
setc cl;


cmp [ rsp + 0x500 ], r14




; fr: none.
; freeing x50 (r14) no dependants anymore
movzx r14, byte [ rsp + 0x4b8 ];

; fr: none.

; stacking up for x162
mov byte [ rsp + 0x508 ], r9b; spilling byte x162 to mem
movzx r9, byte [ rsp + 0x4b0 ]; load byte memx971 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r9 ]; r64+m8



; fr: none.
; freeing x971 (r9) no dependants anymore
mov r9, [ rsp + 0x340 ];






; fr: none.

; stacking up for x231
mov byte [ rsp + 0x510 ], cl; spilling byte x231 to mem
mov rcx, [ rsp + 0x2d0 ];

; fr: none.

; stacking up for x301
mov [ rsp + 0x518 ], r9; spilling x301 to mem
mov r9, [ rsp + 0x400 ]; load m64 x309 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r9 ]; r8/64 + m8




; fr: none.

; stacking up for x310
mov [ rsp + 0x520 ], rcx; spilling x310 to mem
mov rcx, [ rsp + 0x128 ]; load m64 x939 to register64
; r__rm_rm_rmf
lea r14, [ r14 + rcx ]; r8/64 + m8

; renamed x301 to x302 


; fr: none.

; stacking up for x977
mov [ rsp + 0x528 ], r14; spilling x977 to mem
setc r14b;


cmp [ rsp + 0x4f8 ], r15




; fr: none.
; freeing x373 (r15) no dependants anymore
mov r15, [ rsp + 0x2c0 ];

; fr: none.

; stacking up for x93
mov byte [ rsp + 0x530 ], r14b; spilling byte x93 to mem
mov r14, [ rsp + 0x518 ]; load m64 x302 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r14 ]; r8/64 + m8


; fr: none.
; freeing x302 (r14) no dependants anymore
setc r14b;


cmp [ rsp + 0x520 ], r9




; fr: none.
; freeing x309 (r9) no dependants anymore
mov r9, [ rsp + 0x478 ];
;should save CF(x311) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r9, 0x0; add CF to r0's alloc



cmp r9, [ rsp + 0x318 ]


; fr: none.

; stacking up for x423
mov byte [ rsp + 0x538 ], r14b; spilling byte x423 to mem
setc r14b;


cmp [ rsp + 0x528 ], rcx

; renamed x191 to x192 


; fr: none.
; freeing x939 (rcx) no dependants anymore
setc cl;


cmp r13, [ rsp + 0x100 ]




; fr: none.
; freeing x419 (r13) no dependants anymore
movzx r13, byte [ rsp + 0x510 ];

; fr: none.

; stacking up for x978
mov byte [ rsp + 0x540 ], cl; spilling byte x978 to mem
movzx rcx, byte [ rsp + 0x480 ]; load byte memx228 to register64
; r__rm_rm_rmf
lea r13, [ r13 + rcx ]; r64+m8




; fr: none.
; freeing x228 (rcx) no dependants anymore
movzx rcx, r14b;
; r__rm_rm_rmf
lea rcx, [ rcx + r15 ]




; fr: none.
; freeing x317 (r15) no dependants anymore
mov r15, [ rsp + 0x88 ]; load m64 x196 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r15 ]; r8/64 + m8




; fr: none.
; freeing x315 (r14b) no dependants anymore
mov r14, [ rsp + 0x488 ];

; fr: none.

; stacking up for x318
mov [ rsp + 0x548 ], rcx; spilling x318 to mem
mov rcx, [ rsp + 0x230 ]; load m64 x213 to register64
; r__rm_rm_rmf
lea r14, [ r14 + rcx ]; r8/64 + m8


; fr: none.

; stacking up for x234
mov [ rsp + 0x550 ], r13; spilling x234 to mem
setc r13b;


cmp r14, rcx




; fr: none.
; freeing x213 (rcx) no dependants anymore
mov rcx, r14;

; fr: none.

; stacking up for x420
mov byte [ rsp + 0x558 ], r13b; spilling byte x420 to mem
movzx r13, byte [ rsp + 0x308 ]; load byte memx330 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r13 ]; r64+m8




; fr: none.
; freeing x330 (r13) no dependants anymore
mov r13, [ rsp + 0x528 ];

; fr: none.

; stacking up for x332
mov [ rsp + 0x560 ], rcx; spilling x332 to mem
mov rcx, [ rsp + 0x80 ]; load m64 x931 to register64
; r__rm_rm_rmf
lea r13, [ r13 + rcx ]; r8/64 + m8


; fr: none.

; stacking up for x980
mov [ rsp + 0x568 ], r13; spilling x980 to mem
mov r13, [ rsp + 0x238 ]; load m64 x567 to register64

; fr: none.

setc cl;


cmp [ rsp + 0x4d0 ], r13


; fr: none.
; freeing x567 (r13) no dependants anymore
setc r13b;


cmp [ rsp + 0x550 ], r15




; fr: none.
; freeing x196 (r15) no dependants anymore
mov r15, [ rsp + 0x1d8 ];
;should save CF(x235) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc




; fr: none.

; stacking up for x606
mov byte [ rsp + 0x570 ], r13b; spilling byte x606 to mem
mov r13, [ rsp + 0x500 ];
; r__rm_rm_rmf
add r13, [ rsp + 0x98 ]


; fr: none.

; stacking up for x95
mov [ rsp + 0x578 ], r13; spilling x95 to mem
mov r13, [ r8 + 0x28 ]; load m64 x188 to register64


imul r13, [ rax + 0x8 ]; lox188 = arg4[5]*arg2[1]


; fr: none.

; stacking up for x240
mov [ rsp + 0x580 ], r15; spilling x240 to mem
mov r15, [ rsp + 0x548 ]; load m64 x318 to register64


cmp r15, [ rsp + 0x2c0 ]




; fr: none.

; stacking up for x188
mov [ rsp + 0x588 ], r13; spilling x188 to mem
mov r13, [ rsp + 0x420 ];
;should save CF(x319) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r13, 0x0; add CF to r0's alloc




; fr: none.

; stacking up for x322
mov [ rsp + 0x590 ], r13; spilling x322 to mem
movzx r13, byte [ rsp + 0x558 ];
; r__rm_rm_rmf
add r13, [ rsp + 0x90 ]




; fr: none.

; stacking up for x425
mov [ rsp + 0x598 ], r13; spilling x425 to mem
movzx r13, cl;
; r__rm_rm_rmf
rcr byte [ rsp + 0x4d8 ], 1
adc r13, 0x0



; r__rm_rm_rmf
add r13, [ rsp + 0x4c8 ]




; fr: none.
; freeing x249 (cl) no dependants anymore
mov rcx, [ rsp + 0x560 ];
; r__rm_rm_rmf
add rcx, [ rsp + 0x520 ]




; fr: none.

; stacking up for x252
mov [ rsp + 0x5a0 ], r13; spilling x252 to mem
mov r13, [ rsp + 0x550 ];
; r__rm_rm_rmf
add r13, [ rsp + 0x588 ]




; fr: none.

; stacking up for x237
mov [ rsp + 0x5a8 ], r13; spilling x237 to mem
mov r13, rcx;
; r__rm_rm_rmf
add r13, [ rsp + 0x120 ]


; fr: none.

; stacking up for x427
mov [ rsp + 0x5b0 ], r13; spilling x427 to mem
mov r13, [ rsp + 0x588 ]; load m64 x188 to register64


cmp [ rsp + 0x5a8 ], r13


; fr: none.
; freeing x188 (r13) no dependants anymore
setc r13b;


cmp rcx, [ rsp + 0x520 ]




; fr: none.

; stacking up for x335
mov [ rsp + 0x5b8 ], rcx; spilling x335 to mem
movzx rcx, r13b;

; fr: none.

mov r15, [ rsp + 0x580 ]; load m64 x240 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r15 ]; r8/64 + m8


; fr: none.
; freeing x240 (r15) no dependants anymore
setc r15b;


cmp [ rsp + 0x4c8 ], r10




; fr: none.
; freeing x133 (r10) no dependants anymore
movzx r10, byte [ rsp + 0x508 ];
;should save CF(x165) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea r10, [ r10 + rbx ]




; fr: none.
; freeing x238 (r13b) no dependants anymore
mov r13, r10;
; r__rm_rm_rmf
add r13, [ rsp + 0x388 ]



cmp [ rsp + 0x560 ], r14


; fr: none.
; freeing x248 (r14) no dependants anymore
setc r14b;


cmp [ rsp + 0x590 ], rdx




; fr: none.
; freeing x291 (rdx) no dependants anymore
mov rdx, [ rsp + 0x598 ];

; fr: none.

; stacking up for x241
mov [ rsp + 0x5c0 ], rcx; spilling x241 to mem
movzx rcx, byte [ rsp + 0x538 ]; load byte memx423 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + rcx ]; r64+m8


; fr: none.
; freeing x423 (rcx) no dependants anymore
setc cl;


cmp [ rsp + 0x4a0 ], r11


; fr: none.
; freeing x745 (r11) no dependants anymore
setc r11b;


cmp qword [ rsp + 0x5b0 ], 0x0

; fr: none.

; stacking up for x426
mov [ rsp + 0x5c8 ], rdx; spilling x426 to mem
setne dl; setCC x516 to reg (rdx)



cmp r13, [ rsp + 0x388 ]


; fr: none.

; stacking up for x516
mov byte [ rsp + 0x5d0 ], dl; spilling byte x516 to mem
mov rdx, 0x48669f39fb24c32 ; moving imm to reg

; fr: none.

; stacking up for x795
mov byte [ rsp + 0x5d8 ], r11b; spilling byte x795 to mem
setc r11b;


; fr: none.

; stacking up for x333
mov byte [ rsp + 0x5e0 ], r14b; spilling byte x333 to mem
mov r14, [ rsp + 0x5b0 ];


imul r14, rdx; lox472 = x427*0x48669f39fb24c32



cmp r10, rbx




; fr: none.
; freeing x88 (rbx) no dependants anymore
movzx rbx, byte [ rsp + 0x4a8 ];

; fr: none.
; freeing x168 (r10) no dependants anymore
mov r10, [ rsp + 0xc0 ]; load m64 x749 to register64
; r__rm_rm_rmf
lea rbx, [ rbx + r10 ]; r8/64 + m8




; fr: none.
; freeing x749 (r10) no dependants anymore
movzx r10, r11b;
;should save CF(x169) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc


; fr: none.
; freeing x172 (r11b) no dependants anymore
mov r11, 0x60fec0aec070003 ; moving imm to reg


; fr: none.

mov rdx, [ rsp + 0x5b0 ];


imul rdx, r11; lox489 = x427*0x60fec0aec070003


; fr: none.

mov r11, 0x299338752f97f97b ; moving imm to reg


; fr: none.

; stacking up for x472
mov [ rsp + 0x5e8 ], r14; spilling x472 to mem
mov r14, [ rsp + 0x5b0 ];


imul r14, r11; lox477 = x427*0x299338752f97f97b



; r__rm_rm_rmf
add r10, [ rsp + 0x578 ]



cmp r10, [ rsp + 0x578 ]




; fr: none.

mov r11, [ rsp + 0x3a0 ]; load m64 x141 to register64
; r__rm_rm_rmf
lea r10, [ r10 + r11 ]; r8/64 + m8




; fr: none.

; stacking up for x797
mov [ rsp + 0x5f0 ], rbx; spilling x797 to mem
movzx rbx, cl;

; fr: none.

; stacking up for x477
mov [ rsp + 0x5f8 ], r14; spilling x477 to mem
mov r14, [ rsp + 0x3d0 ]; load m64 x325 to register64
; r__rm_rm_rmf
lea rbx, [ rbx + r14 ]; r8/64 + m8


; fr: none.
; freeing x325 (r14) no dependants anymore
mov r14, -0x760c000300030003 ; moving imm to reg

; fr: none.
; freeing x323 (cl) no dependants anymore
setc cl;


; fr: none.

; stacking up for x489
mov [ rsp + 0x600 ], rdx; spilling x489 to mem
mov rdx, [ rsp + 0x5b0 ];


imul rdx, r14; lox471 = x427*-0x760c000300030003




; fr: none.

mov r14, [ rsp + 0x5a0 ];
; r__rm_rm_rmf
add r14, [ rsp + 0x338 ]



cmp r14, [ rsp + 0x338 ]


; fr: none.

; stacking up for x326
mov [ rsp + 0x608 ], rbx; spilling x326 to mem
mov rbx, 0xb9feffffffffaaab ; moving imm to reg

; fr: none.

; stacking up for x336
mov byte [ rsp + 0x610 ], r15b; spilling byte x336 to mem

; fr: none.

; stacking up for x176
mov byte [ rsp + 0x618 ], cl; spilling byte x176 to mem

mulx rcx, r15, rbx; x493_1, x493_0<- x471 * 0xb9feffffffffaaab (_0*_0)


; fr: none.
; freeing x493_0 (r15) no dependants anymore
mov r15, 0x64774b84f38512bf ; moving imm to reg

; fr: none.


; fr: none.

; stacking up for x493_1
mov [ rsp + 0x620 ], rcx; spilling x493_1 to mem

mulx rcx, rbx, r15; x482_1, x482_0<- x471 * 0x64774b84f38512bf (_0*_0)


; fr: none.
; freeing x482_0 (rbx) no dependants anymore
mov rbx, 0x6730d2a0f6b0f624 ; moving imm to reg

; fr: none.


; fr: none.

; stacking up for x178
mov [ rsp + 0x628 ], r10; spilling x178 to mem

mulx r10, r15, rbx; x486_1, x486_0<- x471 * 0x6730d2a0f6b0f624 (_0*_0)


; fr: none.
; freeing x486_0 (r15) no dependants anymore
mov r15, [ rsp + 0xa0 ]; load m64 x559 to register64

; fr: none.

setc bl;


cmp [ rsp + 0x4e8 ], r15








; fr: none.
; freeing x559 (r15) no dependants anymore
movzx r15, byte [ rsp + 0x530 ];

; fr: none.

; stacking up for x256
mov byte [ rsp + 0x630 ], bl; spilling byte x256 to mem
mov rbx, [ rsp + 0x1d0 ]; load m64 x45 to register64
; r__rm_rm_rmf
lea r15, [ r15 + rbx ]; r8/64 + m8


; fr: none.
; freeing x45 (rbx) no dependants anymore
setc bl;


cmp [ rsp + 0x628 ], r11




; fr: none.
; freeing x141 (r11) no dependants anymore
movzx r11, byte [ rsp + 0x618 ];
;should save CF(x179) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r11, 0x0; add CF to r0's alloc



; fr: none.

; stacking up for x609
mov byte [ rsp + 0x638 ], bl; spilling byte x609 to mem
mov rbx, [ rsp + 0x620 ];




; fr: none.

; stacking up for x483
mov [ rsp + 0x640 ], rcx; spilling x483 to mem
mov rcx, [ rsp + 0x98 ]; load m64 x40 to register64


cmp [ rsp + 0x578 ], rcx



;should save CF(x96) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea r11, [ r11 + r15 ]




; fr: none.
; freeing x40 (rcx) no dependants anymore
mov rcx, r11;
; r__rm_rm_rmf
add rcx, [ rsp + 0x418 ]


; fr: none.

; stacking up for x185
mov [ rsp + 0x648 ], rcx; spilling x185 to mem
mov rcx, 0x4b1ba7b6434bacd7 ; moving imm to reg

; fr: none.

; stacking up for x486_1
mov [ rsp + 0x650 ], r10; spilling x486_1 to mem

; fr: none.

; stacking up for x494
mov [ rsp + 0x658 ], rbx; spilling x494 to mem

mulx rbx, r10, rcx; x478_1, x478_0<- x471 * 0x4b1ba7b6434bacd7 (_0*_0)





; renamed x494 to x495 




; fr: none.
; freeing x478_0 (r10) no dependants anymore
movzx r10, byte [ rsp + 0x610 ];
; r__rm_rm_rmf
rcr byte [ rsp + 0x5e0 ], 1
adc r10, 0x0



; r__rm_rm_rmf
lea r10, [ r10 + r14 ]



; fr: none.

mov rcx, [ rsp + 0x650 ];






; fr: none.

; stacking up for x479
mov [ rsp + 0x660 ], rbx; spilling x479 to mem
mov rbx, r10;
; r__rm_rm_rmf
lea rbx, [ rbx + r9 ]


; fr: none.

; stacking up for x342
mov [ rsp + 0x668 ], rbx; spilling x342 to mem
mov rbx, 0x4cc7c19e39811d94 ; moving imm to reg


; fr: none.

; stacking up for x487
mov [ rsp + 0x670 ], rcx; spilling x487 to mem
mov rcx, [ rsp + 0x5b0 ];


imul rcx, rbx; lox485 = x427*0x4cc7c19e39811d94


; fr: none.

mov rbx, 0x1eabfffeb153ffff ; moving imm to reg

; fr: none.

; stacking up for x485
mov [ rsp + 0x678 ], rcx; spilling x485 to mem

; fr: none.

; stacking up for x339
mov [ rsp + 0x680 ], r10; spilling x339 to mem

mulx r10, rcx, rbx; x490_1, x490_0<- x471 * 0x1eabfffeb153ffff (_0*_0)


; fr: none.
; freeing x490_0 (rcx) no dependants anymore
mov rcx, [ rsp + 0x608 ]; load m64 x326 to register64


cmp rcx, [ rsp + 0x2c8 ]

; renamed x487 to x488 






; fr: none.

mov rbx, 0x1a0111ea397fe69a ; moving imm to reg

; fr: none.

; stacking up for x491
mov [ rsp + 0x688 ], r10; spilling x491 to mem

; fr: none.


mulx rcx, r10, rbx; x474_1, x474_0<- x471 * 0x1a0111ea397fe69a (_0*_0)

; renamed x491 to x492 


; fr: none.
; freeing x471 (rdx) no dependants anymore
mov rdx, [ rsp + 0x5b0 ]; load m64 x427 to register64

; fr: none.
; freeing x474_0 (r10) no dependants anymore
setc r10b;


cmp rdx, [ rsp + 0x5b8 ]

; renamed x479 to x480 


; fr: none.

setc bl;


cmp [ rsp + 0x680 ], r14


; fr: none.
; freeing x255 (r14) no dependants anymore
setc r14b;


cmp r11, r15








; fr: none.
; freeing x99 (r15) no dependants anymore
mov r15, [ rsp + 0x5c0 ];
;should save CF(x183) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc


; fr: none.
; freeing x182 (r11) no dependants anymore
mov r11, [ rsp + 0x5a0 ]; load m64 x252 to register64


cmp r11, [ rsp + 0x4c8 ]




; fr: none.
; freeing x252 (r11) no dependants anymore
movzx r11, bl;

; fr: none.

; stacking up for x327
mov byte [ rsp + 0x690 ], r10b; spilling byte x327 to mem
mov r10, [ rsp + 0x668 ]; load m64 x342 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r10 ]; r8/64 + m8


; fr: none.
; freeing x428 (bl) no dependants anymore
mov rbx, 0x2a880aa4ed33c7c3 ; moving imm to reg

; fr: none.

; stacking up for x475
mov [ rsp + 0x698 ], rcx; spilling x475 to mem
setc cl;



imul rdx, rbx; lox481 = x427*0x2a880aa4ed33c7c3

; renamed x483 to x484 



cmp r11, r10




; fr: none.

mov rbx, [ rsp + 0x600 ];

; fr: none.

; stacking up for x340
mov byte [ rsp + 0x6a0 ], r14b; spilling byte x340 to mem
mov r14, [ rsp + 0x658 ]; load m64 x495 to register64
; r__rm_rm_rmf
lea rbx, [ rbx + r14 ]; r8/64 + m8




; fr: none.

; stacking up for x279
mov [ rsp + 0x6a8 ], r15; spilling x279 to mem
mov r15, [ rsp + 0x5f8 ];

; fr: none.

; stacking up for x481
mov [ rsp + 0x6b0 ], rdx; spilling x481 to mem
mov rdx, [ rsp + 0x640 ]; load m64 x484 to register64
; r__rm_rm_rmf
lea r15, [ r15 + rdx ]; r8/64 + m8




; fr: none.
; freeing x484 (rdx) no dependants anymore
mov rdx, [ rsp + 0x5f0 ];

; fr: none.

; stacking up for x507
mov [ rsp + 0x6b8 ], r15; spilling x507 to mem
movzx r15, byte [ rsp + 0x5d8 ]; load byte memx795 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + r15 ]; r64+m8




; fr: none.
; freeing x795 (r15) no dependants anymore
movzx r15, cl;

; fr: none.

; stacking up for x798
mov [ rsp + 0x6c0 ], rdx; spilling x798 to mem
movzx rdx, byte [ rsp + 0x630 ]; load byte memx256 to register64
; r__rm_rm_rmf
lea r15, [ r15 + rdx ]; r64+m8


; fr: none.
; freeing x256 (rdx) no dependants anymore
mov rdx, [ rsp + 0x418 ]; load m64 x144 to register64

; fr: none.
; freeing x253 (cl) no dependants anymore
setc cl;


cmp [ rsp + 0x648 ], rdx




; fr: none.
; freeing x144 (rdx) no dependants anymore
mov rdx, [ rsp + 0x678 ];

; fr: none.

; stacking up for x431
mov byte [ rsp + 0x6c8 ], cl; spilling byte x431 to mem
mov rcx, [ rsp + 0x688 ]; load m64 x492 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + rcx ]; r8/64 + m8


; fr: none.
; freeing x492 (rcx) no dependants anymore
setc cl;


cmp rbx, r14



;should save CF(x497) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rdx, 0x0; add CF to r0's alloc



cmp rdx, [ rsp + 0x678 ]




; fr: none.
; freeing x495 (r14) no dependants anymore
mov r14, [ rsp + 0x6b0 ];

; fr: none.

; stacking up for x186
mov byte [ rsp + 0x6d0 ], cl; spilling byte x186 to mem
mov rcx, [ rsp + 0x670 ]; load m64 x488 to register64
; r__rm_rm_rmf
lea r14, [ r14 + rcx ]; r8/64 + m8



;should save CF(x501) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r14, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea r15, [ r15 + r13 ]




; fr: none.
; freeing x488 (rcx) no dependants anymore
mov rcx, r15;
; r__rm_rm_rmf
add rcx, [ rsp + 0x3a8 ]



; r__rm_rm_rmf
lea r11, [ r11 + rsi ]



cmp r11, rsi


; fr: none.
; freeing x398 (rsi) no dependants anymore
setc sil;


cmp r10, r9




; fr: none.
; freeing x314 (r9) no dependants anymore
movzx r9, sil;

; fr: none.
; freeing x342 (r10) no dependants anymore
movzx r10, byte [ rsp + 0x6c8 ]; load byte memx431 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r10 ]; r64+m8




; fr: none.
; freeing x431 (r10) no dependants anymore
mov r10, [ rsp + 0x6a8 ];

; fr: none.
; freeing x434 (sil) no dependants anymore
movzx rsi, byte [ rsp + 0x6d0 ]; load byte memx186 to register64
; r__rm_rm_rmf
lea r10, [ r10 + rsi ]; r64+m8




; fr: none.
; freeing x186 (rsi) no dependants anymore
movzx rsi, byte [ rsp + 0x6a0 ];
;should save CF(x343) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rsi, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea rsi, [ rsi + rcx ]




; fr: none.

; stacking up for x280
mov [ rsp + 0x6d8 ], r10; spilling x280 to mem
mov r10, rsi;
; r__rm_rm_rmf
add r10, [ rsp + 0x548 ]



cmp rsi, rcx




; fr: none.
; freeing x346 (rsi) no dependants anymore
mov rsi, r11;

; fr: none.

; stacking up for x436
mov [ rsp + 0x6e0 ], r9; spilling x436 to mem
movzx r9, byte [ rsp + 0x5d0 ]; load byte memx516 to register64
; r__rm_rm_rmf
lea rsi, [ rsi + r9 ]; r64+m8


; fr: none.
; freeing x516 (r9) no dependants anymore
setc r9b;


cmp rsi, r11



; r__rm_rm_rmf
lea rsi, [ rsi + rbx ]


; fr: none.
; freeing x433 (r11) no dependants anymore
setc r11b;


cmp rcx, [ rsp + 0x3a8 ]


; fr: none.
; freeing x262 (rcx) no dependants anymore
setc cl;


cmp r15, r13




; fr: none.
; freeing x171 (r13) no dependants anymore
mov r13, rsi;

; fr: none.
; freeing x259 (r15) no dependants anymore
mov r15, [ rsp + 0xf8 ]; load m64 x580 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r15 ]; r8/64 + m8




; fr: none.
; freeing x580 (r15) no dependants anymore
movzx r15, cl;
;should save CF(x260) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc



cmp r10, [ rsp + 0x548 ]


; fr: none.
; freeing x263 (cl) no dependants anymore
mov rcx, 0x48669f39fb24c32 ; moving imm to reg

; fr: none.

; stacking up for x265
mov [ rsp + 0x6e8 ], r15; spilling x265 to mem
setc r15b;


; fr: none.

; stacking up for x504
mov [ rsp + 0x6f0 ], r14; spilling x504 to mem
mov r14, r13;


imul r14, rcx; lox658 = x613*0x48669f39fb24c32


; fr: none.

mov rcx, 0x60fec0aec070003 ; moving imm to reg


; fr: none.

; stacking up for x658
mov [ rsp + 0x6f8 ], r14; spilling x658 to mem
mov r14, r13;


imul r14, rcx; lox675 = x613*0x60fec0aec070003



cmp rsi, rbx




; fr: none.
; freeing x496 (rbx) no dependants anymore
movzx rbx, r11b;
;should save CF(x522) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rbx, 0x0; add CF to r0's alloc




; fr: none.
; freeing x519 (r11b) no dependants anymore
movzx r11, r15b;
; r__rm_rm_rmf
movzx r9, r9b
add r11, r9



cmp r13, rsi


; fr: none.
; freeing x347 (r9b) no dependants anymore
mov r9, -0x760c000300030003 ; moving imm to reg

; fr: none.
; freeing x521 (rsi) no dependants anymore
setc sil;


; fr: none.
; freeing x350 (r15b) no dependants anymore
mov r15, r13;


imul r15, r9; lox657 = x613*-0x760c000300030003


; fr: none.

mov rcx, 0x1a0111ea397fe69a ; moving imm to reg
xchg rdx, rcx; 0x1a0111ea397fe69a, swapping with x500, which is currently in rdx

; fr: none.


; fr: none.

; stacking up for x352
mov [ rsp + 0x700 ], r11; spilling x352 to mem

mulx r11, r9, r15; x660_1, x660_0<- x657 * 0x1a0111ea397fe69a (_0*_0)


; fr: none.
; freeing x660_0 (r9) no dependants anymore
mov r9, [ rsp + 0x6b0 ]; load m64 x481 to register64


cmp [ rsp + 0x6f0 ], r9


; fr: none.
; freeing x481 (r9) no dependants anymore
mov r9, 0x1eabfffeb153ffff ; moving imm to reg
mov rdx, r9; 0x1eabfffeb153ffff to rdx

; fr: r9

; fr: none.

; stacking up for x675
mov [ rsp + 0x708 ], r14; spilling x675 to mem

mulx r14, r9, r15; x676_1, x676_0<- x657 * 0x1eabfffeb153ffff (_0*_0)




; fr: none.
; freeing x676_0 (r9) no dependants anymore
mov r9, [ rsp + 0x6b8 ];
;should save CF(x505) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r9, 0x0; add CF to r0's alloc



cmp r9, [ rsp + 0x5f8 ]




; fr: none.

mov rdx, r10;

; fr: none.

; stacking up for x614
mov byte [ rsp + 0x710 ], sil; spilling byte x614 to mem
mov rsi, [ rsp + 0x6e0 ]; load m64 x436 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + rsi ]; r8/64 + m8




; fr: none.
; freeing x436 (rsi) no dependants anymore
mov rsi, rdx;
; r__rm_rm_rmf
lea rsi, [ rsi + r12 ]







; r__rm_rm_rmf
lea rbx, [ rbx + rsi ]


; fr: none.

; stacking up for x677
mov [ rsp + 0x718 ], r14; spilling x677 to mem
mov r14, 0x4b1ba7b6434bacd7 ; moving imm to reg
xchg rdx, r15; x657, swapping with x437, which is currently in rdx

; fr: none.

; stacking up for x660_1
mov [ rsp + 0x720 ], r11; spilling x660_1 to mem

; fr: none.

; stacking up for x525
mov [ rsp + 0x728 ], rbx; spilling x525 to mem

mulx rbx, r11, r14; x664_1, x664_0<- x657 * 0x4b1ba7b6434bacd7 (_0*_0)





; renamed x665 to x666 


; fr: none.
; freeing x664_0 (r11) no dependants anymore
mov r11, 0xb9feffffffffaaab ; moving imm to reg

; fr: none.


; fr: none.

; stacking up for x666
mov [ rsp + 0x730 ], rbx; spilling x666 to mem

mulx rbx, r14, r11; x679_1, x679_0<- x657 * 0xb9feffffffffaaab (_0*_0)




; fr: none.
; freeing x679_0 (r14) no dependants anymore
mov r14, [ rsp + 0x5e8 ];

; fr: none.

mov r11, [ rsp + 0x660 ]; load m64 x480 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r11 ]; r8/64 + m8


; fr: none.
; freeing x480 (r11) no dependants anymore
setc r11b;


cmp rsi, r12




; fr: none.
; freeing x402 (r12) no dependants anymore
movzx r12, r11b;
; r__rm_rm_rmf
lea r12, [ r12 + r14 ]




; fr: none.
; freeing x509 (r11b) no dependants anymore
mov r11, rcx;

; fr: none.
; freeing x511 (r14) no dependants anymore
mov r14, [ rsp + 0x728 ]; load m64 x525 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r14 ]; r8/64 + m8


; fr: none.

; stacking up for x512
mov [ rsp + 0x738 ], r12; spilling x512 to mem
setc r12b;


cmp r11, rcx



; fr: none.
; freeing x500 (rcx) no dependants anymore
mov rcx, [ rsp + 0x720 ];




; fr: none.

; stacking up for x661
mov [ rsp + 0x740 ], rcx; spilling x661 to mem
setc cl;


cmp r15, r10


; fr: none.
; freeing x349 (r10) no dependants anymore
mov r10, 0x64774b84f38512bf ; moving imm to reg

; fr: none.
; freeing x437 (r15) no dependants anymore

; fr: none.

; stacking up for x529
mov byte [ rsp + 0x748 ], cl; spilling byte x529 to mem

mulx rcx, r15, r10; x668_1, x668_0<- x657 * 0x64774b84f38512bf (_0*_0)




; fr: none.
; freeing x668_0 (r15) no dependants anymore
movzx r15, r12b;
;should save CF(x438) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc





; renamed x680 to x681 



cmp r14, rsi


; fr: none.
; freeing x440 (rsi) no dependants anymore
mov rsi, 0x6730d2a0f6b0f624 ; moving imm to reg

; fr: none.
; freeing x525 (r14) no dependants anymore

; fr: none.
; freeing x441 (r12b) no dependants anymore

mulx r12, r14, rsi; x672_1, x672_0<- x657 * 0x6730d2a0f6b0f624 (_0*_0)

; renamed x475 to x476 




; fr: none.
; freeing x657 (rdx) no dependants anymore
mov rdx, r11;

; fr: none.
; freeing x672_0 (r14) no dependants anymore
movzx r14, byte [ rsp + 0x710 ]; load byte memx614 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + r14 ]; r64+m8








; fr: none.
; freeing x614 (r14) no dependants anymore
movzx r14, byte [ rsp + 0x748 ];
;should save CF(x526) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r14, 0x0; add CF to r0's alloc


; fr: none.

mov r10, [ rsp + 0x5e8 ]; load m64 x472 to register64


cmp [ rsp + 0x738 ], r10




; fr: none.
; freeing x472 (r10) no dependants anymore
mov r10, [ rsp + 0x6f8 ];

; fr: none.

mov rsi, [ rsp + 0x730 ]; load m64 x666 to register64
; r__rm_rm_rmf
lea r10, [ r10 + rsi ]; r8/64 + m8

; renamed x673 to x674 


; fr: none.
; freeing x666 (rsi) no dependants anymore
mov rsi, 0x4cc7c19e39811d94 ; moving imm to reg

; fr: none.

; stacking up for x531
mov [ rsp + 0x750 ], r14; spilling x531 to mem
setc r14b;


; fr: none.

; stacking up for x443
mov [ rsp + 0x758 ], r15; spilling x443 to mem
mov r15, r13;


imul r15, rsi; lox671 = x613*0x4cc7c19e39811d94







cmp rdx, r11

; renamed x677 to x678 


; fr: none.
; freeing x528 (r11) no dependants anymore
mov r11, 0x299338752f97f97b ; moving imm to reg

; fr: none.

setc sil;


; fr: none.

; stacking up for x513
mov byte [ rsp + 0x760 ], r14b; spilling byte x513 to mem
mov r14, r13;


imul r14, r11; lox663 = x613*0x299338752f97f97b

; renamed x669 to x670 




; fr: none.

mov r11, rbx;
; r__rm_rm_rmf
add r11, [ rsp + 0x708 ]




; fr: none.

; stacking up for x617
mov byte [ rsp + 0x768 ], sil; spilling byte x617 to mem
mov rsi, r15;
; r__rm_rm_rmf
add rsi, [ rsp + 0x718 ]



cmp r11, rbx



;should save CF(x683) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rsi, 0x0; add CF to r0's alloc


; fr: none.
; freeing x681 (rbx) no dependants anymore
mov rbx, 0x2a880aa4ed33c7c3 ; moving imm to reg


; fr: none.

; stacking up for x697
mov [ rsp + 0x770 ], r10; spilling x697 to mem
mov r10, r13;


imul r10, rbx; lox667 = x613*0x2a880aa4ed33c7c3




; fr: none.

mov rbx, r14;
; r__rm_rm_rmf
lea rbx, [ rbx + rcx ]



cmp rsi, r15




; fr: none.
; freeing x671 (r15) no dependants anymore
mov r15, r10;
; r__rm_rm_rmf
lea r15, [ r15 + r12 ]



; r__rm_rm_rmf
lea rdx, [ rdx + rdi ]



;should save CF(x687) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc



cmp rdx, rdi


; fr: none.
; freeing x584 (rdi) no dependants anymore
setc dil;


cmp r15, r10




; fr: none.
; freeing x674 (r12) no dependants anymore
mov r12, [ rsp + 0x6e8 ];

; fr: none.
; freeing x670 (rcx) no dependants anymore
mov rcx, [ rsp + 0x628 ]; load m64 x178 to register64
; r__rm_rm_rmf
lea r12, [ r12 + rcx ]; r8/64 + m8


; fr: none.
; freeing x667 (r10) no dependants anymore
setc r10b;


cmp r12, rcx




; fr: none.
; freeing x178 (rcx) no dependants anymore
mov rcx, [ rsp + 0x4f0 ]; load m64 x230 to register64
; r__rm_rm_rmf
lea r12, [ r12 + rcx ]; r8/64 + m8


; fr: none.

; stacking up for x770
mov [ rsp + 0x778 ], rbp; spilling x770 to mem
setc bpl;


cmp qword r13, 0x0

; fr: none.

; stacking up for x620
mov byte [ rsp + 0x780 ], dil; spilling byte x620 to mem
setne dil; setCC x702 to reg (rdi)




; fr: none.
; freeing x613 (r13) no dependants anymore
movzx r13, dil;
; r__rm_rm_rmf
lea r13, [ r13 + rdx ]




; fr: none.
; freeing x702 (dil) no dependants anymore
mov rdi, r12;
; r__rm_rm_rmf
add rdi, [ rsp + 0x700 ]




; fr: none.

; stacking up for x691
mov byte [ rsp + 0x788 ], r10b; spilling byte x691 to mem
mov r10, rdi;
; r__rm_rm_rmf
add r10, [ rsp + 0x590 ]




; fr: none.

; stacking up for x693
mov [ rsp + 0x790 ], rbx; spilling x693 to mem
mov rbx, r13;
; r__rm_rm_rmf
lea rbx, [ rbx + r11 ]



cmp rdi, r12


; fr: none.
; freeing x353 (rdi) no dependants anymore
setc dil;


cmp r12, rcx




; fr: none.
; freeing x230 (rcx) no dependants anymore
movzx rcx, bpl;
;should save CF(x270) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rcx, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
add rcx, [ rsp + 0x648 ]



cmp r10, [ rsp + 0x590 ]




; fr: none.
; freeing x267 (bpl) no dependants anymore
mov rbp, [ rsp + 0x790 ];

; fr: none.
; freeing x269 (r12) no dependants anymore
movzx r12, byte [ rsp + 0x788 ]; load byte memx691 to register64
; r__rm_rm_rmf
lea rbp, [ rbp + r12 ]; r64+m8




; fr: none.
; freeing x691 (r12) no dependants anymore
mov r12, rbx;

; fr: none.

; stacking up for x694
mov [ rsp + 0x798 ], rbp; spilling x694 to mem
mov rbp, [ rsp + 0xb0 ]; load m64 x766 to register64
; r__rm_rm_rmf
lea r12, [ r12 + rbp ]; r8/64 + m8


; fr: none.
; freeing x766 (rbp) no dependants anymore
mov rbp, -0x760c000300030003 ; moving imm to reg

; fr: none.

; stacking up for x354
mov byte [ rsp + 0x7a0 ], dil; spilling byte x354 to mem
setc dil;


; fr: none.

; stacking up for x273
mov [ rsp + 0x7a8 ], rcx; spilling x273 to mem
mov rcx, r12;


imul rcx, rbp; lox843 = x799*-0x760c000300030003


; fr: none.

mov rbp, [ rsp + 0x7a8 ]; load m64 x273 to register64


cmp rbp, [ rsp + 0x648 ]


; fr: none.

; stacking up for x843
mov [ rsp + 0x7b0 ], rcx; spilling x843 to mem
mov rcx, 0x60fec0aec070003 ; moving imm to reg

; fr: none.

; stacking up for x357
mov byte [ rsp + 0x7b8 ], dil; spilling byte x357 to mem
setc dil;


; fr: none.

mov rbp, r12;


imul rbp, rcx; lox861 = x799*0x60fec0aec070003


; fr: none.

mov rcx, 0x4cc7c19e39811d94 ; moving imm to reg


; fr: none.

; stacking up for x861
mov [ rsp + 0x7c0 ], rbp; spilling x861 to mem
mov rbp, r12;


imul rbp, rcx; lox857 = x799*0x4cc7c19e39811d94




; fr: none.

movzx rcx, dil;
; r__rm_rm_rmf
add rcx, [ rsp + 0x6d8 ]



cmp rbx, r11




; fr: none.
; freeing x682 (r11) no dependants anymore
movzx r11, byte [ rsp + 0x7b8 ];

; fr: none.
; freeing x274 (dil) no dependants anymore
movzx rdi, byte [ rsp + 0x7a0 ]; load byte memx354 to register64
; r__rm_rm_rmf
lea r11, [ r11 + rdi ]; r64+m8


; fr: none.
; freeing x354 (rdi) no dependants anymore
setc dil;


cmp [ rsp + 0x798 ], r14




; fr: none.
; freeing x663 (r14) no dependants anymore
mov r14, [ rsp + 0x770 ];
;should save CF(x695) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r14, 0x0; add CF to r0's alloc



cmp qword r12, 0x0

; fr: none.

; stacking up for x698
mov [ rsp + 0x7c8 ], r14; spilling x698 to mem
setne r14b; setCC x888 to reg (r14)



cmp r12, rbx


; fr: none.
; freeing x707 (rbx) no dependants anymore
mov rbx, 0x299338752f97f97b ; moving imm to reg

; fr: none.

; stacking up for x888
mov byte [ rsp + 0x7d0 ], r14b; spilling byte x888 to mem
setc r14b;


; fr: none.

; stacking up for x708
mov byte [ rsp + 0x7d8 ], dil; spilling byte x708 to mem
mov rdi, r12;


imul rdi, rbx; lox849 = x799*0x299338752f97f97b


; fr: none.

mov rbx, 0x64774b84f38512bf ; moving imm to reg

; fr: none.

; stacking up for x800
mov byte [ rsp + 0x7e0 ], r14b; spilling byte x800 to mem
mov r14, rdx; preserving value of x619 into a new reg
mov rdx, [ rsp + 0x7b0 ]; saving x843 in rdx.

; fr: none.

; stacking up for x281
mov [ rsp + 0x7e8 ], rcx; spilling x281 to mem

; fr: none.

; stacking up for x857
mov [ rsp + 0x7f0 ], rbp; spilling x857 to mem

mulx rbp, rcx, rbx; x854_1, x854_0<- x843 * 0x64774b84f38512bf (_0*_0)





; renamed x855 to x856 




; fr: none.
; freeing x854_0 (rcx) no dependants anymore
mov rcx, [ rsp + 0x7a8 ];
; r__rm_rm_rmf
add rcx, [ rsp + 0x5a8 ]




; fr: none.

mov rbx, r10;
; r__rm_rm_rmf
add rbx, [ rsp + 0x758 ]



; r__rm_rm_rmf
lea r11, [ r11 + rcx ]


; fr: none.

; stacking up for x360
mov [ rsp + 0x7f8 ], r11; spilling x360 to mem
mov r11, 0x1eabfffeb153ffff ; moving imm to reg

; fr: none.

; stacking up for x856
mov [ rsp + 0x800 ], rbp; spilling x856 to mem

; fr: none.

; stacking up for x849
mov [ rsp + 0x808 ], rdi; spilling x849 to mem

mulx rdi, rbp, r11; x862_1, x862_0<- x843 * 0x1eabfffeb153ffff (_0*_0)








; fr: none.
; freeing x862_0 (rbp) no dependants anymore
mov rbp, rbx;
; r__rm_rm_rmf
add rbp, [ rsp + 0x2e8 ]



cmp rbx, r10


; fr: none.
; freeing x356 (r10) no dependants anymore
mov r10, 0x4b1ba7b6434bacd7 ; moving imm to reg

; fr: none.
; freeing x444 (rbx) no dependants anymore

; fr: none.


mulx r11, rbx, r10; x850_1, x850_0<- x843 * 0x4b1ba7b6434bacd7 (_0*_0)






; fr: none.
; freeing x850_0 (rbx) no dependants anymore
mov rbx, 0xb9feffffffffaaab ; moving imm to reg

; fr: none.


; fr: none.

; stacking up for x447
mov [ rsp + 0x810 ], rbp; spilling x447 to mem

mulx rbp, r10, rbx; x865_1, x865_0<- x843 * 0xb9feffffffffaaab (_0*_0)

; renamed x851 to x852 


; fr: none.
; freeing x865_0 (r10) no dependants anymore
setc r10b;


cmp rcx, [ rsp + 0x5a8 ]




; fr: none.

mov rbx, [ rsp + 0x808 ];

; fr: none.

; stacking up for x852
mov [ rsp + 0x818 ], r11; spilling x852 to mem
mov r11, [ rsp + 0x800 ]; load m64 x856 to register64
; r__rm_rm_rmf
lea rbx, [ rbx + r11 ]; r8/64 + m8


; fr: none.
; freeing x856 (r11) no dependants anymore
mov r11, 0x2a880aa4ed33c7c3 ; moving imm to reg

; fr: none.

; stacking up for x879
mov [ rsp + 0x820 ], rbx; spilling x879 to mem
setc bl;


; fr: none.

; stacking up for x445
mov byte [ rsp + 0x828 ], r10b; spilling byte x445 to mem
mov r10, r12;


imul r10, r11; lox853 = x799*0x2a880aa4ed33c7c3





; renamed x866 to x867 

; renamed x863 to x864 



; r__rm_rm_rmf
add rdi, [ rsp + 0x7f0 ]




; fr: none.

movzx r11, bl;
; r__rm_rm_rmf
add r11, [ rsp + 0x7e8 ]




; fr: none.
; freeing x277 (bl) no dependants anymore
mov rbx, rbp;
; r__rm_rm_rmf
add rbx, [ rsp + 0x7c0 ]



cmp rbx, rbp


; fr: none.
; freeing x867 (rbp) no dependants anymore
setc bpl;


cmp r11, [ rsp + 0x5c0 ]




; fr: none.

; stacking up for x853
mov [ rsp + 0x830 ], r10; spilling x853 to mem
movzx r10, bpl;
; r__rm_rm_rmf
lea r10, [ r10 + rdi ]


; fr: none.
; freeing x871 (rdi) no dependants anymore
mov rdi, [ rsp + 0x810 ]; load m64 x447 to register64

; fr: none.
; freeing x869 (bpl) no dependants anymore
setc bpl;


cmp rdi, [ rsp + 0x2e8 ]


; fr: none.

; stacking up for x872
mov [ rsp + 0x838 ], r10; spilling x872 to mem
mov r10, 0x6730d2a0f6b0f624 ; moving imm to reg

; fr: none.

; stacking up for x283
mov byte [ rsp + 0x840 ], bpl; spilling byte x283 to mem

; fr: none.


mulx rdi, rbp, r10; x858_1, x858_0<- x843 * 0x6730d2a0f6b0f624 (_0*_0)






; fr: none.
; freeing x858_0 (rbp) no dependants anymore
mov rbp, 0x1a0111ea397fe69a ; moving imm to reg

; fr: none.


; fr: none.

; stacking up for x859
mov [ rsp + 0x848 ], rdi; spilling x859 to mem

mulx rdi, r10, rbp; x846_1, x846_0<- x843 * 0x1a0111ea397fe69a (_0*_0)




; fr: none.
; freeing x843 (rdx) no dependants anymore
movzx rdx, byte [ rsp + 0x828 ];
;should save CF(x448) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rdx, 0x0; add CF to r0's alloc




; fr: none.
; freeing x846_0 (r10) no dependants anymore
mov r10, [ rsp + 0x5c8 ];
; r__rm_rm_rmf
rcr byte [ rsp + 0x840 ], 1
adc r10, 0x0


; fr: none.

mov rbp, 0x48669f39fb24c32 ; moving imm to reg



imul r12, rbp; lox844 = x799*0x48669f39fb24c32








; fr: none.

mov rbp, r12;
; r__rm_rm_rmf
add rbp, [ rsp + 0x818 ]

; renamed x859 to x860 




; fr: none.

; stacking up for x847
mov [ rsp + 0x850 ], rdi; spilling x847 to mem
mov rdi, [ rsp + 0x750 ];
; r__rm_rm_rmf
add rdi, [ rsp + 0x810 ]




; fr: none.

; stacking up for x883
mov [ rsp + 0x858 ], rbp; spilling x883 to mem
mov rbp, [ rsp + 0x7f8 ];
; r__rm_rm_rmf
add rbp, [ rsp + 0x608 ]



cmp rbp, [ rsp + 0x608 ]



; r__rm_rm_rmf
lea rdx, [ rdx + rbp ]


; fr: none.

; stacking up for x464
mov [ rsp + 0x860 ], r10; spilling x464 to mem
mov r10, [ rsp + 0x7f0 ]; load m64 x857 to register64

; fr: none.

; stacking up for x532
mov [ rsp + 0x868 ], rdi; spilling x532 to mem
setc dil;


cmp [ rsp + 0x838 ], r10




; fr: none.
; freeing x857 (r10) no dependants anymore
mov r10, rdx;

; fr: none.

; stacking up for x364
mov byte [ rsp + 0x870 ], dil; spilling byte x364 to mem
mov rdi, [ rsp + 0x4e0 ]; load m64 x415 to register64
; r__rm_rm_rmf
lea r10, [ r10 + rdi ]; r8/64 + m8




; fr: none.

; stacking up for x454
mov [ rsp + 0x878 ], r10; spilling x454 to mem
mov r10, [ rsp + 0x868 ];

; fr: none.

; stacking up for x451
mov [ rsp + 0x880 ], rdx; spilling x451 to mem
mov rdx, [ rsp + 0x6f0 ]; load m64 x504 to register64
; r__rm_rm_rmf
lea r10, [ r10 + rdx ]; r8/64 + m8


; fr: none.

; stacking up for x363
mov [ rsp + 0x888 ], rbp; spilling x363 to mem
setc bpl;


cmp r10, rdx




; fr: none.
; freeing x504 (rdx) no dependants anymore
mov rdx, [ rsp + 0x830 ];

; fr: none.

; stacking up for x873
mov byte [ rsp + 0x890 ], bpl; spilling byte x873 to mem
mov rbp, [ rsp + 0x848 ]; load m64 x860 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + rbp ]; r8/64 + m8




; fr: none.
; freeing x860 (rbp) no dependants anymore
movzx rbp, byte [ rsp + 0x890 ]; load byte memx873 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + rbp ]; r64+m8




; fr: none.
; freeing x873 (rbp) no dependants anymore
movzx rbp, byte [ rsp + 0x780 ];

; fr: none.

; stacking up for x876
mov [ rsp + 0x898 ], rdx; spilling x876 to mem
movzx rdx, byte [ rsp + 0x768 ]; load byte memx617 to register64
; r__rm_rm_rmf
lea rbp, [ rbp + rdx ]; r64+m8



; r__rm_rm_rmf
lea rbp, [ rbp + r10 ]


; fr: none.
; freeing x617 (rdx) no dependants anymore
mov rdx, [ rsp + 0x898 ]; load m64 x876 to register64

; fr: none.

; stacking up for x623
mov [ rsp + 0x8a0 ], rbp; spilling x623 to mem
setc bpl;


cmp rdx, [ rsp + 0x830 ]




; fr: none.

; stacking up for x536
mov byte [ rsp + 0x8a8 ], bpl; spilling byte x536 to mem
mov rbp, [ rsp + 0x820 ];
;should save CF(x877) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rbp, 0x0; add CF to r0's alloc



cmp [ rsp + 0x7f8 ], rcx




; fr: none.
; freeing x276 (rcx) no dependants anymore
movzx rcx, byte [ rsp + 0x870 ];
;should save CF(x361) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rcx, 0x0; add CF to r0's alloc



cmp r13, r14




; fr: none.
; freeing x619 (r14) no dependants anymore
movzx r14, byte [ rsp + 0x7d8 ];
;should save CF(x705) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r14, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea rcx, [ rcx + r11 ]




; fr: none.
; freeing x704 (r13) no dependants anymore
movzx r13, byte [ rsp + 0x690 ];
; r__rm_rm_rmf
add r13, [ rsp + 0x3f8 ]




; fr: none.

; stacking up for x880
mov [ rsp + 0x8b0 ], rbp; spilling x880 to mem
mov rbp, rcx;
; r__rm_rm_rmf
lea rbp, [ rbp + r13 ]


; fr: none.

; stacking up for x710
mov [ rsp + 0x8b8 ], r14; spilling x710 to mem
mov r14, [ rsp + 0x810 ]; load m64 x447 to register64


cmp [ rsp + 0x868 ], r14


; fr: none.
; freeing x447 (r14) no dependants anymore
setc r14b;


cmp rbp, r13


; fr: none.
; freeing x329 (r13) no dependants anymore
setc r13b;


cmp rcx, r11


; fr: none.
; freeing x282 (r11) no dependants anymore
setc r11b;


cmp [ rsp + 0x878 ], rdi




; fr: none.
; freeing x415 (rdi) no dependants anymore
movzx rdi, r14b;

; fr: none.
; freeing x367 (rcx) no dependants anymore
movzx rcx, byte [ rsp + 0x8a8 ]; load byte memx536 to register64
; r__rm_rm_rmf
lea rdi, [ rdi + rcx ]; r64+m8




; fr: none.
; freeing x536 (rcx) no dependants anymore
mov rcx, [ rsp + 0x8a0 ];

; fr: none.
; freeing x533 (r14b) no dependants anymore
mov r14, [ rsp + 0x250 ]; load m64 x588 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r14 ]; r8/64 + m8




; fr: none.

; stacking up for x371
mov byte [ rsp + 0x8c0 ], r13b; spilling byte x371 to mem
mov r13, rcx;

; fr: none.

; stacking up for x368
mov byte [ rsp + 0x8c8 ], r11b; spilling byte x368 to mem
mov r11, [ rsp + 0x8b8 ]; load m64 x710 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r11 ]; r8/64 + m8


; fr: none.
; freeing x710 (r11) no dependants anymore
setc r11b;


cmp r13, rcx



; r__rm_rm_rmf
lea r13, [ r13 + rsi ]


; fr: none.

; stacking up for x455
mov byte [ rsp + 0x8d0 ], r11b; spilling byte x455 to mem
setc r11b;


cmp r13, rsi


; fr: none.
; freeing x686 (rsi) no dependants anymore
setc sil;


cmp rcx, r14


; fr: none.
; freeing x588 (r14) no dependants anymore
setc r14b;


cmp [ rsp + 0x8a0 ], r10




; fr: none.
; freeing x535 (r10) no dependants anymore
movzx r10, sil;
; r__rm_rm_rmf
movzx r11, r11b
lea r10, [ r10 + r11 ]




; fr: none.
; freeing x626 (rcx) no dependants anymore
movzx rcx, r14b;
;should save CF(x624) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rcx, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
add rdi, [ rsp + 0x878 ]


; fr: none.
; freeing x712 (r11b) no dependants anymore
mov r11, [ r8 + 0x0 ]; load m64 x952 to register64


imul r11, [ rax + 0x28 ]; lox952 = arg4[0]*arg2[5]




; fr: none.
; freeing x715 (sil) no dependants anymore
mov rsi, [ rsp + 0x860 ];
; r__rm_rm_rmf
rcr byte [ rsp + 0x8c8 ], 1
adc rsi, 0x0



cmp rdi, [ rsp + 0x878 ]




; fr: none.
; freeing x627 (r14b) no dependants anymore
movzx r14, byte [ rsp + 0x8c0 ]; load byte memx371 to register64
; r__rm_rm_rmf
lea rsi, [ rsi + r14 ]; r64+m8


; fr: none.
; freeing x371 (r14) no dependants anymore
mov r14, [ rsp + 0x880 ]; load m64 x451 to register64

; fr: none.

; stacking up for x952
mov [ rsp + 0x8d8 ], r11; spilling x952 to mem
setc r11b;


cmp r14, [ rsp + 0x888 ]




; fr: none.
; freeing x451 (r14) no dependants anymore
movzx r14, byte [ rsp + 0x8d0 ];
;should save CF(x452) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r14, 0x0; add CF to r0's alloc


; fr: none.

; stacking up for x540
mov byte [ rsp + 0x8e0 ], r11b; spilling byte x540 to mem
mov r11, [ rsp + 0x808 ]; load m64 x849 to register64


cmp [ rsp + 0x8b0 ], r11



; r__rm_rm_rmf
lea rdi, [ rdi + r9 ]



; r__rm_rm_rmf
lea r14, [ r14 + rbp ]




; fr: none.
; freeing x849 (r11) no dependants anymore
mov r11, r13;

; fr: none.

; stacking up for x466
mov [ rsp + 0x8e8 ], rsi; spilling x466 to mem
movzx rsi, byte [ rsp + 0x7e0 ]; load byte memx800 to register64
; r__rm_rm_rmf
lea r11, [ r11 + rsi ]; r64+m8




; fr: none.
; freeing x800 (rsi) no dependants anymore
mov rsi, [ rsp + 0x858 ];
;should save CF(x881) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rsi, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea rcx, [ rcx + rdi ]



cmp r14, rbp




; fr: none.
; freeing x370 (rbp) no dependants anymore
mov rbp, rcx;

; fr: none.

; stacking up for x884
mov [ rsp + 0x8f0 ], rsi; spilling x884 to mem
mov rsi, [ rsp + 0x398 ]; load m64 x594 to register64
; r__rm_rm_rmf
lea rbp, [ rbp + rsi ]; r8/64 + m8



; r__rm_rm_rmf
lea r10, [ r10 + rbp ]


; fr: none.

; stacking up for x802
mov [ rsp + 0x8f8 ], r11; spilling x802 to mem
setc r11b;


cmp r10, rbp


; fr: none.

; stacking up for x459
mov byte [ rsp + 0x900 ], r11b; spilling byte x459 to mem
setc r11b;


cmp rbp, rsi


; fr: none.
; freeing x594 (rsi) no dependants anymore
setc sil;


cmp [ rsp + 0x8f8 ], r13




; fr: none.
; freeing x714 (r13) no dependants anymore
mov r13, [ rsp + 0x8f8 ];

; fr: none.
; freeing x633 (rbp) no dependants anymore
mov rbp, [ rsp + 0x778 ]; load m64 x770 to register64
; r__rm_rm_rmf
lea r13, [ r13 + rbp ]; r8/64 + m8


; fr: none.

; stacking up for x719
mov byte [ rsp + 0x908 ], r11b; spilling byte x719 to mem
setc r11b;


cmp r13, rbp




; fr: none.
; freeing x770 (rbp) no dependants anymore
mov rbp, r13;

; fr: none.

; stacking up for x803
mov byte [ rsp + 0x910 ], r11b; spilling byte x803 to mem
movzx r11, byte [ rsp + 0x7d0 ]; load byte memx888 to register64
; r__rm_rm_rmf
lea rbp, [ rbp + r11 ]; r64+m8


; fr: none.
; freeing x888 (r11) no dependants anymore
setc r11b;


cmp rbp, r13



; r__rm_rm_rmf
lea r10, [ r10 + r15 ]




; fr: none.
; freeing x805 (r13) no dependants anymore
mov r13, [ rsp + 0x4f8 ]; load m64 x422 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r13 ]; r8/64 + m8


; fr: none.

; stacking up for x721
mov [ rsp + 0x918 ], r10; spilling x721 to mem
setc r10b;


cmp rcx, rdi


; fr: none.
; freeing x630 (rcx) no dependants anymore
setc cl;


cmp r14, r13




; fr: none.
; freeing x422 (r13) no dependants anymore
mov r13, [ rsp + 0x8e8 ];

; fr: none.

; stacking up for x891
mov byte [ rsp + 0x920 ], r10b; spilling byte x891 to mem
movzx r10, byte [ rsp + 0x900 ]; load byte memx459 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r10 ]; r64+m8




; fr: none.
; freeing x459 (r10) no dependants anymore
movzx r10, sil;
; r__rm_rm_rmf
movzx rcx, cl
lea r10, [ r10 + rcx ]




; fr: none.
; freeing x634 (sil) no dependants anymore
movzx rsi, r11b;

; fr: none.
; freeing x631 (cl) no dependants anymore
movzx rcx, byte [ rsp + 0x910 ]; load byte memx803 to register64
; r__rm_rm_rmf
lea rsi, [ rsi + rcx ]; r64+m8




; fr: none.
; freeing x803 (rcx) no dependants anymore
mov rcx, [ rsp + 0x918 ]; load m64 x721 to register64
; r__rm_rm_rmf
lea rsi, [ rsi + rcx ]; r8/64 + m8



; r__rm_rm_rmf
lea rbp, [ rbp + rbx ]




; fr: none.
; freeing x806 (r11b) no dependants anymore
mov r11, rbp;

; fr: none.

; stacking up for x467
mov [ rsp + 0x928 ], r13; spilling x467 to mem
mov r13, [ rsp + 0x8d8 ]; load m64 x952 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r13 ]; r8/64 + m8


; fr: none.
; freeing x952 (r13) no dependants anymore
mov r13, -0x760c000300030003 ; moving imm to reg

; fr: none.

; stacking up for x636
mov [ rsp + 0x930 ], r10; spilling x636 to mem
setc r10b;


; fr: none.

; stacking up for x809
mov [ rsp + 0x938 ], rsi; spilling x809 to mem
mov rsi, r11;


imul rsi, r13; lox1029 = x985*-0x760c000300030003


; fr: none.

mov r13, 0x60fec0aec070003 ; moving imm to reg


; fr: none.

; stacking up for x462
mov byte [ rsp + 0x940 ], r10b; spilling byte x462 to mem
mov r10, r11;


imul r10, r13; lox1047 = x985*0x60fec0aec070003


; fr: none.

mov r13, 0x4cc7c19e39811d94 ; moving imm to reg


; fr: none.

; stacking up for x1047
mov [ rsp + 0x948 ], r10; spilling x1047 to mem
mov r10, r11;


imul r10, r13; lox1043 = x985*0x4cc7c19e39811d94



cmp [ rsp + 0x938 ], rcx


; fr: none.

mov r13, 0x1a0111ea397fe69a ; moving imm to reg
xchg rdx, rsi; x1029, swapping with x876, which is currently in rdx

; fr: none.

; stacking up for x1043
mov [ rsp + 0x950 ], r10; spilling x1043 to mem

; fr: none.

; stacking up for x985
mov [ rsp + 0x958 ], r11; spilling x985 to mem

mulx r11, r10, r13; x1032_1, x1032_0<- x1029 * 0x1a0111ea397fe69a (_0*_0)






; fr: none.
; freeing x1032_0 (r10) no dependants anymore
mov r10, 0x64774b84f38512bf ; moving imm to reg

; fr: none.


; fr: none.

; stacking up for x1033
mov [ rsp + 0x960 ], r11; spilling x1033 to mem

mulx r11, r13, r10; x1040_1, x1040_0<- x1029 * 0x64774b84f38512bf (_0*_0)


; fr: none.
; freeing x1040_0 (r13) no dependants anymore
setc r13b;


cmp rbp, rbx




; fr: none.
; freeing x868 (rbx) no dependants anymore
mov rbx, [ rsp + 0x938 ];

; fr: none.

mov r10, [ rsp + 0x278 ]; load m64 x774 to register64
; r__rm_rm_rmf
lea rbx, [ rbx + r10 ]; r8/64 + m8


; fr: none.

; stacking up for x810
mov byte [ rsp + 0x968 ], r13b; spilling byte x810 to mem
setc r13b;


cmp rdi, r9




; fr: none.
; freeing x508 (r9) no dependants anymore
movzx r9, byte [ rsp + 0x8e0 ];
;should save CF(x543) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r9, 0x0; add CF to r0's alloc


; fr: none.
; freeing x542 (rdi) no dependants anymore
mov rdi, 0x6730d2a0f6b0f624 ; moving imm to reg

; fr: none.

; stacking up for x894
mov byte [ rsp + 0x970 ], r13b; spilling byte x894 to mem

; fr: none.

; stacking up for x812
mov [ rsp + 0x978 ], rbx; spilling x812 to mem

mulx rbx, r13, rdi; x1044_1, x1044_0<- x1029 * 0x6730d2a0f6b0f624 (_0*_0)


; fr: none.
; freeing x1044_0 (r13) no dependants anymore
mov r13, 0x299338752f97f97b ; moving imm to reg


; fr: none.

mov rdi, [ rsp + 0x958 ];


imul rdi, r13; lox1035 = x985*0x299338752f97f97b


; fr: none.

mov r13, 0x48669f39fb24c32 ; moving imm to reg


; fr: none.

; stacking up for x1035
mov [ rsp + 0x980 ], rdi; spilling x1035 to mem
mov rdi, [ rsp + 0x958 ];


imul rdi, r13; lox1030 = x985*0x48669f39fb24c32



cmp rcx, r15



; r__rm_rm_rmf
lea r9, [ r9 + r14 ]


; fr: none.
; freeing x690 (r15) no dependants anymore
setc r15b;


cmp qword [ rsp + 0x958 ], 0x0

; fr: none.
; freeing x721 (rcx) no dependants anymore
setne cl; setCC x1074 to reg (rcx)


; fr: none.

mov r13, 0x1eabfffeb153ffff ; moving imm to reg

; fr: none.

; stacking up for x1074
mov byte [ rsp + 0x988 ], cl; spilling byte x1074 to mem

; fr: none.

; stacking up for x1030
mov [ rsp + 0x990 ], rdi; spilling x1030 to mem

mulx rdi, rcx, r13; x1048_1, x1048_0<- x1029 * 0x1eabfffeb153ffff (_0*_0)






; fr: none.
; freeing x1048_0 (rcx) no dependants anymore
mov rcx, 0xb9feffffffffaaab ; moving imm to reg

; fr: none.


; fr: none.

; stacking up for x1049
mov [ rsp + 0x998 ], rdi; spilling x1049 to mem

mulx rdi, r13, rcx; x1051_1, x1051_0<- x1029 * 0xb9feffffffffaaab (_0*_0)




; fr: none.
; freeing x1051_0 (r13) no dependants anymore
movzx r13, byte [ rsp + 0x570 ];
; r__rm_rm_rmf
add r13, [ rsp + 0x130 ]


; fr: none.

mov rcx, 0x4b1ba7b6434bacd7 ; moving imm to reg

; fr: none.

; stacking up for x611
mov [ rsp + 0x9a0 ], r13; spilling x611 to mem

; fr: none.

; stacking up for x1044_1
mov [ rsp + 0x9a8 ], rbx; spilling x1044_1 to mem

mulx rbx, r13, rcx; x1036_1, x1036_0<- x1029 * 0x4b1ba7b6434bacd7 (_0*_0)








; fr: none.
; freeing x1029 (rdx) no dependants anymore
mov rdx, r9;
; r__rm_rm_rmf
add rdx, [ rsp + 0x738 ]




; fr: none.
; freeing x1036_0 (r13) no dependants anymore
mov r13, rdx;
; r__rm_rm_rmf
add r13, [ rsp + 0x930 ]


; fr: none.

mov rcx, 0x2a880aa4ed33c7c3 ; moving imm to reg


; fr: none.

; stacking up for x1052
mov [ rsp + 0x9b0 ], rdi; spilling x1052 to mem
mov rdi, [ rsp + 0x958 ];


imul rdi, rcx; lox1039 = x985*0x2a880aa4ed33c7c3



cmp r13, rdx








; fr: none.

movzx rcx, r15b;

; fr: none.

; stacking up for x1036_1
mov [ rsp + 0x9b8 ], rbx; spilling x1036_1 to mem
movzx rbx, byte [ rsp + 0x908 ]; load byte memx719 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + rbx ]; r64+m8



; fr: none.
; freeing x719 (rbx) no dependants anymore
mov rbx, [ rsp + 0x9a8 ];



; renamed x1041 to x1042 




; fr: none.
; freeing x722 (r15b) no dependants anymore
mov r15, [ rsp + 0x438 ]; load m64 x601 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r15 ]; r8/64 + m8

; renamed x1045 to x1046 



; r__rm_rm_rmf
lea rcx, [ rcx + r13 ]




; fr: none.

; stacking up for x1042
mov [ rsp + 0x9c0 ], r11; spilling x1042 to mem
mov r11, [ rsp + 0x9a0 ];

; fr: none.

; stacking up for x725
mov [ rsp + 0x9c8 ], rcx; spilling x725 to mem
movzx rcx, byte [ rsp + 0x638 ]; load byte memx609 to register64
; r__rm_rm_rmf
lea r11, [ r11 + rcx ]; r64+m8




; fr: none.
; freeing x609 (rcx) no dependants anymore
mov rcx, rdi;
; r__rm_rm_rmf
lea rcx, [ rcx + rbx ]



; fr: none.
; freeing x1046 (rbx) no dependants anymore
mov rbx, [ rsp + 0x9b8 ];




; fr: none.

; stacking up for x1061
mov [ rsp + 0x9d0 ], rcx; spilling x1061 to mem
setc cl;


cmp r13, r15

; renamed x1037 to x1038 

; renamed x1049 to x1050 




; fr: none.
; freeing x601 (r15) no dependants anymore
mov r15, [ rsp + 0x950 ];

; fr: none.

; stacking up for x1038
mov [ rsp + 0x9d8 ], rbx; spilling x1038 to mem
mov rbx, [ rsp + 0x998 ]; load m64 x1050 to register64
; r__rm_rm_rmf
lea r15, [ r15 + rbx ]; r8/64 + m8




; fr: none.
; freeing x1050 (rbx) no dependants anymore
mov rbx, [ rsp + 0x928 ];

; fr: none.

; stacking up for x612
mov [ rsp + 0x9e0 ], r11; spilling x612 to mem
movzx r11, byte [ rsp + 0x940 ]; load byte memx462 to register64
; r__rm_rm_rmf
lea rbx, [ rbx + r11 ]; r64+m8




; fr: none.
; freeing x462 (r11) no dependants anymore
movzx r11, cl;
;should save CF(x641) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r11, 0x0; add CF to r0's alloc



cmp [ rsp + 0x9c8 ], r13

; renamed x1052 to x1053 




; fr: none.
; freeing x638 (cl) no dependants anymore
mov rcx, [ rsp + 0x980 ];

; fr: none.
; freeing x640 (r13) no dependants anymore
mov r13, [ rsp + 0x9c0 ]; load m64 x1042 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r13 ]; r8/64 + m8


; fr: none.
; freeing x1042 (r13) no dependants anymore
setc r13b;


cmp rbx, [ rsp + 0x5c8 ]




; fr: none.

; stacking up for x643
mov [ rsp + 0x9e8 ], r11; spilling x643 to mem
mov r11, [ rsp + 0x948 ];

; fr: none.

; stacking up for x1065
mov [ rsp + 0x9f0 ], rcx; spilling x1065 to mem
mov rcx, [ rsp + 0x9b0 ]; load m64 x1053 to register64
; r__rm_rm_rmf
lea r11, [ r11 + rcx ]; r8/64 + m8


; fr: none.

; stacking up for x726
mov byte [ rsp + 0x9f8 ], r13b; spilling byte x726 to mem
setc r13b;


cmp [ rsp + 0x978 ], r10




; fr: none.
; freeing x774 (r10) no dependants anymore
movzx r10, byte [ rsp + 0x968 ];
;should save CF(x813) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc




; fr: none.

; stacking up for x469
mov byte [ rsp + 0xa00 ], r13b; spilling byte x469 to mem
mov r13, [ rsp + 0x9c8 ];
; r__rm_rm_rmf
add r13, [ rsp + 0x798 ]



cmp r11, rcx



;should save CF(x1055) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea r10, [ r10 + r13 ]



cmp r13, [ rsp + 0x798 ]




; fr: none.
; freeing x1053 (rcx) no dependants anymore
mov rcx, [ rsp + 0x9e0 ];

; fr: none.

; stacking up for x816
mov [ rsp + 0xa08 ], r10; spilling x816 to mem
movzx r10, byte [ rsp + 0xa00 ]; load byte memx469 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r10 ]; r64+m8




; fr: none.
; freeing x469 (r10) no dependants anymore
movzx r10, byte [ rsp + 0x9f8 ];
;should save CF(x729) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc



cmp r15, [ rsp + 0x950 ]




; fr: none.

; stacking up for x650
mov [ rsp + 0xa10 ], rcx; spilling x650 to mem
mov rcx, [ rsp + 0x9d0 ];
;should save CF(x1059) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rcx, 0x0; add CF to r0's alloc



cmp rcx, rdi




; fr: none.
; freeing x1039 (rdi) no dependants anymore
mov rdi, [ rsp + 0x9f0 ];
;should save CF(x1063) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rdi, 0x0; add CF to r0's alloc



cmp rdx, [ rsp + 0x738 ]


; fr: none.
; freeing x549 (rdx) no dependants anymore
setc dl;


cmp r9, r14




; fr: none.
; freeing x461 (r14) no dependants anymore
mov r14, [ rsp + 0xa08 ];

; fr: none.
; freeing x546 (r9) no dependants anymore
mov r9, [ rsp + 0x280 ]; load m64 x780 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r9 ]; r8/64 + m8


; fr: none.

; stacking up for x731
mov [ rsp + 0xa18 ], r10; spilling x731 to mem
setc r10b;


cmp r14, r9




; fr: none.
; freeing x780 (r9) no dependants anymore
movzx r9, byte [ rsp + 0x970 ];

; fr: none.

; stacking up for x547
mov byte [ rsp + 0xa20 ], r10b; spilling byte x547 to mem
movzx r10, byte [ rsp + 0x920 ]; load byte memx891 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r10 ]; r64+m8




; fr: none.
; freeing x891 (r10) no dependants anymore
mov r10, [ rsp + 0x990 ];

; fr: none.

; stacking up for x550
mov byte [ rsp + 0xa28 ], dl; spilling byte x550 to mem
mov rdx, [ rsp + 0x9d8 ]; load m64 x1038 to register64
; r__rm_rm_rmf
lea r10, [ r10 + rdx ]; r8/64 + m8


; fr: none.
; freeing x1038 (rdx) no dependants anymore
setc dl;


cmp rdi, [ rsp + 0x980 ]



;should save CF(x1067) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
add r9, [ rsp + 0x978 ]




; fr: none.

; stacking up for x820
mov byte [ rsp + 0xa30 ], dl; spilling byte x820 to mem
movzx rdx, byte [ rsp + 0x760 ];
; r__rm_rm_rmf
add rdx, [ rsp + 0x698 ]




; fr: none.

; stacking up for x515
mov [ rsp + 0xa38 ], rdx; spilling x515 to mem
mov rdx, r9;
; r__rm_rm_rmf
add rdx, [ rsp + 0x838 ]



cmp rdx, [ rsp + 0x838 ]


; fr: none.

; stacking up for x1070
mov [ rsp + 0xa40 ], r10; spilling x1070 to mem
setc r10b;


cmp r9, [ rsp + 0x978 ]


; fr: none.
; freeing x897 (r9) no dependants anymore
setc r9b;


cmp [ rsp + 0xa08 ], r13


; fr: none.
; freeing x728 (r13) no dependants anymore
mov r13, [ rsp + 0xa40 ]; load m64 x1070 to register64

; fr: none.

; stacking up for x898
mov byte [ rsp + 0xa48 ], r9b; spilling byte x898 to mem
setc r9b;


cmp r13, [ rsp + 0x990 ]




; fr: none.

; stacking up for x901
mov byte [ rsp + 0xa50 ], r10b; spilling byte x901 to mem
movzx r10, r9b;

; fr: none.

movzx r13, byte [ rsp + 0xa30 ]; load byte memx820 to register64
; r__rm_rm_rmf
lea r10, [ r10 + r13 ]; r64+m8


; fr: none.
; freeing x820 (r13) no dependants anymore
setc r13b;


cmp [ rsp + 0x958 ], rbp




; fr: none.
; freeing x893 (rbp) no dependants anymore
movzx rbp, byte [ rsp + 0xa28 ];

; fr: none.
; freeing x817 (r9b) no dependants anymore
movzx r9, byte [ rsp + 0xa20 ]; load byte memx547 to register64
; r__rm_rm_rmf
lea rbp, [ rbp + r9 ]; r64+m8



; r__rm_rm_rmf
lea rbp, [ rbp + rbx ]




; fr: none.
; freeing x547 (r9) no dependants anymore
movzx r9, byte [ rsp + 0xa50 ];

; fr: none.

; stacking up for x822
mov [ rsp + 0xa58 ], r10; spilling x822 to mem
movzx r10, byte [ rsp + 0xa48 ]; load byte memx898 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r10 ]; r64+m8




; fr: none.
; freeing x898 (r10) no dependants anymore
mov r10, rdx;
;should save CF(x986) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc




; fr: none.

; stacking up for x903
mov [ rsp + 0xa60 ], r9; spilling x903 to mem
mov r9, r10;
; r__rm_rm_rmf
add r9, [ rsp + 0x2a0 ]




; fr: none.

; stacking up for x991
mov [ rsp + 0xa68 ], r9; spilling x991 to mem
mov r9, rbp;
; r__rm_rm_rmf
add r9, [ rsp + 0xa38 ]



cmp r10, rdx




; fr: none.
; freeing x900 (rdx) no dependants anymore
mov rdx, r9;

; fr: none.
; freeing x988 (r10) no dependants anymore
mov r10, [ rsp + 0x9e8 ]; load m64 x643 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + r10 ]; r8/64 + m8


; fr: none.
; freeing x643 (r10) no dependants anymore
setc r10b;


cmp rdx, r9

; renamed x1033 to x1034 




; fr: none.

; stacking up for x989
mov byte [ rsp + 0xa70 ], r10b; spilling byte x989 to mem
mov r10, [ rsp + 0x4e8 ]; load m64 x608 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + r10 ]; r8/64 + m8




; fr: none.

; stacking up for x1071
mov byte [ rsp + 0xa78 ], r13b; spilling byte x1071 to mem
mov r13, rdx;

; fr: none.

; stacking up for x556
mov [ rsp + 0xa80 ], r9; spilling x556 to mem
mov r9, [ rsp + 0xa18 ]; load m64 x731 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r9 ]; r8/64 + m8


; fr: none.
; freeing x731 (r9) no dependants anymore
setc r9b;


cmp r13, rdx


; fr: none.

; stacking up for x645
mov byte [ rsp + 0xa88 ], r9b; spilling byte x645 to mem
setc r9b;


cmp rbp, rbx




; fr: none.
; freeing x468 (rbx) no dependants anymore
movzx rbx, byte [ rsp + 0xa78 ];

; fr: none.
; freeing x553 (rbp) no dependants anymore
mov rbp, [ rsp + 0x960 ]; load m64 x1034 to register64
; r__rm_rm_rmf
lea rbx, [ rbx + rbp ]; r8/64 + m8




; fr: none.
; freeing x1034 (rbp) no dependants anymore
mov rbp, [ rsp + 0xa10 ];
;should save CF(x554) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rbp, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
add r13, [ rsp + 0x7c8 ]


; fr: none.

; stacking up for x1073
mov [ rsp + 0xa90 ], rbx; spilling x1073 to mem
mov rbx, [ rsp + 0x7c8 ]; load m64 x698 to register64


cmp rbx, [ rsp + 0x6f8 ]




; fr: none.

; stacking up for x651
mov [ rsp + 0xa98 ], rbp; spilling x651 to mem
mov rbp, [ rsp + 0xa68 ];

; fr: none.

; stacking up for x733
mov byte [ rsp + 0xaa0 ], r9b; spilling byte x733 to mem
movzx r9, byte [ rsp + 0x988 ]; load byte memx1074 to register64
; r__rm_rm_rmf
lea rbp, [ rbp + r9 ]; r64+m8




; fr: none.
; freeing x1074 (r9) no dependants anymore
mov r9, rbp;
; r__rm_rm_rmf
lea r9, [ r9 + r11 ]


; fr: none.

; stacking up for x1079
mov [ rsp + 0xaa8 ], r9; spilling x1079 to mem
setc r9b;


cmp r13, rbx




; fr: none.
; freeing x698 (rbx) no dependants anymore
movzx rbx, byte [ rsp + 0xaa0 ];
;should save CF(x736) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rbx, 0x0; add CF to r0's alloc




; fr: none.

; stacking up for x699
mov byte [ rsp + 0xab0 ], r9b; spilling byte x699 to mem
mov r9, r14;
; r__rm_rm_rmf
add r9, [ rsp + 0xa60 ]




; fr: none.

; stacking up for x738
mov [ rsp + 0xab8 ], rbx; spilling x738 to mem
mov rbx, r9;
; r__rm_rm_rmf
lea rbx, [ rbx + rsi ]



cmp r9, r14




; fr: none.
; freeing x819 (r14) no dependants anymore
movzx r14, byte [ rsp + 0x540 ];

; fr: none.
; freeing x904 (r9) no dependants anymore
mov r9, [ rsp + 0xb8 ]; load m64 x935 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r9 ]; r8/64 + m8




; fr: none.
; freeing x935 (r9) no dependants anymore
mov r9, r13;

; fr: none.

; stacking up for x983
mov [ rsp + 0xac0 ], r14; spilling x983 to mem
mov r14, [ rsp + 0xa58 ]; load m64 x822 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r14 ]; r8/64 + m8

; renamed x661 to x662 


; fr: none.
; freeing x822 (r14) no dependants anymore
setc r14b;


cmp r9, r13


; fr: none.
; freeing x735 (r13) no dependants anymore
mov r13, [ rsp + 0x2a0 ]; load m64 x956 to register64

; fr: none.

; stacking up for x905
mov byte [ rsp + 0xac8 ], r14b; spilling byte x905 to mem
setc r14b;


cmp [ rsp + 0xa68 ], r13




; fr: none.
; freeing x956 (r13) no dependants anymore
movzx r13, byte [ rsp + 0xa70 ];
;should save CF(x992) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r13, 0x0; add CF to r0's alloc



cmp [ rsp + 0xaa8 ], r11


; fr: none.
; freeing x1054 (r11) no dependants anymore
setc r11b;


cmp rbp, [ rsp + 0xa68 ]




; fr: none.
; freeing x1076 (rbp) no dependants anymore
movzx rbp, r11b;
;should save CF(x1077) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rbp, 0x0; add CF to r0's alloc



cmp rdx, r10



; r__rm_rm_rmf
lea r13, [ r13 + rbx ]


; fr: none.
; freeing x608 (r10) no dependants anymore
mov r10, [ rsp + 0xa80 ]; load m64 x556 to register64

; fr: none.
; freeing x647 (rdx) no dependants anymore
setc dl;


cmp r10, [ rsp + 0xa38 ]


; fr: none.
; freeing x556 (r10) no dependants anymore
setc r10b;


cmp r13, rbx




; fr: none.
; freeing x1080 (r11b) no dependants anymore
mov r11, [ rsp + 0x3b8 ]; load m64 x787 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r11 ]; r8/64 + m8




; fr: none.

; stacking up for x648
mov byte [ rsp + 0xad0 ], dl; spilling byte x648 to mem
movzx rdx, r10b;

; fr: none.

; stacking up for x824
mov byte [ rsp + 0xad8 ], r14b; spilling byte x824 to mem
mov r14, [ rsp + 0xa98 ]; load m64 x651 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + r14 ]; r8/64 + m8




; fr: none.
; freeing x651 (r14) no dependants anymore
mov r14, [ rsp + 0x330 ]; load m64 x960 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r14 ]; r8/64 + m8



; r__rm_rm_rmf
lea rbp, [ rbp + r13 ]


; fr: none.
; freeing x557 (r10b) no dependants anymore
setc r10b;


cmp r9, r11




; fr: none.
; freeing x787 (r11) no dependants anymore
movzx r11, byte [ rsp + 0xad8 ];
;should save CF(x827) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r11, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
rcr byte [ rsp + 0xa88 ], 1
adc rdx, 0x0



; r__rm_rm_rmf
rcr byte [ rsp + 0xad0 ], 1
adc rdx, 0x0



cmp rbp, r13


; fr: none.

; stacking up for x829
mov [ rsp + 0xae0 ], r11; spilling x829 to mem
mov r11, -0x4601000000005555 ; moving imm to reg

; fr: none.

; stacking up for x996
mov byte [ rsp + 0xae8 ], r10b; spilling byte x996 to mem
setc r10b;


cmp qword [ rsp + 0xaa8 ], r11




; fr: none.

mov r11, rdx;

; fr: none.

; stacking up for x1084
mov byte [ rsp + 0xaf0 ], r10b; spilling byte x1084 to mem
mov r10, [ rsp + 0xab8 ]; load m64 x738 to register64
; r__rm_rm_rmf
lea r11, [ r11 + r10 ]; r8/64 + m8


; fr: none.
; freeing x738 (r10) no dependants anymore
setc r10b;


cmp r13, r14



; r__rm_rm_rmf
lea rbp, [ rbp + r15 ]




; fr: none.
; freeing x960 (r14) no dependants anymore
movzx r14, byte [ rsp + 0xae8 ];
;should save CF(x999) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r14, 0x0; add CF to r0's alloc



; fr: none.
; freeing x998 (r13) no dependants anymore
mov r13, -0x1eabfffeb153ffff ; moving imm to reg


; fr: none.

; stacking up for x1001
mov [ rsp + 0xaf8 ], r14; spilling x1001 to mem
mov r14, rbp;
; r__rm_rm_rmf
lea r14, [ r14 + r13 ]


; fr: none.

mov r13, [ rsp + 0x80 ]; load m64 x931 to register64


cmp [ rsp + 0x568 ], r13
; the job is: x1120 = x1119 !== 0 ? 0x0: 0xffffffffffffffff


; fr: none.
; freeing x931 (r13) no dependants anymore
mov r13, 0x0 ; moving imm to reg

; fr: none.

; stacking up for x1121
mov [ rsp + 0xb00 ], r14; spilling x1121 to mem
mov r14, 0xffffffffffffffff ; moving imm to reg

; fr: none.

; stacking up for x739
mov [ rsp + 0xb08 ], r11; spilling x739 to mem
setc r11b;


; fr: none.

; stacking up for x1086
mov [ rsp + 0xb10 ], rbp; spilling x1086 to mem
mov rbp, r13;


test r10b, r10b; testing x1119
cmovnz rbp, r14; if !ZF, x1120<- 0xffffffffffffffff (nzVar)



cmp [ rsp + 0xb10 ], r15


; fr: none.
; freeing x1058 (r15) no dependants anymore
mov r15, 0x1eabfffeb153ffff ; moving imm to reg

; fr: none.
; freeing x1119 (r10b) no dependants anymore
setc r10b;


cmp qword [ rsp + 0xb10 ], r15
; the job is: x1123 = x1122 !== 0 ? 0x0: 0xffffffffffffffff



; fr: none.

mov r15, r13;


cmovc r15, r14; if CF, x1123<- 0xffffffffffffffff (nzVar)




; fr: none.
; freeing 0x0 (r13, since all are neeed, but this one is just an immediate value.
movzx r13, r11b;

; fr: none.

mov r14, [ rsp + 0xac0 ]; load m64 x983 to register64
; r__rm_rm_rmf
lea r13, [ r13 + r14 ]; r8/64 + m8

;should save CF(x1122) but as it has not dependents, we just ignore it.


cmp rbx, rsi




; fr: none.
; freeing x876 (rsi) no dependants anymore
movzx rsi, byte [ rsp + 0xab0 ];

; fr: none.
; freeing x907 (rbx) no dependants anymore
mov rbx, [ rsp + 0x740 ]; load m64 x662 to register64
; r__rm_rm_rmf
lea rsi, [ rsi + rbx ]; r8/64 + m8




; fr: none.
; freeing x983 (r14) no dependants anymore
mov r14, rsi;

; fr: none.
; freeing x662 (rbx) no dependants anymore
mov rbx, [ rsp + 0xb08 ]; load m64 x739 to register64
; r__rm_rm_rmf
lea r14, [ r14 + rbx ]; r8/64 + m8




; fr: none.
; freeing x981 (r11b) no dependants anymore
movzx r11, byte [ rsp + 0xac8 ];
;should save CF(x908) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r11, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea r11, [ r11 + r9 ]



cmp r14, rsi


; fr: none.
; freeing x701 (rsi) no dependants anymore
setc sil;


cmp rdx, [ rsp + 0x9e0 ]




; fr: none.

; stacking up for x984
mov [ rsp + 0xb18 ], r13; spilling x984 to mem
mov r13, [ rsp + 0xb00 ]; load m64 x1121 to register64
; r__rm_rm_rmf
lea rbp, [ rbp + r13 ]; r8/64 + m8




; fr: none.

; stacking up for x743
mov byte [ rsp + 0xb20 ], sil; spilling byte x743 to mem
mov rsi, [ rsp + 0x6c0 ];
;should save CF(x655) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rsi, 0x0; add CF to r0's alloc




; fr: none.

; stacking up for x836
mov [ rsp + 0xb28 ], rsi; spilling x836 to mem
movzx rsi, r10b;
; r__rm_rm_rmf
rcr byte [ rsp + 0xaf0 ], 1
adc rsi, 0x0



cmp [ rsp + 0x8f0 ], r12


; fr: none.
; freeing x844 (r12) no dependants anymore
setc r12b;


cmp rbx, rdx




; fr: none.
; freeing x654 (rdx) no dependants anymore
mov rdx, r14;

; fr: none.
; freeing x739 (rbx) no dependants anymore
mov rbx, [ rsp + 0xae0 ]; load m64 x829 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + rbx ]; r8/64 + m8


; fr: none.
; freeing x829 (rbx) no dependants anymore
setc bl;


cmp rdx, r14


; fr: none.
; freeing x1087 (r10b) no dependants anymore
setc r10b;


cmp r13, rbp
; the job is: x1126 = x1125 !== 0 ? 0x0: 0xffffffffffffffff


; fr: none.
; freeing x1121 (r13) no dependants anymore
mov r13, 0x0 ; moving imm to reg

; fr: none.
; freeing x742 (r14) no dependants anymore
mov r14, 0xffffffffffffffff ; moving imm to reg


; fr: none.

; stacking up for x831
mov byte [ rsp + 0xb30 ], r10b; spilling byte x831 to mem
mov r10, r13;


cmovc r10, r14; if CF, x1126<- 0xffffffffffffffff (nzVar)




; fr: none.
; freeing 0x0 (r13, since all are neeed, but this one is just an immediate value.
mov r13, [ rsp + 0x4a0 ]; load m64 x794 to register64
; r__rm_rm_rmf
lea rdx, [ rdx + r13 ]; r8/64 + m8



; r__rm_rm_rmf
lea r10, [ r10 + r15 ]




; fr: none.
; freeing x1123 (r15) no dependants anymore
mov r15, r11;

; fr: none.

mov r14, [ rsp + 0x8b0 ]; load m64 x880 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r14 ]; r8/64 + m8

;should save CF(x1125) but as it has not dependents, we just ignore it.


cmp r15, r14




; fr: none.
; freeing x880 (r14) no dependants anymore
mov r14, r15;

; fr: none.

; stacking up for x1127
mov [ rsp + 0xb38 ], r10; spilling x1127 to mem
mov r10, [ rsp + 0xaf8 ]; load m64 x1001 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r10 ]; r8/64 + m8


; fr: none.
; freeing x1001 (r10) no dependants anymore
setc r10b;


cmp r11, r9


; fr: none.
; freeing x826 (r9) no dependants anymore
setc r9b;


cmp r14, r15




; fr: none.
; freeing x911 (r11) no dependants anymore
mov r11, [ rsp + 0x390 ]; load m64 x966 to register64
; r__rm_rm_rmf
lea r14, [ r14 + r11 ]; r8/64 + m8



; r__rm_rm_rmf
lea rsi, [ rsi + r14 ]




; fr: none.
; freeing x914 (r15) no dependants anymore
movzx r15, r10b;
; r__rm_rm_rmf
movzx r9, r9b
lea r15, [ r15 + r9 ]


; fr: none.
; freeing x915 (r10b) no dependants anymore
setc r10b;


cmp rsi, r14



; r__rm_rm_rmf
lea r15, [ r15 + rdx ]



; r__rm_rm_rmf
lea rsi, [ rsi + rcx ]

; renamed x847 to x848 




; fr: none.
; freeing x912 (r9b) no dependants anymore
mov r9, r15;

; fr: none.

; stacking up for x1093
mov [ rsp + 0xb40 ], rsi; spilling x1093 to mem
mov rsi, [ rsp + 0x8f0 ]; load m64 x884 to register64
; r__rm_rm_rmf
lea r9, [ r9 + rsi ]; r8/64 + m8




; fr: none.

; stacking up for x921
mov [ rsp + 0xb48 ], r9; spilling x921 to mem
movzx r9, bl;

; fr: none.

; stacking up for x1003
mov byte [ rsp + 0xb50 ], r10b; spilling byte x1003 to mem
mov r10, [ rsp + 0xb28 ]; load m64 x836 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r10 ]; r8/64 + m8




; fr: none.
; freeing x836 (r10) no dependants anymore
movzx r10, byte [ rsp + 0xb20 ]; load byte memx743 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r10 ]; r64+m8


; fr: none.
; freeing x743 (r10) no dependants anymore
setc r10b;


cmp r14, r11




; fr: none.
; freeing x966 (r11) no dependants anymore
movzx r11, r12b;

; fr: none.
; freeing x740 (bl) no dependants anymore
mov rbx, [ rsp + 0x850 ]; load m64 x848 to register64
; r__rm_rm_rmf
lea r11, [ r11 + rbx ]; r8/64 + m8




; fr: none.
; freeing x885 (r12b) no dependants anymore
movzx r12, byte [ rsp + 0xb50 ];
;should save CF(x1006) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r12, 0x0; add CF to r0's alloc



cmp rdx, r13




; fr: none.
; freeing x794 (r13) no dependants anymore
movzx r13, byte [ rsp + 0xb30 ]; load byte memx831 to register64
; r__rm_rm_rmf
lea r9, [ r9 + r13 ]; r64+m8



;should save CF(x834) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r9, 0x0; add CF to r0's alloc



cmp r9, [ rsp + 0x6c0 ]


; fr: none.
; freeing x831 (r13) no dependants anymore
mov r13, 0x6730d2a0f6b0f624 ; moving imm to reg

; fr: none.
; freeing x1005 (r14) no dependants anymore
setc r14b;


cmp qword [ rsp + 0xb40 ], r13
; the job is: x1130 = x1129 !== 0 ? 0x0: 0xffffffffffffffff


; fr: none.
; freeing x848 (rbx) no dependants anymore
mov rbx, 0x0 ; moving imm to reg

; fr: none.

mov r13, 0xffffffffffffffff ; moving imm to reg


; fr: none.

; stacking up for x841
mov byte [ rsp + 0xb58 ], r14b; spilling byte x841 to mem
mov r14, rbx;


cmovc r14, r13; if CF, x1130<- 0xffffffffffffffff (nzVar)

;should save CF(x1129) but as it has not dependents, we just ignore it.


cmp [ rsp + 0xb40 ], rcx




; fr: none.
; freeing x1062 (rcx) no dependants anymore
mov rcx, [ rsp + 0xb48 ]; load m64 x921 to register64
; r__rm_rm_rmf
lea r12, [ r12 + rcx ]; r8/64 + m8




; fr: none.
; freeing 0x0 (rbx, since all are neeed, but this one is just an immediate value.
movzx rbx, r10b;
;should save CF(x1094) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rbx, 0x0; add CF to r0's alloc




; fr: none.
; freeing x1091 (r10b) no dependants anymore
mov r10, r12;
; r__rm_rm_rmf
add r10, [ rsp + 0x498 ]



cmp r10, [ rsp + 0x498 ]


; fr: none.

setc r13b;


cmp r15, rdx


; fr: none.
; freeing x833 (rdx) no dependants anymore
setc dl;


cmp rcx, rsi




; fr: none.
; freeing x884 (rsi) no dependants anymore
movzx rsi, dl;
;should save CF(x922) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rsi, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea rsi, [ rsi + r9 ]




; fr: none.
; freeing x918 (r15) no dependants anymore
mov r15, rsi;
; r__rm_rm_rmf
lea r15, [ r15 + r11 ]



cmp r12, rcx


; fr: none.
; freeing x921 (rcx) no dependants anymore
setc cl;


cmp r15, r11




; fr: none.
; freeing x887 (r11) no dependants anymore
movzx r11, r13b;
; r__rm_rm_rmf
movzx rcx, cl
lea r11, [ r11 + rcx ]


; fr: none.
; freeing x1009 (r12) no dependants anymore
setc r12b;


cmp rsi, r9



; r__rm_rm_rmf
lea rbx, [ rbx + r10 ]




; fr: none.
; freeing x840 (r9) no dependants anymore
mov r9, rbx;
; r__rm_rm_rmf
lea r9, [ r9 + rdi ]


; fr: none.
; freeing x1013 (r13b) no dependants anymore
setc r13b;


cmp r9, rdi



; r__rm_rm_rmf
lea r11, [ r11 + r15 ]




; fr: none.
; freeing x1066 (rdi) no dependants anymore
mov rdi, r11;

; fr: none.
; freeing x919 (dl) no dependants anymore
mov rdx, [ rsp + 0x568 ]; load m64 x980 to register64
; r__rm_rm_rmf
lea rdi, [ rdi + rdx ]; r8/64 + m8


; fr: none.
; freeing x925 (rsi) no dependants anymore
setc sil;


cmp rbx, r10




; fr: none.
; freeing x1012 (r10) no dependants anymore
mov r10, [ rsp + 0xb18 ];

; fr: none.
; freeing x1010 (cl) no dependants anymore
movzx rcx, byte [ rsp + 0xb58 ]; load byte memx841 to register64
; r__rm_rm_rmf
lea r10, [ r10 + rcx ]; r64+m8




; fr: none.
; freeing x841 (rcx) no dependants anymore
movzx rcx, sil;
;should save CF(x1098) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rcx, 0x0; add CF to r0's alloc




; fr: none.
; freeing x1097 (rbx) no dependants anymore
movzx rbx, r13b;
; r__rm_rm_rmf
lea rbx, [ rbx + r10 ]



; fr: none.
; freeing x926 (r13b) no dependants anymore
mov r13, -0x6730d2a0f6b0f624 ; moving imm to reg

; r__rm_rm_rmf
add r13, [ rsp + 0xb40 ]



cmp r11, r15




; fr: none.
; freeing x928 (r15) no dependants anymore
movzx r15, r12b;
; r__rm_rm_rmf
lea r15, [ r15 + rbx ]



;should save CF(x1017) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r15, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea rcx, [ rcx + rdi ]



cmp rcx, rdi




; fr: none.
; freeing x929 (r12b) no dependants anymore
mov r12, r13;

; fr: none.
; freeing x1101 (sil) no dependants anymore
mov rsi, [ rsp + 0xb38 ]; load m64 x1127 to register64
; r__rm_rm_rmf
lea r12, [ r12 + rsi ]; r8/64 + m8


; fr: none.
; freeing x1127 (rsi) no dependants anymore
mov rsi, 0x64774b84f38512bf ; moving imm to reg

; fr: none.
; freeing x1016 (r11) no dependants anymore
setc r11b;


cmp qword r9, rsi




; fr: none.
; freeing x1022 (r10) no dependants anymore
mov r10, [ rsp + 0xa40 ]; load m64 x1070 to register64
; r__rm_rm_rmf
lea rcx, [ rcx + r10 ]; r8/64 + m8


; fr: none.
; freeing x1023 (rbx) no dependants anymore
setc bl;


cmp rcx, r10




; fr: none.
; freeing x1070 (r10) no dependants anymore
movzx r10, r11b;
;should save CF(x1108) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc r10, 0x0; add CF to r0's alloc
; the job is: x1137 = x1136 !== 0 ? 0x0: 0xffffffffffffffff


; fr: none.
; freeing x1105 (r11b) no dependants anymore
mov r11, 0x0 ; moving imm to reg

; fr: none.

mov rsi, 0xffffffffffffffff ; moving imm to reg


; fr: none.

; stacking up for x1110
mov [ rsp + 0xb60 ], r10; spilling x1110 to mem
mov r10, r11;


test bl, bl; testing x1136
cmovnz r10, rsi; if !ZF, x1137<- 0xffffffffffffffff (nzVar)



cmp r13, r12
; the job is: x1133 = x1132 !== 0 ? 0x0: 0xffffffffffffffff



; fr: none.
; freeing x1128 (r13) no dependants anymore
mov r13, r11;


cmovc r13, rsi; if CF, x1133<- 0xffffffffffffffff (nzVar)



; r__rm_rm_rmf
lea r13, [ r13 + r14 ]



; fr: none.
; freeing x1130 (r14) no dependants anymore
mov r14, -0x64774b84f38512bf ; moving imm to reg


; fr: none.
; freeing x1136 (bl) no dependants anymore
mov rbx, r9;
; r__rm_rm_rmf
lea rbx, [ rbx + r14 ]

;should save CF(x1132) but as it has not dependents, we just ignore it.


cmp rdi, rdx



; r__rm_rm_rmf
lea r13, [ r13 + rbx ]


; fr: none.
; freeing x980 (rdx) no dependants anymore
setc dl;


cmp rbx, r13


; fr: none.
; freeing x1019 (rdi) no dependants anymore
mov rdi, 0x4b1ba7b6434bacd7 ; moving imm to reg

; fr: none.
; freeing x1135 (rbx) no dependants anymore
setc bl;


cmp qword rcx, rdi




; fr: none.
; freeing 0x0 (r11, since all are neeed, but this one is just an immediate value.
movzx r11, dl;
; r__rm_rm_rmf
lea r11, [ r11 + r15 ]
; the job is: x1140 = x1139 !== 0 ? 0x0: 0xffffffffffffffff


; fr: none.
; freeing x1025 (r15) no dependants anymore
mov r15, 0x0 ; moving imm to reg

; fr: none.
; freeing x1020 (dl) no dependants anymore
setc dl;


; fr: none.

mov r14, r15;


test bl, bl; testing x1139
cmovnz r14, rsi; if !ZF, x1140<- 0xffffffffffffffff (nzVar)




; fr: none.
; freeing x1139 (bl) no dependants anymore
mov rbx, r11;
; r__rm_rm_rmf
add rbx, [ rsp + 0xb60 ]



cmp r11, [ rsp + 0xb18 ]


; fr: none.
; freeing 0x0 (r15, since all are neeed, but this one is just an immediate value.
setc r15b;


cmp rbx, r11




; fr: none.
; freeing x1026 (r11) no dependants anymore
mov r11, [ rsp + 0xa90 ]; load m64 x1073 to register64
; r__rm_rm_rmf
lea rbx, [ rbx + r11 ]; r8/64 + m8



; fr: none.

mov rsi, -0x4b1ba7b6434bacd7 ; moving imm to reg


; fr: none.

mov rdi, rcx;
; r__rm_rm_rmf
lea rdi, [ rdi + rsi ]




; fr: none.

movzx rsi, r15b;
;should save CF(x1112) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rsi, 0x0; add CF to r0's alloc



cmp rbx, r11



;should save CF(x1115) but as it has not dependents, we just ignore it.
; r__rm_rm_rmf
adc rsi, 0x0; add CF to r0's alloc



; r__rm_rm_rmf
lea r14, [ r14 + r10 ]



; r__rm_rm_rmf
lea r14, [ r14 + rdi ]



cmp rdi, r14
; the job is: x1144 = x1143 !== 0 ? 0x0: 0xffffffffffffffff


; fr: none.
; freeing x1073 (r11) no dependants anymore
mov r11, 0x0 ; moving imm to reg

; fr: none.
; freeing x1137 (r10) no dependants anymore
mov r10, 0xffffffffffffffff ; moving imm to reg

; fr: none.
; freeing x1027 (r15b) no dependants anymore
setc r15b;


; fr: none.
; freeing x1142 (rdi) no dependants anymore
mov rdi, r11;


test dl, dl; testing x1143
cmovnz rdi, r10; if !ZF, x1144<- 0xffffffffffffffff (nzVar)
; the job is: x1147 = x1146 !== 0 ? 0x0: 0xffffffffffffffff



; fr: none.
; freeing x1143 (dl) no dependants anymore
mov rdx, r11;


test r15b, r15b; testing x1146
cmovnz rdx, r10; if !ZF, x1147<- 0xffffffffffffffff (nzVar)



; fr: none.
; freeing x1146 (r15b) no dependants anymore
mov r15, -0x1a0111ea397fe69a ; moving imm to reg


; fr: none.
; freeing 0x0 (r11, since all are neeed, but this one is just an immediate value.
mov r11, rbx;
; r__rm_rm_rmf
lea r11, [ r11 + r15 ]


; fr: none.

mov r15, 0x1a0111ea397fe69a ; moving imm to reg


cmp qword rbx, r15



; r__rm_rm_rmf
lea rdx, [ rdx + rdi ]



; r__rm_rm_rmf
lea rdx, [ rdx + r11 ]
; the job is: x1151 = x1150 !== 0 ? 0x0: 0xffffffffffffffff


; fr: none.
; freeing x1144 (rdi) no dependants anymore
mov rdi, 0x0 ; moving imm to reg


; fr: none.

mov r15, rdi;


cmovc r15, r10; if CF, x1151<- 0xffffffffffffffff (nzVar)

;should save CF(x1150) but as it has not dependents, we just ignore it.


cmp r11, rdx
; the job is: x1154 = x1153 !== 0 ? 0x0: 0xffffffffffffffff



; fr: none.
; freeing x1149 (r11) no dependants anymore
mov r11, rdi;


cmovc r11, r10; if CF, x1154<- 0xffffffffffffffff (nzVar)



; r__rm_rm_rmf
lea r11, [ r11 + r15 ]



; r__rm_rm_rmf
lea r11, [ r11 + rsi ]

;should save CF(x1153) but as it has not dependents, we just ignore it.


cmp rsi, r11
; the job is: x1158 = x1157 !== 0 ? 0x0: 0xffffffffffffffff



; fr: none.
; freeing x1118 (rsi) no dependants anymore
mov rsi, rdi;


cmovc rsi, r10; if CF, x1158<- 0xffffffffffffffff (nzVar)



; fr: none.
; freeing x1151 (r15) no dependants anymore
mov r15, 0x4601000000005555 ; moving imm to reg


; fr: none.
; freeing x1156 (r11) no dependants anymore
mov r11, [ rsp + 0xaa8 ]; load m64 x1079 to register64
; r__rm_rm_rmf
lea r15, [ r15 + r11 ]; r8/64 + m8


; fr: none.
; freeing 0x0 (rdi, since all are neeed, but this one is just an immediate value.
setc dil;


; fr: none.

mov r10, [ rsp + 0xb40 ];


and r10, rsi; x1162 <- x1093&x1158
; the job is: x1160 = x1157 !== 0 ? x1124: 0x0


; fr: none.

; stacking up for x1162
mov [ rsp + 0xb68 ], r10; spilling x1162 to mem
mov r10, 0x0 ; moving imm to reg



test dil, dil; testing x1157
cmovnz rbp, r10; if !ZF, x1160<- 0x0 (nzVar)




and rcx, rsi; x1168 <- x1107&x1158
; the job is: x1166 = x1157 !== 0 ? x1138: 0x0




test dil, dil; testing x1157
cmovnz r13, r10; if !ZF, x1166<- 0x0 (nzVar)
; the job is: x1163 = x1157 !== 0 ? x1131: 0x0




test dil, dil; testing x1157
cmovnz r12, r10; if !ZF, x1163<- 0x0 (nzVar)



; fr: none.
; freeing 0x0 (r10, since all are neeed, but this one is just an immediate value.
mov r10, [ rsp + 0xb10 ];


and r10, rsi; x1159 <- x1086&x1158




or r10, rbp; x1161 <- x1159|x1160


; fr: none.
; freeing x1160 (rbp) no dependants anymore
mov rbp, [ rsp - 0x38 ]; load m64 out1 to register64


mov [ rbp + 0x8 ], r10; out1[1] = x1161
; the job is: x1174 = x1157 !== 0 ? x1172: 0x0


; fr: none.
; freeing x1161 (r10) no dependants anymore
mov r10, 0x0 ; moving imm to reg



test dil, dil; testing x1157
cmovnz r15, r10; if !ZF, x1174<- 0x0 (nzVar)




and r11, rsi; x1173 <- x1079&x1158




or r11, r15; x1175 <- x1173|x1174




and r9, rsi; x1165 <- x1100&x1158



mov [ rbp + 0x0 ], r11; out1[0] = x1175
; the job is: x1186 = x1157 !== 0 ? x1152: 0x0




test dil, dil; testing x1157
cmovnz rdx, r10; if !ZF, x1186<- 0x0 (nzVar)




or r9, r13; x1167 <- x1165|x1166




and rbx, rsi; x1185 <- x1114&x1158



mov [ rbp + 0x18 ], r9; out1[3] = x1167




or rbx, rdx; x1187 <- x1185|x1186
; the job is: x1169 = x1157 !== 0 ? x1145: 0x0




test dil, dil; testing x1157
cmovnz r14, r10; if !ZF, x1169<- 0x0 (nzVar)



mov [ rbp + 0x28 ], rbx; out1[5] = x1187



; fr: none.
; freeing x1157 (dil) no dependants anymore
mov rdi, [ rsp + 0xb68 ];


or rdi, r12; x1164 <- x1162|x1163




or rcx, r14; x1170 <- x1168|x1169



mov [ rbp + 0x10 ], rdi; out1[2] = x1164



mov [ rbp + 0x20 ], rcx; out1[4] = x1170
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 3056
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1238
; seed 2540577615654911 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 1826438 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=28, initial num_batches=31): 20339 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.011135883068573913
; number reverted permutation / tried permutation: 2683 / 3969 =67.599%
; number reverted decision / tried decision: 2405 / 4030 =59.677%