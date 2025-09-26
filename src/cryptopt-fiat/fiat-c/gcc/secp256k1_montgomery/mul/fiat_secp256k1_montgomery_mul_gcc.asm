	.file	"secp256k1_montgomery_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_secp256k1_montgomery_mul_gcc
	.type	fiat_secp256k1_montgomery_mul_gcc, @function
fiat_secp256k1_montgomery_mul_gcc:
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
	push	r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	mov	r13, rdx
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 72
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -88[rsp], rdi
	xor	edi, edi
	mov	rax, QWORD PTR [rsi]
	mov	r11, QWORD PTR 8[rsi]
	mov	r9, QWORD PTR 16[rsi]
	mov	rbx, QWORD PTR 24[rsi]
	mov	rsi, QWORD PTR 24[rdx]
	mov	r10, QWORD PTR 16[r13]
	mov	QWORD PTR -56[rsp], r11
	mov	QWORD PTR -80[rsp], rbx
	mov	r8, QWORD PTR 8[r13]
	mov	rdx, rsi
	mov	QWORD PTR 56[rsp], rsi
	mulx	rsi, rbx, rax
	mov	rdx, r10
	mov	QWORD PTR -72[rsp], r9
	xor	r9d, r9d
	mov	r12, r9
	mov	QWORD PTR 24[rsp], r8
	mov	QWORD PTR 40[rsp], r10
	mov	QWORD PTR [rsp], rsi
	mov	rsi, QWORD PTR 0[r13]
	mov	QWORD PTR -8[rsp], rbx
	mulx	rbx, rcx, rax
	mov	rdx, r8
	mulx	r15, r14, rax
	mov	QWORD PTR 8[rsp], rsi
	mul	rsi
	mov	rsi, QWORD PTR -8[rsp]
	mov	r11, rdx
	mov	rdx, -1
	mov	r10, rax
	add	r11, r14
	mov	r14, r15
	adc	r12, rdi
	xor	edi, edi
	xor	r15d, r15d
	add	r14, rcx
	adc	r15, rdi
	mov	rcx, rbx
	xor	edi, edi
	add	r14, r12
	adc	r15, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, r15
	mov	QWORD PTR -104[rsp], r11
	movabs	rcx, -2866531139136965327
	adc	rdi, rbx
	mov	QWORD PTR -120[rsp], rsi
	xor	r11d, r11d
	imul	rcx, rax
	mov	QWORD PTR -112[rsp], rdi
	xor	r13d, r13d
	xor	r9d, r9d
	mulx	rdi, rsi, rcx
	movabs	rdx, -4294968273
	mulx	rbx, rcx, rcx
	xor	edx, edx
	mov	rax, rsi
	mov	QWORD PTR -24[rsp], rdi
	mov	r8, rbx
	add	r8, rsi
	adc	r9, rdx
	add	rax, rdi
	adc	rdx, r13
	mov	rsi, r9
	xor	r13d, r13d
	mov	rdi, r13
	add	rsi, rax
	adc	rdi, rdx
	xor	r13d, r13d
	mov	r12, rdi
	add	r12, rax
	mov	rax, rcx
	mov	rcx, rsi
	adc	r13, rdx
	xor	edx, edx
	add	rax, r10
	mov	QWORD PTR -40[rsp], r12
	adc	rdx, r11
	mov	r12, QWORD PTR -104[rsp]
	xor	ebx, ebx
	mov	QWORD PTR -32[rsp], r13
	mov	rax, rdx
	xor	edx, edx
	mov	rsi, QWORD PTR -120[rsp]
	mov	rdi, QWORD PTR -112[rsp]
	add	rax, r8
	mov	r11, QWORD PTR -56[rsp]
	adc	rdx, rbx
	xor	r13d, r13d
	add	r12, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	r13, rdx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, r14
	mov	r14, r13
	adc	rbx, rdx
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, QWORD PTR [rsp]
	adc	r15, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	mov	rsi, QWORD PTR -32[rsp]
	mov	r9, rax
	lea	rax, [rcx+rdi]
	mov	rdi, QWORD PTR -24[rsp]
	adc	rdx, rbx
	mov	r10, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR -40[rsp], r9
	lea	rcx, [rsi+rdi]
	add	rax, rcx
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r10
	adc	rdx, rbx
	mov	QWORD PTR -104[rsp], rax
	xor	r9d, r9d
	mov	QWORD PTR -96[rsp], rdx
	mov	rdx, QWORD PTR 56[rsp]
	mulx	rsi, rbx, r11
	mov	rdx, r11
	mulx	r11, r10, QWORD PTR 8[rsp]
	mov	QWORD PTR -8[rsp], rbx
	mulx	rbx, rcx, QWORD PTR 24[rsp]
	mov	QWORD PTR [rsp], rsi
	mulx	rdi, rsi, QWORD PTR 40[rsp]
	mov	QWORD PTR -24[rsp], rcx
	mov	rax, QWORD PTR -24[rsp]
	mov	rcx, r11
	mov	QWORD PTR -16[rsp], rbx
	mov	rdx, QWORD PTR -16[rsp]
	xor	ebx, ebx
	add	rcx, rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	r8, rdx
	adc	rbx, r9
	xor	r9d, r9d
	xor	edx, edx
	add	rax, r8
	mov	r8, QWORD PTR -8[rsp]
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
	mov	rsi, r12
	adc	r9, rdi
	xor	edi, edi
	mov	QWORD PTR -24[rsp], r8
	mov	QWORD PTR -16[rsp], r9
	xor	r9d, r9d
	add	rsi, r10
	mov	r10, QWORD PTR -96[rsp]
	adc	rdi, r9
	xor	r12d, r12d
	xor	r11d, r11d
	mov	r8, rdi
	mov	r9, r12
	add	r8, rcx
	adc	r9, r11
	xor	ebx, ebx
	add	r8, r14
	adc	r9, rbx
	xor	ebx, ebx
	xor	r15d, r15d
	mov	QWORD PTR -56[rsp], r8
	mov	r14, r9
	mov	r9, QWORD PTR -104[rsp]
	add	r14, rax
	mov	rax, QWORD PTR -40[rsp]
	mov	rcx, QWORD PTR -24[rsp]
	adc	r15, rbx
	xor	edx, edx
	add	r14, rax
	mov	rax, r9
	adc	r15, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r15
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	mov	rax, QWORD PTR [rsp]
	xor	ebx, ebx
	mov	r12, rdx
	mov	rdx, QWORD PTR -16[rsp]
	mov	QWORD PTR -40[rsp], r11
	lea	rcx, [rax+rdx]
	mov	rax, r10
	xor	edx, edx
	add	rax, rcx
	movabs	rcx, -2866531139136965327
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r12
	mov	r12, rsi
	adc	rdx, rbx
	imul	rcx, rsi
	xor	r13d, r13d
	xor	r11d, r11d
	mov	QWORD PTR [rsp], rdx
	mov	rdx, -1
	mov	QWORD PTR -8[rsp], rax
	mulx	rdi, rsi, rcx
	movabs	rdx, -4294968273
	mulx	rbx, rcx, rcx
	xor	edx, edx
	mov	r10, rdi
	xor	edi, edi
	mov	rax, rsi
	mov	r8, rbx
	mov	r9, rdi
	mov	QWORD PTR -24[rsp], r10
	add	r8, rsi
	adc	r9, rdx
	add	rax, r10
	mov	rsi, r9
	adc	rdx, r11
	xor	edi, edi
	mov	r9, QWORD PTR -24[rsp]
	add	rsi, rax
	adc	rdi, rdx
	xor	r11d, r11d
	add	rax, rdi
	adc	rdx, r11
	mov	r10, rax
	mov	rax, rcx
	mov	rcx, rsi
	mov	r11, rdx
	xor	edx, edx
	add	rax, r12
	mov	r12, QWORD PTR -56[rsp]
	adc	rdx, r13
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rbx
	xor	r13d, r13d
	add	r12, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	r13, rdx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, r14
	mov	r14, r13
	adc	rbx, rdx
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, QWORD PTR -8[rsp]
	adc	r15, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r10
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	adc	rdx, rbx
	add	r9, r11
	xor	ebx, ebx
	mov	QWORD PTR -40[rsp], rax
	mov	rdi, rdx
	xor	edx, edx
	add	rcx, r9
	mov	r9, QWORD PTR -72[rsp]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rdi
	adc	rbx, rdx
	mov	rdx, QWORD PTR 56[rsp]
	mov	QWORD PTR -56[rsp], rcx
	mov	QWORD PTR -48[rsp], rbx
	mulx	rsi, rbx, r9
	mov	rdx, r9
	xor	r9d, r9d
	mulx	r11, r10, QWORD PTR 8[rsp]
	mov	QWORD PTR -24[rsp], rbx
	mulx	rbx, rcx, QWORD PTR 24[rsp]
	mov	QWORD PTR -16[rsp], rsi
	mulx	rdi, rsi, QWORD PTR 40[rsp]
	mov	QWORD PTR -72[rsp], rcx
	mov	rax, QWORD PTR -72[rsp]
	mov	rcx, r11
	mov	QWORD PTR -64[rsp], rbx
	mov	rdx, QWORD PTR -64[rsp]
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
	mov	rsi, r12
	adc	r9, rdi
	xor	edi, edi
	mov	QWORD PTR -72[rsp], r8
	mov	QWORD PTR -64[rsp], r9
	xor	r9d, r9d
	add	rsi, r10
	adc	rdi, r9
	mov	QWORD PTR -104[rsp], rsi
	xor	r11d, r11d
	mov	rsi, rdi
	mov	QWORD PTR -96[rsp], rdi
	xor	edi, edi
	mov	r12, QWORD PTR -48[rsp]
	mov	r8, rsi
	mov	r9, rdi
	mov	r10, QWORD PTR -64[rsp]
	add	r8, rcx
	adc	r9, r11
	xor	ebx, ebx
	add	r8, r14
	mov	r11, QWORD PTR -56[rsp]
	adc	r9, rbx
	xor	ebx, ebx
	mov	QWORD PTR -120[rsp], r8
	mov	rcx, r9
	mov	QWORD PTR -112[rsp], r9
	xor	r9d, r9d
	add	rcx, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	rbx, r9
	xor	edx, edx
	mov	r9, QWORD PTR -72[rsp]
	mov	rsi, rbx
	mov	rbx, rcx
	add	rbx, rax
	mov	rax, r11
	adc	rsi, rdx
	xor	edx, edx
	mov	QWORD PTR -40[rsp], rbx
	mov	rbx, rdx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR [rsp]
	add	rsi, r9
	mov	rdi, rdx
	adc	rdi, rbx
	lea	rcx, [r12+rax]
	xor	ebx, ebx
	xor	edx, edx
	mov	rax, rdi
	mov	rdi, QWORD PTR -16[rsp]
	mov	QWORD PTR -56[rsp], rsi
	add	rax, rcx
	adc	rdx, rbx
	lea	rcx, [rdi+r10]
	mov	r11, rax
	mov	r10, QWORD PTR -104[rsp]
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rcx
	mov	rdx, -1
	movabs	rcx, -2866531139136965327
	adc	r12, rbx
	xor	r13d, r13d
	mov	QWORD PTR -8[rsp], r11
	imul	rcx, r10
	xor	r11d, r11d
	xor	r15d, r15d
	mov	r9, r13
	mov	QWORD PTR [rsp], r12
	mulx	rdi, rsi, rcx
	movabs	rdx, -4294968273
	mulx	rbx, rcx, rcx
	xor	edx, edx
	mov	rax, rsi
	mov	r14, rdi
	mov	r8, rbx
	add	r8, rsi
	adc	r9, rdx
	add	rax, rdi
	mov	rsi, r9
	adc	rdx, r15
	xor	edi, edi
	add	rsi, rax
	adc	rdi, rdx
	xor	r13d, r13d
	mov	r12, rdi
	add	r12, rax
	mov	rax, rcx
	mov	rcx, rsi
	adc	r13, rdx
	xor	edx, edx
	add	rax, r10
	mov	QWORD PTR -24[rsp], r12
	adc	rdx, r11
	mov	r12, QWORD PTR -120[rsp]
	xor	ebx, ebx
	mov	QWORD PTR -16[rsp], r13
	mov	rax, rdx
	xor	edx, edx
	mov	r9, r12
	add	rax, r8
	adc	rdx, rbx
	xor	r13d, r13d
	add	r9, rax
	mov	rax, QWORD PTR -40[rsp]
	mov	r10, r13
	mov	QWORD PTR -40[rsp], r9
	mov	r9, QWORD PTR -24[rsp]
	adc	r10, rdx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdx
	mov	rax, QWORD PTR -56[rsp]
	xor	edx, edx
	add	rcx, r10
	adc	rbx, rdx
	mov	QWORD PTR -32[rsp], r10
	xor	edx, edx
	mov	r10, QWORD PTR -16[rsp]
	mov	r12, rbx
	xor	ebx, ebx
	add	rax, r9
	mov	QWORD PTR -24[rsp], rcx
	adc	rdx, rbx
	mov	rcx, QWORD PTR -8[rsp]
	xor	ebx, ebx
	add	rax, r12
	adc	rdx, rbx
	mov	rsi, rax
	lea	rax, [r10+r14]
	xor	ebx, ebx
	mov	rdi, rdx
	xor	edx, edx
	add	rcx, rax
	mov	QWORD PTR -16[rsp], r12
	adc	rbx, rdx
	mov	r9, rcx
	xor	edx, edx
	mov	QWORD PTR -56[rsp], rsi
	add	r9, rdi
	mov	r10, rbx
	mov	rbx, QWORD PTR -80[rsp]
	mov	QWORD PTR -48[rsp], rdi
	adc	r10, rdx
	mov	rdx, QWORD PTR 56[rsp]
	mov	QWORD PTR -72[rsp], r9
	xor	r11d, r11d
	mov	QWORD PTR -64[rsp], r10
	xor	edi, edi
	mulx	rdx, rax, rbx
	mov	QWORD PTR 56[rsp], rax
	mov	r10, QWORD PTR 56[rsp]
	mov	QWORD PTR 64[rsp], rdx
	mov	rdx, rbx
	mulx	r9, r8, QWORD PTR 8[rsp]
	mulx	r14, r13, QWORD PTR 24[rsp]
	mulx	rbx, rcx, QWORD PTR 40[rsp]
	mov	rsi, r9
	mov	rax, rcx
	mov	rcx, rbx
	add	rsi, r13
	adc	rdi, r11
	xor	r11d, r11d
	xor	edx, edx
	add	rax, r14
	adc	rdx, r11
	xor	r11d, r11d
	add	rax, rdi
	adc	rdx, r11
	xor	ebx, ebx
	xor	r11d, r11d
	add	r10, rcx
	adc	r11, rbx
	mov	rcx, QWORD PTR -40[rsp]
	xor	ebx, ebx
	add	r10, rdx
	adc	r11, rbx
	xor	ebx, ebx
	mov	r13, r10
	mov	r10, QWORD PTR -64[rsp]
	mov	r14, r11
	xor	r11d, r11d
	add	rcx, r8
	adc	rbx, r11
	xor	r11d, r11d
	xor	r9d, r9d
	mov	r8, rbx
	add	r8, rsi
	mov	rsi, QWORD PTR -24[rsp]
	adc	r9, r11
	xor	edi, edi
	add	r8, rsi
	adc	r9, rdi
	xor	edi, edi
	mov	QWORD PTR 40[rsp], r8
	mov	r8, QWORD PTR 64[rsp]
	mov	rsi, r9
	xor	r9d, r9d
	add	rsi, rax
	mov	rax, QWORD PTR -56[rsp]
	adc	rdi, r9
	mov	r9, QWORD PTR -72[rsp]
	xor	edx, edx
	add	rsi, rax
	adc	rdi, rdx
	mov	QWORD PTR 24[rsp], rsi
	xor	edx, edx
	mov	rax, r9
	mov	rsi, rdi
	mov	rdi, rdx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rdi
	mov	r11, rax
	xor	edi, edi
	mov	r12, rdx
	add	r11, r13
	mov	rdx, QWORD PTR [rsp]
	adc	r12, rdi
	xor	edi, edi
	mov	QWORD PTR 8[rsp], r11
	lea	rsi, [r10+rdx]
	mov	rax, r12
	xor	r10d, r10d
	add	rax, rsi
	mov	rdx, r10
	lea	rsi, [r8+r14]
	mov	r14, rax
	adc	rdx, rdi
	xor	edi, edi
	add	r14, rsi
	mov	r15, rdx
	mov	rdx, -1
	mov	QWORD PTR -8[rsp], r14
	mov	r14, rcx
	adc	r15, rdi
	xor	r11d, r11d
	movabs	rcx, -2866531139136965327
	mov	QWORD PTR [rsp], r15
	xor	r13d, r13d
	xor	r15d, r15d
	imul	rcx, r14
	mov	r9, r11
	mulx	rdi, rsi, rcx
	movabs	rdx, -4294968273
	mulx	rbx, rcx, rcx
	xor	edx, edx
	mov	rax, rsi
	mov	r12, rdi
	mov	r8, rbx
	add	r8, rsi
	adc	r9, rdx
	add	rax, rdi
	adc	rdx, r13
	mov	rsi, r9
	xor	r11d, r11d
	mov	rdi, r11
	add	rsi, rax
	adc	rdi, rdx
	xor	r11d, r11d
	mov	r10, rdi
	add	r10, rax
	mov	rax, rcx
	mov	rcx, QWORD PTR 40[rsp]
	adc	r11, rdx
	xor	edx, edx
	add	rax, r14
	adc	rdx, r15
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	mov	r8, rsi
	mov	rsi, QWORD PTR 8[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 24[rsp]
	adc	rdx, rbx
	mov	QWORD PTR 56[rsp], rax
	xor	ebx, ebx
	xor	r9d, r9d
	mov	rax, rdx
	add	r8, rcx
	mov	QWORD PTR 64[rsp], rdx
	mov	rcx, QWORD PTR 56[rsp]
	adc	r9, rbx
	xor	edx, edx
	add	r8, rax
	adc	r9, rdx
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, r10
	adc	rdi, rbx
	xor	ebx, ebx
	lea	r10, [r11+r12]
	add	rsi, r9
	mov	r14, rsi
	mov	rsi, QWORD PTR -8[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	mov	r15, rdi
	xor	r11d, r11d
	mov	QWORD PTR 40[rsp], r14
	mov	rdi, QWORD PTR [rsp]
	add	r10, rsi
	mov	QWORD PTR 48[rsp], r15
	movabs	r14, 4294968273
	adc	r11, rbx
	xor	ebx, ebx
	add	r10, r15
	mov	r15, -1
	adc	r11, rbx
	xor	ebx, ebx
	add	r14, rcx
	mov	rcx, r8
	adc	r15, rbx
	xor	r13d, r13d
	xor	ebx, ebx
	mov	rdx, r15
	neg	edx
	movzx	r12d, dl
	sub	rcx, r12
	sbb	rbx, r13
	add	rcx, 1
	adc	rbx, -1
	mov	rax, rcx
	mov	rcx, QWORD PTR 40[rsp]
	xor	r13d, r13d
	mov	rdx, rbx
	mov	QWORD PTR 24[rsp], rax
	xor	ebx, ebx
	mov	QWORD PTR 32[rsp], rdx
	neg	edx
	mov	rax, QWORD PTR 56[rsp]
	movzx	r12d, dl
	mov	rsi, QWORD PTR 40[rsp]
	sub	rcx, r12
	sbb	rbx, r13
	add	rcx, 1
	adc	rbx, -1
	mov	r12, rcx
	mov	rcx, r10
	mov	r13, rbx
	mov	QWORD PTR 8[rsp], r12
	xor	ebx, ebx
	mov	rdx, r13
	mov	QWORD PTR 16[rsp], r13
	xor	r13d, r13d
	neg	edx
	movzx	r12d, dl
	sub	rcx, r12
	sbb	rbx, r13
	mov	rdx, rcx
	add	rdx, 1
	mov	rcx, rbx
	adc	rcx, -1
	mov	QWORD PTR -8[rsp], rdx
	xor	ebx, ebx
	mov	r13, rcx
	lea	rcx, [r11+rdi]
	mov	rdi, QWORD PTR 24[rsp]
	mov	rdx, r13
	mov	QWORD PTR [rsp], r13
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
	mov	rdi, QWORD PTR 8[rsp]
	and	rsi, rcx
	or	rax, r14
	and	rcx, r10
	vmovq	xmm3, rax
	mov	rax, QWORD PTR -88[rsp]
	and	rdi, rdx
	and	rdx, QWORD PTR -8[rsp]
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
	.size	fiat_secp256k1_montgomery_mul_gcc, .-fiat_secp256k1_montgomery_mul_gcc
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
