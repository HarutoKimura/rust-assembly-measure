	.file	"p448_solinas_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p448_solinas_carry_square_gcc
	.type	fiat_p448_solinas_carry_square_gcc, @function
fiat_p448_solinas_carry_square_gcc:
.LFB14:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rbx, rsi
	and	rsp, -32
	sub	rsp, 200
	mov	QWORD PTR -112[rsp], rdi
	mov	QWORD PTR -8[rsp], rbx
	mov	r12, QWORD PTR 24[rbx]
	mov	r9, QWORD PTR 56[rsi]
	mov	rcx, QWORD PTR 48[rbx]
	mov	rdi, QWORD PTR 16[rbx]
	lea	rdx, [r12+r12]
	lea	rsi, [r9+r9]
	mov	rax, QWORD PTR 40[rbx]
	mov	r8, QWORD PTR 32[rbx]
	mov	QWORD PTR 184[rsp], rdx
	mov	rdx, r9
	lea	r11, [rdi+rdi]
	lea	r13, [rcx+rcx]
	mulx	r10, r9, r9
	mov	rdx, rcx
	lea	r15, [rax+rax]
	mov	rbx, QWORD PTR 8[rbx]
	mov	QWORD PTR 168[rsp], r11
	lea	r14, [r8+r8]
	mov	QWORD PTR -88[rsp], r9
	mov	QWORD PTR -80[rsp], r10
	mulx	r10, r9, rsi
	mov	QWORD PTR 160[rsp], r10
	mulx	r11, r10, rcx
	mov	rdx, rsi
	mov	QWORD PTR 152[rsp], r9
	mov	QWORD PTR -72[rsp], r10
	mov	QWORD PTR -64[rsp], r11
	mulx	r11, r10, rax
	mov	rdx, rax
	mulx	rcx, rdx, rax
	mov	QWORD PTR 136[rsp], r10
	mov	QWORD PTR -56[rsp], rdx
	mov	rdx, r13
	mulx	r10, r9, r8
	mov	rdx, r8
	mov	QWORD PTR -48[rsp], rcx
	mov	QWORD PTR 144[rsp], r11
	mov	QWORD PTR 120[rsp], r9
	mov	QWORD PTR 128[rsp], r10
	mulx	r10, r9, r15
	mov	QWORD PTR 104[rsp], r9
	mov	QWORD PTR 112[rsp], r10
	mulx	r11, r10, r8
	mov	rdx, rsi
	mulx	rcx, rdx, r12
	mov	QWORD PTR -40[rsp], r10
	mov	QWORD PTR 88[rsp], rdx
	mov	rdx, r13
	mov	QWORD PTR -32[rsp], r11
	mulx	r11, r10, r12
	mov	rdx, r15
	mov	QWORD PTR 96[rsp], rcx
	mulx	rcx, rdx, r12
	mov	QWORD PTR 72[rsp], r10
	mov	QWORD PTR 56[rsp], rdx
	mov	rdx, rsi
	mulx	r10, r9, rdi
	mov	rdx, r13
	mov	QWORD PTR 80[rsp], r11
	mov	QWORD PTR 64[rsp], rcx
	mov	QWORD PTR 48[rsp], r10
	mulx	r11, r10, rdi
	mov	rdx, rsi
	mulx	rcx, rdx, rbx
	mov	QWORD PTR 40[rsp], r9
	mov	QWORD PTR 24[rsp], r10
	mov	QWORD PTR 8[rsp], rdx
	mov	rdx, rax
	mov	rax, QWORD PTR 136[rsp]
	mov	QWORD PTR 32[rsp], r11
	mulx	r11, r10, r13
	mov	rdx, rsi
	mulx	r9, r8, r8
	mov	QWORD PTR 16[rsp], rcx
	mov	rdx, QWORD PTR 168[rsp]
	mov	rcx, QWORD PTR -8[rsp]
	mov	rcx, QWORD PTR [rcx]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR 184[rsp]
	mov	QWORD PTR -8[rsp], r10
	mov	QWORD PTR [rsp], r11
	mulx	r11, r10, rcx
	mov	rdx, r12
	add	r8, r10
	adc	r9, r11
	add	r8, QWORD PTR -8[rsp]
	adc	r9, QWORD PTR [rsp]
	mov	QWORD PTR -24[rsp], r8
	mov	QWORD PTR -16[rsp], r9
	mulx	r9, r8, r14
	mov	rdx, r15
	mulx	r11, r10, rdi
	mov	rdx, r13
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rbx
	mov	rdx, rsi
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rcx
	mov	rdx, QWORD PTR 144[rsp]
	add	r8, r10
	adc	r9, r11
	mov	r10, r9
	mov	r9, r8
	add	r9, QWORD PTR -8[rsp]
	adc	r10, QWORD PTR [rsp]
	add	rax, QWORD PTR -72[rsp]
	adc	rdx, QWORD PTR -64[rsp]
	mov	QWORD PTR -96[rsp], r10
	mov	r11, r10
	mov	QWORD PTR [rsp], rdx
	mov	rdx, rdi
	mov	r10, r9
	mov	r8, QWORD PTR -72[rsp]
	mov	QWORD PTR -8[rsp], rax
	mulx	rdx, rax, rdi
	shrd	r10, r11, 56
	xor	r11d, r11d
	add	r8, QWORD PTR -40[rsp]
	mov	QWORD PTR -104[rsp], r9
	mov	r9, QWORD PTR -64[rsp]
	adc	r9, QWORD PTR -32[rsp]
	add	r8, rax
	adc	r9, rdx
	mov	rdx, QWORD PTR 184[rsp]
	add	r8, QWORD PTR 136[rsp]
	adc	r9, QWORD PTR 144[rsp]
	add	r8, QWORD PTR 56[rsp]
	mulx	rdx, rax, rbx
	adc	r9, QWORD PTR 64[rsp]
	add	r8, QWORD PTR 24[rsp]
	adc	r9, QWORD PTR 32[rsp]
	add	r8, QWORD PTR 8[rsp]
	adc	r9, QWORD PTR 16[rsp]
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR 136[rsp], rax
	mov	rax, QWORD PTR 136[rsp]
	mov	QWORD PTR 144[rsp], rdx
	mov	rdx, r14
	mulx	r9, r8, rcx
	mov	rdx, QWORD PTR 144[rsp]
	add	rax, r8
	mov	r8, QWORD PTR -24[rsp]
	adc	rdx, r9
	add	rax, QWORD PTR -8[rsp]
	adc	rdx, QWORD PTR [rsp]
	mov	r9, QWORD PTR -16[rsp]
	shrd	r8, r9, 56
	xor	r9d, r9d
	mov	QWORD PTR 136[rsp], r8
	mov	r8, QWORD PTR 136[rsp]
	add	rax, r8
	mov	r8, QWORD PTR 104[rsp]
	adc	rdx, r9
	add	rax, r10
	mov	r9, QWORD PTR 112[rsp]
	adc	rdx, r11
	mov	QWORD PTR 136[rsp], rax
	mov	QWORD PTR 144[rsp], rdx
	mov	rdx, rcx
	mulx	rdx, rax, rcx
	add	rax, QWORD PTR -40[rsp]
	adc	rdx, QWORD PTR -32[rsp]
	add	rax, QWORD PTR 56[rsp]
	adc	rdx, QWORD PTR 64[rsp]
	add	rax, QWORD PTR 24[rsp]
	adc	rdx, QWORD PTR 32[rsp]
	add	rax, QWORD PTR 8[rsp]
	adc	rdx, QWORD PTR 16[rsp]
	add	rax, QWORD PTR -8[rsp]
	adc	rdx, QWORD PTR [rsp]
	add	rax, r10
	adc	rdx, r11
	mov	QWORD PTR 56[rsp], rax
	add	r8, QWORD PTR 72[rsp]
	mov	QWORD PTR 64[rsp], rdx
	mov	rdx, QWORD PTR 184[rsp]
	adc	r9, QWORD PTR 80[rsp]
	add	r8, QWORD PTR 40[rsp]
	mulx	rdx, rax, rdi
	adc	r9, QWORD PTR 48[rsp]
	add	rax, r8
	adc	rdx, r9
	mov	r11, rdx
	mov	rdx, r14
	mulx	r9, r8, rbx
	mov	rdx, rcx
	add	r8, rax
	mulx	rdx, rax, r15
	adc	r9, r11
	add	rax, r8
	mov	r8, QWORD PTR 152[rsp]
	adc	rdx, r9
	mov	r9, QWORD PTR 160[rsp]
	mov	r11, QWORD PTR 144[rsp]
	mov	r10, QWORD PTR 136[rsp]
	shld	r9, r8, 1
	add	r8, r8
	add	rax, r8
	lea	r8, [rbx+rbx]
	adc	rdx, r9
	shrd	r10, r11, 56
	xor	r9d, r9d
	mov	r11, QWORD PTR 48[rsp]
	add	rax, r10
	mov	r10, QWORD PTR 40[rsp]
	adc	rdx, r9
	mov	QWORD PTR 184[rsp], rax
	mov	rax, QWORD PTR 152[rsp]
	mov	QWORD PTR 192[rsp], rdx
	add	rax, QWORD PTR 104[rsp]
	mov	rdx, QWORD PTR 160[rsp]
	adc	rdx, QWORD PTR 112[rsp]
	add	rax, QWORD PTR 72[rsp]
	adc	rdx, QWORD PTR 80[rsp]
	add	r10, rax
	adc	r11, rdx
	mov	rdx, rcx
	mov	rax, r10
	mov	r10, QWORD PTR 64[rsp]
	mulx	r9, r8, r8
	mov	rdx, r11
	mov	r11, QWORD PTR -88[rsp]
	add	rax, r8
	adc	rdx, r9
	mov	r9, QWORD PTR 56[rsp]
	shrd	r9, r10, 56
	mov	r8, r9
	xor	r9d, r9d
	add	r8, rax
	adc	r9, rdx
	mov	rdx, r12
	mulx	rdx, rax, r12
	add	rax, QWORD PTR -56[rsp]
	adc	rdx, QWORD PTR -48[rsp]
	add	rax, QWORD PTR 120[rsp]
	adc	rdx, QWORD PTR 128[rsp]
	add	rax, QWORD PTR 88[rsp]
	adc	rdx, QWORD PTR 96[rsp]
	mov	r12, rdx
	mov	rdx, r14
	mov	r14, QWORD PTR 184[rsp]
	mulx	rdi, rsi, rdi
	mov	rdx, r15
	add	rsi, rax
	mulx	rdx, rax, rbx
	adc	rdi, r12
	mov	r12, QWORD PTR -80[rsp]
	add	rax, rsi
	adc	rdx, rdi
	mov	r15, rdx
	mov	rdx, rcx
	mulx	rdi, rsi, r13
	movabs	r13, 72057594037927935
	add	rsi, rax
	adc	rdi, r15
	mov	r15, QWORD PTR 192[rsp]
	shld	r12, r11, 1
	add	r11, r11
	add	rsi, r11
	mov	r11, r14
	adc	rdi, r12
	shrd	r11, r15, 56
	xor	edx, edx
	add	rsi, r11
	adc	rdi, rdx
	mov	QWORD PTR 184[rsp], rsi
	mov	QWORD PTR 192[rsp], rdi
	mov	rax, QWORD PTR -56[rsp]
	mov	rdx, QWORD PTR -48[rsp]
	add	rax, QWORD PTR -88[rsp]
	adc	rdx, QWORD PTR -80[rsp]
	mov	rsi, QWORD PTR 184[rsp]
	mov	rdi, rdx
	mov	rdx, rbx
	mulx	r11, r10, rbx
	mov	rdx, QWORD PTR 168[rsp]
	mov	rbx, r8
	add	r10, rax
	mulx	rdx, rax, rcx
	adc	r11, rdi
	add	r10, QWORD PTR 120[rsp]
	adc	r11, QWORD PTR 128[rsp]
	add	r10, QWORD PTR 88[rsp]
	adc	r11, QWORD PTR 96[rsp]
	mov	rdi, QWORD PTR 192[rsp]
	add	rax, r10
	adc	rdx, r11
	shrd	rbx, r9, 56
	mov	r10, rbx
	xor	ebx, ebx
	add	rax, r10
	adc	rdx, rbx
	mov	rbx, QWORD PTR -104[rsp]
	shrd	rsi, rdi, 56
	mov	rcx, rax
	shrd	rcx, rdx, 56
	mov	QWORD PTR 168[rsp], rax
	and	r8, r13
	and	rbx, r13
	mov	QWORD PTR 176[rsp], rdx
	mov	rdx, QWORD PTR 136[rsp]
	lea	rdi, [rbx+rsi]
	mov	rbx, QWORD PTR -24[rsp]
	mov	rsi, QWORD PTR 184[rsp]
	mov	r11, rdi
	and	rdx, r13
	and	rdi, r13
	and	rbx, r13
	shr	r11, 56
	and	rsi, r13
	add	rcx, rbx
	mov	rbx, QWORD PTR 56[rsp]
	vmovq	xmm3, rsi
	and	rbx, r13
	mov	r10, rbx
	mov	rbx, rcx
	and	rcx, r13
	add	r10, r11
	shr	rbx, 56
	mov	rax, r10
	add	rdx, rbx
	shr	r10, 56
	mov	rbx, QWORD PTR -112[rsp]
	and	rax, r13
	add	rdx, r11
	add	r8, r10
	vmovq	xmm1, rax
	mov	rax, QWORD PTR 168[rsp]
	vpinsrq	xmm1, xmm1, r8, 1
	and	rax, r13
	vmovq	xmm2, rax
	mov	rax, rdx
	shr	rdx, 56
	and	rax, r13
	vpinsrq	xmm0, xmm2, rcx, 1
	vinserti128	ymm0, ymm1, xmm0, 0x1
	vmovq	xmm1, rax
	mov	rax, r14
	and	rax, r13
	vmovdqu	YMMWORD PTR [rbx], ymm0
	vpinsrq	xmm0, xmm3, rdi, 1
	add	rdx, rax
	vpinsrq	xmm1, xmm1, rdx, 1
	vinserti128	ymm0, ymm1, xmm0, 0x1
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
.LFE14:
	.size	fiat_p448_solinas_carry_square_gcc, .-fiat_p448_solinas_carry_square_gcc
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
