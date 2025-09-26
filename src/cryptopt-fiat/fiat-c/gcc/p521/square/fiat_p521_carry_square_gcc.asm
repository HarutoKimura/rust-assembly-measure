	.file	"p521_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p521_carry_square_gcc
	.type	fiat_p521_carry_square_gcc, @function
fiat_p521_carry_square_gcc:
.LFB16:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rax, rsi
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 72
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -96[rsp], rdi
	mov	r13, QWORD PTR 48[rax]
	mov	rcx, QWORD PTR 64[rsi]
	mov	rdx, QWORD PTR 40[rax]
	mov	rsi, QWORD PTR 56[rsi]
	lea	r15, [r13+r13]
	mov	r12, QWORD PTR 16[rax]
	lea	r11, [rcx+rcx]
	mov	QWORD PTR -64[rsp], rcx
	mov	QWORD PTR 56[rsp], r15
	mov	r15, QWORD PTR 32[rax]
	lea	rbx, [rsi+rsi]
	lea	r9, 0[0+r13*4]
	mov	QWORD PTR 40[rsp], rdx
	lea	r8, [r12+r12]
	lea	rdi, 0[0+rcx*4]
	lea	r14, [r15+r15]
	mov	QWORD PTR 24[rsp], rbx
	lea	rbx, [rdx+rdx]
	mov	QWORD PTR 32[rsp], r14
	mov	r14, QWORD PTR 24[rax]
	lea	rcx, 0[0+rsi*4]
	mov	QWORD PTR -72[rsp], r11
	lea	r10, [r14+r14]
	mov	QWORD PTR -8[rsp], r8
	mov	QWORD PTR 8[rsp], r10
	lea	r10, 0[0+rdx*4]
	mov	rdx, r10
	mov	QWORD PTR -24[rsp], r9
	mulx	r11, r10, r15
	mov	rdx, r9
	mov	QWORD PTR 64[rsp], rbx
	mov	rbx, QWORD PTR 8[rax]
	mulx	r9, r8, r14
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rax
	mov	rdx, rcx
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, r12
	mov	rdx, rdi
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rbx
	mov	rdx, QWORD PTR 40[rsp]
	add	r8, r10
	adc	r9, r11
	mov	QWORD PTR -40[rsp], r8
	mov	QWORD PTR -32[rsp], r9
	mulx	r9, r8, QWORD PTR 64[rsp]
	mov	rdx, QWORD PTR -24[rsp]
	mulx	r11, r10, r15
	mov	rdx, rcx
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, r14
	mov	rdx, rdi
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r12
	mov	rdx, rax
	add	r10, r8
	lea	r8, [rbx+rbx]
	adc	r11, r9
	mulx	r9, r8, r8
	mov	rdx, QWORD PTR 40[rsp]
	add	r8, r10
	mov	r10, QWORD PTR -40[rsp]
	adc	r9, r11
	mov	r11, QWORD PTR -32[rsp]
	shrd	r10, r11, 58
	shr	r11, 58
	add	r8, r10
	adc	r9, r11
	mov	QWORD PTR -56[rsp], r8
	mov	QWORD PTR -48[rsp], r9
	mulx	r9, r8, QWORD PTR -24[rsp]
	mov	rdx, rcx
	mulx	r11, r10, r15
	mov	rdx, rbx
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rbx
	mov	rdx, rdi
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r14
	mov	rdx, QWORD PTR -8[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rax
	mov	rdx, QWORD PTR 56[rsp]
	add	r8, r10
	mov	r10, QWORD PTR -56[rsp]
	adc	r9, r11
	mov	r11, QWORD PTR -48[rsp]
	shrd	r10, r11, 58
	shr	r11, 58
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r13
	mov	rdx, QWORD PTR 40[rsp]
	mov	QWORD PTR -24[rsp], r8
	mov	QWORD PTR -16[rsp], r9
	mulx	r9, r8, rcx
	mov	rdx, rdi
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r15
	mov	rdx, QWORD PTR -8[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR 8[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rax
	mov	rdx, rcx
	add	r8, r10
	mov	r10, QWORD PTR -24[rsp]
	adc	r9, r11
	mov	r11, QWORD PTR -16[rsp]
	shrd	r10, r11, 58
	shr	r11, 58
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r13
	mov	rdx, QWORD PTR 40[rsp]
	mov	QWORD PTR -8[rsp], r8
	mov	QWORD PTR [rsp], r9
	mulx	r9, r8, rdi
	mov	rdx, r12
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r12
	mov	rdx, QWORD PTR 8[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rbx
	mov	rdx, QWORD PTR 32[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rax
	mov	rdx, QWORD PTR 24[rsp]
	add	r8, r10
	mov	r10, QWORD PTR -8[rsp]
	adc	r9, r11
	mov	r11, QWORD PTR [rsp]
	shrd	r10, r11, 58
	shr	r11, 58
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rsi
	mov	rdx, rdi
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 48[rsp], r9
	mulx	r9, r8, r13
	mov	rdx, QWORD PTR 8[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r12
	mov	rdx, QWORD PTR 32[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rbx
	mov	rdx, QWORD PTR 64[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rax
	mov	rdx, rdi
	mulx	rdi, rsi, rsi
	mov	rdx, QWORD PTR 32[rsp]
	add	r8, r10
	mov	r10, QWORD PTR 40[rsp]
	adc	r9, r11
	mov	r11, QWORD PTR 48[rsp]
	shrd	r10, r11, 58
	shr	r11, 58
	add	r8, r10
	adc	r9, r11
	mov	r10, r8
	mov	r11, r9
	mulx	r9, r8, r12
	mov	rdx, r14
	mov	QWORD PTR -88[rsp], r10
	mov	QWORD PTR -80[rsp], r11
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, r14
	mov	rdx, QWORD PTR 64[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR 56[rsp]
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, rax
	mov	rdx, QWORD PTR -64[rsp]
	add	rsi, r8
	adc	rdi, r9
	mov	r9, r10
	mov	r10, r11
	shrd	r9, r11, 58
	shr	r10, 58
	mov	r11, r10
	mov	r10, r9
	add	r10, rsi
	adc	r11, rdi
	mov	QWORD PTR 8[rsp], r10
	mov	r10, QWORD PTR 8[rsp]
	mov	QWORD PTR 16[rsp], r11
	mov	r11, QWORD PTR -72[rsp]
	mulx	r9, r8, r11
	mov	rdx, QWORD PTR 32[rsp]
	mulx	rdi, rsi, r14
	mov	rdx, QWORD PTR 64[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, r12
	mov	rdx, QWORD PTR 56[rsp]
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, rbx
	mov	rdx, QWORD PTR 24[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, rax
	mov	rdx, QWORD PTR 64[rsp]
	add	r8, rsi
	mov	rsi, QWORD PTR 8[rsp]
	adc	r9, rdi
	mov	rdi, QWORD PTR 16[rsp]
	shrd	rsi, rdi, 58
	shr	rdi, 58
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, r14
	mov	rdx, QWORD PTR 56[rsp]
	mov	r14, rsi
	mulx	r13, r12, r12
	mov	rdx, r15
	add	r12, r8
	adc	r13, r9
	mulx	r9, r8, r15
	mov	rdx, QWORD PTR 24[rsp]
	mulx	rbx, rcx, rbx
	mov	rdx, r11
	add	r8, r12
	adc	r9, r13
	add	r8, rcx
	adc	r9, rbx
	mulx	rbx, rcx, rax
	mov	rdx, QWORD PTR -88[rsp]
	movabs	rax, 288230376151711743
	add	rcx, r8
	adc	rbx, r9
	shrd	rsi, rdi, 58
	shr	rdi, 58
	add	rcx, rsi
	mov	rsi, QWORD PTR -40[rsp]
	adc	rbx, rdi
	mov	r12, rcx
	xor	r9d, r9d
	and	rsi, rax
	shrd	r12, rbx, 57
	mov	r13, rbx
	mov	r8, rsi
	mov	rsi, QWORD PTR -56[rsp]
	shr	r13, 57
	add	r8, r12
	adc	r9, r13
	mov	r12, r8
	and	rsi, rax
	and	r8, rax
	shrd	r12, r9, 58
	mov	rdi, rsi
	mov	r9, QWORD PTR -24[rsp]
	and	r10, rax
	add	rdi, r12
	mov	rsi, QWORD PTR -8[rsp]
	vmovq	xmm3, r8
	and	rdx, rax
	and	r9, rax
	mov	r11, rdi
	shr	rdi, 58
	vmovq	xmm4, r10
	add	r9, rdi
	and	rsi, rax
	and	r11, rax
	mov	rdi, QWORD PTR -96[rsp]
	vmovq	xmm2, r9
	vpinsrq	xmm0, xmm3, r11, 1
	vpinsrq	xmm1, xmm2, rsi, 1
	mov	rsi, QWORD PTR 40[rsp]
	vinserti128	ymm0, ymm0, xmm1, 0x1
	and	rsi, rax
	vmovdqu	YMMWORD PTR [rdi], ymm0
	vmovq	xmm0, rsi
	mov	rsi, r14
	and	rsi, rax
	vpinsrq	xmm0, xmm0, rdx, 1
	movabs	rax, 144115188075855871
	vpinsrq	xmm1, xmm4, rsi, 1
	and	rcx, rax
	vinserti128	ymm0, ymm0, xmm1, 0x1
	vmovdqu	YMMWORD PTR 32[rdi], ymm0
	mov	QWORD PTR 64[rdi], rcx
	vzeroupper
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	fiat_p521_carry_square_gcc, .-fiat_p521_carry_square_gcc
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
