	.file	"p256_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p256_square_gcc
	.type	fiat_p256_square_gcc, @function
fiat_p256_square_gcc:
.LFB20:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	.cfi_offset 15, -24
	xor	r15d, r15d
	push	r14
	push	r13
	push	r12
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	xor	r12d, r12d
	push	rbx
	and	rsp, -32
	sub	rsp, 136
	.cfi_offset 3, -56
	mov	QWORD PTR -112[rsp], rdi
	mov	QWORD PTR -16[rsp], r15
	xor	r15d, r15d
	mov	rcx, QWORD PTR [rsi]
	mov	rdx, QWORD PTR 24[rsi]
	mov	QWORD PTR 48[rsp], r15
	mov	rax, QWORD PTR 8[rsi]
	mov	r11, QWORD PTR 16[rsi]
	mov	QWORD PTR 112[rsp], 0
	mulx	rsi, rbx, rcx
	mov	QWORD PTR 120[rsp], rdx
	mov	rdx, r11
	mov	QWORD PTR 24[rsp], r11
	mov	QWORD PTR 96[rsp], 0
	mov	QWORD PTR 64[rsp], rsi
	mov	QWORD PTR -24[rsp], rsi
	mulx	rdi, rsi, rcx
	mov	rdx, rcx
	mulx	r9, r8, rax
	mov	QWORD PTR 56[rsp], rbx
	mulx	rbx, rcx, rcx
	mov	r11, rdi
	mov	QWORD PTR 88[rsp], rsi
	mov	rdi, QWORD PTR 48[rsp]
	mov	QWORD PTR 40[rsp], r9
	xor	r9d, r9d
	mov	rsi, QWORD PTR 40[rsp]
	mov	QWORD PTR 104[rsp], r8
	mov	r8, rbx
	add	r8, QWORD PTR 104[rsp]
	adc	r9, QWORD PTR 112[rsp]
	mov	r14, r8
	mov	r8, r9
	xor	r9d, r9d
	add	rsi, QWORD PTR 88[rsp]
	adc	rdi, QWORD PTR 96[rsp]
	add	r8, rsi
	mov	rdx, QWORD PTR 56[rsp]
	mov	rsi, r11
	mov	QWORD PTR 80[rsp], 0
	adc	r9, rdi
	mov	QWORD PTR -8[rsp], r8
	mov	rdi, r12
	mov	r15, QWORD PTR 64[rsp]
	mov	r8, r9
	xor	r9d, r9d
	mov	QWORD PTR 72[rsp], rdx
	add	rsi, QWORD PTR 72[rsp]
	mov	r10, r9
	mov	r9, r8
	adc	rdi, QWORD PTR 80[rsp]
	movabs	rdx, -4294967295
	add	r9, rsi
	mov	rsi, rcx
	mulx	rbx, rcx, rcx
	mov	rdx, -1
	adc	r10, rdi
	mov	QWORD PTR -40[rsp], r11
	xor	edi, edi
	mov	QWORD PTR -48[rsp], r10
	mulx	r11, r10, rsi
	mov	r13, rdi
	mov	rdx, QWORD PTR 120[rsp]
	mov	QWORD PTR -32[rsp], r12
	mov	r12, rsi
	shld	r13, rsi, 32
	sal	r12, 32
	mov	QWORD PTR 16[rsp], rbx
	sub	r12, rsi
	mov	QWORD PTR -56[rsp], r9
	sbb	r13, rdi
	mov	r8, r11
	xor	ebx, ebx
	mov	QWORD PTR 8[rsp], rcx
	mov	r9, rbx
	mov	rcx, r10
	xor	ebx, ebx
	add	r8, r12
	adc	r9, rbx
	xor	ebx, ebx
	add	rcx, rsi
	mov	rsi, r8
	adc	rbx, rdi
	xor	edi, edi
	mov	rcx, rbx
	xor	ebx, ebx
	add	rsi, rcx
	mov	rcx, r14
	mov	r14, QWORD PTR -48[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, rdi
	lea	rsi, 0[r13+r9]
	xor	edi, edi
	xor	r11d, r11d
	mov	r8, rbx
	mov	r9, r11
	mov	r13, QWORD PTR -56[rsp]
	add	r8, rsi
	mov	rsi, QWORD PTR -8[rsp]
	mov	r10, r8
	adc	r9, rdi
	xor	edi, edi
	add	r10, rsi
	mov	rsi, QWORD PTR 8[rsp]
	mov	r11, r9
	adc	r11, rdi
	xor	r9d, r9d
	xor	edi, edi
	mov	QWORD PTR -56[rsp], r10
	add	rsi, r13
	adc	rdi, r9
	xor	r9d, r9d
	add	rsi, r11
	adc	rdi, r9
	mov	r9, QWORD PTR 16[rsp]
	add	r15, r14
	xor	r11d, r11d
	mov	r8, r9
	xor	r9d, r9d
	add	r8, r15
	mulx	r15, r14, rax
	mov	rdx, QWORD PTR 24[rsp]
	adc	r9, r11
	xor	r11d, r11d
	add	r8, rdi
	adc	r9, r11
	mov	QWORD PTR -72[rsp], r8
	xor	r10d, r10d
	xor	r13d, r13d
	mov	QWORD PTR -64[rsp], r9
	mulx	r9, r8, rax
	mul	rax
	xor	r11d, r11d
	mov	QWORD PTR -88[rsp], r15
	mov	QWORD PTR -80[rsp], r10
	mov	QWORD PTR 16[rsp], r13
	mov	r10, rax
	mov	rax, rdx
	add	r10, QWORD PTR 40[rsp]
	mov	QWORD PTR 8[rsp], r9
	adc	r11, QWORD PTR 48[rsp]
	xor	edx, edx
	mov	QWORD PTR 56[rsp], r8
	add	rax, QWORD PTR 56[rsp]
	mov	r8, QWORD PTR 8[rsp]
	mov	QWORD PTR 40[rsp], r14
	mov	QWORD PTR 64[rsp], 0
	adc	rdx, QWORD PTR 64[rsp]
	xor	r13d, r13d
	add	rax, r11
	adc	rdx, r13
	xor	r13d, r13d
	add	r8, QWORD PTR 40[rsp]
	mov	QWORD PTR 48[rsp], 0
	mov	r12, rdx
	mov	r9, QWORD PTR 16[rsp]
	adc	r9, QWORD PTR 48[rsp]
	add	r12, r8
	mov	r8, rcx
	adc	r13, r9
	xor	r9d, r9d
	add	r8, QWORD PTR 104[rsp]
	adc	r9, QWORD PTR 112[rsp]
	mov	rcx, r9
	mov	QWORD PTR [rsp], r13
	xor	ebx, ebx
	xor	r13d, r13d
	add	rcx, r10
	mov	r10, QWORD PTR -56[rsp]
	mov	QWORD PTR -8[rsp], r12
	adc	rbx, r13
	xor	r11d, r11d
	add	rcx, r10
	adc	rbx, r11
	xor	r13d, r13d
	xor	r11d, r11d
	mov	QWORD PTR 104[rsp], rcx
	mov	r10, rbx
	mov	rcx, QWORD PTR -72[rsp]
	mov	rbx, QWORD PTR -64[rsp]
	add	r10, rsi
	adc	r11, r13
	xor	edi, edi
	add	r10, rax
	mov	rax, QWORD PTR -8[rsp]
	adc	r11, rdi
	xor	edi, edi
	xor	edx, edx
	mov	QWORD PTR -56[rsp], r10
	add	rax, rcx
	mov	rcx, r8
	mov	r10, r8
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r11
	mov	r12, rax
	mov	rax, QWORD PTR [rsp]
	adc	rdx, rdi
	xor	edi, edi
	mov	r13, rdx
	xor	edx, edx
	mov	QWORD PTR -72[rsp], r12
	lea	rsi, [rax+r15]
	mov	rax, rbx
	add	rax, rsi
	adc	rdx, rdi
	xor	esi, esi
	add	rax, r13
	adc	rdx, rsi
	xor	r11d, r11d
	sal	rcx, 32
	mov	QWORD PTR -8[rsp], rax
	mov	QWORD PTR [rsp], rdx
	mov	rbx, r11
	mov	r12, rcx
	movabs	rdx, -4294967295
	mulx	r15, r14, r8
	mov	rdx, -1
	shld	rbx, r8, 32
	sub	r12, r8
	mulx	r9, r8, r8
	mov	r13, rbx
	sbb	r13, r11
	xor	edx, edx
	mov	rdi, rdx
	xor	edx, edx
	mov	rsi, r9
	mov	rax, r8
	add	rsi, r12
	adc	rdi, rdx
	xor	edx, edx
	add	rax, r10
	mov	r10, rsi
	adc	rdx, r11
	xor	r11d, r11d
	mov	rax, rdx
	xor	edx, edx
	add	r10, rax
	mov	rax, QWORD PTR 104[rsp]
	adc	r11, rdx
	xor	edx, edx
	add	r10, rax
	lea	rax, 0[r13+rdi]
	adc	r11, rdx
	xor	edx, edx
	xor	ebx, ebx
	mov	r12, r10
	mov	rcx, r11
	add	rcx, rax
	mov	rax, QWORD PTR -56[rsp]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rax
	mov	rax, r14
	mov	rsi, rcx
	mov	rcx, QWORD PTR -72[rsp]
	adc	rbx, rdx
	xor	edx, edx
	mov	rdi, rbx
	xor	ebx, ebx
	mov	QWORD PTR -56[rsp], rsi
	add	rax, rcx
	mov	QWORD PTR -48[rsp], rdi
	mov	rcx, QWORD PTR -8[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rdi
	mov	r8, QWORD PTR -40[rsp]
	adc	rdx, rbx
	mov	QWORD PTR -72[rsp], rax
	xor	esi, esi
	xor	ebx, ebx
	mov	rax, rdx
	add	rcx, r15
	mov	QWORD PTR -64[rsp], rdx
	mov	r9, QWORD PTR -32[rsp]
	mov	QWORD PTR 112[rsp], 0
	adc	rbx, rsi
	xor	edx, edx
	add	rcx, rax
	adc	rbx, rdx
	mov	rdx, QWORD PTR 24[rsp]
	xor	esi, esi
	mov	QWORD PTR -104[rsp], rcx
	mov	QWORD PTR 32[rsp], rsi
	add	r8, QWORD PTR 56[rsp]
	mulx	rdi, rsi, rdx
	adc	r9, QWORD PTR 64[rsp]
	mov	QWORD PTR -96[rsp], rbx
	mulx	r15, r14, QWORD PTR 120[rsp]
	xor	ebx, ebx
	mov	rcx, rsi
	add	rcx, QWORD PTR 8[rsp]
	adc	rbx, QWORD PTR 16[rsp]
	xor	r13d, r13d
	add	rcx, r9
	mov	QWORD PTR 104[rsp], r14
	mov	rsi, rdi
	adc	rbx, r13
	xor	edi, edi
	add	rsi, QWORD PTR 104[rsp]
	adc	rdi, QWORD PTR 112[rsp]
	mov	rax, rsi
	xor	r13d, r13d
	mov	rdx, rdi
	mov	QWORD PTR 24[rsp], r15
	add	rax, rbx
	adc	rdx, r13
	xor	r13d, r13d
	add	r12, QWORD PTR 88[rsp]
	adc	r13, QWORD PTR 96[rsp]
	mov	rsi, r13
	xor	r11d, r11d
	xor	edi, edi
	mov	QWORD PTR 56[rsp], rax
	add	rsi, r8
	mov	r8, QWORD PTR -56[rsp]
	mov	QWORD PTR 64[rsp], rdx
	adc	rdi, r11
	xor	r9d, r9d
	add	rsi, r8
	adc	rdi, r9
	mov	QWORD PTR 8[rsp], rsi
	xor	r9d, r9d
	mov	rsi, rdi
	xor	edi, edi
	add	rsi, rcx
	mov	rcx, QWORD PTR -72[rsp]
	adc	rdi, r9
	xor	ebx, ebx
	add	rsi, rcx
	adc	rdi, rbx
	mov	QWORD PTR -40[rsp], rsi
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR -32[rsp], rdi
	mov	r10, QWORD PTR -104[rsp]
	mov	r8, QWORD PTR 56[rsp]
	mov	r11, QWORD PTR -96[rsp]
	mov	rax, r10
	mov	r9, QWORD PTR 64[rsp]
	add	rax, rdi
	mov	rdi, QWORD PTR [rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r8
	adc	rdx, rbx
	mov	rbx, rax
	lea	rax, [r11+rdi]
	mov	rsi, rdx
	mov	QWORD PTR -8[rsp], rbx
	xor	edx, edx
	xor	ebx, ebx
	mov	rcx, rsi
	mov	QWORD PTR [rsp], rsi
	mov	rsi, QWORD PTR -8[rsp]
	add	rcx, rax
	lea	rax, [r9+r15]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rax
	adc	rbx, rdx
	mov	QWORD PTR 88[rsp], rcx
	mov	rcx, r12
	movabs	rdx, -4294967295
	mulx	r15, r14, r12
	mov	rdx, -1
	mov	QWORD PTR 96[rsp], rbx
	xor	ebx, ebx
	mulx	r11, r10, rcx
	mov	r13, rbx
	shld	r13, r12, 32
	sal	r12, 32
	sub	r12, rcx
	mov	r8, r11
	sbb	r13, rbx
	mov	rax, r10
	xor	edx, edx
	xor	r9d, r9d
	add	r8, r12
	mov	rdi, r13
	adc	r9, rdx
	xor	edx, edx
	add	rax, rcx
	mov	r12, r8
	adc	rdx, rbx
	xor	r13d, r13d
	lea	rcx, [rdi+r9]
	mov	rax, rdx
	xor	edx, edx
	add	r12, rax
	mov	rax, QWORD PTR 8[rsp]
	adc	r13, rdx
	xor	edx, edx
	add	r12, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	r13, rdx
	xor	edx, edx
	mov	rbx, rdx
	xor	edx, edx
	add	rax, r13
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	xor	r11d, r11d
	xor	edi, edi
	mov	QWORD PTR 56[rsp], rax
	mov	rcx, rdx
	mov	rbx, r11
	mov	rdx, QWORD PTR 120[rsp]
	add	rcx, rsi
	mov	rsi, QWORD PTR 88[rsp]
	adc	rbx, rdi
	xor	edi, edi
	add	rcx, r14
	mulx	r11, r10, rdx
	adc	rbx, rdi
	xor	r9d, r9d
	xor	edi, edi
	mov	r14, QWORD PTR -24[rsp]
	add	rsi, rbx
	adc	rdi, r9
	xor	r9d, r9d
	add	rsi, r15
	mov	r15, QWORD PTR -16[rsp]
	adc	rdi, r9
	add	r14, QWORD PTR 40[rsp]
	adc	r15, QWORD PTR 48[rsp]
	xor	r9d, r9d
	mov	QWORD PTR 8[rsp], rsi
	mov	r8, r15
	mov	rsi, QWORD PTR -88[rsp]
	add	rsi, QWORD PTR 104[rsp]
	mov	QWORD PTR 16[rsp], rdi
	mov	rdi, QWORD PTR -80[rsp]
	adc	rdi, QWORD PTR 112[rsp]
	add	r8, rsi
	mov	rsi, r10
	adc	r9, rdi
	xor	edi, edi
	add	rsi, QWORD PTR 24[rsp]
	mov	QWORD PTR 48[rsp], r11
	adc	rdi, QWORD PTR 32[rsp]
	xor	r11d, r11d
	add	rsi, r9
	adc	rdi, r11
	mov	QWORD PTR 120[rsp], rsi
	mov	rsi, r12
	mov	QWORD PTR 128[rsp], rdi
	xor	edi, edi
	add	rsi, QWORD PTR 72[rsp]
	adc	rdi, QWORD PTR 80[rsp]
	xor	r12d, r12d
	xor	r13d, r13d
	mov	QWORD PTR 104[rsp], rsi
	mov	r10, rdi
	mov	r11, r12
	mov	r12, QWORD PTR 56[rsp]
	mov	rsi, QWORD PTR 8[rsp]
	add	r10, r14
	mov	r14, rcx
	mov	rdi, QWORD PTR 16[rsp]
	adc	r11, r13
	xor	r13d, r13d
	add	r12, r10
	mov	rcx, rsi
	adc	r13, r11
	xor	r11d, r11d
	xor	edx, edx
	mov	r10, QWORD PTR 48[rsp]
	mov	rax, r13
	add	rax, r8
	adc	rdx, r11
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 120[rsp]
	adc	r15, rdx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, r15
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rax
	adc	rbx, rdx
	mov	rdx, QWORD PTR 96[rsp]
	xor	r9d, r9d
	mov	QWORD PTR 88[rsp], rcx
	mov	rax, rbx
	lea	r8, [rdi+rdx]
	mov	rdi, QWORD PTR 128[rsp]
	xor	edx, edx
	mov	QWORD PTR 128[rsp], 0
	add	rax, r8
	lea	r8, [r10+rdi]
	adc	rdx, r9
	xor	r9d, r9d
	mov	r10, QWORD PTR 128[rsp]
	add	rax, r8
	mov	QWORD PTR 72[rsp], rax
	mov	rax, QWORD PTR 104[rsp]
	adc	rdx, r9
	mov	rdi, r10
	mov	QWORD PTR 80[rsp], rdx
	mov	r11, rdi
	movabs	rdx, -4294967295
	mov	QWORD PTR 120[rsp], rax
	mov	r9, QWORD PTR 120[rsp]
	mulx	rsi, rbx, r9
	mov	r10, r9
	shld	r11, r9, 32
	mov	rdx, -1
	sal	r10, 32
	sub	r10, r9
	sbb	r11, rdi
	mov	QWORD PTR 56[rsp], r10
	mov	r8, QWORD PTR 56[rsp]
	xor	ecx, ecx
	mov	QWORD PTR 112[rsp], rsi
	mulx	rdi, rsi, rax
	xor	r9d, r9d
	mov	r15, QWORD PTR 112[rsp]
	mov	QWORD PTR 104[rsp], rbx
	mov	rbx, r11
	mov	r11, rcx
	mov	r10, rdi
	add	r10, r8
	mov	r8, rsi
	adc	r11, r9
	xor	r9d, r9d
	add	r8, QWORD PTR 120[rsp]
	mov	rax, r10
	adc	r9, QWORD PTR 128[rsp]
	xor	edx, edx
	lea	rsi, [rbx+r11]
	mov	r8, r9
	xor	r9d, r9d
	add	rax, r8
	mov	r8, r14
	mov	r14, QWORD PTR 104[rsp]
	adc	rdx, r9
	xor	edi, edi
	add	rax, r12
	adc	rdx, rdi
	xor	edi, edi
	xor	r9d, r9d
	mov	r12, rax
	add	r8, rdx
	mov	r13, rdx
	mov	QWORD PTR 120[rsp], r12
	adc	r9, rdi
	xor	edi, edi
	add	r8, rsi
	mov	rsi, QWORD PTR 88[rsp]
	adc	r9, rdi
	mov	rax, r8
	xor	r11d, r11d
	mov	r8, QWORD PTR 72[rsp]
	xor	edi, edi
	add	rsi, r9
	mov	rdx, r9
	mov	r9, QWORD PTR 80[rsp]
	adc	rdi, r11
	xor	ebx, ebx
	add	rsi, r14
	mov	r10, r8
	adc	rdi, rbx
	xor	ebx, ebx
	xor	r11d, r11d
	mov	r14, r12
	add	r10, rdi
	mov	QWORD PTR 128[rsp], r13
	mov	rcx, rax
	adc	r11, rbx
	xor	ebx, ebx
	add	r10, r15
	mov	QWORD PTR 112[rsp], rdx
	adc	r11, rbx
	xor	r15d, r15d
	add	r14, 1
	mov	QWORD PTR 96[rsp], rdi
	adc	r15, -1
	xor	r13d, r13d
	xor	ebx, ebx
	mov	QWORD PTR 104[rsp], rax
	mov	rdx, r15
	mov	QWORD PTR 88[rsp], rsi
	mov	r8, QWORD PTR 104[rsp]
	neg	edx
	movzx	r12d, dl
	sub	rcx, r12
	movabs	r12, -4294967295
	sbb	rbx, r13
	mov	rdx, rcx
	mov	r13, -1
	add	rdx, r12
	mov	rcx, rbx
	mov	r12, rsi
	adc	rcx, r13
	xor	ebx, ebx
	xor	r13d, r13d
	mov	QWORD PTR 72[rsp], rdx
	mov	rdi, rcx
	mov	QWORD PTR 80[rsp], rcx
	neg	edi
	movzx	ecx, dil
	sub	r12, rcx
	mov	rcx, r10
	sbb	r13, rbx
	mov	QWORD PTR 56[rsp], r12
	xor	ebx, ebx
	mov	rdi, r13
	mov	QWORD PTR 64[rsp], r13
	xor	r13d, r13d
	neg	edi
	movzx	r12d, dil
	sub	rcx, r12
	mov	r12d, 4294967295
	sbb	rbx, r13
	mov	rax, rcx
	mov	r13, -1
	add	rax, r12
	mov	rdx, rbx
	lea	rcx, [r11+r9]
	adc	rdx, r13
	xor	ebx, ebx
	xor	r13d, r13d
	mov	QWORD PTR 40[rsp], rax
	mov	rdi, rdx
	mov	rsi, rbx
	mov	QWORD PTR 48[rsp], rdx
	mov	rdx, QWORD PTR 72[rsp]
	neg	edi
	mov	rax, QWORD PTR 120[rsp]
	movzx	r12d, dil
	cmp	rcx, r12
	sbb	rsi, r13
	mov	rcx, rsi
	mov	rdi, rsi
	mov	rsi, QWORD PTR 88[rsp]
	not	rcx
	and	r8, rdi
	and	rax, rdi
	and	rsi, rdi
	and	rdx, rcx
	and	r14, rcx
	and	rdi, r10
	or	r8, rdx
	mov	rdx, QWORD PTR 56[rsp]
	or	rax, r14
	vmovq	xmm3, rax
	mov	rax, QWORD PTR -112[rsp]
	and	rdx, rcx
	and	rcx, QWORD PTR 40[rsp]
	vpinsrq	xmm0, xmm3, r8, 1
	or	rsi, rdx
	or	rdi, rcx
	vmovq	xmm2, rsi
	vpinsrq	xmm1, xmm2, rdi, 1
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
.LFE20:
	.size	fiat_p256_square_gcc, .-fiat_p256_square_gcc
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
