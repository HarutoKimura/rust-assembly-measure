	.file	"curve25519_solinas_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_curve25519_solinas_square_gcc
	.type	fiat_curve25519_solinas_square_gcc, @function
fiat_curve25519_solinas_square_gcc:
.LFB7:
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
	sub	rsp, 40
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -112[rsp], rdi
	mov	rdx, QWORD PTR [rsi]
	mov	rcx, QWORD PTR 24[rsi]
	mov	rbx, QWORD PTR 16[rsi]
	mov	r9, QWORD PTR 8[rsi]
	mov	QWORD PTR 24[rsp], rdx
	mulx	r11, r10, rcx
	mulx	r15, r14, rbx
	mov	rdx, r9
	mov	QWORD PTR 8[rsp], r9
	mulx	rdi, rsi, QWORD PTR 24[rsp]
	mov	rdx, rcx
	mulx	rdx, rax, rbx
	mov	r8, rdi
	mov	QWORD PTR -24[rsp], rsi
	xor	edi, edi
	mov	rsi, r10
	mov	QWORD PTR [rsp], rdx
	mov	rdx, r9
	xor	r9d, r9d
	mov	r10, r11
	mulx	r13, r12, rcx
	mov	QWORD PTR -8[rsp], rax
	mov	rdx, r15
	mov	rax, r14
	mov	r14, r8
	mov	r15, r9
	mov	r8, QWORD PTR -8[rsp]
	add	r14, rax
	mov	rax, rdx
	adc	r15, rdi
	xor	edx, edx
	xor	edi, edi
	add	rsi, rax
	adc	rdi, rdx
	mov	rax, r12
	xor	edx, edx
	add	rsi, r15
	adc	rdi, rdx
	xor	r11d, r11d
	xor	edx, edx
	add	rax, r10
	adc	rdx, r11
	mov	r12, r13
	xor	r10d, r10d
	add	rax, rdi
	adc	rdx, r10
	xor	r13d, r13d
	xor	r9d, r9d
	add	r8, r12
	adc	r9, r13
	xor	r11d, r11d
	add	r8, rdx
	mov	rdx, QWORD PTR 8[rsp]
	adc	r9, r11
	mov	QWORD PTR -56[rsp], r8
	mov	r8, rsi
	xor	edi, edi
	mulx	r13, r12, rbx
	mov	QWORD PTR -48[rsp], r9
	xor	r9d, r9d
	mov	r10, QWORD PTR -48[rsp]
	mov	QWORD PTR -40[rsp], r14
	add	r8, r12
	mov	r12, r13
	adc	r9, rdi
	xor	r11d, r11d
	xor	edi, edi
	mov	QWORD PTR -72[rsp], r8
	mov	rsi, r9
	mov	r9, QWORD PTR -56[rsp]
	add	rsi, rax
	adc	rdi, r11
	xor	r13d, r13d
	add	rsi, r12
	adc	rdi, r13
	mov	QWORD PTR -88[rsp], rsi
	xor	edx, edx
	mov	rsi, rdi
	xor	edi, edi
	mov	r14, rsi
	mov	r15, rdi
	mov	rdi, QWORD PTR [rsp]
	add	r14, r9
	adc	r15, rdx
	lea	rax, [rdi+r10]
	xor	r11d, r11d
	xor	edx, edx
	add	rax, r15
	adc	rdx, r11
	mov	QWORD PTR -8[rsp], rax
	xor	r11d, r11d
	xor	r13d, r13d
	mov	QWORD PTR [rsp], rdx
	mov	rax, QWORD PTR -24[rsp]
	xor	edx, edx
	mov	r10, QWORD PTR -40[rsp]
	shld	rdx, rax, 1
	add	rax, rax
	shld	r11, r10, 1
	mov	r12, rdx
	add	r10, r10
	mov	QWORD PTR -24[rsp], rax
	add	r12, r10
	mov	r10, QWORD PTR -72[rsp]
	adc	r13, r11
	xor	r11d, r11d
	mov	r8, r10
	mov	r9, r11
	xor	r11d, r11d
	shld	r9, r10, 1
	add	r8, r10
	mov	r10, r13
	add	r10, r8
	mov	r8, QWORD PTR -88[rsp]
	adc	r11, r9
	xor	r9d, r9d
	mov	rsi, r8
	mov	rdi, r9
	xor	r9d, r9d
	add	rsi, r8
	shld	rdi, r8, 1
	mov	rax, rsi
	mov	rdx, rdi
	mov	rsi, r14
	add	rax, r11
	adc	rdx, r9
	xor	edi, edi
	add	rsi, r14
	xor	r9d, r9d
	shld	rdi, r14, 1
	add	rsi, rdx
	mov	QWORD PTR -40[rsp], rax
	adc	rdi, r9
	mov	rax, rsi
	mov	rsi, QWORD PTR -8[rsp]
	xor	r15d, r15d
	mov	rdx, rdi
	xor	edi, edi
	mov	QWORD PTR -56[rsp], rax
	shld	rdi, rsi, 1
	add	rsi, rsi
	mov	QWORD PTR -48[rsp], rdx
	add	rsi, rdx
	mov	rdx, rcx
	mulx	r9, r8, rcx
	mov	rdx, rbx
	adc	rdi, r15
	mov	QWORD PTR -72[rsp], rsi
	xor	ecx, ecx
	mov	QWORD PTR -64[rsp], rdi
	mov	rdi, rcx
	mov	rcx, QWORD PTR -24[rsp]
	mov	QWORD PTR -104[rsp], r8
	mov	QWORD PTR -96[rsp], r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR 8[rsp]
	mulx	r15, r14, rdx
	mov	rdx, QWORD PTR 24[rsp]
	mulx	rsi, rbx, rdx
	mov	rax, r14
	mov	r14, r15
	mov	QWORD PTR -88[rsp], rbx
	xor	ebx, ebx
	mov	QWORD PTR -80[rsp], rsi
	add	rsi, rcx
	mov	rcx, r8
	mov	r8, QWORD PTR -104[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 24[rsp], rsi
	add	rax, rdi
	mov	rsi, QWORD PTR -40[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r12
	adc	rdx, rbx
	mov	QWORD PTR 8[rsp], rax
	xor	r15d, r15d
	mov	rax, rdx
	xor	edx, edx
	add	rax, r14
	mov	r14, QWORD PTR -72[rsp]
	adc	rdx, r15
	xor	ebx, ebx
	add	rax, r10
	mov	r10, QWORD PTR -56[rsp]
	adc	rdx, rbx
	xor	r12d, r12d
	xor	ebx, ebx
	mov	QWORD PTR -24[rsp], rax
	add	rcx, rdx
	mov	QWORD PTR -16[rsp], rdx
	mov	r15, QWORD PTR -64[rsp]
	adc	rbx, r12
	xor	edi, edi
	add	rcx, rsi
	adc	rbx, rdi
	xor	r12d, r12d
	xor	r11d, r11d
	mov	rsi, rbx
	mov	rdi, r12
	add	rsi, r10
	mov	r10, r8
	adc	rdi, r11
	mov	rax, rsi
	xor	r11d, r11d
	mov	rdx, rdi
	add	rax, r9
	mov	rdi, QWORD PTR [rsp]
	mov	r9, QWORD PTR -96[rsp]
	adc	rdx, r11
	xor	r13d, r13d
	xor	r11d, r11d
	add	r10, r14
	mov	r12, rdx
	adc	r11, r13
	lea	r14, [r15+rdi*2]
	xor	r13d, r13d
	add	r12, r10
	mov	r10d, 38
	mov	QWORD PTR -40[rsp], rax
	adc	r13, r11
	add	r14, r9
	xor	edi, edi
	xor	ebx, ebx
	add	r14, r13
	mov	rdx, r14
	mulx	r15, r14, r10
	mov	rdx, r12
	mulx	r9, r8, r10
	mov	rdx, QWORD PTR -40[rsp]
	mulx	r13, r12, r10
	mov	rdx, rcx
	mulx	rdx, rax, r10
	mov	r11, r15
	mov	QWORD PTR -40[rsp], rax
	mov	rax, r14
	mov	QWORD PTR -32[rsp], rdx
	mov	rcx, QWORD PTR 24[rsp]
	mov	rsi, QWORD PTR 8[rsp]
	mov	QWORD PTR -8[rsp], r12
	add	rcx, r12
	mov	QWORD PTR [rsp], r13
	adc	rbx, rdi
	xor	edi, edi
	xor	r13d, r13d
	mov	QWORD PTR 24[rsp], r8
	mov	r12, rbx
	mov	QWORD PTR 32[rsp], r9
	add	r12, rsi
	adc	r13, rdi
	xor	edi, edi
	add	r12, r8
	mov	r8, QWORD PTR -24[rsp]
	adc	r13, rdi
	xor	r9d, r9d
	xor	edi, edi
	mov	rsi, r13
	add	rsi, r8
	mov	r8, QWORD PTR -88[rsp]
	adc	rdi, r9
	mov	r14, rsi
	mov	rsi, QWORD PTR -40[rsp]
	xor	edx, edx
	mov	r15, rdi
	add	r14, rax
	mov	rdi, QWORD PTR -32[rsp]
	adc	r15, rdx
	xor	edx, edx
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdx
	mov	rsi, rdi
	xor	edi, edi
	mov	rax, rsi
	mov	rsi, r9
	mov	rdx, rdi
	xor	edi, edi
	add	rsi, rax
	adc	rdi, rdx
	mov	rbx, rsi
	xor	edx, edx
	mov	rsi, rdi
	add	rbx, rcx
	adc	rsi, rdx
	mov	rdx, QWORD PTR [rsp]
	mov	QWORD PTR 8[rsp], rbx
	xor	ebx, ebx
	mov	rcx, rsi
	mov	QWORD PTR 16[rsp], rsi
	mov	rax, rdx
	xor	edx, edx
	add	rcx, rax
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, r12
	adc	rbx, rdx
	xor	edx, edx
	xor	r13d, r13d
	mov	rsi, rcx
	mov	r12, rbx
	add	r12, r14
	adc	r13, rdx
	mov	rdx, QWORD PTR 32[rsp]
	mov	rax, rdx
	xor	edx, edx
	add	rax, r12
	mov	r12, r8
	mov	r8, QWORD PTR 8[rsp]
	adc	rdx, r13
	add	r11, r15
	xor	r13d, r13d
	mov	QWORD PTR 24[rsp], rax
	add	r11, rdx
	mov	QWORD PTR 32[rsp], rdx
	mov	rcx, QWORD PTR 24[rsp]
	mov	rdx, r11
	mulx	r11, r10, r10
	add	r12, r10
	adc	r13, r11
	xor	r11d, r11d
	xor	r9d, r9d
	add	r8, r13
	adc	r9, r11
	xor	r11d, r11d
	xor	edi, edi
	add	rsi, r9
	adc	rdi, r11
	mov	r14, rsi
	xor	ebx, ebx
	mov	rsi, rdi
	xor	edi, edi
	vmovq	xmm2, r14
	add	rcx, rsi
	adc	rbx, rdi
	vpinsrq	xmm1, xmm2, rcx, 1
	mov	rdi, rbx
	neg	edi
	movsx	rdi, dil
	and	edi, 38
	mov	rax, rdi
	add	rax, r12
	vmovq	xmm3, rax
	mov	rax, QWORD PTR -112[rsp]
	vpinsrq	xmm0, xmm3, r8, 1
	vinserti128	ymm0, ymm0, xmm1, 0x1
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
.LFE7:
	.size	fiat_curve25519_solinas_square_gcc, .-fiat_curve25519_solinas_square_gcc
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
