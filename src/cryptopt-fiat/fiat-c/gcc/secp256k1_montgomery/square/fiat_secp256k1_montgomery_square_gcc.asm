	.file	"secp256k1_montgomery_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_secp256k1_montgomery_square_gcc
	.type	fiat_secp256k1_montgomery_square_gcc, @function
fiat_secp256k1_montgomery_square_gcc:
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
	mov	QWORD PTR -112[rsp], rdi
	mov	r15, QWORD PTR 8[rsi]
	mov	rax, QWORD PTR 16[rsi]
	mov	QWORD PTR 112[rsp], 0
	mov	QWORD PTR 96[rsp], 0
	mov	rdx, QWORD PTR 24[rsi]
	mov	rsi, QWORD PTR [rsi]
	mov	QWORD PTR 24[rsp], rax
	mov	QWORD PTR 120[rsp], rdx
	mulx	r12, r11, rsi
	mov	rdx, rax
	mov	QWORD PTR 8[rsp], r15
	mulx	r9, r8, rsi
	mov	rdx, rsi
	mulx	rbx, rcx, r15
	xor	edx, edx
	mov	QWORD PTR 64[rsp], rdx
	mov	rdx, rsi
	mulx	rdi, rsi, rsi
	mov	QWORD PTR -40[rsp], r12
	mov	rdx, -1
	mov	r13, r9
	mov	QWORD PTR 88[rsp], r8
	mov	QWORD PTR 56[rsp], rbx
	xor	ebx, ebx
	mov	QWORD PTR 104[rsp], rcx
	mov	rcx, rdi
	add	rcx, QWORD PTR 104[rsp]
	adc	rbx, QWORD PTR 112[rsp]
	xor	r9d, r9d
	mov	QWORD PTR -24[rsp], rcx
	mov	r8, rbx
	mov	rcx, QWORD PTR 56[rsp]
	mov	rbx, QWORD PTR 64[rsp]
	add	rcx, QWORD PTR 88[rsp]
	mov	QWORD PTR 72[rsp], r11
	adc	rbx, QWORD PTR 96[rsp]
	add	r8, rcx
	mov	rcx, r13
	mov	QWORD PTR 80[rsp], 0
	adc	r9, rbx
	xor	r11d, r11d
	add	rcx, QWORD PTR 72[rsp]
	mov	rbx, r14
	mov	r10, r9
	adc	rbx, QWORD PTR 80[rsp]
	mov	QWORD PTR [rsp], r12
	mov	r12, rsi
	add	r10, rcx
	mov	QWORD PTR -48[rsp], r14
	adc	r11, rbx
	mov	QWORD PTR -72[rsp], r10
	movabs	rbx, -2866531139136965327
	imul	rbx, rsi
	mov	QWORD PTR -64[rsp], r11
	mov	QWORD PTR -56[rsp], r13
	xor	r13d, r13d
	mulx	rdi, rsi, rbx
	xor	edx, edx
	mov	QWORD PTR 48[rsp], rdx
	movabs	rdx, -4294968273
	mulx	r15, r14, rbx
	xor	ebx, ebx
	mov	QWORD PTR 40[rsp], rdi
	xor	edi, edi
	mov	rcx, rsi
	mov	r11, rdi
	mov	r10, r15
	add	r10, rsi
	adc	r11, rbx
	add	rcx, QWORD PTR 40[rsp]
	adc	rbx, QWORD PTR 48[rsp]
	xor	edi, edi
	mov	rsi, r11
	mov	rax, rcx
	add	rsi, rcx
	mov	rcx, r14
	adc	rdi, rbx
	xor	edx, edx
	mov	QWORD PTR -88[rsp], rdi
	add	rax, QWORD PTR -88[rsp]
	mov	QWORD PTR -80[rsp], rdx
	mov	rdx, rbx
	adc	rdx, QWORD PTR -80[rsp]
	xor	ebx, ebx
	add	rcx, r12
	mov	r12, QWORD PTR -72[rsp]
	mov	QWORD PTR -16[rsp], rdx
	adc	rbx, r13
	xor	r13d, r13d
	mov	rdx, QWORD PTR -16[rsp]
	mov	rcx, rbx
	xor	ebx, ebx
	add	rcx, r10
	mov	r10, QWORD PTR -24[rsp]
	adc	rbx, r13
	xor	r11d, r11d
	mov	r13, QWORD PTR -64[rsp]
	add	r10, rcx
	mov	rcx, r8
	adc	r11, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	mov	r14, r11
	xor	edi, edi
	mov	rsi, QWORD PTR [rsp]
	add	r14, rcx
	mov	r15, rdi
	mov	rcx, rax
	adc	r15, rbx
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, r12
	mov	r12, QWORD PTR 40[rsp]
	adc	rbx, rdi
	mov	r8, rcx
	xor	edi, edi
	lea	rcx, 0[r13+rsi]
	add	r8, r15
	mov	r9, rbx
	lea	rsi, [rdx+r12]
	adc	r9, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rsi
	mov	QWORD PTR -24[rsp], r8
	adc	rbx, rdi
	mov	r12, rcx
	xor	edi, edi
	mov	r13, rbx
	add	r12, r9
	adc	r13, rdi
	mov	QWORD PTR -72[rsp], r12
	mov	QWORD PTR -64[rsp], r13
	mov	rdx, QWORD PTR 120[rsp]
	mov	QWORD PTR 48[rsp], 0
	mov	r9, QWORD PTR 8[rsp]
	mulx	rbx, rcx, r9
	xor	edx, edx
	mov	QWORD PTR -80[rsp], rdx
	mov	rdx, QWORD PTR 24[rsp]
	mulx	rdi, rsi, r9
	xor	edx, edx
	mov	QWORD PTR 16[rsp], rdx
	mov	rdx, r9
	mulx	rdx, rax, r9
	xor	r9d, r9d
	mov	QWORD PTR 40[rsp], rcx
	mov	QWORD PTR -88[rsp], rbx
	mov	QWORD PTR 8[rsp], rdi
	mov	r8, rax
	mov	rax, rdx
	add	r8, QWORD PTR 56[rsp]
	mov	QWORD PTR 56[rsp], rsi
	adc	r9, QWORD PTR 64[rsp]
	xor	edx, edx
	add	rax, QWORD PTR 56[rsp]
	mov	QWORD PTR 64[rsp], 0
	adc	rdx, QWORD PTR 64[rsp]
	xor	edi, edi
	add	rax, r9
	mov	rsi, QWORD PTR 8[rsp]
	adc	rdx, rdi
	xor	r13d, r13d
	add	rsi, QWORD PTR 40[rsp]
	mov	rdi, QWORD PTR 16[rsp]
	mov	r12, rdx
	adc	rdi, QWORD PTR 48[rsp]
	add	r12, rsi
	mov	rsi, r10
	adc	r13, rdi
	xor	edi, edi
	add	rsi, QWORD PTR 104[rsp]
	adc	rdi, QWORD PTR 112[rsp]
	mov	r10, rdi
	mov	QWORD PTR [rsp], r13
	xor	r11d, r11d
	xor	r13d, r13d
	add	r10, r8
	mov	QWORD PTR -8[rsp], r12
	mov	r12, QWORD PTR -64[rsp]
	adc	r11, r13
	xor	r9d, r9d
	add	r10, r14
	adc	r11, r9
	mov	QWORD PTR -104[rsp], r10
	xor	r9d, r9d
	xor	r10d, r10d
	mov	r14, r11
	mov	QWORD PTR -96[rsp], r11
	mov	r15, r10
	mov	r11, QWORD PTR -72[rsp]
	add	r14, rax
	mov	rax, QWORD PTR -24[rsp]
	mov	r8, QWORD PTR -8[rsp]
	mov	r10, rsi
	adc	r15, r9
	xor	edx, edx
	add	r14, rax
	mov	rax, r11
	adc	r15, rdx
	xor	r9d, r9d
	xor	edx, edx
	add	rax, r15
	adc	rdx, r9
	xor	r9d, r9d
	add	rax, r8
	mov	QWORD PTR 104[rsp], rax
	mov	rax, QWORD PTR [rsp]
	adc	rdx, r9
	xor	r9d, r9d
	mov	QWORD PTR 112[rsp], rdx
	xor	edx, edx
	lea	r8, [rax+rbx]
	mov	rax, r12
	mov	r12, QWORD PTR 112[rsp]
	movabs	rbx, -2866531139136965327
	mov	QWORD PTR 112[rsp], 0
	add	rax, r8
	adc	rdx, r9
	mov	r11, r12
	mov	r8, rax
	xor	r12d, r12d
	mov	r9, rdx
	add	r8, r11
	mov	rdx, -1
	adc	r9, r12
	imul	rbx, rsi
	mov	QWORD PTR -8[rsp], r8
	xor	r11d, r11d
	mov	QWORD PTR [rsp], r9
	xor	r13d, r13d
	xor	r9d, r9d
	mulx	rdi, rsi, rbx
	movabs	rdx, -4294968273
	mulx	rbx, rcx, rbx
	xor	edx, edx
	mov	rax, rsi
	mov	QWORD PTR -24[rsp], rdi
	mov	r15, QWORD PTR -24[rsp]
	mov	r8, rbx
	add	r8, rsi
	adc	r9, rdx
	add	rax, rdi
	mov	rsi, r9
	adc	rdx, r13
	xor	edi, edi
	add	rsi, rax
	adc	rdi, rdx
	xor	r13d, r13d
	mov	r12, rdi
	add	r12, rax
	mov	rax, rcx
	mov	rcx, rsi
	mov	rsi, r14
	adc	r13, rdx
	xor	edx, edx
	add	rax, r10
	adc	rdx, r11
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	mov	r8, QWORD PTR -104[rsp]
	adc	rdx, rbx
	xor	r9d, r9d
	add	r8, rax
	mov	rax, QWORD PTR 104[rsp]
	adc	r9, rdx
	xor	edx, edx
	xor	ebx, ebx
	add	rsi, rcx
	mov	rdi, rdx
	mov	rcx, QWORD PTR -8[rsp]
	adc	rdi, rbx
	xor	r11d, r11d
	add	rsi, r9
	adc	rdi, r11
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r12
	adc	rdx, rbx
	mov	r10, rax
	lea	rax, 0[r13+r15]
	xor	r11d, r11d
	mov	rbx, r11
	add	r10, rdi
	mov	r11, rdx
	adc	r11, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdx
	mov	rax, r11
	mov	r11, rcx
	xor	edx, edx
	mov	r12, rbx
	add	r11, rax
	mov	QWORD PTR -24[rsp], r10
	mov	r10, QWORD PTR -56[rsp]
	adc	r12, rdx
	mov	rdx, QWORD PTR 24[rsp]
	mov	QWORD PTR -72[rsp], r11
	xor	r13d, r13d
	mov	r11, QWORD PTR -48[rsp]
	add	r10, QWORD PTR 56[rsp]
	mov	QWORD PTR 32[rsp], r13
	mulx	r15, r14, QWORD PTR 120[rsp]
	mulx	rdx, rax, rdx
	adc	r11, QWORD PTR 64[rsp]
	xor	ebx, ebx
	mov	QWORD PTR -64[rsp], r12
	mov	rcx, rax
	add	rcx, QWORD PTR 8[rsp]
	adc	rbx, QWORD PTR 16[rsp]
	xor	r13d, r13d
	add	rcx, r11
	mov	QWORD PTR 104[rsp], r14
	mov	rax, rdx
	adc	rbx, r13
	xor	edx, edx
	add	rax, QWORD PTR 104[rsp]
	mov	QWORD PTR 24[rsp], r15
	adc	rdx, QWORD PTR 112[rsp]
	xor	r13d, r13d
	add	rax, rbx
	mov	r12, QWORD PTR -64[rsp]
	adc	rdx, r13
	mov	QWORD PTR 56[rsp], rax
	mov	rax, r8
	mov	QWORD PTR 64[rsp], rdx
	xor	edx, edx
	add	rax, QWORD PTR 88[rsp]
	adc	rdx, QWORD PTR 96[rsp]
	xor	r13d, r13d
	xor	r9d, r9d
	mov	QWORD PTR 8[rsp], rax
	mov	r8, rdx
	mov	r14, QWORD PTR 8[rsp]
	add	r8, r10
	adc	r9, r13
	xor	r11d, r11d
	add	r8, rsi
	adc	r9, r11
	xor	edi, edi
	mov	r11, QWORD PTR -72[rsp]
	mov	QWORD PTR -56[rsp], r8
	mov	rsi, r9
	mov	QWORD PTR -48[rsp], r9
	xor	r9d, r9d
	add	rsi, rcx
	mov	rcx, QWORD PTR -24[rsp]
	adc	rdi, r9
	mov	rax, rsi
	xor	ebx, ebx
	mov	rdx, rdi
	add	rax, rcx
	mov	rcx, r11
	adc	rdx, rbx
	xor	esi, esi
	xor	ebx, ebx
	mov	QWORD PTR -24[rsp], rax
	add	rcx, rdx
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, QWORD PTR [rsp]
	adc	rbx, rsi
	mov	rsi, QWORD PTR 56[rsp]
	mov	r9, rcx
	xor	edi, edi
	mov	r10, rbx
	lea	rcx, [r12+rdx]
	mov	rdx, QWORD PTR 64[rsp]
	add	r9, rsi
	adc	r10, rdi
	xor	ebx, ebx
	xor	edi, edi
	mov	QWORD PTR -8[rsp], r9
	mov	rsi, r10
	movabs	r10, -2866531139136965327
	add	rsi, rcx
	lea	rcx, [rdx+r15]
	mov	rdx, -1
	adc	rdi, rbx
	mov	r11, rsi
	xor	ebx, ebx
	mov	r12, rdi
	add	r11, rcx
	adc	r12, rbx
	imul	r10, r14
	mov	QWORD PTR 88[rsp], r11
	xor	r11d, r11d
	mov	r9, r11
	xor	r11d, r11d
	xor	r15d, r15d
	mov	QWORD PTR 96[rsp], r12
	mulx	rdi, rsi, r10
	movabs	rdx, -4294968273
	mulx	rbx, rcx, r10
	xor	edx, edx
	mov	rax, rsi
	mov	r8, rdi
	mov	rdi, r11
	mov	rsi, rbx
	add	rsi, rax
	adc	rdi, rdx
	add	rax, r8
	mov	r10, rdi
	adc	rdx, r9
	xor	r11d, r11d
	add	r10, rax
	adc	r11, rdx
	xor	r13d, r13d
	mov	r12, r11
	add	r12, rax
	mov	rax, QWORD PTR -56[rsp]
	mov	QWORD PTR 56[rsp], r12
	adc	r13, rdx
	mov	r12, rcx
	mov	QWORD PTR 64[rsp], r13
	xor	r13d, r13d
	add	r12, r14
	mov	r11, QWORD PTR 64[rsp]
	adc	r13, r15
	xor	r14d, r14d
	xor	edx, edx
	mov	r12, r13
	mov	r13, r14
	lea	rcx, [r11+r8]
	mov	r8, QWORD PTR 88[rsp]
	add	r12, rsi
	mov	rsi, r10
	mov	r10, QWORD PTR 56[rsp]
	adc	r13, rdx
	xor	edx, edx
	add	r12, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	r13, rdx
	xor	edx, edx
	xor	edi, edi
	add	rsi, rax
	mov	rax, QWORD PTR -8[rsp]
	adc	rdi, rdx
	xor	edx, edx
	add	rsi, r13
	adc	rdi, rdx
	mov	QWORD PTR 8[rsp], rsi
	xor	ebx, ebx
	xor	edx, edx
	mov	rsi, rdi
	add	rax, r10
	mov	QWORD PTR 16[rsp], rdi
	adc	rdx, rbx
	xor	edi, edi
	add	rax, rsi
	adc	rdx, rdi
	xor	ebx, ebx
	xor	r9d, r9d
	add	r8, rcx
	adc	r9, rbx
	xor	esi, esi
	add	r8, rdx
	mov	QWORD PTR 56[rsp], rax
	mov	QWORD PTR -8[rsp], r8
	mov	rdx, QWORD PTR 120[rsp]
	adc	r9, rsi
	mov	r14, QWORD PTR -40[rsp]
	mov	r15, QWORD PTR -32[rsp]
	mov	QWORD PTR [rsp], r9
	mulx	rdi, rsi, rdx
	add	r14, QWORD PTR 40[rsp]
	adc	r15, QWORD PTR 48[rsp]
	xor	r11d, r11d
	mov	rcx, QWORD PTR -88[rsp]
	mov	r8, r15
	add	rcx, QWORD PTR 104[rsp]
	mov	r9, r11
	mov	rbx, QWORD PTR -80[rsp]
	adc	rbx, QWORD PTR 112[rsp]
	add	r8, rcx
	adc	r9, rbx
	xor	ebx, ebx
	mov	rcx, rsi
	add	rcx, QWORD PTR 24[rsp]
	adc	rbx, QWORD PTR 32[rsp]
	xor	r11d, r11d
	add	rcx, r9
	mov	QWORD PTR 112[rsp], rdi
	adc	rbx, r11
	mov	QWORD PTR 120[rsp], rcx
	mov	rcx, r12
	mov	r12, QWORD PTR 8[rsp]
	mov	QWORD PTR 128[rsp], rbx
	xor	ebx, ebx
	add	rcx, QWORD PTR 72[rsp]
	adc	rbx, QWORD PTR 80[rsp]
	xor	r13d, r13d
	xor	r11d, r11d
	mov	r10, rbx
	add	r10, r14
	adc	r11, r13
	xor	r13d, r13d
	add	r12, r10
	mov	r10, QWORD PTR [rsp]
	adc	r13, r11
	mov	QWORD PTR 72[rsp], r12
	xor	r11d, r11d
	mov	r12, r13
	xor	r13d, r13d
	mov	rsi, r12
	mov	rdi, r13
	mov	r12, QWORD PTR 128[rsp]
	add	rsi, r8
	mov	r8, QWORD PTR 56[rsp]
	adc	rdi, r11
	xor	r9d, r9d
	mov	r11, QWORD PTR 120[rsp]
	add	rsi, r8
	mov	r8, QWORD PTR 112[rsp]
	adc	rdi, r9
	mov	r9, QWORD PTR -8[rsp]
	mov	QWORD PTR 56[rsp], rsi
	xor	edx, edx
	mov	rsi, rdi
	xor	edi, edi
	mov	rax, r9
	add	rax, rsi
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r11
	adc	rdx, rdi
	mov	r13, rax
	xor	edi, edi
	mov	r14, rdx
	mov	rdx, QWORD PTR 96[rsp]
	mov	rax, r14
	lea	rsi, [r10+rdx]
	xor	edx, edx
	add	rax, rsi
	lea	rsi, [r8+r12]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 88[rsp], rax
	xor	r12d, r12d
	xor	r9d, r9d
	mov	QWORD PTR 96[rsp], rdx
	mov	rdx, -1
	mov	QWORD PTR 120[rsp], rcx
	movabs	rcx, -2866531139136965327
	imul	rcx, QWORD PTR 120[rsp]
	mov	QWORD PTR 128[rsp], 0
	mulx	rdi, rsi, rcx
	movabs	rdx, -4294968273
	mulx	rbx, rcx, rcx
	xor	edx, edx
	mov	rax, rsi
	mov	QWORD PTR 104[rsp], rdi
	mov	r8, rbx
	add	r8, rsi
	adc	r9, rdx
	add	rax, rdi
	adc	rdx, r12
	mov	rsi, r9
	xor	r11d, r11d
	mov	rdi, r11
	add	rsi, rax
	adc	rdi, rdx
	xor	r11d, r11d
	mov	r10, rdi
	add	r10, rax
	mov	rax, rcx
	mov	rcx, QWORD PTR 72[rsp]
	adc	r11, rdx
	xor	edx, edx
	add	rax, QWORD PTR 120[rsp]
	adc	rdx, QWORD PTR 128[rsp]
	mov	rax, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r8
	mov	r8, rsi
	mov	rsi, r13
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 56[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	xor	r9d, r9d
	mov	QWORD PTR 120[rsp], rax
	add	r8, rcx
	mov	rcx, QWORD PTR 120[rsp]
	mov	QWORD PTR 128[rsp], rdx
	adc	r9, rbx
	xor	ebx, ebx
	add	r8, rdx
	adc	r9, rbx
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, r10
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, r9
	adc	rdi, rbx
	mov	rbx, QWORD PTR 104[rsp]
	mov	r14, rsi
	mov	rsi, QWORD PTR 88[rsp]
	mov	r15, rdi
	mov	QWORD PTR 104[rsp], r14
	mov	rdi, QWORD PTR 96[rsp]
	movabs	r14, 4294968273
	lea	r10, [r11+rbx]
	xor	ebx, ebx
	xor	r11d, r11d
	mov	QWORD PTR 112[rsp], r15
	add	r10, rsi
	mov	rsi, QWORD PTR 104[rsp]
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
	sbb	rbx, r13
	mov	rdx, rcx
	add	rdx, 1
	mov	rcx, rbx
	adc	rcx, -1
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
	mov	rbx, QWORD PTR 72[rsp]
	not	rdx
	and	rax, rcx
	and	rsi, rcx
	and	r8, rcx
	and	r14, rdx
	and	rbx, rdx
	and	rdi, rdx
	and	rcx, r10
	or	rax, r14
	or	rsi, rbx
	and	rdx, QWORD PTR 56[rsp]
	or	r8, rdi
	vmovq	xmm3, rax
	or	rcx, rdx
	vmovq	xmm2, rsi
	mov	rax, QWORD PTR -112[rsp]
	vpinsrq	xmm1, xmm2, rcx, 1
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
.LFE20:
	.size	fiat_secp256k1_montgomery_square_gcc, .-fiat_secp256k1_montgomery_square_gcc
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
