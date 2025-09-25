	.file	"p256_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p256_mul_gcc
	.type	fiat_p256_mul_gcc, @function
fiat_p256_mul_gcc:
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
	mov	r14, rdx
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 72
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -56[rsp], rdi
	mov	rbx, QWORD PTR 24[rdx]
	mov	r12, QWORD PTR [rsi]
	mov	rax, QWORD PTR 8[rsi]
	mov	r9, QWORD PTR 16[rsi]
	mov	rdx, rbx
	mov	r10, QWORD PTR 24[rsi]
	mov	r15, QWORD PTR 8[r14]
	mov	QWORD PTR 56[rsp], rbx
	mulx	rsi, rbx, r12
	mov	r11, QWORD PTR [r14]
	mov	QWORD PTR -40[rsp], r9
	mov	QWORD PTR 24[rsp], r15
	mov	QWORD PTR 8[rsp], r11
	mov	QWORD PTR -48[rsp], r10
	mov	QWORD PTR [rsp], rsi
	mov	rsi, QWORD PTR 16[r14]
	mov	QWORD PTR -8[rsp], rbx
	mov	rdx, rsi
	mov	QWORD PTR 40[rsp], rsi
	mulx	rbx, rcx, r12
	mov	rdx, r15
	xor	r15d, r15d
	mulx	rdi, rsi, r12
	mov	rdx, r11
	xor	r11d, r11d
	mulx	r13, r12, r12
	movabs	rdx, -4294967295
	mov	r8, rcx
	mov	rcx, rbx
	mov	r14, rsi
	mov	rsi, rdi
	add	r14, r13
	adc	r15, r11
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, QWORD PTR -8[rsp]
	xor	edi, edi
	mov	r10, r9
	mov	r9, r8
	add	r9, r15
	adc	r10, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, r10
	mov	QWORD PTR -72[rsp], r9
	mov	QWORD PTR -88[rsp], rsi
	mov	rsi, r12
	mulx	r12, r11, r12
	adc	rdi, rbx
	mov	rdx, -1
	mov	QWORD PTR -80[rsp], rdi
	xor	edi, edi
	mov	r13, rdi
	shld	r13, rsi, 32
	mov	QWORD PTR -24[rsp], r11
	mulx	r11, r10, rsi
	mov	QWORD PTR -16[rsp], r12
	mov	r12, rsi
	sal	r12, 32
	sub	r12, rsi
	mov	r8, r11
	sbb	r13, rdi
	mov	rcx, r10
	xor	ebx, ebx
	xor	r9d, r9d
	add	r8, r12
	mov	r12, r14
	mov	QWORD PTR -104[rsp], r13
	adc	r9, rbx
	xor	ebx, ebx
	add	rcx, rsi
	mov	rsi, r8
	adc	rbx, rdi
	xor	edi, edi
	mov	r15, QWORD PTR -104[rsp]
	mov	rdx, QWORD PTR [rsp]
	mov	rcx, rbx
	xor	ebx, ebx
	mov	r10, QWORD PTR -80[rsp]
	add	rsi, rcx
	lea	rcx, [r15+r9]
	mov	r9, QWORD PTR -88[rsp]
	adc	rdi, rbx
	xor	r13d, r13d
	add	r12, rsi
	adc	r13, rdi
	xor	ebx, ebx
	xor	edi, edi
	mov	rsi, r13
	add	rsi, rcx
	mov	rcx, QWORD PTR -72[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, rcx
	mov	rcx, QWORD PTR -24[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	mov	QWORD PTR -72[rsp], rsi
	mov	r15, rdi
	xor	edi, edi
	add	rcx, r9
	adc	rbx, rdi
	mov	rsi, r15
	mov	r14, rcx
	xor	edi, edi
	mov	r15, rbx
	mov	rbx, QWORD PTR -16[rsp]
	add	r14, rsi
	lea	rsi, [rdx+r10]
	adc	r15, rdi
	xor	edi, edi
	mov	rdx, QWORD PTR 56[rsp]
	mov	rcx, rbx
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, rdi
	xor	edi, edi
	add	rcx, r15
	adc	rbx, rdi
	mov	QWORD PTR -24[rsp], rcx
	xor	r11d, r11d
	xor	r9d, r9d
	mov	QWORD PTR -16[rsp], rbx
	mulx	rsi, rbx, rax
	mov	rdx, QWORD PTR 40[rsp]
	mov	QWORD PTR [rsp], rsi
	mulx	rdi, rsi, rax
	mov	rdx, QWORD PTR 24[rsp]
	mov	QWORD PTR -8[rsp], rbx
	mulx	rbx, rcx, rax
	mul	QWORD PTR 8[rsp]
	mov	r8, rdx
	add	r8, rcx
	mov	r10, rbx
	mov	rcx, rsi
	mov	rsi, rdi
	adc	r9, r11
	xor	r11d, r11d
	xor	ebx, ebx
	add	rcx, r10
	mov	r10, QWORD PTR -8[rsp]
	adc	rbx, r11
	xor	r11d, r11d
	add	rcx, r9
	adc	rbx, r11
	xor	edi, edi
	xor	r11d, r11d
	add	r10, rsi
	adc	r11, rdi
	xor	edi, edi
	add	r10, rbx
	mov	QWORD PTR -88[rsp], r10
	adc	r11, rdi
	mov	r10, rax
	xor	edi, edi
	mov	rax, r12
	mov	QWORD PTR -80[rsp], r11
	mov	rdx, rdi
	xor	r11d, r11d
	add	rax, r10
	mov	r12, QWORD PTR -80[rsp]
	adc	rdx, r11
	mov	QWORD PTR -104[rsp], rax
	xor	r11d, r11d
	mov	rax, rdx
	xor	edx, edx
	mov	rsi, rax
	mov	rdi, rdx
	mov	rax, rcx
	add	rsi, r8
	mov	r8, QWORD PTR -72[rsp]
	adc	rdi, r11
	xor	r9d, r9d
	add	rsi, r8
	adc	rdi, r9
	xor	r11d, r11d
	xor	r9d, r9d
	mov	QWORD PTR -72[rsp], rsi
	mov	r8, rdi
	mov	rsi, QWORD PTR -24[rsp]
	mov	rdi, QWORD PTR -16[rsp]
	add	r8, r14
	adc	r9, r11
	xor	r11d, r11d
	add	rax, r8
	mov	rcx, rsi
	mov	rdx, r11
	mov	r11, QWORD PTR -88[rsp]
	mov	rsi, rdi
	mov	QWORD PTR -24[rsp], rax
	adc	rdx, r9
	xor	r9d, r9d
	xor	ebx, ebx
	mov	r14, rdx
	add	rcx, r11
	mov	rdx, QWORD PTR [rsp]
	adc	rbx, r9
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, rsi
	adc	r15, rbx
	lea	r8, [rdx+r12]
	xor	edi, edi
	xor	r9d, r9d
	movabs	rdx, -4294967295
	add	rcx, r8
	mov	rbx, rdi
	adc	rbx, r9
	xor	r9d, r9d
	add	rcx, r15
	mov	QWORD PTR -8[rsp], rcx
	mov	rcx, QWORD PTR -104[rsp]
	adc	rbx, r9
	mov	QWORD PTR [rsp], rbx
	xor	ebx, ebx
	mulx	r10, r9, rcx
	mov	rdx, -1
	mov	r12, rcx
	mov	r13, rbx
	sal	r12, 32
	shld	r13, rcx, 32
	mov	r11, r12
	sub	r11, rcx
	mov	r12, r13
	mov	QWORD PTR -88[rsp], r9
	sbb	r12, rbx
	mov	QWORD PTR -80[rsp], r10
	mulx	r10, r9, rcx
	xor	edx, edx
	mov	rdi, r12
	mov	r12, QWORD PTR -72[rsp]
	mov	QWORD PTR -104[rsp], r9
	mov	r8, r10
	mov	rax, QWORD PTR -104[rsp]
	xor	r9d, r9d
	add	r8, r11
	mov	r10, QWORD PTR -80[rsp]
	adc	r9, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, r8
	adc	rdx, rbx
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rcx, rax
	lea	rax, [rdi+r9]
	mov	r9, QWORD PTR -88[rsp]
	adc	rbx, rdx
	xor	r13d, r13d
	add	r12, rcx
	adc	r13, rbx
	xor	esi, esi
	xor	edx, edx
	mov	rcx, r13
	mov	rbx, rsi
	add	rcx, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	rbx, rdx
	mov	rsi, rcx
	xor	edx, edx
	mov	rcx, r9
	add	rsi, rax
	mov	rdi, rbx
	mov	rax, QWORD PTR -8[rsp]
	mov	r9, r10
	adc	rdi, rdx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, r14
	adc	rbx, rdx
	mov	r14, rsi
	xor	edx, edx
	mov	rsi, rbx
	mov	rbx, rcx
	add	rbx, rdi
	adc	rsi, rdx
	xor	r10d, r10d
	xor	edx, edx
	add	rax, r9
	mov	rdi, rsi
	mov	QWORD PTR -72[rsp], rbx
	adc	rdx, r10
	xor	ebx, ebx
	add	rax, rdi
	mov	r9, QWORD PTR -40[rsp]
	adc	rdx, rbx
	mov	QWORD PTR -88[rsp], rax
	mov	QWORD PTR -80[rsp], rdx
	mov	rdx, QWORD PTR 56[rsp]
	mulx	rsi, rbx, r9
	mov	rdx, r9
	xor	r9d, r9d
	mulx	r11, r10, QWORD PTR 8[rsp]
	mov	QWORD PTR -24[rsp], rbx
	mulx	rbx, rcx, QWORD PTR 24[rsp]
	mov	QWORD PTR -16[rsp], rsi
	mulx	rdi, rsi, QWORD PTR 40[rsp]
	mov	QWORD PTR -40[rsp], rcx
	mov	rax, QWORD PTR -40[rsp]
	mov	rcx, r11
	mov	QWORD PTR -32[rsp], rbx
	mov	rdx, QWORD PTR -32[rsp]
	xor	ebx, ebx
	add	rcx, rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	r8, rdx
	adc	rbx, r9
	xor	r9d, r9d
	xor	edx, edx
	add	rax, r8
	mov	r8, QWORD PTR -24[rsp]
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
	adc	r9, rdi
	mov	QWORD PTR -40[rsp], r8
	mov	r8, r12
	xor	edi, edi
	mov	QWORD PTR -32[rsp], r9
	xor	r9d, r9d
	add	r8, r10
	adc	r9, rdi
	xor	r11d, r11d
	xor	edi, edi
	mov	QWORD PTR -104[rsp], r8
	mov	rsi, r9
	mov	QWORD PTR -96[rsp], r9
	add	rsi, rcx
	adc	rdi, r11
	xor	ebx, ebx
	add	rsi, r14
	mov	r11, QWORD PTR -88[rsp]
	adc	rdi, rbx
	mov	r14, rsi
	xor	ebx, ebx
	mov	rsi, rdi
	xor	edi, edi
	add	rsi, rax
	mov	rax, QWORD PTR -72[rsp]
	adc	rdi, rbx
	xor	edx, edx
	add	rsi, rax
	mov	rax, r11
	adc	rdi, rdx
	mov	QWORD PTR -72[rsp], rsi
	mov	r12, QWORD PTR -80[rsp]
	xor	edx, edx
	mov	r9, QWORD PTR -40[rsp]
	mov	rsi, rdi
	xor	edi, edi
	mov	r10, QWORD PTR -32[rsp]
	add	rax, rsi
	adc	rdx, rdi
	xor	ebx, ebx
	add	rax, r9
	mov	rdi, QWORD PTR -16[rsp]
	mov	rsi, rax
	mov	rax, QWORD PTR [rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	QWORD PTR -32[rsp], rdx
	lea	rcx, [r12+rax]
	mov	rax, rdx
	xor	edx, edx
	mov	QWORD PTR -40[rsp], rsi
	add	rax, rcx
	lea	rcx, [rdi+r10]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR -104[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	QWORD PTR -8[rsp], rax
	mov	QWORD PTR [rsp], rdx
	mov	r13, rbx
	movabs	rdx, -4294967295
	mulx	r12, r11, rcx
	mov	rdx, -1
	shld	r13, rcx, 32
	mov	QWORD PTR -24[rsp], r11
	mulx	r11, r10, rcx
	mov	QWORD PTR -16[rsp], r12
	mov	r12, rcx
	mov	rdi, QWORD PTR -16[rsp]
	sal	r12, 32
	sub	r12, rcx
	mov	r8, r11
	sbb	r13, rbx
	mov	rax, r10
	xor	edx, edx
	xor	r9d, r9d
	add	r8, r12
	mov	r10, QWORD PTR -48[rsp]
	adc	r9, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, r8
	adc	rdx, rbx
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rcx, rax
	mov	rax, QWORD PTR -72[rsp]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, r14
	adc	rbx, rdx
	mov	r14, rcx
	xor	edx, edx
	mov	rcx, rbx
	xor	ebx, ebx
	add	rax, rcx
	lea	rcx, 0[r13+r9]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR -40[rsp]
	adc	rdx, rbx
	xor	esi, esi
	mov	QWORD PTR -72[rsp], rax
	xor	ebx, ebx
	mov	QWORD PTR -64[rsp], rdx
	mov	rax, rdx
	mov	rdx, rsi
	mov	rsi, QWORD PTR -24[rsp]
	add	rax, rcx
	mov	r12, rsi
	adc	rdx, rbx
	xor	r13d, r13d
	mov	rsi, rdi
	add	r12, rax
	mov	rax, QWORD PTR -8[rsp]
	mov	rcx, rsi
	adc	r13, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r13
	adc	rdx, rbx
	xor	edi, edi
	mov	rsi, rax
	mov	rbx, rdi
	mov	rdi, rdx
	mov	rdx, QWORD PTR 56[rsp]
	add	rsi, rcx
	adc	rdi, rbx
	mov	QWORD PTR -24[rsp], rsi
	xor	r11d, r11d
	mulx	rbx, rcx, r10
	mov	rdx, r10
	mov	QWORD PTR -16[rsp], rdi
	mulx	rdi, rsi, QWORD PTR 40[rsp]
	mov	QWORD PTR 56[rsp], rcx
	mov	QWORD PTR 64[rsp], rbx
	mulx	rbx, rcx, QWORD PTR 24[rsp]
	mov	QWORD PTR 40[rsp], rcx
	mov	QWORD PTR 48[rsp], rbx
	mulx	r9, r8, QWORD PTR 8[rsp]
	xor	ebx, ebx
	mov	rax, QWORD PTR 40[rsp]
	mov	rdx, QWORD PTR 48[rsp]
	mov	r10, rdx
	mov	rcx, r9
	add	rcx, rax
	mov	rax, rsi
	mov	rsi, rdi
	adc	rbx, r11
	xor	r11d, r11d
	xor	edx, edx
	add	rax, r10
	mov	r10, QWORD PTR 56[rsp]
	adc	rdx, r11
	xor	r11d, r11d
	add	rax, rbx
	adc	rdx, r11
	xor	edi, edi
	xor	r11d, r11d
	add	r10, rsi
	mov	rsi, r14
	mov	r14, r12
	adc	r11, rdi
	xor	edi, edi
	add	r10, rdx
	adc	r11, rdi
	xor	edi, edi
	mov	QWORD PTR 40[rsp], r10
	mov	r10, QWORD PTR 64[rsp]
	mov	QWORD PTR 48[rsp], r11
	xor	r11d, r11d
	add	rsi, r8
	mov	r12, QWORD PTR 48[rsp]
	adc	rdi, r11
	xor	r11d, r11d
	xor	r9d, r9d
	mov	QWORD PTR 24[rsp], rsi
	mov	r8, rdi
	mov	rsi, QWORD PTR -24[rsp]
	mov	rdi, QWORD PTR -16[rsp]
	mov	QWORD PTR 64[rsp], 0
	add	r8, rcx
	mov	rcx, QWORD PTR -72[rsp]
	adc	r9, r11
	xor	ebx, ebx
	mov	r11, QWORD PTR 40[rsp]
	add	r8, rcx
	adc	r9, rbx
	xor	ebx, ebx
	mov	QWORD PTR 8[rsp], r8
	mov	rcx, r9
	xor	r9d, r9d
	add	rcx, rax
	adc	rbx, r9
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, rsi
	adc	r15, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, r15
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, r11
	adc	rbx, rdx
	mov	rdx, QWORD PTR [rsp]
	xor	r9d, r9d
	mov	QWORD PTR 40[rsp], rcx
	mov	rax, rbx
	lea	r8, [rdi+rdx]
	xor	edx, edx
	mov	rdi, QWORD PTR 64[rsp]
	add	rax, r8
	lea	r8, [r10+r12]
	adc	rdx, r9
	xor	r9d, r9d
	add	rax, r8
	mov	r11, rdi
	mov	QWORD PTR -8[rsp], rax
	mov	rax, QWORD PTR 24[rsp]
	adc	rdx, r9
	mov	QWORD PTR [rsp], rdx
	movabs	rdx, -4294967295
	mov	QWORD PTR 56[rsp], rax
	mov	rsi, QWORD PTR 56[rsp]
	mov	r10, rsi
	mulx	r13, r12, rsi
	shld	r11, rsi, 32
	mov	rdx, -1
	sal	r10, 32
	sub	r10, rsi
	sbb	r11, rdi
	mulx	rdi, rsi, rax
	mov	QWORD PTR 24[rsp], r10
	xor	ecx, ecx
	mov	r8, QWORD PTR 24[rsp]
	mov	rbx, r11
	xor	r9d, r9d
	mov	r11, rcx
	mov	r10, rdi
	add	r10, r8
	mov	r8, rsi
	mov	rsi, QWORD PTR 8[rsp]
	adc	r11, r9
	mov	rax, r10
	xor	r9d, r9d
	add	r8, QWORD PTR 56[rsp]
	adc	r9, QWORD PTR 64[rsp]
	xor	ecx, ecx
	xor	edx, edx
	mov	r8, r14
	add	rax, r9
	adc	rdx, rcx
	xor	edi, edi
	add	rax, rsi
	adc	rdx, rdi
	lea	rsi, [rbx+r11]
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rdx
	mov	QWORD PTR 56[rsp], rax
	adc	r9, rdi
	xor	edi, edi
	add	r8, rsi
	mov	rsi, QWORD PTR 40[rsp]
	adc	r9, rdi
	xor	r11d, r11d
	xor	edi, edi
	mov	rax, r8
	add	rsi, r9
	mov	QWORD PTR 64[rsp], rdx
	mov	rdx, r9
	mov	rcx, rax
	adc	rdi, r11
	xor	ebx, ebx
	add	rsi, r12
	mov	QWORD PTR 40[rsp], rsi
	mov	r8, QWORD PTR -8[rsp]
	adc	rdi, rbx
	xor	r11d, r11d
	mov	rsi, rdi
	mov	QWORD PTR 48[rsp], rdi
	mov	r14, QWORD PTR 56[rsp]
	xor	edi, edi
	mov	r10, r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, QWORD PTR [rsp]
	add	r10, rsi
	mov	QWORD PTR 24[rsp], rax
	mov	r8, QWORD PTR 24[rsp]
	adc	r11, rdi
	xor	ebx, ebx
	add	r10, r13
	adc	r11, rbx
	xor	r15d, r15d
	add	r14, 1
	adc	r15, -1
	xor	r13d, r13d
	xor	ebx, ebx
	mov	rdx, r15
	neg	edx
	movzx	r12d, dl
	sub	rcx, r12
	movabs	r12, -4294967295
	sbb	rbx, r13
	mov	rdx, rcx
	mov	r13, -1
	add	rdx, r12
	mov	rcx, rbx
	mov	r12, QWORD PTR 40[rsp]
	adc	rcx, r13
	xor	ebx, ebx
	xor	r13d, r13d
	mov	QWORD PTR 8[rsp], rdx
	mov	rdi, rcx
	mov	QWORD PTR 16[rsp], rcx
	neg	edi
	movzx	ecx, dil
	sub	r12, rcx
	mov	rcx, r10
	sbb	r13, rbx
	mov	QWORD PTR -8[rsp], r12
	xor	ebx, ebx
	mov	rdi, r13
	mov	QWORD PTR [rsp], r13
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
	mov	QWORD PTR -24[rsp], rax
	mov	rdi, rdx
	mov	rsi, rbx
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, QWORD PTR 8[rsp]
	neg	edi
	mov	rax, QWORD PTR 56[rsp]
	movzx	r12d, dil
	cmp	rcx, r12
	sbb	rsi, r13
	mov	rcx, rsi
	mov	rdi, rsi
	mov	rsi, QWORD PTR 40[rsp]
	not	rcx
	and	r8, rdi
	and	rax, rdi
	and	rsi, rdi
	and	rdx, rcx
	and	r14, rcx
	and	rdi, r10
	or	r8, rdx
	mov	rdx, QWORD PTR -8[rsp]
	or	rax, r14
	vmovq	xmm3, rax
	mov	rax, QWORD PTR -56[rsp]
	and	rdx, rcx
	and	rcx, QWORD PTR -24[rsp]
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
	.size	fiat_p256_mul_gcc, .-fiat_p256_mul_gcc
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
