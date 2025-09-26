	.file	"p521_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p521_carry_mul_gcc
	.type	fiat_p521_carry_mul_gcc, @function
fiat_p521_carry_mul_gcc:
.LFB16:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r9, rdx
	mov	r8, rsi
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 136
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -96[rsp], rdi
	mov	rdx, QWORD PTR 64[rdx]
	mov	r15, QWORD PTR 40[r9]
	mov	r11, QWORD PTR 32[r9]
	mov	r12, QWORD PTR 16[r9]
	lea	rax, [rdx+rdx]
	lea	rbx, [r15+r15]
	mov	r14, QWORD PTR 48[r9]
	mov	r13, QWORD PTR 24[r9]
	mov	QWORD PTR 104[rsp], rax
	mov	rax, QWORD PTR 56[r9]
	lea	r10, [r12+r12]
	mov	QWORD PTR 8[rsp], rbx
	mov	rbx, QWORD PTR 48[r8]
	lea	rdi, [r14+r14]
	mov	rcx, QWORD PTR 64[rsi]
	mov	QWORD PTR -40[rsp], rdx
	lea	rsi, [rax+rax]
	lea	rdx, [r11+r11]
	mov	QWORD PTR -32[rsp], rax
	mov	rax, rsi
	lea	rsi, [r13+r13]
	mov	QWORD PTR -8[rsp], r14
	mov	QWORD PTR [rsp], r15
	mov	r15, QWORD PTR 56[r8]
	mov	QWORD PTR 40[rsp], r11
	mov	QWORD PTR -24[rsp], rdx
	mov	QWORD PTR 48[rsp], r13
	mov	r13, QWORD PTR 8[r9]
	mov	QWORD PTR 88[rsp], r12
	mov	QWORD PTR -56[rsp], r10
	mov	QWORD PTR 128[rsp], rbx
	mov	r10, QWORD PTR 40[r8]
	mov	r11, QWORD PTR 16[r8]
	mov	rbx, QWORD PTR 32[r8]
	mov	QWORD PTR 56[rsp], rax
	mov	r14, QWORD PTR 24[r8]
	mov	r12, QWORD PTR [r8]
	mov	QWORD PTR 120[rsp], r10
	lea	r10, [r13+r13]
	mov	rdx, r10
	mov	QWORD PTR 24[rsp], r11
	mulx	r11, r10, rcx
	mov	rdx, QWORD PTR -56[rsp]
	mov	QWORD PTR 96[rsp], rbx
	mov	QWORD PTR 72[rsp], r14
	mov	rbx, QWORD PTR [r9]
	mov	r14, QWORD PTR 8[r8]
	mulx	r9, r8, r15
	mov	rdx, QWORD PTR 128[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rsi
	mov	rdx, QWORD PTR -24[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, QWORD PTR 120[rsp]
	mov	rdx, QWORD PTR 96[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, QWORD PTR 8[rsp]
	mov	rdx, QWORD PTR 72[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rdi
	mov	rdx, QWORD PTR 24[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rax
	mov	rdx, QWORD PTR 104[rsp]
	mov	rax, QWORD PTR 128[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, r14
	mov	rdx, rbx
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r12
	mov	rdx, QWORD PTR -56[rsp]
	add	r8, r10
	adc	r9, r11
	mov	QWORD PTR -72[rsp], r8
	mov	QWORD PTR -64[rsp], r9
	mulx	r9, r8, rcx
	mov	rdx, rsi
	mulx	r11, r10, r15
	mov	rdx, QWORD PTR -24[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rax
	mov	rdx, QWORD PTR 120[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, QWORD PTR 8[rsp]
	mov	rdx, QWORD PTR 96[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rdi
	mov	rdx, QWORD PTR 56[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, QWORD PTR 72[rsp]
	mov	rdx, QWORD PTR 104[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, QWORD PTR 24[rsp]
	mov	rdx, rbx
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r14
	mov	rdx, r13
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, r12
	mov	rdx, rsi
	mov	rsi, QWORD PTR 72[rsp]
	add	r8, r10
	mov	r10, QWORD PTR -72[rsp]
	adc	r9, r11
	mov	r11, QWORD PTR -64[rsp]
	shrd	r10, r11, 58
	shr	r11, 58
	add	r8, r10
	adc	r9, r11
	mov	QWORD PTR -56[rsp], r8
	mov	QWORD PTR -48[rsp], r9
	mulx	r9, r8, rcx
	mov	rdx, QWORD PTR -24[rsp]
	mulx	r11, r10, r15
	mov	rdx, rax
	mov	rax, QWORD PTR 96[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, QWORD PTR 8[rsp]
	mov	rdx, QWORD PTR 120[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rdi
	mov	rdx, QWORD PTR 56[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rax
	mov	rdx, QWORD PTR 104[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rsi
	mov	rdx, QWORD PTR 24[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rbx
	mov	rdx, r13
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r14
	mov	rdx, QWORD PTR 88[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, r12
	mov	rdx, QWORD PTR -24[rsp]
	add	r8, r10
	mov	r10, QWORD PTR -56[rsp]
	adc	r9, r11
	mov	r11, QWORD PTR -48[rsp]
	shrd	r10, r11, 58
	shr	r11, 58
	add	r8, r10
	adc	r9, r11
	mov	QWORD PTR -88[rsp], r8
	mov	QWORD PTR -80[rsp], r9
	mulx	r9, r8, rcx
	mov	rdx, QWORD PTR 8[rsp]
	mulx	r11, r10, r15
	mov	rdx, QWORD PTR 128[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rdi
	mov	rdx, QWORD PTR 56[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, QWORD PTR 120[rsp]
	mov	rdx, QWORD PTR 104[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rax
	mov	rdx, rsi
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rbx
	mov	rdx, QWORD PTR 24[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, r13
	mov	rdx, QWORD PTR 88[rsp]
	mov	rax, QWORD PTR 8[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r14
	mov	rdx, QWORD PTR 48[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, r12
	add	r8, r10
	mov	r10, QWORD PTR -88[rsp]
	adc	r9, r11
	mov	r11, QWORD PTR -80[rsp]
	shrd	r10, r11, 58
	shr	r11, 58
	add	r8, r10
	adc	r9, r11
	mul	rcx
	mov	r10, r8
	mov	r11, r9
	mov	QWORD PTR 16[rsp], rdx
	mov	rdx, rdi
	mulx	r9, r8, r15
	mov	rdx, QWORD PTR 56[rsp]
	mov	QWORD PTR 8[rsp], rax
	add	r8, QWORD PTR 8[rsp]
	adc	r9, QWORD PTR 16[rsp]
	mulx	rdx, rax, QWORD PTR 128[rsp]
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR 8[rsp], rax
	mov	QWORD PTR 16[rsp], rdx
	mov	rdx, QWORD PTR 104[rsp]
	mulx	r9, r8, QWORD PTR 120[rsp]
	mov	rdx, QWORD PTR 96[rsp]
	add	r8, QWORD PTR 8[rsp]
	adc	r9, QWORD PTR 16[rsp]
	mulx	rdx, rax, rbx
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR 8[rsp], rax
	mov	QWORD PTR 16[rsp], rdx
	mov	rdx, rsi
	mulx	r9, r8, r13
	mov	rdx, QWORD PTR 88[rsp]
	add	r8, QWORD PTR 8[rsp]
	adc	r9, QWORD PTR 16[rsp]
	mulx	rdx, rax, QWORD PTR 24[rsp]
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR 8[rsp], rax
	mov	QWORD PTR 16[rsp], rdx
	mov	rdx, QWORD PTR 48[rsp]
	mulx	r9, r8, r14
	mov	rdx, QWORD PTR 40[rsp]
	add	r8, QWORD PTR 8[rsp]
	mov	QWORD PTR 8[rsp], r10
	adc	r9, QWORD PTR 16[rsp]
	mov	QWORD PTR 16[rsp], r11
	mulx	rdx, rax, r12
	add	rax, r8
	adc	rdx, r9
	mov	r9, r10
	mov	r10, r11
	shrd	r9, r11, 58
	shr	r10, 58
	add	rax, r9
	adc	rdx, r10
	mov	r9, rax
	mov	r10, rdx
	mov	rdx, rdi
	mulx	rdx, rax, rcx
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, QWORD PTR 56[rsp]
	mov	QWORD PTR -24[rsp], rax
	mulx	rdi, rsi, r15
	mov	rdx, QWORD PTR 104[rsp]
	add	rsi, QWORD PTR -24[rsp]
	adc	rdi, QWORD PTR -16[rsp]
	mulx	rdx, rax, QWORD PTR 128[rsp]
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR -24[rsp], rax
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, QWORD PTR 120[rsp]
	mulx	rdi, rsi, rbx
	mov	rdx, QWORD PTR 96[rsp]
	add	rsi, QWORD PTR -24[rsp]
	adc	rdi, QWORD PTR -16[rsp]
	mulx	rdx, rax, r13
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR -24[rsp], rax
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, QWORD PTR 88[rsp]
	mulx	rdi, rsi, QWORD PTR 72[rsp]
	mov	rdx, QWORD PTR 48[rsp]
	add	rsi, QWORD PTR -24[rsp]
	adc	rdi, QWORD PTR -16[rsp]
	mov	r8, QWORD PTR 24[rsp]
	mov	QWORD PTR -16[rsp], r10
	mov	QWORD PTR -24[rsp], r9
	mulx	rdx, rax, r8
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 24[rsp], rax
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, QWORD PTR 40[rsp]
	mulx	rdi, rsi, r14
	mov	rdx, QWORD PTR [rsp]
	add	rsi, QWORD PTR 24[rsp]
	adc	rdi, QWORD PTR 32[rsp]
	mulx	rdx, rax, r12
	add	rax, rsi
	mov	rsi, r9
	adc	rdx, rdi
	shrd	rsi, r10, 58
	mov	rdi, r10
	shr	rdi, 58
	mov	r10, rsi
	add	r10, rax
	mov	r11, rdi
	adc	r11, rdx
	mov	rdx, QWORD PTR 56[rsp]
	mov	QWORD PTR 24[rsp], r10
	mov	QWORD PTR 32[rsp], r11
	mov	r11, r8
	mulx	r10, r9, rcx
	mov	rdx, QWORD PTR 104[rsp]
	mulx	rdi, rsi, r15
	mov	rdx, QWORD PTR 128[rsp]
	mulx	rdx, rax, rbx
	add	rsi, r9
	adc	rdi, r10
	add	rax, rsi
	adc	rdx, rdi
	mov	r10, rdx
	mov	rdx, QWORD PTR 120[rsp]
	mulx	rdi, rsi, r13
	mov	rdx, QWORD PTR 88[rsp]
	add	rsi, rax
	mulx	rdx, rax, QWORD PTR 96[rsp]
	adc	rdi, r10
	mov	r10, QWORD PTR 72[rsp]
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 56[rsp], rax
	mov	QWORD PTR 64[rsp], rdx
	mov	rdx, QWORD PTR 48[rsp]
	mulx	rdi, rsi, r10
	mov	rdx, QWORD PTR 40[rsp]
	add	rsi, QWORD PTR 56[rsp]
	adc	rdi, QWORD PTR 64[rsp]
	mulx	rdx, rax, r8
	mov	r8, QWORD PTR 24[rsp]
	add	rax, rsi
	adc	rdx, rdi
	mov	r9, rdx
	mov	rdx, QWORD PTR [rsp]
	mulx	rdi, rsi, r14
	mov	rdx, QWORD PTR -8[rsp]
	add	rsi, rax
	mulx	rdx, rax, r12
	adc	rdi, r9
	mov	r9, QWORD PTR 32[rsp]
	add	rax, rsi
	adc	rdx, rdi
	shrd	r8, r9, 58
	shr	r9, 58
	add	r8, rax
	adc	r9, rdx
	mov	QWORD PTR 72[rsp], r8
	mov	QWORD PTR 80[rsp], r9
	mov	rdx, QWORD PTR 104[rsp]
	mulx	r9, r8, rcx
	mov	rdx, rbx
	mulx	rdi, rsi, r15
	mov	rdx, QWORD PTR 128[rsp]
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, r13
	mov	rdx, QWORD PTR 88[rsp]
	add	rsi, r8
	mov	r8, QWORD PTR 120[rsp]
	adc	rdi, r9
	mov	r9, QWORD PTR 96[rsp]
	mulx	rdx, rax, r8
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 104[rsp], rax
	mov	QWORD PTR 112[rsp], rdx
	mov	rdx, QWORD PTR 48[rsp]
	mulx	rdi, rsi, r9
	mov	rdx, QWORD PTR 40[rsp]
	add	rsi, QWORD PTR 104[rsp]
	adc	rdi, QWORD PTR 112[rsp]
	mulx	rdx, rax, r10
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 104[rsp], rax
	mov	QWORD PTR 112[rsp], rdx
	mov	rdx, QWORD PTR [rsp]
	mulx	rdi, rsi, r11
	mov	rdx, QWORD PTR -8[rsp]
	add	rsi, QWORD PTR 104[rsp]
	adc	rdi, QWORD PTR 112[rsp]
	mulx	rdx, rax, r14
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 104[rsp], rax
	mov	rax, QWORD PTR 72[rsp]
	mov	QWORD PTR 112[rsp], rdx
	mov	rdx, QWORD PTR -32[rsp]
	mulx	rdi, rsi, r12
	mov	rdx, QWORD PTR 80[rsp]
	add	rsi, QWORD PTR 104[rsp]
	adc	rdi, QWORD PTR 112[rsp]
	shrd	rax, rdx, 58
	shr	rdx, 58
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 104[rsp], rax
	mov	QWORD PTR 112[rsp], rdx
	mov	rdx, rbx
	mulx	rbx, rcx, rcx
	mov	rdx, r13
	mulx	rdi, rsi, r15
	mov	rdx, QWORD PTR 88[rsp]
	add	rsi, rcx
	adc	rdi, rbx
	mulx	rbx, rcx, QWORD PTR 128[rsp]
	mov	rdx, QWORD PTR 48[rsp]
	mov	rax, QWORD PTR 104[rsp]
	add	rcx, rsi
	adc	rbx, rdi
	mulx	rdi, rsi, r8
	mov	rdx, QWORD PTR 40[rsp]
	mov	r8, QWORD PTR 72[rsp]
	add	rsi, rcx
	adc	rdi, rbx
	mulx	rbx, rcx, r9
	mov	rdx, QWORD PTR [rsp]
	add	rcx, rsi
	adc	rbx, rdi
	mulx	rdi, rsi, r10
	mov	rdx, QWORD PTR -8[rsp]
	mov	r10, QWORD PTR 24[rsp]
	add	rsi, rcx
	adc	rdi, rbx
	mulx	rbx, rcx, r11
	mov	rdx, QWORD PTR -32[rsp]
	add	rcx, rsi
	adc	rbx, rdi
	mulx	rdi, rsi, r14
	mov	rdx, QWORD PTR -40[rsp]
	add	rcx, rsi
	adc	rbx, rdi
	mulx	rdi, rsi, r12
	mov	rdx, QWORD PTR 112[rsp]
	add	rsi, rcx
	adc	rdi, rbx
	shrd	rax, rdx, 58
	shr	rdx, 58
	add	rsi, rax
	mov	rax, QWORD PTR -72[rsp]
	adc	rdi, rdx
	mov	r12, rsi
	xor	ebx, ebx
	movabs	rdx, 288230376151711743
	and	rax, rdx
	shrd	r12, rdi, 57
	mov	r13, rdi
	mov	rcx, rax
	mov	rax, QWORD PTR -56[rsp]
	shr	r13, 57
	add	rcx, r12
	adc	rbx, r13
	and	rax, rdx
	mov	r12, rcx
	and	rcx, rdx
	mov	rdi, rax
	mov	rax, QWORD PTR -88[rsp]
	shrd	r12, rbx, 58
	and	r8, rdx
	add	rdi, r12
	vmovq	xmm3, rcx
	mov	rbx, QWORD PTR -96[rsp]
	and	r10, rdx
	and	rax, rdx
	mov	r11, rdi
	shr	rdi, 58
	vmovq	xmm4, r8
	mov	r9, rax
	mov	rax, QWORD PTR 8[rsp]
	and	r11, rdx
	add	r9, rdi
	vpinsrq	xmm0, xmm3, r11, 1
	and	rax, rdx
	vmovq	xmm2, r9
	vpinsrq	xmm1, xmm2, rax, 1
	mov	rax, QWORD PTR -24[rsp]
	vinserti128	ymm0, ymm0, xmm1, 0x1
	and	rax, rdx
	vmovdqu	YMMWORD PTR [rbx], ymm0
	vmovq	xmm0, rax
	mov	rax, QWORD PTR 104[rsp]
	vpinsrq	xmm0, xmm0, r10, 1
	and	rax, rdx
	vpinsrq	xmm1, xmm4, rax, 1
	movabs	rax, 144115188075855871
	vinserti128	ymm0, ymm0, xmm1, 0x1
	and	rsi, rax
	mov	QWORD PTR 64[rbx], rsi
	vmovdqu	YMMWORD PTR 32[rbx], ymm0
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
	.size	fiat_p521_carry_mul_gcc, .-fiat_p521_carry_mul_gcc
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
