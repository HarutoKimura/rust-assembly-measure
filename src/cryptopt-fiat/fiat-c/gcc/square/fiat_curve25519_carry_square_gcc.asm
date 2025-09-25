	.file	"curve25519_64_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_curve25519_carry_square_gcc
	.type	fiat_curve25519_carry_square_gcc, @function
fiat_curve25519_carry_square_gcc:
.LFB15:
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
	and	rsp, -32
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -16[rsp], rdi
	mov	r14, QWORD PTR 32[rsi]
	mov	r8, QWORD PTR 24[rsi]
	mov	r15, QWORD PTR 16[rsi]
	mov	rcx, QWORD PTR 8[rsi]
	lea	rax, [r14+r14*8]
	lea	rdx, [r8+r8]
	mov	rbx, QWORD PTR [rsi]
	lea	r12, [r14+rax*2]
	lea	rax, [r8+r8*8]
	mov	QWORD PTR -8[rsp], rdx
	lea	rax, [r8+rax*2]
	lea	r9, [r12+r12]
	lea	r10, [rax+rax]
	lea	r13, [r15+r15]
	mov	rdx, r10
	mulx	r11, r10, r15
	mov	rdx, r9
	mulx	rdi, rsi, rcx
	mov	rdx, rbx
	add	rsi, r10
	adc	rdi, r11
	mulx	r11, r10, rbx
	mov	rdx, rax
	lea	rax, [rcx+rcx]
	add	rsi, r10
	adc	rdi, r11
	mulx	r11, r10, r8
	mov	rdx, r9
	mov	QWORD PTR -32[rsp], rsi
	mov	QWORD PTR -24[rsp], rdi
	mulx	rdi, rsi, r15
	add	rsi, r10
	adc	rdi, r11
	mul	rbx
	mov	r10, rsi
	mov	r11, rdi
	add	r10, rax
	mov	rax, QWORD PTR -32[rsp]
	adc	r11, rdx
	mov	rdx, QWORD PTR -24[rsp]
	xor	edi, edi
	shrd	rax, rdx, 51
	mov	rdx, r9
	mulx	r9, r8, r8
	mov	rdx, rbx
	mov	rsi, rax
	mulx	rdx, rax, r13
	add	rsi, r10
	adc	rdi, r11
	mov	r10, rsi
	mov	QWORD PTR -48[rsp], rsi
	mov	QWORD PTR -40[rsp], rdi
	add	rax, r8
	adc	rdx, r9
	mov	r11, rdx
	mov	rdx, rcx
	mulx	r9, r8, rcx
	mov	rdx, r11
	add	rax, r8
	adc	rdx, r9
	shrd	r10, rdi, 51
	xor	r9d, r9d
	add	rax, r10
	adc	rdx, r9
	mov	QWORD PTR -64[rsp], rax
	mov	rdi, rdx
	mov	rdx, r12
	mov	r12, rax
	mov	rax, QWORD PTR -32[rsp]
	mulx	r9, r8, r14
	mov	rdx, rcx
	mov	QWORD PTR -56[rsp], rdi
	mulx	r11, r10, r13
	mov	rdx, QWORD PTR -8[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rbx
	mov	rdx, rbx
	add	r10, r8
	adc	r11, r9
	shrd	r12, rdi, 51
	xor	r9d, r9d
	mov	r8, r12
	add	r8, r10
	lea	r10, [r14+r14]
	adc	r9, r11
	mulx	r11, r10, r10
	mov	rdx, QWORD PTR -8[rsp]
	mov	r12, r8
	mulx	rbx, rcx, rcx
	mov	rdx, r15
	add	rcx, r10
	adc	rbx, r11
	mulx	r11, r10, r15
	add	rcx, r10
	adc	rbx, r11
	shrd	r12, r9, 51
	xor	r11d, r11d
	mov	r10, r12
	add	r10, rcx
	adc	r11, rbx
	mov	rcx, r10
	shrd	rcx, r11, 51
	lea	rdx, [rcx+rcx*8]
	lea	rdx, [rcx+rdx*2]
	movabs	rcx, 2251799813685247
	and	rax, rcx
	and	r8, rcx
	and	r10, rcx
	add	rdx, rax
	mov	rax, QWORD PTR -48[rsp]
	and	rax, rcx
	mov	rsi, rax
	mov	rax, rdx
	and	rdx, rcx
	shr	rax, 51
	vmovq	xmm3, rdx
	add	rsi, rax
	mov	rax, rsi
	shr	rsi, 51
	and	rax, rcx
	mov	rdi, rax
	mov	rax, QWORD PTR -64[rsp]
	vpinsrq	xmm0, xmm3, rdi, 1
	and	rax, rcx
	add	rax, rsi
	vmovq	xmm2, rax
	mov	rax, QWORD PTR -16[rsp]
	vpinsrq	xmm1, xmm2, r8, 1
	vinserti128	ymm0, ymm0, xmm1, 0x1
	mov	QWORD PTR 32[rax], r10
	vmovdqu	YMMWORD PTR [rax], ymm0
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
.LFE15:
	.size	fiat_curve25519_carry_square_gcc, .-fiat_curve25519_carry_square_gcc
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
