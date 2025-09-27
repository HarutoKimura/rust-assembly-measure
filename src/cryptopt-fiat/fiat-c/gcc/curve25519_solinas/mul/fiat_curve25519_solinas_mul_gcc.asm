	.file	"curve25519_solinas_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_curve25519_solinas_mul_gcc
	.type	fiat_curve25519_solinas_mul_gcc, @function
fiat_curve25519_solinas_mul_gcc:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r11, rdx
	mov	rcx, rsi
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
	mov	QWORD PTR -112[rsp], rdi
	mov	r10, QWORD PTR 24[rsi]
	mov	r9, QWORD PTR 24[rdx]
	mov	r8, QWORD PTR 16[r11]
	mov	rdi, QWORD PTR 8[r11]
	mov	rdx, r10
	mov	rax, r10
	mov	r10, QWORD PTR 16[rcx]
	mulx	rsi, rbx, r9
	mulx	r15, r14, rdi
	mov	QWORD PTR 120[rsp], rbx
	mov	QWORD PTR 128[rsp], rsi
	mulx	rsi, rbx, r8
	mov	QWORD PTR 112[rsp], rsi
	mov	rsi, QWORD PTR [r11]
	mov	QWORD PTR 104[rsp], rbx
	xor	ebx, ebx
	mul	rsi
	mov	QWORD PTR -48[rsp], rdx
	mov	rdx, r9
	mov	QWORD PTR -56[rsp], rax
	mulx	rdx, rax, r10
	mov	QWORD PTR 96[rsp], rdx
	mov	rdx, r8
	mov	QWORD PTR 88[rsp], rax
	mulx	rdx, rax, r10
	mov	QWORD PTR 80[rsp], rdx
	mov	rdx, rdi
	mulx	r12, r11, r10
	mov	rdx, rsi
	mov	QWORD PTR 72[rsp], rax
	mov	QWORD PTR 64[rsp], r12
	mulx	r13, r12, r10
	mov	r10, QWORD PTR 8[rcx]
	mov	rdx, r9
	mov	QWORD PTR 56[rsp], r11
	mulx	rdx, rax, r10
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, r8
	mov	QWORD PTR 40[rsp], rax
	mulx	rdx, rax, r10
	mov	QWORD PTR 24[rsp], rax
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rdi
	mov	rcx, QWORD PTR [rcx]
	mulx	rdx, rax, r10
	mov	QWORD PTR -64[rsp], r15
	mov	QWORD PTR -72[rsp], r14
	mov	QWORD PTR 16[rsp], rdx
	mov	rdx, rsi
	mulx	r11, r10, r10
	mov	rdx, r9
	mov	QWORD PTR 8[rsp], rax
	mov	QWORD PTR -88[rsp], r10
	mulx	r10, r9, rcx
	mov	rdx, r8
	mulx	rdx, rax, rcx
	mov	QWORD PTR -80[rsp], r11
	mov	QWORD PTR -104[rsp], r9
	mov	QWORD PTR [rsp], rdx
	mov	rdx, rdi
	mov	rdi, QWORD PTR [rsp]
	mov	QWORD PTR -8[rsp], rax
	mulx	rdx, rax, rcx
	mov	QWORD PTR -96[rsp], r10
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, rsi
	mov	rsi, rdi
	xor	edi, edi
	mulx	rcx, rdx, rcx
	mov	QWORD PTR -24[rsp], rax
	mov	rax, QWORD PTR -56[rsp]
	add	rsi, rax
	mov	rax, QWORD PTR 48[rsp]
	adc	rdi, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	mov	QWORD PTR -32[rsp], rcx
	mov	rcx, r14
	add	rcx, r10
	mov	r10, rsi
	mov	rsi, QWORD PTR 56[rsp]
	mov	QWORD PTR -40[rsp], rdx
	adc	rbx, r9
	xor	r9d, r9d
	add	rcx, rdi
	mov	rdx, QWORD PTR -48[rsp]
	adc	rbx, r9
	xor	edi, edi
	xor	r11d, r11d
	add	r10, rsi
	adc	r11, rdi
	mov	rsi, rcx
	xor	r9d, r9d
	xor	edi, edi
	add	rsi, r11
	lea	r8, [rax+rbx]
	mov	rax, r13
	mov	rcx, QWORD PTR 72[rsp]
	adc	rdi, r9
	xor	r15d, r15d
	add	rsi, rdx
	adc	rdi, r15
	mov	r15, QWORD PTR -16[rsp]
	xor	ebx, ebx
	xor	r9d, r9d
	add	r8, rdi
	mov	r14, r15
	adc	r9, rbx
	xor	edx, edx
	xor	r15d, r15d
	add	r14, r12
	adc	r15, rdx
	xor	ebx, ebx
	mov	rdx, rbx
	mov	r12, r15
	xor	ebx, ebx
	mov	r13, rbx
	add	r12, rax
	mov	rax, QWORD PTR 104[rsp]
	adc	r13, rdx
	xor	edx, edx
	add	r12, r10
	mov	r10, r8
	adc	r13, rdx
	xor	ebx, ebx
	mov	rdx, rbx
	xor	ebx, ebx
	add	rcx, r13
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rsi
	adc	rbx, rdx
	xor	edi, edi
	xor	r11d, r11d
	add	r10, rbx
	adc	r11, rdi
	mov	rdi, QWORD PTR 96[rsp]
	xor	edx, edx
	add	r10, rax
	adc	r11, rdx
	xor	edx, edx
	lea	rax, [rdi+r9]
	xor	edi, edi
	mov	r9, rdx
	mov	r8, rax
	mov	rax, QWORD PTR 8[rsp]
	add	r8, r11
	adc	r9, rdi
	mov	QWORD PTR -56[rsp], r8
	mov	r8, r14
	xor	edx, edx
	mov	QWORD PTR -48[rsp], r9
	xor	r9d, r9d
	add	r8, rax
	mov	rax, QWORD PTR 24[rsp]
	adc	r9, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, r9
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r12
	adc	rdx, rdi
	mov	rdi, QWORD PTR 64[rsp]
	mov	rsi, rdi
	xor	edi, edi
	mov	r12, rsi
	mov	rsi, rdx
	mov	r13, rdi
	xor	edi, edi
	add	rsi, r12
	adc	rdi, r13
	xor	r13d, r13d
	add	rsi, rcx
	adc	rdi, r13
	mov	r13, QWORD PTR -64[rsp]
	xor	ebx, ebx
	mov	rcx, rdi
	mov	r12, r13
	xor	r13d, r13d
	add	rcx, r12
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, r10
	mov	r10, QWORD PTR -56[rsp]
	adc	rbx, r13
	xor	r11d, r11d
	xor	r13d, r13d
	mov	r12, rbx
	add	r12, r10
	adc	r13, r11
	mov	QWORD PTR 56[rsp], r12
	xor	r15d, r15d
	mov	QWORD PTR 64[rsp], r13
	mov	r13, QWORD PTR -32[rsp]
	mov	r10, QWORD PTR -88[rsp]
	mov	r11, QWORD PTR -80[rsp]
	mov	r12, r13
	xor	r13d, r13d
	mov	r9, QWORD PTR 16[rsp]
	mov	r14, r10
	mov	r10, r11
	add	r14, r12
	adc	r15, r13
	xor	r11d, r11d
	xor	r13d, r13d
	mov	r12, r15
	add	r12, r10
	adc	r13, r11
	xor	r11d, r11d
	add	r12, r8
	mov	r8, r9
	adc	r13, r11
	xor	r9d, r9d
	xor	r11d, r11d
	mov	r10, r13
	add	r10, r8
	mov	r8, rsi
	adc	r11, r9
	xor	r9d, r9d
	add	r10, rax
	mov	rax, QWORD PTR 40[rsp]
	adc	r11, r9
	xor	r9d, r9d
	xor	edx, edx
	add	rax, r11
	mov	r11, QWORD PTR 112[rsp]
	adc	rdx, r9
	mov	rsi, rax
	xor	r9d, r9d
	mov	rax, QWORD PTR 88[rsp]
	add	rsi, r8
	mov	rdi, rdx
	adc	rdi, r9
	xor	r9d, r9d
	xor	edx, edx
	add	rax, rdi
	adc	rdx, r9
	xor	r9d, r9d
	add	rax, rcx
	mov	rcx, QWORD PTR 56[rsp]
	mov	r8, rax
	mov	rax, QWORD PTR 120[rsp]
	adc	rdx, r9
	xor	ebx, ebx
	mov	r9, rdx
	xor	edx, edx
	mov	QWORD PTR 40[rsp], r8
	mov	r8, QWORD PTR -8[rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR -24[rsp]
	mov	QWORD PTR 48[rsp], r9
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r9
	mov	QWORD PTR 88[rsp], rax
	adc	rdx, rbx
	mov	rax, r14
	xor	ebx, ebx
	mov	QWORD PTR 96[rsp], rdx
	xor	edx, edx
	add	rax, rcx
	mov	r14, r10
	adc	rdx, rbx
	mov	QWORD PTR 8[rsp], rax
	xor	r9d, r9d
	mov	rbx, QWORD PTR 32[rsp]
	mov	rax, rdx
	mov	QWORD PTR 16[rsp], rdx
	xor	edx, edx
	mov	r10, r11
	add	r8, rax
	mov	rax, QWORD PTR -104[rsp]
	mov	rcx, rbx
	adc	r9, rdx
	xor	edx, edx
	add	r8, r12
	adc	r9, rdx
	xor	r15d, r15d
	xor	edx, edx
	add	rax, r9
	adc	rdx, r15
	xor	r15d, r15d
	add	r14, rax
	adc	r15, rdx
	xor	r12d, r12d
	xor	ebx, ebx
	mov	rax, r15
	mov	rdx, r12
	add	rax, rcx
	mov	rcx, QWORD PTR 80[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rsi
	adc	rdx, rbx
	mov	QWORD PTR 72[rsp], rax
	mov	rax, QWORD PTR 72[rsp]
	mov	rdi, rdx
	mov	rdx, rcx
	xor	ecx, ecx
	mov	rsi, rdi
	mov	QWORD PTR 80[rsp], rdi
	xor	edi, edi
	add	rsi, rdx
	mov	rdx, QWORD PTR 128[rsp]
	adc	rdi, rcx
	mov	rcx, QWORD PTR 40[rsp]
	xor	ebx, ebx
	add	rsi, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	rdi, rbx
	xor	r11d, r11d
	xor	ebx, ebx
	add	rcx, r10
	adc	rbx, r11
	xor	r12d, r12d
	mov	r13, r12
	mov	r12, rdi
	add	r12, rcx
	mov	rcx, QWORD PTR -48[rsp]
	adc	r13, rbx
	lea	r10, [rdx+rcx]
	add	r10, QWORD PTR 64[rsp]
	add	r10, QWORD PTR 96[rsp]
	mov	ecx, 38
	add	r10, r13
	mov	rdx, r10
	mulx	r11, r10, rcx
	mov	rdx, r12
	mulx	r13, r12, rcx
	mov	rdx, rsi
	mulx	rdi, rsi, rcx
	mul	rcx
	mov	rbx, r11
	mov	QWORD PTR 120[rsp], r12
	mov	QWORD PTR 128[rsp], r13
	mov	r12, rsi
	mov	r13, rdi
	xor	edi, edi
	mov	QWORD PTR 88[rsp], rax
	mov	QWORD PTR 96[rsp], rdx
	mov	rsi, QWORD PTR 8[rsp]
	xor	edx, edx
	mov	QWORD PTR 104[rsp], r12
	mov	rax, QWORD PTR 120[rsp]
	add	rsi, r12
	mov	QWORD PTR 112[rsp], r13
	adc	rdi, rdx
	xor	edx, edx
	xor	r13d, r13d
	mov	r12, rdi
	add	r12, r8
	mov	r8, r14
	adc	r13, rdx
	xor	edx, edx
	add	r12, rax
	adc	r13, rdx
	xor	r9d, r9d
	mov	rax, r13
	mov	rdx, r9
	xor	r9d, r9d
	add	rax, r10
	mov	r10, QWORD PTR -40[rsp]
	adc	rdx, r9
	mov	r14, rax
	xor	r9d, r9d
	mov	r15, rdx
	add	r14, r8
	mov	r8, QWORD PTR 88[rsp]
	adc	r15, r9
	mov	r9, QWORD PTR 96[rsp]
	xor	edx, edx
	xor	r11d, r11d
	add	r10, r8
	adc	r11, rdx
	mov	r8, r9
	xor	r9d, r9d
	mov	rax, r8
	mov	r8, r11
	mov	rdx, r9
	xor	r9d, r9d
	add	r8, rax
	adc	r9, rdx
	xor	edx, edx
	add	r8, rsi
	adc	r9, rdx
	mov	rdx, QWORD PTR 112[rsp]
	xor	edi, edi
	mov	rsi, r9
	mov	rax, rdx
	xor	edx, edx
	add	rsi, rax
	adc	rdi, rdx
	xor	edx, edx
	add	rsi, r12
	adc	rdi, rdx
	mov	QWORD PTR 104[rsp], rsi
	xor	edx, edx
	mov	rsi, rdi
	mov	QWORD PTR 112[rsp], rdi
	xor	edi, edi
	mov	r12, rsi
	mov	r13, rdi
	add	r12, r14
	adc	r13, rdx
	mov	rdx, QWORD PTR 128[rsp]
	mov	rax, rdx
	xor	edx, edx
	add	rax, r12
	mov	r12, r10
	adc	rdx, r13
	add	rbx, r15
	xor	r13d, r13d
	mov	rsi, rax
	add	rbx, rdx
	mov	rdx, rbx
	mulx	rbx, rcx, rcx
	add	r12, rcx
	mov	rcx, r8
	mov	r8, QWORD PTR 104[rsp]
	adc	r13, rbx
	xor	r11d, r11d
	xor	ebx, ebx
	add	rcx, r13
	adc	rbx, r11
	xor	r11d, r11d
	xor	r9d, r9d
	add	r8, rbx
	adc	r9, r11
	xor	r11d, r11d
	vmovq	xmm2, r8
	xor	edi, edi
	add	rsi, r9
	adc	rdi, r11
	vpinsrq	xmm1, xmm2, rsi, 1
	neg	edi
	movsx	rdi, dil
	and	edi, 38
	mov	rax, rdi
	add	rax, r12
	vmovq	xmm3, rax
	mov	rax, QWORD PTR -112[rsp]
	vpinsrq	xmm0, xmm3, rcx, 1
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
	.size	fiat_curve25519_solinas_mul_gcc, .-fiat_curve25519_solinas_mul_gcc
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
