	.file	"p224_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p224_square_gcc
	.type	fiat_p224_square_gcc, @function
fiat_p224_square_gcc:
.LFB20:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	xor	r14d, r14d
	push	r13
	push	r12
	push	rbx
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	xor	ebx, ebx
	and	rsp, -32
	sub	rsp, 136
	mov	QWORD PTR -32[rsp], rbx
	mov	QWORD PTR -120[rsp], rdi
	mov	rax, QWORD PTR 8[rsi]
	mov	r15, QWORD PTR 16[rsi]
	mov	QWORD PTR 16[rsp], r14
	mov	QWORD PTR 112[rsp], 0
	mov	rdx, QWORD PTR 24[rsi]
	mov	rsi, QWORD PTR [rsi]
	mov	QWORD PTR 24[rsp], r15
	mov	QWORD PTR 120[rsp], rdx
	mov	QWORD PTR 96[rsp], 0
	mulx	r12, r11, rsi
	mov	rdx, r15
	xor	r15d, r15d
	mulx	r9, r8, rsi
	mov	rdx, rsi
	mov	QWORD PTR -16[rsp], r15
	mulx	rbx, rcx, rax
	mulx	rdi, rsi, rsi
	mov	rdx, -1
	mov	QWORD PTR -40[rsp], r12
	mov	QWORD PTR 88[rsp], r8
	mov	r14, rbx
	mov	QWORD PTR 104[rsp], rcx
	xor	ebx, ebx
	mov	rcx, rdi
	mov	QWORD PTR 8[rsp], r9
	add	rcx, QWORD PTR 104[rsp]
	mov	QWORD PTR -24[rsp], r14
	adc	rbx, QWORD PTR 112[rsp]
	xor	r9d, r9d
	add	r14, QWORD PTR 88[rsp]
	mov	QWORD PTR -56[rsp], rcx
	mov	r8, rbx
	adc	r15, QWORD PTR 96[rsp]
	mov	rcx, r14
	mov	QWORD PTR 72[rsp], r11
	add	rcx, r8
	mov	rbx, r15
	mov	QWORD PTR 56[rsp], rsi
	adc	rbx, r9
	xor	r9d, r9d
	mov	QWORD PTR -72[rsp], rcx
	mov	rcx, QWORD PTR 8[rsp]
	mov	r8, rbx
	add	rcx, QWORD PTR 72[rsp]
	mov	r10, r9
	mov	rbx, QWORD PTR 16[rsp]
	mov	r9, r8
	mov	QWORD PTR [rsp], r12
	mov	r12, QWORD PTR 56[rsp]
	mov	QWORD PTR 80[rsp], 0
	adc	rbx, QWORD PTR 80[rsp]
	add	r9, rcx
	adc	r10, rbx
	xor	r11d, r11d
	mov	QWORD PTR 40[rsp], r9
	mov	QWORD PTR 48[rsp], r10
	imul	r10, rsi, -1
	mov	rsi, r11
	mov	QWORD PTR 64[rsp], 0
	mov	rbx, r10
	shld	rsi, r10, 32
	sal	rbx, 32
	mov	r9, rsi
	mov	r8, rbx
	mulx	rbx, rcx, r10
	movabs	rdx, -4294967296
	mulx	rdi, rsi, r10
	sub	r8, r10
	mov	rdx, QWORD PTR 48[rsp]
	sbb	r9, r11
	xor	r13d, r13d
	mov	r15, r9
	mov	QWORD PTR -88[rsp], rsi
	mov	rsi, rdi
	xor	edi, edi
	add	rsi, rcx
	mov	rcx, rbx
	adc	rdi, r13
	xor	r13d, r13d
	xor	ebx, ebx
	add	rcx, r8
	adc	rbx, r13
	mov	r13, rcx
	xor	r9d, r9d
	mov	r8, QWORD PTR -88[rsp]
	add	r13, rdi
	mov	r14, rbx
	mov	QWORD PTR -104[rsp], r13
	mov	r13, QWORD PTR 64[rsp]
	adc	r14, r9
	add	r12, r10
	mov	r12, QWORD PTR -56[rsp]
	mov	r10, QWORD PTR -104[rsp]
	mov	QWORD PTR -96[rsp], r14
	adc	r13, r11
	xor	r9d, r9d
	xor	ebx, ebx
	mov	r11, QWORD PTR -96[rsp]
	mov	rcx, r13
	add	rcx, r8
	mov	r8, rsi
	adc	rbx, r9
	xor	r13d, r13d
	add	r12, rcx
	mov	rcx, QWORD PTR -72[rsp]
	adc	r13, rbx
	xor	ebx, ebx
	xor	r9d, r9d
	mov	rsi, rcx
	mov	rdi, rbx
	mov	rcx, r10
	add	rsi, r8
	mov	r8, QWORD PTR 40[rsp]
	adc	rdi, r9
	xor	ebx, ebx
	add	rsi, r13
	adc	rdi, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, r8
	adc	rbx, r9
	xor	r9d, r9d
	lea	r8, [r15+r11]
	add	rcx, rdi
	adc	rbx, r9
	mov	r15, QWORD PTR [rsp]
	xor	r9d, r9d
	xor	r11d, r11d
	mov	r10, rbx
	add	r10, r8
	lea	r8, [rdx+r15]
	mov	rdx, QWORD PTR 120[rsp]
	adc	r11, r9
	xor	r9d, r9d
	add	r10, r8
	adc	r11, r9
	mov	QWORD PTR -56[rsp], r10
	xor	r15d, r15d
	mov	QWORD PTR -48[rsp], r11
	mulx	r11, r10, rax
	mov	QWORD PTR -80[rsp], r15
	xor	r15d, r15d
	mov	QWORD PTR -88[rsp], r11
	mov	rdx, QWORD PTR 24[rsp]
	mov	QWORD PTR [rsp], r15
	xor	r15d, r15d
	mulx	r9, r8, rax
	mul	rax
	mov	QWORD PTR 40[rsp], r10
	mov	QWORD PTR 64[rsp], 0
	mov	QWORD PTR -64[rsp], r11
	mov	QWORD PTR 48[rsp], 0
	mov	r14, rax
	mov	rax, rdx
	add	r14, QWORD PTR -24[rsp]
	mov	QWORD PTR 56[rsp], r8
	adc	r15, QWORD PTR -16[rsp]
	xor	edx, edx
	add	rax, QWORD PTR 56[rsp]
	adc	rdx, QWORD PTR 64[rsp]
	mov	QWORD PTR -8[rsp], r9
	xor	r9d, r9d
	add	rax, r15
	mov	r8, QWORD PTR -8[rsp]
	mov	r15, QWORD PTR -64[rsp]
	adc	rdx, r9
	xor	r10d, r10d
	add	r8, QWORD PTR 40[rsp]
	mov	r9, QWORD PTR [rsp]
	mov	r11, r10
	mov	r10, rdx
	adc	r9, QWORD PTR 48[rsp]
	add	r10, r8
	mov	r8, r12
	adc	r11, r9
	xor	r9d, r9d
	add	r8, QWORD PTR 104[rsp]
	adc	r9, QWORD PTR 112[rsp]
	mov	QWORD PTR -24[rsp], r10
	xor	r12d, r12d
	mov	r10, r9
	xor	r13d, r13d
	mov	QWORD PTR -16[rsp], r11
	add	r10, rsi
	mov	r11, r12
	mov	rsi, rcx
	adc	r11, r13
	mov	rcx, rax
	xor	edi, edi
	add	r10, r14
	adc	r11, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, rdi
	mov	rsi, QWORD PTR -56[rsp]
	mov	rax, QWORD PTR -24[rsp]
	mov	r13, rcx
	xor	edx, edx
	mov	r14, rbx
	add	r13, r11
	mov	rdi, QWORD PTR -48[rsp]
	adc	r14, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rbx
	mov	QWORD PTR 104[rsp], r13
	xor	r13d, r13d
	add	rax, r14
	adc	rdx, r13
	mov	r13, rax
	mov	rax, QWORD PTR -16[rsp]
	mov	rsi, rdi
	xor	edi, edi
	mov	r14, rdx
	xor	ebx, ebx
	mov	QWORD PTR -56[rsp], r13
	lea	rcx, [rax+r15]
	mov	rax, rsi
	mov	rdx, rdi
	add	rax, rcx
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r14
	mov	r14, r8
	adc	rdx, rsi
	imul	r12, r8, -1
	mov	QWORD PTR -24[rsp], rax
	xor	r13d, r13d
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, -1
	mov	rdi, r13
	xor	r15d, r15d
	mov	QWORD PTR 112[rsp], 0
	mulx	rdx, rax, r12
	mov	rsi, r12
	shld	rdi, r12, 32
	sal	rsi, 32
	mov	r9, rdi
	mov	r8, rsi
	sub	r8, r12
	mov	QWORD PTR -64[rsp], rdx
	sbb	r9, r13
	movabs	rdx, -4294967296
	mulx	rdi, rsi, r12
	mov	QWORD PTR -72[rsp], rax
	mov	rdx, QWORD PTR -64[rsp]
	mov	rax, QWORD PTR -72[rsp]
	mov	QWORD PTR -112[rsp], r9
	mov	QWORD PTR -104[rsp], rsi
	mov	rsi, rdi
	xor	edi, edi
	mov	rcx, rsi
	mov	rbx, rdi
	xor	edi, edi
	add	rcx, rax
	mov	rax, rdx
	adc	rbx, rdi
	mov	rsi, rax
	xor	edx, edx
	mov	rax, r8
	mov	rdi, rdx
	mov	r8, rbx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rdi
	xor	r9d, r9d
	add	r8, rax
	mov	rax, r14
	adc	r9, rdx
	add	rax, r12
	mov	rdx, r15
	mov	rsi, QWORD PTR -104[rsp]
	adc	rdx, r13
	xor	edi, edi
	mov	rax, rdx
	xor	edx, edx
	add	rax, rsi
	mov	rsi, QWORD PTR 104[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r10
	mov	r10, rcx
	adc	rdx, rdi
	mov	rcx, QWORD PTR -56[rsp]
	xor	edi, edi
	xor	r11d, r11d
	add	r10, rsi
	mov	rsi, QWORD PTR -112[rsp]
	mov	QWORD PTR -64[rsp], rdx
	adc	r11, rdi
	xor	edi, edi
	add	r10, rdx
	mov	rdx, QWORD PTR 24[rsp]
	adc	r11, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, r8
	adc	rbx, rdi
	mov	r13, rcx
	lea	rcx, [rsi+r9]
	mov	rsi, QWORD PTR -24[rsp]
	xor	edi, edi
	mov	r14, rbx
	add	r13, r11
	mov	r8, QWORD PTR 8[rsp]
	adc	r14, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	r15, r14
	mulx	rbx, rcx, rdx
	mov	QWORD PTR -48[rsp], r14
	xor	r14d, r14d
	add	rsi, r15
	mov	r9, QWORD PTR 16[rsp]
	mov	QWORD PTR -56[rsp], r13
	adc	rdi, r14
	mulx	r15, r14, QWORD PTR 120[rsp]
	mov	QWORD PTR -104[rsp], rsi
	xor	esi, esi
	mov	QWORD PTR -96[rsp], rdi
	add	r8, QWORD PTR 56[rsp]
	mov	QWORD PTR 32[rsp], rsi
	adc	r9, QWORD PTR 64[rsp]
	mov	rsi, rcx
	xor	edi, edi
	add	rsi, QWORD PTR -8[rsp]
	adc	rdi, QWORD PTR [rsp]
	xor	r13d, r13d
	mov	QWORD PTR -72[rsp], rax
	add	rsi, r9
	mov	QWORD PTR 24[rsp], r15
	mov	rcx, rbx
	adc	rdi, r13
	mov	QWORD PTR 104[rsp], r14
	xor	ebx, ebx
	add	rcx, QWORD PTR 104[rsp]
	adc	rbx, QWORD PTR 112[rsp]
	xor	r13d, r13d
	add	rcx, rdi
	mov	r12, QWORD PTR -72[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	add	r12, QWORD PTR 88[rsp]
	adc	r13, QWORD PTR 96[rsp]
	mov	rax, r13
	mov	QWORD PTR 64[rsp], rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rax, r8
	mov	QWORD PTR 56[rsp], rcx
	mov	rcx, QWORD PTR -56[rsp]
	mov	r14, r12
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r10
	mov	r8, QWORD PTR -104[rsp]
	adc	rdx, rbx
	mov	QWORD PTR 8[rsp], rax
	xor	r10d, r10d
	xor	ebx, ebx
	mov	rax, rdx
	mov	rdx, r10
	mov	r9, QWORD PTR -96[rsp]
	add	rax, rsi
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, r8
	add	rsi, rcx
	mov	rdi, rdx
	mov	rcx, QWORD PTR 56[rsp]
	adc	rdi, rbx
	mov	QWORD PTR -8[rsp], rsi
	xor	edx, edx
	xor	esi, esi
	add	rax, rdi
	mov	QWORD PTR [rsp], rdi
	adc	rdx, rsi
	mov	r10, rax
	mov	rsi, QWORD PTR -16[rsp]
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	adc	r11, rbx
	lea	rax, [r9+rsi]
	mov	rsi, QWORD PTR 64[rsp]
	xor	edx, edx
	mov	rcx, r11
	xor	ebx, ebx
	mov	QWORD PTR -24[rsp], r10
	add	rcx, rax
	lea	rax, [rsi+r15]
	mov	QWORD PTR -16[rsp], r11
	adc	rbx, rdx
	mov	r8, rcx
	xor	edx, edx
	mov	r9, rbx
	add	r8, rax
	adc	r9, rdx
	imul	r12, r12, -1
	xor	r13d, r13d
	mov	QWORD PTR 88[rsp], r8
	mov	rdx, -1
	mov	QWORD PTR 96[rsp], r9
	mov	r9, r13
	xor	r15d, r15d
	mulx	rdx, rax, r12
	mov	r8, r12
	shld	r9, r12, 32
	sal	r8, 32
	sub	r8, r12
	sbb	r9, r13
	xor	edi, edi
	xor	ebx, ebx
	mov	QWORD PTR 64[rsp], rdx
	movabs	rdx, -4294967296
	mulx	r11, r10, r12
	mov	QWORD PTR 56[rsp], rax
	mov	rdx, QWORD PTR 64[rsp]
	mov	rax, QWORD PTR 56[rsp]
	mov	QWORD PTR -56[rsp], r9
	mov	rcx, r11
	add	rcx, rax
	mov	rax, rdx
	adc	rbx, rdi
	mov	rsi, rax
	xor	edx, edx
	mov	rax, r8
	mov	rdi, rdx
	mov	r8, rbx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rdi
	xor	r9d, r9d
	add	r8, rax
	mov	rax, r14
	adc	r9, rdx
	add	rax, r12
	mov	rdx, r15
	mov	r12, QWORD PTR 8[rsp]
	adc	rdx, r13
	xor	edi, edi
	mov	rax, rdx
	xor	edx, edx
	add	rax, r10
	adc	rdx, rdi
	xor	r13d, r13d
	add	r12, rax
	mov	rax, QWORD PTR -8[rsp]
	adc	r13, rdx
	xor	edx, edx
	xor	edi, edi
	mov	rsi, r13
	add	rsi, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	rdi, rdx
	xor	edx, edx
	add	rsi, rcx
	adc	rdi, rdx
	mov	QWORD PTR 56[rsp], rsi
	xor	edx, edx
	mov	rsi, rdi
	xor	edi, edi
	mov	rcx, rsi
	mov	rbx, rdi
	add	rcx, rax
	mov	rax, QWORD PTR 88[rsp]
	mov	rsi, QWORD PTR -56[rsp]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, r8
	mov	r14, QWORD PTR -40[rsp]
	adc	rbx, rdx
	lea	r10, [rsi+r9]
	xor	r11d, r11d
	xor	edx, edx
	add	rax, rbx
	mov	r15, QWORD PTR -32[rsp]
	adc	rdx, r11
	xor	r11d, r11d
	add	rax, r10
	adc	rdx, r11
	add	r14, QWORD PTR 40[rsp]
	adc	r15, QWORD PTR 48[rsp]
	xor	r9d, r9d
	mov	QWORD PTR 16[rsp], rdx
	mov	rdx, QWORD PTR 120[rsp]
	mov	r8, r15
	mov	QWORD PTR 8[rsp], rax
	mov	rax, QWORD PTR -88[rsp]
	mulx	rdi, rsi, rdx
	add	rax, QWORD PTR 104[rsp]
	mov	rdx, QWORD PTR -80[rsp]
	adc	rdx, QWORD PTR 112[rsp]
	add	r8, rax
	mov	r15, QWORD PTR 16[rsp]
	adc	r9, rdx
	xor	edx, edx
	mov	rax, rsi
	add	rax, QWORD PTR 24[rsp]
	adc	rdx, QWORD PTR 32[rsp]
	xor	r11d, r11d
	add	rax, r9
	mov	QWORD PTR 48[rsp], rdi
	adc	rdx, r11
	mov	QWORD PTR 120[rsp], rax
	mov	rax, r12
	mov	r12, QWORD PTR 56[rsp]
	mov	QWORD PTR 128[rsp], rdx
	xor	edx, edx
	add	rax, QWORD PTR 72[rsp]
	adc	rdx, QWORD PTR 80[rsp]
	xor	r13d, r13d
	xor	r11d, r11d
	mov	QWORD PTR 104[rsp], rax
	mov	r10, rdx
	add	r10, r14
	mov	r14, QWORD PTR 8[rsp]
	adc	r11, r13
	xor	r13d, r13d
	add	r10, r12
	mov	r12, QWORD PTR 120[rsp]
	adc	r11, r13
	xor	edi, edi
	mov	QWORD PTR 72[rsp], r10
	mov	r10, r14
	mov	rsi, r11
	xor	r11d, r11d
	mov	r13, QWORD PTR 128[rsp]
	add	rsi, r8
	adc	rdi, r11
	mov	rax, rsi
	xor	r9d, r9d
	mov	rdx, rdi
	add	rax, rcx
	mov	rcx, QWORD PTR 96[rsp]
	adc	rdx, r9
	xor	ebx, ebx
	xor	r11d, r11d
	mov	QWORD PTR 56[rsp], rax
	add	r10, rdx
	lea	rsi, [r15+rcx]
	mov	rdx, -1
	adc	r11, rbx
	mov	r9, r10
	xor	ebx, ebx
	mov	r10, r11
	add	r9, r12
	mov	QWORD PTR 88[rsp], r9
	adc	r10, rbx
	mov	r8, QWORD PTR 48[rsp]
	xor	edi, edi
	mov	rcx, r10
	xor	ebx, ebx
	mov	QWORD PTR 128[rsp], 0
	add	rcx, rsi
	lea	rsi, [r8+r13]
	mov	r8, QWORD PTR 104[rsp]
	adc	rbx, rdi
	xor	edi, edi
	add	rcx, rsi
	adc	rbx, rdi
	imul	rax, r8, -1
	mov	QWORD PTR 40[rsp], rcx
	xor	r9d, r9d
	mov	rdi, QWORD PTR 128[rsp]
	mov	QWORD PTR 48[rsp], rbx
	mov	QWORD PTR 120[rsp], rax
	mov	rsi, QWORD PTR 120[rsp]
	mov	r13, rdi
	mulx	rbx, rcx, rsi
	mov	r12, rsi
	shld	r13, rsi, 32
	movabs	rdx, -4294967296
	mulx	r15, r14, rax
	sal	r12, 32
	mov	r11, r12
	mov	r12, r13
	sub	r11, rsi
	mov	rax, rcx
	sbb	r12, rdi
	xor	edi, edi
	xor	edx, edx
	add	rax, r15
	mov	rcx, rbx
	mov	QWORD PTR 24[rsp], r12
	mov	r12, QWORD PTR 88[rsp]
	adc	rdx, rdi
	xor	esi, esi
	xor	edi, edi
	mov	r10, rax
	add	rcx, r11
	mov	rax, QWORD PTR 120[rsp]
	mov	rbx, rsi
	mov	rsi, QWORD PTR 72[rsp]
	adc	rbx, rdi
	xor	r13d, r13d
	add	rcx, rdx
	mov	rdx, QWORD PTR 128[rsp]
	adc	rbx, r13
	add	rax, r8
	adc	rdx, r9
	xor	edi, edi
	mov	rax, rdx
	xor	edx, edx
	add	rax, r14
	adc	rdx, rdi
	xor	edi, edi
	add	rax, rsi
	mov	rsi, QWORD PTR 56[rsp]
	adc	rdx, rdi
	xor	edi, edi
	xor	r9d, r9d
	mov	QWORD PTR 120[rsp], rax
	mov	r8, rdx
	mov	rax, QWORD PTR 24[rsp]
	mov	r14, QWORD PTR 120[rsp]
	mov	QWORD PTR 128[rsp], rdx
	add	r8, rsi
	adc	r9, rdi
	xor	edi, edi
	add	r8, r10
	adc	r9, rdi
	xor	edx, edx
	xor	r13d, r13d
	mov	rsi, r9
	mov	rdi, rdx
	add	rsi, r12
	adc	rdi, r13
	xor	r11d, r11d
	add	rsi, rcx
	mov	QWORD PTR 104[rsp], rsi
	mov	rsi, QWORD PTR 40[rsp]
	adc	rdi, r11
	lea	rcx, [rax+rbx]
	mov	r12, rdi
	xor	r13d, r13d
	xor	r11d, r11d
	mov	QWORD PTR 112[rsp], rdi
	mov	r10, rsi
	mov	rdi, QWORD PTR 48[rsp]
	mov	rsi, QWORD PTR 104[rsp]
	add	r10, r12
	adc	r11, r13
	xor	ebx, ebx
	add	r10, rcx
	mov	rcx, r8
	adc	r11, rbx
	xor	r15d, r15d
	add	r14, -1
	adc	r15, -1
	xor	r13d, r13d
	xor	ebx, ebx
	mov	rdx, r15
	neg	edx
	movzx	r12d, dl
	sub	rcx, r12
	movabs	r12, 4294967296
	sbb	rbx, r13
	add	rcx, r12
	mov	r13, -1
	adc	rbx, r13
	mov	rax, rcx
	mov	rcx, QWORD PTR 104[rsp]
	xor	r13d, r13d
	mov	rdx, rbx
	xor	ebx, ebx
	mov	QWORD PTR 88[rsp], rax
	mov	rax, QWORD PTR 120[rsp]
	mov	QWORD PTR 96[rsp], rdx
	neg	edx
	movzx	r12d, dl
	sub	rcx, r12
	sbb	rbx, r13
	add	rcx, 1
	adc	rbx, -1
	mov	r12, rcx
	mov	rcx, r10
	mov	r13, rbx
	mov	QWORD PTR 72[rsp], r12
	xor	ebx, ebx
	mov	rdx, r13
	mov	QWORD PTR 80[rsp], r13
	xor	r13d, r13d
	neg	edx
	movzx	r12d, dl
	sub	rcx, r12
	movabs	r12, -4294967295
	sbb	rbx, r13
	mov	rdx, rcx
	mov	r13, -1
	add	rdx, r12
	mov	rcx, rbx
	adc	rcx, r13
	mov	QWORD PTR 56[rsp], rdx
	xor	ebx, ebx
	mov	r13, rcx
	lea	rcx, [r11+rdi]
	mov	rdi, QWORD PTR 88[rsp]
	mov	rdx, r13
	mov	QWORD PTR 64[rsp], r13
	xor	r13d, r13d
	neg	edx
	movzx	r12d, dl
	cmp	rcx, r12
	sbb	rbx, r13
	mov	rdx, rbx
	mov	rcx, rbx
	not	rdx
	and	r8, rcx
	and	rdi, rdx
	and	rax, rcx
	and	r14, rdx
	or	r8, rdi
	mov	rdi, QWORD PTR 72[rsp]
	and	rsi, rcx
	or	rax, r14
	and	rcx, r10
	vmovq	xmm3, rax
	mov	rax, QWORD PTR -120[rsp]
	and	rdi, rdx
	and	rdx, QWORD PTR 56[rsp]
	vpinsrq	xmm0, xmm3, r8, 1
	or	rsi, rdi
	or	rcx, rdx
	vmovq	xmm2, rsi
	vpinsrq	xmm1, xmm2, rcx, 1
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
	.size	fiat_p224_square_gcc, .-fiat_p224_square_gcc
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
