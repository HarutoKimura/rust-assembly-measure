	.file	"p224_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p224_mul_gcc
	.type	fiat_p224_mul_gcc, @function
fiat_p224_mul_gcc:
.LFB20:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r8, rdx
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 104
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -24[rsp], rdi
	mov	rbx, QWORD PTR 24[r8]
	mov	rdx, QWORD PTR 8[rsi]
	mov	rcx, QWORD PTR [rsi]
	mov	r9, QWORD PTR 16[r8]
	mov	rax, QWORD PTR 16[rsi]
	mov	r10, QWORD PTR 8[r8]
	mov	QWORD PTR 8[rsp], rdx
	mov	rdx, rbx
	mulx	r15, r14, rcx
	mov	rdx, r9
	mov	r13, QWORD PTR [r8]
	mov	r11, QWORD PTR 24[rsi]
	mov	QWORD PTR -8[rsp], rax
	mulx	rdx, rax, rcx
	mov	QWORD PTR 72[rsp], rbx
	mov	QWORD PTR 40[rsp], r10
	mov	QWORD PTR -16[rsp], r11
	xor	r11d, r11d
	mov	QWORD PTR 96[rsp], rdx
	mov	rdx, r10
	mulx	rdi, rsi, rcx
	mov	rdx, r13
	mov	QWORD PTR 88[rsp], rax
	mov	rax, QWORD PTR 88[rsp]
	mulx	rbx, rcx, rcx
	mov	QWORD PTR 56[rsp], r9
	mov	rdx, QWORD PTR 96[rsp]
	xor	r9d, r9d
	mov	r8, rax
	mov	QWORD PTR 24[rsp], r13
	mov	rax, rdx
	mov	QWORD PTR -32[rsp], r15
	mov	r10, rbx
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, r14
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	edx, edx
	xor	edi, edi
	add	rsi, rax
	adc	rdi, rdx
	xor	edx, edx
	add	rsi, r9
	mov	QWORD PTR -56[rsp], r8
	adc	rdi, rdx
	imul	r14, rcx, -1
	mov	QWORD PTR -72[rsp], rsi
	xor	r15d, r15d
	mov	rdx, -1
	mov	QWORD PTR -64[rsp], rdi
	mov	r13, r15
	mov	QWORD PTR 88[rsp], rcx
	mulx	rbx, rcx, r14
	mov	r12, r14
	movabs	rdx, -4294967296
	shld	r13, r14, 32
	mulx	rdx, rax, r14
	sal	r12, 32
	mov	QWORD PTR 96[rsp], 0
	sub	r12, r14
	sbb	r13, r15
	xor	r9d, r9d
	xor	edi, edi
	mov	QWORD PTR -104[rsp], r12
	mov	QWORD PTR -96[rsp], r13
	mov	rsi, rdx
	mov	QWORD PTR -88[rsp], rax
	mov	rax, QWORD PTR 88[rsp]
	add	rsi, rcx
	mov	rcx, rbx
	mov	rdx, QWORD PTR 96[rsp]
	mov	r8, rcx
	mov	rcx, QWORD PTR -104[rsp]
	adc	rdi, r9
	xor	ebx, ebx
	mov	r9, rbx
	xor	ebx, ebx
	add	rcx, r8
	mov	r8, rdi
	adc	rbx, r9
	xor	r9d, r9d
	add	r8, rcx
	mov	rcx, QWORD PTR -88[rsp]
	adc	r9, rbx
	add	rax, r14
	mov	r14, QWORD PTR -72[rsp]
	adc	rdx, r15
	xor	ebx, ebx
	mov	r15, QWORD PTR -64[rsp]
	mov	rax, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r10
	mov	r11, rax
	mov	rax, QWORD PTR -56[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	r12, rdx
	xor	edx, edx
	mov	QWORD PTR 88[rsp], r11
	add	rcx, rax
	mov	rax, r8
	mov	r8, QWORD PTR 8[rsp]
	adc	rbx, rdx
	mov	rsi, rcx
	xor	edx, edx
	mov	rdi, rbx
	add	rsi, r12
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r14
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rdi
	mov	QWORD PTR -56[rsp], rsi
	adc	rdx, rbx
	mov	rbx, rax
	lea	rax, 0[r13+r9]
	mov	rsi, rdx
	mov	QWORD PTR -72[rsp], rbx
	xor	edx, edx
	xor	ebx, ebx
	mov	rcx, rsi
	mov	rsi, QWORD PTR -32[rsp]
	add	rcx, rax
	adc	rbx, rdx
	mov	rdx, QWORD PTR 72[rsp]
	lea	r12, [rsi+r15]
	xor	r13d, r13d
	add	r12, rcx
	mulx	r15, r14, r8
	mov	rdx, r8
	adc	r13, rbx
	xor	r9d, r9d
	mulx	rbx, rcx, QWORD PTR 40[rsp]
	mulx	r11, r10, QWORD PTR 24[rsp]
	mulx	rdi, rsi, QWORD PTR 56[rsp]
	mov	QWORD PTR 16[rsp], rbx
	mov	rdx, QWORD PTR 16[rsp]
	mov	rbx, r9
	xor	r9d, r9d
	mov	QWORD PTR 8[rsp], rcx
	mov	rax, QWORD PTR 8[rsp]
	mov	rcx, r11
	mov	r8, rdx
	mov	QWORD PTR 16[rsp], r15
	add	rcx, rax
	mov	rax, rsi
	mov	rsi, rdi
	adc	rbx, r9
	xor	r9d, r9d
	xor	edx, edx
	add	rax, r8
	adc	rdx, r9
	xor	r9d, r9d
	add	rax, rbx
	mov	r8, r14
	adc	rdx, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	mov	r14, rdx
	mov	rsi, QWORD PTR 88[rsp]
	adc	r9, rdi
	xor	r15d, r15d
	add	r14, r8
	adc	r15, r9
	xor	r9d, r9d
	xor	edi, edi
	add	rsi, r10
	adc	rdi, r9
	mov	r10, QWORD PTR -56[rsp]
	xor	r11d, r11d
	xor	r9d, r9d
	mov	r8, rdi
	add	r8, r10
	mov	r10, rcx
	mov	rcx, rax
	mov	rax, r12
	adc	r9, r11
	xor	r11d, r11d
	add	r10, r8
	mov	r8, QWORD PTR -72[rsp]
	adc	r11, r9
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, r8
	adc	rbx, r9
	xor	edx, edx
	add	rcx, r11
	adc	rbx, rdx
	xor	edx, edx
	mov	QWORD PTR -40[rsp], rcx
	mov	r9, rbx
	xor	ebx, ebx
	add	rax, r14
	mov	QWORD PTR 88[rsp], rsi
	mov	QWORD PTR 96[rsp], 0
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r9
	mov	r8, rax
	mov	rax, QWORD PTR 16[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	r9, rdx
	xor	edx, edx
	mov	QWORD PTR -56[rsp], r8
	lea	rcx, [rax+r15]
	mov	rax, r13
	add	rax, rcx
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r9
	adc	rdx, rbx
	imul	r14, rsi, -1
	xor	r15d, r15d
	mov	QWORD PTR 8[rsp], rax
	mov	QWORD PTR 16[rsp], rdx
	mov	rdx, -1
	mov	r13, r15
	mov	rax, QWORD PTR 88[rsp]
	mulx	rbx, rcx, r14
	mov	r12, r14
	shld	r13, r14, 32
	movabs	rdx, -4294967296
	mulx	rdi, rsi, r14
	sal	r12, 32
	sub	r12, r14
	mov	QWORD PTR -88[rsp], r12
	mov	r8, QWORD PTR -88[rsp]
	sbb	r13, r15
	xor	r9d, r9d
	mov	QWORD PTR -72[rsp], rsi
	mov	rsi, rdi
	xor	edi, edi
	add	rsi, rcx
	mov	rcx, rbx
	adc	rdi, r9
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, r8
	adc	rbx, r9
	mov	r8, rdi
	xor	edx, edx
	mov	r9, rdx
	add	r8, rcx
	mov	rdx, QWORD PTR 96[rsp]
	mov	rcx, QWORD PTR -72[rsp]
	adc	r9, rbx
	add	rax, r14
	mov	r14, r10
	adc	rdx, r15
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	r15, rdx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	mov	rax, QWORD PTR -56[rsp]
	adc	rbx, rdx
	mov	rsi, rcx
	xor	edx, edx
	mov	rcx, QWORD PTR 8[rsp]
	add	rsi, r15
	mov	rdi, rbx
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rdi
	mov	QWORD PTR 88[rsp], rsi
	adc	rdx, rbx
	mov	r11, rax
	lea	rax, 0[r13+r9]
	xor	ebx, ebx
	mov	r12, rdx
	xor	edx, edx
	add	rcx, rax
	mov	rdi, QWORD PTR -8[rsp]
	adc	rbx, rdx
	xor	edx, edx
	mov	QWORD PTR -40[rsp], r11
	mov	rsi, rbx
	mov	rbx, rcx
	add	rbx, r12
	adc	rsi, rdx
	mov	rdx, QWORD PTR 72[rsp]
	mov	QWORD PTR -56[rsp], rbx
	xor	r9d, r9d
	mov	QWORD PTR -48[rsp], rsi
	mulx	r13, r12, rdi
	mov	rdx, rdi
	mulx	rbx, rcx, QWORD PTR 40[rsp]
	mulx	r11, r10, QWORD PTR 24[rsp]
	mulx	rdi, rsi, QWORD PTR 56[rsp]
	mov	QWORD PTR -8[rsp], rcx
	mov	rax, QWORD PTR -8[rsp]
	mov	rcx, r11
	mov	QWORD PTR [rsp], rbx
	mov	rdx, QWORD PTR [rsp]
	xor	ebx, ebx
	add	rcx, rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	r8, rdx
	adc	rbx, r9
	xor	r9d, r9d
	xor	edx, edx
	add	rax, r8
	mov	r8, r12
	adc	rdx, r9
	xor	r9d, r9d
	add	rax, rbx
	adc	rdx, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	xor	edi, edi
	add	r8, rdx
	mov	rsi, r14
	adc	r9, rdi
	mov	QWORD PTR -8[rsp], r8
	xor	edi, edi
	mov	QWORD PTR [rsp], r9
	xor	r9d, r9d
	add	rsi, r10
	mov	r10, QWORD PTR [rsp]
	adc	rdi, r9
	xor	r15d, r15d
	xor	r11d, r11d
	mov	QWORD PTR -72[rsp], rsi
	mov	r8, rdi
	mov	r9, r15
	mov	QWORD PTR -64[rsp], rdi
	mov	rdi, QWORD PTR -48[rsp]
	add	r8, rcx
	mov	rcx, QWORD PTR 88[rsp]
	mov	r12, QWORD PTR -72[rsp]
	mov	QWORD PTR 96[rsp], 0
	adc	r9, r11
	xor	ebx, ebx
	add	r8, rcx
	adc	r9, rbx
	xor	ebx, ebx
	mov	QWORD PTR -88[rsp], r8
	mov	rcx, r9
	mov	QWORD PTR -80[rsp], r9
	xor	r9d, r9d
	add	rcx, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	rbx, r9
	xor	edx, edx
	mov	r9, QWORD PTR -8[rsp]
	mov	rsi, rbx
	mov	rbx, rcx
	add	rbx, rax
	mov	r14, r9
	adc	rsi, rdx
	xor	edx, edx
	mov	QWORD PTR -40[rsp], rbx
	mov	rcx, rsi
	mov	rsi, QWORD PTR -56[rsp]
	mov	rbx, rdx
	xor	edx, edx
	mov	rax, rsi
	add	rax, rcx
	adc	rdx, rbx
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 16[rsp]
	adc	r15, rdx
	xor	ebx, ebx
	xor	edx, edx
	lea	rcx, [rdi+rax]
	mov	rax, r15
	add	rax, rcx
	lea	rcx, 0[r13+r10]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 8[rsp], rax
	xor	r13d, r13d
	mov	QWORD PTR 16[rsp], rdx
	imul	rdx, r12, -1
	mov	QWORD PTR 88[rsp], rdx
	mov	rax, QWORD PTR 88[rsp]
	mov	rdx, QWORD PTR 96[rsp]
	mov	rsi, rax
	mov	rdi, rdx
	sal	rsi, 32
	shld	rdi, rax, 32
	sub	rsi, rax
	sbb	rdi, rdx
	mov	rdx, -1
	mov	QWORD PTR -8[rsp], rsi
	mov	rsi, QWORD PTR -8[rsp]
	mulx	rbx, rcx, rax
	mov	QWORD PTR -56[rsp], rdi
	xor	r11d, r11d
	xor	edi, edi
	movabs	rdx, -4294967296
	mov	rax, QWORD PTR -88[rsp]
	mulx	r9, r8, QWORD PTR 88[rsp]
	mov	r10, r9
	add	r10, rcx
	mov	rcx, rbx
	adc	r11, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, r11
	mov	rcx, QWORD PTR -40[rsp]
	adc	rdi, rbx
	add	r12, QWORD PTR 88[rsp]
	adc	r13, QWORD PTR 96[rsp]
	xor	edx, edx
	mov	r12, r13
	xor	r13d, r13d
	add	r12, r8
	adc	r13, rdx
	xor	edx, edx
	add	r12, rax
	adc	r13, rdx
	xor	ebx, ebx
	mov	rax, r13
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r10
	adc	rdx, rbx
	mov	QWORD PTR -8[rsp], rax
	xor	ebx, ebx
	mov	rax, rdx
	mov	QWORD PTR [rsp], rdx
	xor	edx, edx
	add	rax, r14
	mov	r14, rsi
	mov	rsi, rdi
	adc	rdx, rbx
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 8[rsp]
	adc	r15, rdx
	mov	rdi, QWORD PTR -56[rsp]
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r15
	mov	r11, QWORD PTR -16[rsp]
	adc	rdx, rbx
	lea	rcx, [rdi+rsi]
	mov	rsi, rax
	xor	ebx, ebx
	mov	rdi, rdx
	mov	rdx, QWORD PTR 72[rsp]
	add	rsi, rcx
	adc	rdi, rbx
	mov	QWORD PTR -40[rsp], rsi
	mulx	rsi, rbx, r11
	mov	rdx, r11
	mov	QWORD PTR -32[rsp], rdi
	xor	edi, edi
	mulx	r11, r10, QWORD PTR 24[rsp]
	mulx	r9, r8, QWORD PTR 56[rsp]
	mov	r15, QWORD PTR -32[rsp]
	mov	QWORD PTR 88[rsp], rbx
	mov	QWORD PTR 96[rsp], rsi
	mulx	rsi, rbx, QWORD PTR 40[rsp]
	mov	QWORD PTR 72[rsp], rbx
	mov	rax, QWORD PTR 72[rsp]
	xor	ebx, ebx
	mov	QWORD PTR 80[rsp], rsi
	mov	rsi, r11
	mov	rdx, QWORD PTR 80[rsp]
	add	rsi, rax
	mov	rax, r8
	mov	r8, r9
	adc	rdi, rbx
	mov	rcx, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, rdi
	adc	rdx, rbx
	xor	ebx, ebx
	add	rcx, rax
	mov	rax, QWORD PTR 88[rsp]
	adc	rbx, rdx
	xor	r9d, r9d
	xor	edx, edx
	add	rax, r8
	mov	r8, rbx
	adc	rdx, r9
	xor	r9d, r9d
	add	r8, rax
	mov	rax, r12
	adc	r9, rdx
	xor	r13d, r13d
	xor	edx, edx
	add	rax, r10
	adc	rdx, r13
	xor	r13d, r13d
	xor	r11d, r11d
	mov	QWORD PTR 72[rsp], rax
	mov	r10, rdx
	add	r10, rsi
	mov	rsi, QWORD PTR -8[rsp]
	adc	r11, r13
	xor	edi, edi
	mov	r13, r9
	add	r10, rsi
	adc	r11, rdi
	xor	edi, edi
	mov	QWORD PTR 56[rsp], r10
	mov	rsi, r11
	xor	r11d, r11d
	add	rsi, rcx
	mov	rcx, QWORD PTR 16[rsp]
	mov	rax, rsi
	adc	rdi, r11
	xor	ebx, ebx
	add	rax, r14
	mov	r14, QWORD PTR -40[rsp]
	mov	rdx, rdi
	lea	rsi, [r15+rcx]
	adc	rdx, rbx
	xor	ebx, ebx
	xor	r11d, r11d
	mov	QWORD PTR 40[rsp], rax
	mov	r10, r14
	add	r10, rdx
	mov	rdx, -1
	adc	r11, rbx
	mov	r9, r10
	xor	ebx, ebx
	mov	r10, r11
	add	r9, r8
	mov	r8, QWORD PTR 96[rsp]
	mov	QWORD PTR 96[rsp], 0
	adc	r10, rbx
	xor	edi, edi
	xor	ebx, ebx
	mov	QWORD PTR 24[rsp], r9
	mov	rcx, r10
	add	rcx, rsi
	lea	rsi, [r8+r13]
	mov	r8, QWORD PTR 72[rsp]
	adc	rbx, rdi
	xor	edi, edi
	add	rcx, rsi
	adc	rbx, rdi
	imul	rax, r8, -1
	mov	QWORD PTR 8[rsp], rcx
	xor	r9d, r9d
	mov	QWORD PTR 16[rsp], rbx
	mov	QWORD PTR 88[rsp], rax
	mov	rsi, QWORD PTR 88[rsp]
	mov	rdi, QWORD PTR 96[rsp]
	mulx	rbx, rcx, rsi
	mov	r12, rsi
	movabs	rdx, -4294967296
	mulx	r15, r14, rax
	sal	r12, 32
	mov	r13, rdi
	shld	r13, rsi, 32
	mov	r11, r12
	sub	r11, rsi
	mov	r12, r13
	mov	rax, rcx
	sbb	r12, rdi
	xor	edi, edi
	xor	edx, edx
	add	rax, r15
	mov	rcx, rbx
	mov	QWORD PTR -8[rsp], r12
	mov	r12, QWORD PTR 24[rsp]
	adc	rdx, rdi
	xor	esi, esi
	xor	edi, edi
	mov	r10, rax
	add	rcx, r11
	mov	rax, QWORD PTR 88[rsp]
	mov	rbx, rsi
	mov	rsi, QWORD PTR 56[rsp]
	adc	rbx, rdi
	xor	r13d, r13d
	add	rcx, rdx
	mov	rdx, QWORD PTR 96[rsp]
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
	mov	rsi, QWORD PTR 40[rsp]
	adc	rdx, rdi
	xor	edi, edi
	xor	r9d, r9d
	mov	QWORD PTR 88[rsp], rax
	mov	r8, rdx
	mov	QWORD PTR 96[rsp], rdx
	mov	rax, QWORD PTR -8[rsp]
	add	r8, rsi
	mov	r14, QWORD PTR 88[rsp]
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
	mov	QWORD PTR 72[rsp], rsi
	mov	rsi, QWORD PTR 8[rsp]
	adc	rdi, r11
	lea	rcx, [rax+rbx]
	mov	r12, rdi
	xor	r13d, r13d
	xor	r11d, r11d
	mov	QWORD PTR 80[rsp], rdi
	mov	r10, rsi
	mov	rdi, QWORD PTR 16[rsp]
	mov	rsi, QWORD PTR 72[rsp]
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
	mov	rcx, QWORD PTR 72[rsp]
	xor	r13d, r13d
	mov	rdx, rbx
	xor	ebx, ebx
	mov	QWORD PTR 56[rsp], rax
	mov	rax, QWORD PTR 88[rsp]
	mov	QWORD PTR 64[rsp], rdx
	neg	edx
	movzx	r12d, dl
	sub	rcx, r12
	sbb	rbx, r13
	add	rcx, 1
	adc	rbx, -1
	mov	r12, rcx
	mov	rcx, r10
	mov	r13, rbx
	mov	QWORD PTR 40[rsp], r12
	xor	ebx, ebx
	mov	rdx, r13
	mov	QWORD PTR 48[rsp], r13
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
	mov	QWORD PTR 24[rsp], rdx
	xor	ebx, ebx
	mov	r13, rcx
	lea	rcx, [r11+rdi]
	mov	rdi, QWORD PTR 56[rsp]
	mov	rdx, r13
	mov	QWORD PTR 32[rsp], r13
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
	mov	rdi, QWORD PTR 40[rsp]
	and	rsi, rcx
	or	rax, r14
	and	rcx, r10
	vmovq	xmm3, rax
	mov	rax, QWORD PTR -24[rsp]
	and	rdi, rdx
	and	rdx, QWORD PTR 24[rsp]
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
	.size	fiat_p224_mul_gcc, .-fiat_p224_mul_gcc
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
