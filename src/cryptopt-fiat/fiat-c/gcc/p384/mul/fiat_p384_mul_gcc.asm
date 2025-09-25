	.file	"p384_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p384_mul_gcc
	.type	fiat_p384_mul_gcc, @function
fiat_p384_mul_gcc:
.LFB20:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r10, rdx
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 232
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR 8[rsp], rdi
	mov	rax, QWORD PTR 40[rsi]
	mov	r15, QWORD PTR 8[rsi]
	mov	r8, QWORD PTR 16[rsi]
	mov	r13, QWORD PTR 24[rsi]
	mov	rbx, QWORD PTR 32[rsi]
	mov	rcx, QWORD PTR 32[r10]
	mov	QWORD PTR 16[rsp], rax
	mov	rax, QWORD PTR [rsi]
	mov	rsi, QWORD PTR 40[rdx]
	mov	QWORD PTR 72[rsp], r15
	mov	r12, QWORD PTR 24[r10]
	mov	r9, QWORD PTR 16[r10]
	mov	QWORD PTR 24[rsp], rbx
	mov	rdx, rsi
	mov	r11, QWORD PTR 8[r10]
	mov	QWORD PTR 56[rsp], r8
	mov	QWORD PTR 216[rsp], rsi
	mulx	rsi, rbx, rax
	mov	rdx, rcx
	mulx	r15, r14, rax
	mov	rdx, r12
	mov	QWORD PTR 40[rsp], r13
	mov	QWORD PTR 200[rsp], rcx
	mov	QWORD PTR 184[rsp], r12
	mulx	r13, r12, rax
	mov	rdx, r9
	mov	QWORD PTR 120[rsp], rbx
	mulx	rbx, rcx, rax
	mov	rdx, r11
	mov	QWORD PTR 128[rsp], rsi
	mulx	rdi, rsi, rax
	mov	QWORD PTR 168[rsp], r9
	mov	QWORD PTR 152[rsp], r11
	mov	r9, QWORD PTR [r10]
	xor	r11d, r11d
	mov	r8, rcx
	mov	rcx, rbx
	mul	r9
	mov	QWORD PTR 136[rsp], r9
	xor	r9d, r9d
	mov	r10, rdx
	mov	rdx, -1
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	QWORD PTR -8[rsp], r10
	xor	edi, edi
	mov	rsi, r12
	mov	r10, r9
	mov	r9, r8
	mov	r12, r13
	add	r9, r11
	adc	r10, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	r8, rsi
	mov	QWORD PTR -24[rsp], r9
	xor	ebx, ebx
	mov	r9, rdi
	add	r8, r10
	mov	rcx, r14
	mov	r14, r15
	adc	r9, rbx
	xor	r13d, r13d
	xor	ebx, ebx
	add	rcx, r12
	adc	rbx, r13
	mov	r11, rcx
	mov	rcx, QWORD PTR 120[rsp]
	xor	edi, edi
	mov	r12, rbx
	add	r11, r9
	mov	QWORD PTR -40[rsp], r8
	mov	r8, rax
	adc	r12, rdi
	xor	r15d, r15d
	xor	ebx, ebx
	add	rcx, r14
	adc	rbx, r15
	xor	r15d, r15d
	add	rcx, r12
	mov	QWORD PTR -56[rsp], r11
	adc	rbx, r15
	sal	rax, 32
	xor	r9d, r9d
	mov	QWORD PTR -72[rsp], rcx
	add	rax, r8
	mov	QWORD PTR -64[rsp], rbx
	xor	ebx, ebx
	xor	r13d, r13d
	mulx	r11, r10, rax
	mov	rdx, -2
	mov	rcx, rax
	mulx	rdx, rax, rax
	mov	r12, r11
	mov	QWORD PTR 104[rsp], rax
	mov	rax, rcx
	mov	QWORD PTR 112[rsp], rdx
	sal	rax, 32
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	mov	rdx, rbx
	shld	rdx, rcx, 32
	sub	rax, rcx
	mov	rcx, r10
	sbb	rdx, rbx
	mov	QWORD PTR -88[rsp], rax
	xor	esi, esi
	mov	rax, QWORD PTR 104[rsp]
	mov	QWORD PTR -96[rsp], rdx
	mov	rdi, rsi
	xor	ebx, ebx
	mov	QWORD PTR -80[rsp], rdx
	mov	rdx, QWORD PTR 112[rsp]
	mov	rsi, r15
	add	rsi, rax
	mov	QWORD PTR 104[rsp], r12
	mov	rax, rdx
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r10
	adc	rdx, rbx
	xor	r11d, r11d
	add	rax, rdi
	adc	rdx, r11
	add	rcx, r12
	mov	r12, rdx
	adc	rbx, r13
	xor	r13d, r13d
	add	r12, rcx
	adc	r13, rbx
	xor	r11d, r11d
	mov	r10, r13
	add	r10, rcx
	mov	rcx, QWORD PTR -88[rsp]
	mov	QWORD PTR 88[rsp], r10
	adc	r11, rbx
	mov	r10, QWORD PTR -96[rsp]
	xor	ebx, ebx
	add	rcx, r8
	mov	r8, QWORD PTR -8[rsp]
	mov	QWORD PTR 96[rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	mov	r10, rcx
	mov	rcx, QWORD PTR -24[rsp]
	xor	r9d, r9d
	mov	r11, rbx
	add	r10, r8
	adc	r11, r9
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	xor	edi, edi
	add	rcx, r11
	mov	QWORD PTR -8[rsp], r10
	mov	r9, rcx
	mov	rcx, QWORD PTR -40[rsp]
	adc	rbx, rdi
	xor	edi, edi
	mov	r10, rbx
	xor	ebx, ebx
	mov	QWORD PTR -24[rsp], r9
	add	rcx, rax
	mov	rax, QWORD PTR -56[rsp]
	adc	rbx, rdi
	xor	edx, edx
	add	rcx, r10
	mov	r10, QWORD PTR -64[rsp]
	adc	rbx, rdx
	xor	edx, edx
	mov	QWORD PTR -40[rsp], rcx
	mov	r9, rbx
	xor	ebx, ebx
	add	rax, r12
	mov	r11, rax
	adc	rdx, rbx
	mov	rax, QWORD PTR 88[rsp]
	xor	ebx, ebx
	add	r11, r9
	mov	r9, QWORD PTR -72[rsp]
	mov	r12, rdx
	adc	r12, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR -56[rsp], r11
	add	rax, r9
	adc	rdx, rbx
	mov	r14, rax
	xor	esi, esi
	mov	r15, rdx
	add	r14, r12
	mov	rdx, QWORD PTR 128[rsp]
	mov	rdi, QWORD PTR 104[rsp]
	adc	r15, rsi
	mov	rsi, QWORD PTR 96[rsp]
	xor	ebx, ebx
	mov	QWORD PTR 88[rsp], r14
	lea	rcx, [rdx+r10]
	xor	edx, edx
	lea	rax, [rsi+rdi]
	add	rax, rcx
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	mov	r15, QWORD PTR 72[rsp]
	adc	rdx, rbx
	mov	QWORD PTR -72[rsp], rax
	xor	r9d, r9d
	xor	r11d, r11d
	mov	QWORD PTR -64[rsp], rdx
	mov	rdx, QWORD PTR 216[rsp]
	mulx	r14, r13, r15
	mov	rdx, r15
	mulx	rbx, rcx, QWORD PTR 168[rsp]
	mulx	rdi, rsi, QWORD PTR 152[rsp]
	mov	QWORD PTR 120[rsp], r13
	mulx	r13, r12, QWORD PTR 184[rsp]
	mov	QWORD PTR 128[rsp], r14
	mov	r8, rcx
	mov	rcx, rbx
	mulx	r15, r14, QWORD PTR 200[rsp]
	mulx	rdx, rax, QWORD PTR 136[rsp]
	mov	r10, rdx
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, r12
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	r12, r13
	xor	ebx, ebx
	mov	rcx, r14
	add	rsi, r9
	adc	rdi, rbx
	xor	r13d, r13d
	xor	ebx, ebx
	add	rcx, r12
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, rdi
	mov	r12, QWORD PTR -8[rsp]
	mov	QWORD PTR 104[rsp], rcx
	mov	rcx, QWORD PTR 120[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	mov	QWORD PTR 112[rsp], rbx
	xor	ebx, ebx
	mov	r14, QWORD PTR 104[rsp]
	add	rcx, r15
	mov	r15, QWORD PTR 112[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, r15
	adc	rbx, r13
	xor	r13d, r13d
	mov	QWORD PTR 104[rsp], rcx
	mov	rcx, r10
	mov	QWORD PTR 112[rsp], rbx
	xor	ebx, ebx
	add	r12, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	r13, rbx
	xor	edx, edx
	mov	rbx, rdx
	xor	edx, edx
	add	rax, r13
	adc	rdx, rbx
	mov	r10, rax
	mov	rax, QWORD PTR -40[rsp]
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	adc	r11, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rbx
	mov	r9, rax
	mov	rax, QWORD PTR -56[rsp]
	mov	QWORD PTR 72[rsp], r10
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, r11
	adc	r10, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rsi
	mov	QWORD PTR -8[rsp], r9
	adc	rdx, rbx
	mov	r8, rax
	mov	rax, QWORD PTR 88[rsp]
	xor	esi, esi
	mov	r9, rdx
	add	r8, r10
	mov	rdi, QWORD PTR -64[rsp]
	adc	r9, rsi
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r14
	adc	rdx, rbx
	mov	r14, rax
	mov	rsi, QWORD PTR -72[rsp]
	mov	rax, QWORD PTR 104[rsp]
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, r9
	mov	QWORD PTR 88[rsp], r8
	adc	r15, rbx
	mov	QWORD PTR -24[rsp], r14
	xor	ebx, ebx
	xor	edx, edx
	mov	r14, r15
	add	rax, rsi
	mov	r8, r12
	adc	rdx, rbx
	xor	r15d, r15d
	add	rax, r14
	adc	rdx, r15
	mov	r9, rax
	mov	rax, QWORD PTR 128[rsp]
	xor	ebx, ebx
	mov	r10, rdx
	mov	rdx, QWORD PTR 112[rsp]
	mov	QWORD PTR -40[rsp], r9
	lea	rcx, [rax+rdx]
	mov	rax, rdi
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	xor	edi, edi
	add	rax, r10
	mov	QWORD PTR 120[rsp], rax
	mov	rax, r12
	adc	rdx, rdi
	xor	r9d, r9d
	sal	rax, 32
	mov	QWORD PTR 128[rsp], rdx
	mov	rdx, -1
	add	rax, r12
	xor	ebx, ebx
	xor	r13d, r13d
	mulx	r11, r10, rax
	mov	rdx, -2
	mov	rcx, rax
	mov	rdi, rbx
	mulx	rdx, rax, rax
	mov	rsi, rcx
	shld	rdi, rcx, 32
	sal	rsi, 32
	sub	rsi, rcx
	sbb	rdi, rbx
	mov	QWORD PTR -72[rsp], rsi
	xor	ebx, ebx
	mov	r12, r11
	mov	QWORD PTR 112[rsp], rdx
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	xor	edx, edx
	mov	QWORD PTR 104[rsp], rax
	mov	rcx, r10
	mov	rax, QWORD PTR 104[rsp]
	mov	QWORD PTR -88[rsp], rdi
	mov	rdi, rdx
	mov	rdx, QWORD PTR 112[rsp]
	mov	QWORD PTR 104[rsp], r12
	mov	rsi, r15
	add	rsi, rax
	mov	rax, rdx
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r10
	adc	rdx, rbx
	xor	r11d, r11d
	add	rax, rdi
	adc	rdx, r11
	add	rcx, r12
	adc	rbx, r13
	xor	r12d, r12d
	mov	r13, r12
	mov	r12, rdx
	add	r12, rcx
	adc	r13, rbx
	xor	r11d, r11d
	mov	r10, r13
	add	r10, rcx
	mov	rcx, QWORD PTR -72[rsp]
	adc	r11, rbx
	mov	QWORD PTR -56[rsp], r10
	xor	ebx, ebx
	mov	r10, QWORD PTR -88[rsp]
	add	rcx, r8
	mov	r8, QWORD PTR 72[rsp]
	mov	QWORD PTR -48[rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	mov	r10, rcx
	mov	rcx, QWORD PTR -8[rsp]
	xor	r9d, r9d
	mov	r11, rbx
	add	r10, r8
	adc	r11, r9
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	xor	edi, edi
	add	rcx, r11
	mov	QWORD PTR 72[rsp], r10
	mov	r9, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	rbx, rdi
	xor	edi, edi
	mov	r10, rbx
	xor	ebx, ebx
	mov	QWORD PTR -8[rsp], r9
	add	rcx, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	rbx, rdi
	xor	edx, edx
	add	rcx, r10
	adc	rbx, rdx
	xor	edx, edx
	mov	QWORD PTR -24[rsp], rcx
	mov	r9, rbx
	xor	ebx, ebx
	add	rax, r12
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r9
	adc	rdx, rbx
	mov	QWORD PTR -72[rsp], rax
	mov	rax, QWORD PTR -40[rsp]
	xor	esi, esi
	mov	rcx, rdx
	mov	QWORD PTR -64[rsp], rdx
	mov	r14, QWORD PTR -56[rsp]
	xor	edx, edx
	add	rax, rcx
	mov	r15, QWORD PTR -48[rsp]
	mov	rcx, QWORD PTR 120[rsp]
	mov	r11, rax
	adc	rdx, rsi
	xor	ebx, ebx
	mov	r8, QWORD PTR 56[rsp]
	add	r11, r14
	mov	r14, QWORD PTR 104[rsp]
	mov	r12, rdx
	adc	r12, rbx
	xor	edx, edx
	xor	ebx, ebx
	mov	QWORD PTR -40[rsp], r11
	lea	rax, [r15+r14]
	add	rcx, rax
	adc	rbx, rdx
	mov	rdx, QWORD PTR 216[rsp]
	xor	r15d, r15d
	add	rcx, r12
	adc	rbx, r15
	mov	QWORD PTR -56[rsp], rcx
	xor	r9d, r9d
	xor	r11d, r11d
	mulx	r14, r13, r8
	mov	rdx, r8
	mov	QWORD PTR -48[rsp], rbx
	mulx	rdi, rsi, QWORD PTR 152[rsp]
	mulx	rbx, rcx, QWORD PTR 168[rsp]
	mov	QWORD PTR 104[rsp], r13
	mulx	r13, r12, QWORD PTR 184[rsp]
	mov	QWORD PTR 112[rsp], r14
	mov	r8, rcx
	mov	rcx, rbx
	mulx	r15, r14, QWORD PTR 200[rsp]
	mulx	rdx, rax, QWORD PTR 136[rsp]
	mov	r10, rdx
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, r12
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	r12, r13
	xor	ebx, ebx
	mov	rcx, r14
	add	rsi, r9
	adc	rdi, rbx
	xor	r13d, r13d
	xor	ebx, ebx
	add	rcx, r12
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, rdi
	mov	r12, QWORD PTR 72[rsp]
	mov	QWORD PTR 88[rsp], rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	mov	QWORD PTR 96[rsp], rbx
	xor	ebx, ebx
	mov	r14, QWORD PTR 88[rsp]
	add	rcx, r15
	mov	r15, QWORD PTR 96[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, r15
	adc	rbx, r13
	xor	r13d, r13d
	mov	QWORD PTR 88[rsp], rcx
	mov	rcx, r10
	mov	QWORD PTR 96[rsp], rbx
	xor	ebx, ebx
	add	r12, rax
	mov	rax, QWORD PTR -8[rsp]
	adc	r13, rbx
	xor	edx, edx
	mov	rbx, rdx
	xor	edx, edx
	add	rax, r13
	adc	rdx, rbx
	mov	r10, rax
	mov	rax, QWORD PTR -24[rsp]
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	adc	r11, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rbx
	mov	QWORD PTR 72[rsp], r10
	mov	r9, rax
	mov	rax, QWORD PTR -72[rsp]
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, r11
	mov	r8, r12
	adc	r10, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r10
	mov	QWORD PTR 56[rsp], r9
	adc	rdx, rsi
	mov	rsi, rax
	mov	rax, QWORD PTR -40[rsp]
	xor	ebx, ebx
	mov	rdi, rdx
	xor	edx, edx
	mov	QWORD PTR -8[rsp], rsi
	mov	rsi, QWORD PTR -56[rsp]
	add	rax, r14
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rdi
	mov	rdi, QWORD PTR -48[rsp]
	mov	r14, rax
	mov	rax, QWORD PTR 88[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	r15, rdx
	xor	edx, edx
	mov	QWORD PTR -24[rsp], r14
	add	rax, rsi
	mov	rsi, QWORD PTR 112[rsp]
	adc	rdx, rbx
	xor	r9d, r9d
	add	rax, r15
	adc	rdx, r9
	mov	r9, rax
	mov	rax, QWORD PTR 128[rsp]
	xor	ebx, ebx
	mov	r10, rdx
	xor	edx, edx
	mov	QWORD PTR 88[rsp], r9
	lea	rcx, [rdi+rax]
	mov	rdi, QWORD PTR 96[rsp]
	lea	rax, [rsi+rdi]
	add	rax, rcx
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r10
	mov	QWORD PTR 120[rsp], rax
	mov	rax, r12
	adc	rdx, rsi
	xor	r9d, r9d
	sal	rax, 32
	mov	QWORD PTR 128[rsp], rdx
	mov	rdx, -1
	add	rax, r12
	xor	ebx, ebx
	xor	r13d, r13d
	mulx	r11, r10, rax
	mov	rdx, -2
	mov	rcx, rax
	mov	rdi, rbx
	mulx	rdx, rax, rax
	mov	rsi, rcx
	shld	rdi, rcx, 32
	sal	rsi, 32
	sub	rsi, rcx
	sbb	rdi, rbx
	mov	QWORD PTR -56[rsp], rsi
	xor	ebx, ebx
	mov	r12, r11
	mov	QWORD PTR 112[rsp], rdx
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	xor	edx, edx
	mov	QWORD PTR 104[rsp], rax
	mov	rcx, r10
	mov	rax, QWORD PTR 104[rsp]
	mov	QWORD PTR -72[rsp], rdi
	mov	rdi, rdx
	mov	rdx, QWORD PTR 112[rsp]
	mov	QWORD PTR 104[rsp], r12
	mov	rsi, r15
	add	rsi, rax
	mov	rax, rdx
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r10
	adc	rdx, rbx
	xor	r11d, r11d
	add	rax, rdi
	adc	rdx, r11
	add	rcx, r12
	adc	rbx, r13
	xor	r12d, r12d
	mov	r13, r12
	mov	r12, rdx
	add	r12, rcx
	adc	r13, rbx
	xor	r11d, r11d
	mov	r10, r13
	add	r10, rcx
	mov	rcx, QWORD PTR -56[rsp]
	adc	r11, rbx
	mov	QWORD PTR -40[rsp], r10
	xor	ebx, ebx
	mov	r10, QWORD PTR -72[rsp]
	add	rcx, r8
	mov	r8, QWORD PTR 72[rsp]
	mov	QWORD PTR -32[rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	mov	r10, rcx
	mov	rcx, QWORD PTR 56[rsp]
	xor	r9d, r9d
	mov	r11, rbx
	add	r10, r8
	adc	r11, r9
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	xor	edi, edi
	add	rcx, r11
	mov	QWORD PTR 72[rsp], r10
	mov	r9, rcx
	mov	rcx, QWORD PTR -8[rsp]
	adc	rbx, rdi
	xor	edi, edi
	mov	r10, rbx
	xor	ebx, ebx
	mov	QWORD PTR 56[rsp], r9
	add	rcx, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	rbx, rdi
	xor	edx, edx
	add	rcx, r10
	adc	rbx, rdx
	xor	edx, edx
	mov	QWORD PTR -8[rsp], rcx
	mov	rdi, rbx
	xor	ebx, ebx
	add	rax, r12
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rdi
	mov	QWORD PTR -24[rsp], rax
	adc	rdx, rbx
	mov	rax, QWORD PTR 88[rsp]
	xor	ebx, ebx
	mov	rcx, rdx
	mov	r14, QWORD PTR -40[rsp]
	xor	edx, edx
	mov	r15, QWORD PTR -32[rsp]
	add	rax, rcx
	mov	r13, QWORD PTR 40[rsp]
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 120[rsp]
	add	r11, r14
	mov	r12, rdx
	mov	r14, QWORD PTR 104[rsp]
	adc	r12, rbx
	xor	esi, esi
	xor	edx, edx
	mov	QWORD PTR -40[rsp], r11
	add	rax, r12
	lea	rcx, [r15+r14]
	adc	rdx, rsi
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	mov	rdx, QWORD PTR 216[rsp]
	add	r14, rcx
	adc	r15, rbx
	mov	QWORD PTR -56[rsp], r14
	xor	r11d, r11d
	mulx	r9, r8, r13
	mov	rdx, r13
	mov	QWORD PTR -48[rsp], r15
	mulx	r13, r12, QWORD PTR 184[rsp]
	mulx	r15, r14, QWORD PTR 200[rsp]
	mulx	rbx, rcx, QWORD PTR 168[rsp]
	mulx	rdi, rsi, QWORD PTR 152[rsp]
	mulx	rdx, rax, QWORD PTR 136[rsp]
	mov	QWORD PTR 104[rsp], r8
	mov	QWORD PTR 112[rsp], r9
	mov	r8, rcx
	xor	r9d, r9d
	mov	rcx, rbx
	mov	r10, rdx
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, r12
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	r12, r13
	xor	ebx, ebx
	mov	rcx, r14
	add	rsi, r9
	adc	rdi, rbx
	xor	r13d, r13d
	xor	ebx, ebx
	add	rcx, r12
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, rdi
	mov	r12, QWORD PTR 72[rsp]
	mov	QWORD PTR 88[rsp], rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	mov	QWORD PTR 96[rsp], rbx
	xor	ebx, ebx
	mov	r14, QWORD PTR 88[rsp]
	add	rcx, r15
	mov	r15, QWORD PTR 96[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, r15
	adc	rbx, r13
	xor	r13d, r13d
	mov	QWORD PTR 88[rsp], rcx
	mov	rcx, r10
	mov	QWORD PTR 96[rsp], rbx
	xor	ebx, ebx
	add	r12, rax
	mov	rax, QWORD PTR 56[rsp]
	adc	r13, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r13
	adc	rdx, rbx
	mov	r10, rax
	mov	rax, QWORD PTR -8[rsp]
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	adc	r11, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r8
	mov	QWORD PTR 72[rsp], r10
	adc	rdx, rbx
	mov	r9, rax
	mov	rax, QWORD PTR -24[rsp]
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, r11
	adc	r10, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rbx
	xor	edi, edi
	add	rax, r10
	mov	QWORD PTR 56[rsp], r9
	mov	r8, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	rdx, rdi
	xor	ebx, ebx
	mov	r9, rdx
	xor	edx, edx
	mov	rdi, QWORD PTR -48[rsp]
	mov	QWORD PTR 40[rsp], r8
	add	rax, r14
	mov	r8, r12
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r9
	adc	rdx, rsi
	mov	r14, rax
	mov	rsi, QWORD PTR -56[rsp]
	mov	rax, QWORD PTR 88[rsp]
	mov	r15, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR -8[rsp], r14
	add	rax, rsi
	mov	rsi, QWORD PTR 112[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	mov	r9, rax
	mov	rax, QWORD PTR 128[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	r10, rdx
	xor	edx, edx
	mov	QWORD PTR 88[rsp], r9
	lea	rcx, [rdi+rax]
	mov	rdi, QWORD PTR 96[rsp]
	lea	rax, [rsi+rdi]
	add	rax, rcx
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r10
	mov	QWORD PTR 120[rsp], rax
	mov	rax, r12
	adc	rdx, rsi
	xor	r9d, r9d
	sal	rax, 32
	mov	QWORD PTR 128[rsp], rdx
	mov	rdx, -1
	add	rax, r12
	xor	ebx, ebx
	xor	r13d, r13d
	mulx	r11, r10, rax
	mov	rdx, -2
	mov	rcx, rax
	mov	rdi, rbx
	mulx	rdx, rax, rax
	mov	rsi, rcx
	shld	rdi, rcx, 32
	sal	rsi, 32
	sub	rsi, rcx
	sbb	rdi, rbx
	mov	QWORD PTR -40[rsp], rsi
	xor	ebx, ebx
	mov	r12, r11
	mov	QWORD PTR 112[rsp], rdx
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	xor	edx, edx
	mov	QWORD PTR 104[rsp], rax
	mov	rcx, r10
	mov	rax, QWORD PTR 104[rsp]
	mov	QWORD PTR -56[rsp], rdi
	mov	rdi, rdx
	mov	rdx, QWORD PTR 112[rsp]
	mov	QWORD PTR 104[rsp], r12
	mov	rsi, r15
	add	rsi, rax
	mov	rax, rdx
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r10
	adc	rdx, rbx
	xor	r11d, r11d
	add	rax, rdi
	adc	rdx, r11
	add	rcx, r12
	adc	rbx, r13
	xor	r12d, r12d
	mov	r13, r12
	mov	r12, rdx
	add	r12, rcx
	adc	r13, rbx
	xor	r11d, r11d
	mov	r10, r13
	add	r10, rcx
	mov	rcx, QWORD PTR -40[rsp]
	adc	r11, rbx
	mov	QWORD PTR -24[rsp], r10
	xor	ebx, ebx
	mov	r10, QWORD PTR -56[rsp]
	add	rcx, r8
	mov	r8, QWORD PTR 72[rsp]
	mov	QWORD PTR -16[rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	mov	r10, rcx
	mov	rcx, QWORD PTR 56[rsp]
	xor	r9d, r9d
	mov	r11, rbx
	add	r10, r8
	adc	r11, r9
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	xor	edi, edi
	add	rcx, r11
	mov	QWORD PTR 72[rsp], r10
	mov	r9, rcx
	mov	rcx, QWORD PTR 40[rsp]
	adc	rbx, rdi
	xor	edi, edi
	mov	r10, rbx
	xor	ebx, ebx
	mov	QWORD PTR 56[rsp], r9
	add	rcx, rax
	mov	rax, QWORD PTR -8[rsp]
	adc	rbx, rdi
	mov	r8, rcx
	xor	edx, edx
	mov	r9, rbx
	add	r8, r10
	adc	r9, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r12
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r9
	mov	QWORD PTR 40[rsp], r8
	adc	rdx, rbx
	mov	QWORD PTR -8[rsp], rax
	mov	rax, QWORD PTR 88[rsp]
	xor	ebx, ebx
	mov	rcx, rdx
	mov	r14, QWORD PTR -24[rsp]
	xor	edx, edx
	mov	r15, QWORD PTR -16[rsp]
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 120[rsp]
	add	r11, r14
	mov	r12, rdx
	mov	r14, QWORD PTR 104[rsp]
	adc	r12, rbx
	xor	esi, esi
	xor	edx, edx
	mov	QWORD PTR -24[rsp], r11
	add	rax, r12
	lea	rcx, [r15+r14]
	adc	rdx, rsi
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	mov	rdx, QWORD PTR 216[rsp]
	adc	r15, rbx
	mov	rbx, QWORD PTR 24[rsp]
	mov	QWORD PTR -40[rsp], r14
	xor	r9d, r9d
	mov	QWORD PTR -32[rsp], r15
	xor	r11d, r11d
	mulx	r14, r13, rbx
	mov	rdx, rbx
	mulx	rbx, rcx, QWORD PTR 168[rsp]
	mulx	rdi, rsi, QWORD PTR 152[rsp]
	mov	QWORD PTR 104[rsp], r13
	mulx	r13, r12, QWORD PTR 184[rsp]
	mov	QWORD PTR 112[rsp], r14
	mov	r8, rcx
	mov	rcx, rbx
	mulx	r15, r14, QWORD PTR 200[rsp]
	mulx	rdx, rax, QWORD PTR 136[rsp]
	mov	r10, rdx
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, r12
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	r12, r13
	xor	ebx, ebx
	mov	rcx, r14
	add	rsi, r9
	adc	rdi, rbx
	xor	r13d, r13d
	xor	ebx, ebx
	add	rcx, r12
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, rdi
	mov	r12, QWORD PTR 72[rsp]
	mov	QWORD PTR 88[rsp], rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	mov	QWORD PTR 96[rsp], rbx
	xor	ebx, ebx
	mov	r14, QWORD PTR 88[rsp]
	add	rcx, r15
	mov	r15, QWORD PTR 96[rsp]
	adc	rbx, r13
	xor	r13d, r13d
	add	rcx, r15
	adc	rbx, r13
	xor	r13d, r13d
	mov	QWORD PTR 88[rsp], rcx
	mov	rcx, r10
	mov	QWORD PTR 96[rsp], rbx
	xor	ebx, ebx
	add	r12, rax
	mov	rax, QWORD PTR 56[rsp]
	adc	r13, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r13
	adc	rdx, rbx
	mov	r10, rax
	mov	rax, QWORD PTR 40[rsp]
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	adc	r11, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r8
	mov	QWORD PTR 72[rsp], r10
	adc	rdx, rbx
	mov	r9, rax
	mov	rax, QWORD PTR -8[rsp]
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, r11
	adc	r10, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rbx
	xor	edi, edi
	add	rax, r10
	mov	QWORD PTR 56[rsp], r9
	mov	r8, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	rdx, rdi
	xor	ebx, ebx
	mov	r9, rdx
	xor	edx, edx
	mov	rdi, QWORD PTR -32[rsp]
	mov	QWORD PTR 40[rsp], r8
	add	rax, r14
	mov	r8, r12
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r9
	adc	rdx, rsi
	mov	r14, rax
	mov	rsi, QWORD PTR -40[rsp]
	mov	rax, QWORD PTR 88[rsp]
	mov	r15, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 24[rsp], r14
	add	rax, rsi
	mov	rsi, QWORD PTR 112[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	mov	r9, rax
	mov	rax, QWORD PTR 128[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	r10, rdx
	xor	edx, edx
	mov	QWORD PTR 88[rsp], r9
	lea	rcx, [rdi+rax]
	mov	rdi, QWORD PTR 96[rsp]
	lea	rax, [rsi+rdi]
	add	rax, rcx
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r10
	mov	QWORD PTR 120[rsp], rax
	mov	rax, r12
	adc	rdx, rsi
	xor	r9d, r9d
	sal	rax, 32
	mov	QWORD PTR 128[rsp], rdx
	mov	rdx, -1
	add	rax, r12
	xor	ebx, ebx
	xor	r13d, r13d
	mulx	r11, r10, rax
	mov	rdx, -2
	mov	rcx, rax
	mov	rdi, rbx
	mulx	rdx, rax, rax
	mov	rsi, rcx
	shld	rdi, rcx, 32
	sal	rsi, 32
	sub	rsi, rcx
	sbb	rdi, rbx
	mov	QWORD PTR -24[rsp], rsi
	xor	ebx, ebx
	mov	r12, r11
	mov	QWORD PTR 112[rsp], rdx
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	xor	edx, edx
	mov	QWORD PTR 104[rsp], rax
	mov	rcx, r10
	mov	rax, QWORD PTR 104[rsp]
	mov	QWORD PTR -40[rsp], rdi
	mov	QWORD PTR -16[rsp], rdi
	mov	rdi, rdx
	mov	rdx, QWORD PTR 112[rsp]
	mov	QWORD PTR 104[rsp], r12
	mov	rsi, r15
	add	rsi, rax
	mov	rax, rdx
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r10
	adc	rdx, rbx
	xor	r11d, r11d
	add	rax, rdi
	adc	rdx, r11
	add	rcx, r12
	adc	rbx, r13
	xor	r12d, r12d
	mov	r13, r12
	mov	r12, rdx
	add	r12, rcx
	adc	r13, rbx
	xor	r11d, r11d
	mov	r10, r13
	add	r10, rcx
	mov	rcx, QWORD PTR -24[rsp]
	adc	r11, rbx
	mov	QWORD PTR -8[rsp], r10
	xor	ebx, ebx
	mov	r10, QWORD PTR -40[rsp]
	add	rcx, r8
	mov	r8, QWORD PTR 72[rsp]
	mov	QWORD PTR [rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	mov	r10, rcx
	mov	rcx, QWORD PTR 56[rsp]
	xor	r9d, r9d
	mov	r11, rbx
	add	r10, r8
	adc	r11, r9
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	xor	edi, edi
	add	rcx, r11
	mov	QWORD PTR 72[rsp], r10
	mov	r9, rcx
	mov	rcx, QWORD PTR 40[rsp]
	adc	rbx, rdi
	xor	edi, edi
	mov	r10, rbx
	xor	ebx, ebx
	mov	QWORD PTR 56[rsp], r9
	add	rcx, rax
	mov	QWORD PTR 64[rsp], r10
	mov	rax, QWORD PTR 24[rsp]
	adc	rbx, rdi
	mov	r8, rcx
	xor	edx, edx
	mov	r14, QWORD PTR -8[rsp]
	add	r8, r10
	mov	r9, rbx
	mov	r15, QWORD PTR [rsp]
	adc	r9, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r12
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r9
	mov	QWORD PTR 40[rsp], r8
	adc	rdx, rbx
	mov	QWORD PTR 24[rsp], rax
	mov	rax, QWORD PTR 88[rsp]
	xor	ebx, ebx
	mov	rcx, rdx
	mov	QWORD PTR 32[rsp], rdx
	xor	edx, edx
	add	rax, rcx
	mov	QWORD PTR 48[rsp], r9
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 120[rsp]
	add	r11, r14
	mov	r12, rdx
	mov	r14, QWORD PTR 104[rsp]
	adc	r12, rbx
	xor	esi, esi
	xor	edx, edx
	mov	QWORD PTR 88[rsp], r11
	add	rax, r12
	lea	rcx, [r15+r14]
	adc	rdx, rsi
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	mov	rdx, QWORD PTR 216[rsp]
	adc	r15, rbx
	mov	rbx, QWORD PTR 16[rsp]
	mov	QWORD PTR 104[rsp], r14
	xor	r9d, r9d
	mov	QWORD PTR 112[rsp], r15
	xor	r11d, r11d
	mulx	r14, r13, rbx
	mov	rdx, rbx
	mulx	rsi, rbx, QWORD PTR 168[rsp]
	mov	QWORD PTR 224[rsp], r14
	mulx	r15, r14, QWORD PTR 200[rsp]
	mov	QWORD PTR 208[rsp], rsi
	mulx	rdi, rsi, QWORD PTR 136[rsp]
	mov	QWORD PTR 200[rsp], rbx
	mov	rax, QWORD PTR 200[rsp]
	mulx	rbx, rcx, QWORD PTR 152[rsp]
	mov	QWORD PTR 216[rsp], r13
	mulx	r13, r12, QWORD PTR 184[rsp]
	mov	rdx, QWORD PTR 208[rsp]
	mov	r8, rax
	mov	r10, rdi
	mov	rax, rdx
	add	r10, rcx
	mov	rcx, rbx
	adc	r11, r9
	xor	ebx, ebx
	xor	r9d, r9d
	add	r8, rcx
	adc	r9, rbx
	mov	rcx, r12
	xor	ebx, ebx
	add	r8, r11
	adc	r9, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdx
	mov	r12, r13
	xor	edx, edx
	mov	rax, r14
	add	rcx, r9
	adc	rbx, rdx
	xor	r13d, r13d
	xor	edx, edx
	add	rax, r12
	adc	rdx, r13
	xor	r13d, r13d
	add	rax, rbx
	adc	rdx, r13
	mov	QWORD PTR 200[rsp], rax
	xor	r13d, r13d
	mov	QWORD PTR 208[rsp], rdx
	mov	rax, QWORD PTR 216[rsp]
	xor	edx, edx
	mov	r14, QWORD PTR 200[rsp]
	add	rax, r15
	mov	r15, QWORD PTR 208[rsp]
	adc	rdx, r13
	xor	r13d, r13d
	add	rax, r15
	mov	r15, QWORD PTR 112[rsp]
	mov	QWORD PTR 200[rsp], rax
	mov	rax, QWORD PTR 72[rsp]
	adc	rdx, r13
	xor	r13d, r13d
	mov	QWORD PTR 208[rsp], rdx
	xor	edx, edx
	add	rax, rsi
	mov	rsi, QWORD PTR 56[rsp]
	adc	rdx, r13
	xor	r13d, r13d
	xor	edi, edi
	mov	QWORD PTR 184[rsp], rax
	add	rsi, rdx
	adc	rdi, r13
	xor	r13d, r13d
	add	rsi, r10
	mov	r12, rsi
	mov	rsi, QWORD PTR 40[rsp]
	adc	rdi, r13
	xor	r11d, r11d
	mov	r13, rdi
	xor	edi, edi
	mov	QWORD PTR 168[rsp], r12
	add	rsi, r8
	mov	r8, QWORD PTR 208[rsp]
	adc	rdi, r11
	xor	r9d, r9d
	add	rsi, r13
	mov	r10, rsi
	mov	rsi, QWORD PTR 24[rsp]
	adc	rdi, r9
	xor	r9d, r9d
	mov	r11, rdi
	xor	edi, edi
	mov	QWORD PTR 152[rsp], r10
	add	rsi, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	rdi, r9
	mov	rax, rsi
	xor	ebx, ebx
	mov	rdx, rdi
	add	rax, r11
	adc	rdx, rbx
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, r14
	adc	rbx, rdi
	mov	r14, QWORD PTR 104[rsp]
	mov	r9, rcx
	mov	rcx, QWORD PTR 200[rsp]
	xor	edi, edi
	mov	r10, rbx
	add	r9, rdx
	mov	rdx, QWORD PTR 224[rsp]
	adc	r10, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, r14
	mov	r11, rcx
	mov	rcx, QWORD PTR 128[rsp]
	adc	rbx, rdi
	xor	edi, edi
	mov	r12, rbx
	add	r11, r10
	mov	QWORD PTR 104[rsp], r9
	lea	rsi, [r15+rcx]
	lea	rcx, [rdx+r8]
	adc	r12, rdi
	mov	r8, QWORD PTR 184[rsp]
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rsi
	mov	QWORD PTR 136[rsp], rax
	adc	rbx, rdi
	mov	rax, r8
	xor	r15d, r15d
	add	rcx, r12
	adc	rbx, r15
	sal	rax, 32
	xor	r9d, r9d
	mov	rdx, -1
	add	rax, r8
	mov	QWORD PTR 216[rsp], rcx
	xor	edi, edi
	mov	rsi, rax
	mulx	rdx, rax, rax
	mov	QWORD PTR 120[rsp], r11
	mov	r11, rdi
	mov	QWORD PTR 224[rsp], rbx
	mov	r10, rsi
	shld	r11, rsi, 32
	sal	r10, 32
	mov	QWORD PTR 184[rsp], rax
	mov	rax, rdx
	xor	edx, edx
	sub	r10, rsi
	mov	QWORD PTR 208[rsp], rdx
	mov	rdx, -2
	sbb	r11, rdi
	xor	edi, edi
	mulx	rbx, rcx, rsi
	xor	r12d, r12d
	mov	QWORD PTR 88[rsp], r10
	movabs	rdx, -4294967296
	mulx	r15, r14, rsi
	mov	rsi, QWORD PTR 184[rsp]
	mov	rdx, r11
	mov	QWORD PTR 200[rsp], rax
	mov	r11, r15
	add	r11, rcx
	mov	rcx, rbx
	adc	r12, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, rdi
	mov	QWORD PTR 184[rsp], r11
	xor	r11d, r11d
	add	rcx, r12
	adc	rbx, r11
	add	rsi, QWORD PTR 200[rsp]
	adc	rdi, QWORD PTR 208[rsp]
	xor	r13d, r13d
	mov	r10, rbx
	mov	r11, r13
	mov	rax, QWORD PTR 168[rsp]
	add	r10, rsi
	adc	r11, rdi
	xor	r13d, r13d
	mov	r12, r11
	add	r12, rsi
	mov	rsi, QWORD PTR 88[rsp]
	adc	r13, rdi
	xor	edi, edi
	add	rsi, r8
	mov	r8, rdx
	adc	rdi, r9
	mov	rsi, rdi
	xor	edi, edi
	add	r8, r14
	xor	edx, edx
	add	rsi, r8
	mov	r8, QWORD PTR 104[rsp]
	adc	rdi, rdx
	xor	edx, edx
	add	rsi, rax
	mov	rax, QWORD PTR 152[rsp]
	adc	rdi, rdx
	mov	r14, rsi
	mov	rsi, QWORD PTR 184[rsp]
	xor	edx, edx
	mov	r15, rdi
	mov	QWORD PTR 184[rsp], r14
	xor	edi, edi
	mov	r14, r15
	add	rax, rsi
	mov	QWORD PTR 192[rsp], r15
	adc	rdx, rdi
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 136[rsp]
	adc	r15, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 120[rsp]
	adc	rdx, rdi
	xor	esi, esi
	add	rax, r15
	adc	rdx, rsi
	mov	QWORD PTR 168[rsp], rax
	xor	ebx, ebx
	xor	r9d, r9d
	mov	rax, rdx
	add	r8, r10
	mov	QWORD PTR 176[rsp], rdx
	adc	r9, rbx
	xor	edx, edx
	add	r8, rax
	adc	r9, rdx
	xor	ebx, ebx
	xor	edi, edi
	mov	rsi, r9
	add	rsi, rcx
	mov	rcx, QWORD PTR 216[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, r12
	adc	rdi, rbx
	mov	QWORD PTR 152[rsp], rsi
	xor	ebx, ebx
	mov	rsi, rdi
	mov	QWORD PTR 160[rsp], rdi
	xor	edi, edi
	add	rcx, rsi
	mov	rsi, QWORD PTR 200[rsp]
	adc	rbx, rdi
	xor	r11d, r11d
	lea	r10, 0[r13+rsi]
	mov	rsi, rcx
	mov	rcx, QWORD PTR 184[rsp]
	mov	rdi, rbx
	add	rsi, r10
	movabs	r10, -4294967295
	adc	rdi, r11
	xor	ebx, ebx
	add	rcx, r10
	mov	r11, -1
	adc	rbx, r11
	mov	rax, rcx
	mov	rcx, r14
	xor	r11d, r11d
	mov	rdx, rbx
	xor	ebx, ebx
	mov	QWORD PTR 136[rsp], rax
	mov	QWORD PTR 144[rsp], rdx
	neg	edx
	movzx	r10d, dl
	mov	QWORD PTR 200[rsp], rsi
	sub	rcx, r10
	mov	QWORD PTR 208[rsp], rdi
	movabs	r10, 4294967296
	sbb	rbx, r11
	mov	rdx, rcx
	mov	r11, -1
	add	rdx, r10
	mov	rcx, rbx
	adc	rcx, r11
	mov	QWORD PTR 120[rsp], rdx
	xor	r11d, r11d
	xor	ebx, ebx
	mov	r12, rcx
	mov	rcx, QWORD PTR 168[rsp]
	mov	rdx, r12
	mov	QWORD PTR 128[rsp], r12
	neg	edx
	movzx	r10d, dl
	sub	rcx, r10
	sbb	rbx, r11
	add	rcx, 2
	adc	rbx, -1
	mov	r10, rcx
	mov	rcx, r8
	mov	r11, rbx
	mov	QWORD PTR 104[rsp], r10
	xor	ebx, ebx
	mov	rdx, r11
	mov	QWORD PTR 112[rsp], r11
	xor	r11d, r11d
	neg	edx
	movzx	r10d, dl
	sub	rcx, r10
	sbb	rbx, r11
	mov	r12, rcx
	mov	rcx, QWORD PTR 152[rsp]
	add	r12, 1
	mov	r13, rbx
	adc	r13, -1
	xor	r11d, r11d
	xor	ebx, ebx
	mov	QWORD PTR 88[rsp], r12
	mov	rdx, r13
	mov	QWORD PTR 96[rsp], r13
	neg	edx
	movzx	r10d, dl
	sub	rcx, r10
	mov	r10, rsi
	sbb	rbx, r11
	mov	r12, rcx
	add	r12, 1
	mov	r13, rbx
	adc	r13, -1
	xor	ebx, ebx
	xor	r11d, r11d
	mov	QWORD PTR 72[rsp], r12
	mov	rdx, r13
	mov	QWORD PTR 80[rsp], r13
	neg	edx
	movzx	ecx, dl
	mov	rdx, QWORD PTR 224[rsp]
	mov	r9, QWORD PTR 88[rsp]
	sub	r10, rcx
	mov	rax, QWORD PTR 136[rsp]
	mov	rsi, QWORD PTR 152[rsp]
	sbb	r11, rbx
	lea	rcx, [rdi+rdx]
	mov	rdi, QWORD PTR 184[rsp]
	mov	r12, r11
	mov	r11, r10
	add	r11, 1
	adc	r12, -1
	xor	r13d, r13d
	xor	ebx, ebx
	mov	QWORD PTR 216[rsp], r11
	mov	rdx, r12
	mov	QWORD PTR 224[rsp], r12
	neg	edx
	movzx	r12d, dl
	cmp	rcx, r12
	sbb	rbx, r13
	mov	rdx, rbx
	mov	rcx, rbx
	mov	rbx, QWORD PTR 120[rsp]
	not	rdx
	and	rdi, rcx
	and	r8, rcx
	and	rsi, rcx
	and	rax, rdx
	and	rbx, rdx
	and	r9, rdx
	or	rdi, rax
	mov	rax, r14
	mov	r14, QWORD PTR 72[rsp]
	or	r8, r9
	and	rax, rcx
	vmovq	xmm3, rdi
	mov	r11, rax
	mov	rax, QWORD PTR 168[rsp]
	and	r14, rdx
	or	r11, rbx
	mov	rbx, QWORD PTR 104[rsp]
	or	rsi, r14
	and	rax, rcx
	vpinsrq	xmm1, xmm3, r11, 1
	and	rcx, QWORD PTR 200[rsp]
	and	rbx, rdx
	and	rdx, QWORD PTR 216[rsp]
	vmovq	xmm4, rsi
	or	rax, rbx
	or	rcx, rdx
	vmovq	xmm2, rax
	mov	rax, QWORD PTR 8[rsp]
	vpinsrq	xmm0, xmm2, r8, 1
	vinserti128	ymm0, ymm1, xmm0, 0x1
	vmovdqu	YMMWORD PTR [rax], ymm0
	vpinsrq	xmm0, xmm4, rcx, 1
	vmovdqu	XMMWORD PTR 32[rax], xmm0
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
	.size	fiat_p384_mul_gcc, .-fiat_p384_mul_gcc
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
