	.file	"p434_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p434_mul_gcc
	.type	fiat_p434_mul_gcc, @function
fiat_p434_mul_gcc:
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
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 296
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR 8[rsp], rdi
	mov	rax, QWORD PTR 32[rsi]
	mov	rcx, QWORD PTR 24[rsi]
	mov	r9, QWORD PTR 48[rdx]
	mov	rbx, QWORD PTR 40[rsi]
	mov	r10, QWORD PTR 8[rsi]
	mov	r13, QWORD PTR 16[rsi]
	mov	QWORD PTR 40[rsp], rax
	mov	rax, QWORD PTR [rsi]
	mov	r11, QWORD PTR 48[rsi]
	mov	QWORD PTR 56[rsp], rcx
	mov	rcx, rdx
	mov	rdx, r9
	mov	r14, QWORD PTR 40[rcx]
	mov	r12, QWORD PTR 32[rcx]
	mov	QWORD PTR 24[rsp], rbx
	mulx	rsi, rbx, rax
	mov	r8, QWORD PTR 24[rcx]
	mov	QWORD PTR 88[rsp], r10
	mov	rdx, r14
	mov	QWORD PTR 72[rsp], r13
	mov	QWORD PTR 16[rsp], r11
	mulx	r11, r10, rax
	mov	rdx, r12
	mov	QWORD PTR 280[rsp], r9
	mov	r9, rcx
	mov	QWORD PTR 152[rsp], rbx
	mov	QWORD PTR 160[rsp], rsi
	mov	QWORD PTR 264[rsp], r14
	mulx	r15, r14, rax
	mov	rdx, r8
	mov	QWORD PTR 248[rsp], r12
	mulx	r13, r12, rax
	mov	QWORD PTR 232[rsp], r8
	mov	rdi, QWORD PTR 16[rcx]
	mov	r8, QWORD PTR 8[r9]
	mov	r9, QWORD PTR [r9]
	mov	rdx, rdi
	mov	QWORD PTR 216[rsp], rdi
	mulx	rbx, rcx, rax
	mov	rdx, r8
	mov	QWORD PTR 184[rsp], r9
	mulx	rdi, rsi, rax
	mov	QWORD PTR 200[rsp], r8
	mul	r9
	xor	r9d, r9d
	mov	QWORD PTR 176[rsp], r9
	xor	r9d, r9d
	mov	QWORD PTR 168[rsp], rdx
	mov	r8, rsi
	mov	rsi, rdi
	add	r8, QWORD PTR 168[rsp]
	mov	QWORD PTR 136[rsp], r8
	mov	r8, rcx
	mov	rcx, rbx
	adc	r9, QWORD PTR 176[rsp]
	mov	QWORD PTR 144[rsp], r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	movabs	rdx, 620258357900100
	adc	r9, rdi
	mov	rdi, QWORD PTR 144[rsp]
	mov	QWORD PTR 176[rsp], 0
	mov	rsi, rdi
	xor	edi, edi
	add	r8, rsi
	mov	rsi, r12
	mov	r12, r13
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	rcx, r14
	xor	ebx, ebx
	add	rsi, r9
	adc	rdi, rbx
	xor	r13d, r13d
	xor	ebx, ebx
	add	rcx, r12
	mov	QWORD PTR -8[rsp], r8
	adc	rbx, r13
	mov	r8, rax
	xor	r13d, r13d
	add	rcx, rdi
	mulx	rdx, rax, r8
	mov	r14, r15
	mov	QWORD PTR -24[rsp], rsi
	adc	rbx, r13
	mov	r12, rcx
	mov	rcx, r10
	mov	r13, rbx
	xor	r15d, r15d
	xor	ebx, ebx
	add	rcx, r14
	adc	rbx, r15
	mov	rsi, r13
	mov	r13, rcx
	xor	r15d, r15d
	mov	r14, rbx
	add	r13, rsi
	mov	QWORD PTR -88[rsp], rax
	mov	r10, r11
	adc	r14, r15
	mov	r15, rdx
	xor	r11d, r11d
	xor	ebx, ebx
	movabs	rdx, 7853257225132122198
	mov	QWORD PTR -40[rsp], r12
	mov	rcx, QWORD PTR 152[rsp]
	mulx	rdx, rax, r8
	mov	QWORD PTR -56[rsp], r13
	add	rcx, r10
	adc	rbx, r11
	xor	r10d, r10d
	add	rcx, r14
	adc	rbx, r10
	xor	r11d, r11d
	xor	r9d, r9d
	mov	QWORD PTR -72[rsp], rcx
	mov	QWORD PTR -96[rsp], rdx
	movabs	rdx, 8918917783347572387
	mulx	r13, r12, r8
	mov	QWORD PTR -104[rsp], rax
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mov	QWORD PTR -64[rsp], rbx
	mulx	rdx, rax, r8
	mov	QWORD PTR 168[rsp], rax
	mov	rax, QWORD PTR 168[rsp]
	mov	r10, rdx
	mov	rdx, QWORD PTR 176[rsp]
	add	rax, r10
	adc	rdx, r11
	xor	ebx, ebx
	mov	QWORD PTR 120[rsp], rax
	mov	rcx, rdx
	add	rcx, rax
	mov	rax, rsi
	mov	rsi, rdi
	adc	rbx, rdx
	xor	edx, edx
	add	rax, r10
	mov	r10, rbx
	adc	rdx, r11
	xor	r11d, r11d
	add	r10, rax
	mov	rax, r12
	mov	r12, r13
	adc	r11, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rdi
	mov	rsi, QWORD PTR -104[rsp]
	xor	edi, edi
	add	rax, r11
	adc	rdx, rdi
	mov	QWORD PTR 104[rsp], rax
	xor	r13d, r13d
	mov	QWORD PTR 112[rsp], rdx
	mov	rax, rsi
	mov	rdi, QWORD PTR -96[rsp]
	xor	edx, edx
	mov	r14, QWORD PTR 112[rsp]
	add	rax, r12
	adc	rdx, r13
	mov	rsi, rdi
	mov	r13, r14
	xor	r14d, r14d
	add	r13, rax
	mov	rax, rsi
	mov	rsi, QWORD PTR -88[rsp]
	adc	r14, rdx
	xor	edi, edi
	mov	QWORD PTR -88[rsp], r13
	mov	rdx, rdi
	xor	edi, edi
	add	rax, rsi
	mov	rsi, r14
	adc	rdx, rdi
	mov	r13, rax
	mov	rax, QWORD PTR 168[rsp]
	xor	edi, edi
	mov	r14, rdx
	add	r13, rsi
	mov	rdx, QWORD PTR 176[rsp]
	mov	rsi, QWORD PTR 120[rsp]
	adc	r14, rdi
	add	rax, r8
	adc	rdx, r9
	xor	edi, edi
	mov	rax, rdx
	xor	edx, edx
	add	rax, rsi
	mov	rsi, QWORD PTR 136[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, rsi
	mov	r8, rax
	mov	rax, QWORD PTR -8[rsp]
	adc	rdx, rdi
	xor	edi, edi
	mov	r9, rdx
	xor	edx, edx
	mov	QWORD PTR 136[rsp], r8
	add	rax, rcx
	adc	rdx, rdi
	xor	esi, esi
	add	rax, r9
	mov	r9, QWORD PTR -72[rsp]
	mov	rcx, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	rdx, rsi
	xor	edi, edi
	mov	rbx, rdx
	xor	edx, edx
	mov	rsi, QWORD PTR 104[rsp]
	mov	QWORD PTR 120[rsp], rcx
	add	rax, r10
	mov	rcx, QWORD PTR -88[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, rbx
	mov	r11, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	rdx, rdi
	xor	edi, edi
	mov	r12, rdx
	xor	edx, edx
	mov	QWORD PTR 104[rsp], r11
	add	rax, rsi
	adc	rdx, rdi
	xor	ebx, ebx
	add	rax, r12
	mov	r10, rax
	mov	rax, QWORD PTR -56[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	r11, rdx
	xor	edx, edx
	mov	QWORD PTR -8[rsp], r10
	add	rax, rcx
	adc	rdx, rbx
	xor	r10d, r10d
	add	rax, r11
	adc	rdx, r10
	mov	rsi, rax
	mov	rax, r13
	xor	ebx, ebx
	mov	rdi, rdx
	xor	edx, edx
	add	rax, r9
	mov	QWORD PTR -24[rsp], rsi
	adc	rdx, rbx
	xor	esi, esi
	add	rax, rdi
	mov	r10, QWORD PTR -64[rsp]
	adc	rdx, rsi
	mov	r11, rax
	lea	rax, [r15+r14]
	xor	ebx, ebx
	mov	r12, rdx
	mov	rdx, QWORD PTR 160[rsp]
	mov	QWORD PTR -40[rsp], r11
	lea	rcx, [rdx+r10]
	xor	edx, edx
	mov	r10, QWORD PTR 88[rsp]
	add	rax, rcx
	adc	rdx, rbx
	xor	r15d, r15d
	add	rax, r12
	adc	rdx, r15
	mov	QWORD PTR -56[rsp], rax
	xor	r11d, r11d
	mov	QWORD PTR -48[rsp], rdx
	mov	rdx, QWORD PTR 280[rsp]
	mulx	r14, r13, r10
	mov	rdx, r10
	mov	QWORD PTR 168[rsp], r13
	mov	QWORD PTR 176[rsp], r14
	mulx	r14, r13, QWORD PTR 264[rsp]
	mov	QWORD PTR 88[rsp], r13
	mov	QWORD PTR 96[rsp], r14
	mulx	rsi, rbx, QWORD PTR 232[rsp]
	mulx	r9, r8, QWORD PTR 200[rsp]
	mulx	r13, r12, QWORD PTR 184[rsp]
	mulx	r15, r14, QWORD PTR 248[rsp]
	mov	QWORD PTR 160[rsp], rsi
	mov	r10, r8
	mov	r8, r9
	mulx	rdi, rsi, QWORD PTR 216[rsp]
	xor	edx, edx
	add	r10, r13
	mov	QWORD PTR 152[rsp], rbx
	adc	r11, rdx
	xor	r9d, r9d
	xor	ebx, ebx
	mov	rcx, rsi
	mov	rsi, r14
	mov	r14, r15
	add	rcx, r8
	mov	r8, r11
	adc	rbx, r9
	xor	r9d, r9d
	add	r8, rcx
	mov	rcx, QWORD PTR 152[rsp]
	adc	r9, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rdi
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, r9
	adc	rbx, rdx
	mov	rdx, QWORD PTR 160[rsp]
	xor	edi, edi
	mov	rax, rdx
	xor	edx, edx
	add	rsi, rax
	adc	rdi, rdx
	xor	edx, edx
	add	rsi, rbx
	mov	QWORD PTR 152[rsp], rsi
	mov	rsi, QWORD PTR 88[rsp]
	adc	rdi, rdx
	xor	r15d, r15d
	xor	edx, edx
	mov	QWORD PTR 160[rsp], rdi
	mov	rdi, QWORD PTR 96[rsp]
	mov	rax, rsi
	add	rax, r14
	mov	rsi, rdi
	adc	rdx, r15
	mov	r15, QWORD PTR 160[rsp]
	mov	r14, r15
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 168[rsp]
	adc	r15, rdx
	xor	edx, edx
	mov	rdi, rdx
	xor	edx, edx
	add	rax, rsi
	mov	rsi, QWORD PTR 136[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r15
	adc	rdx, rdi
	mov	QWORD PTR 88[rsp], rax
	xor	edi, edi
	mov	rax, r12
	mov	r12, rsi
	mov	QWORD PTR 96[rsp], rdx
	mov	r13, rdi
	xor	edx, edx
	add	r12, rax
	mov	rsi, QWORD PTR 120[rsp]
	adc	r13, rdx
	xor	edi, edi
	xor	edx, edx
	mov	rax, r13
	add	rax, r10
	adc	rdx, rdi
	xor	edi, edi
	add	rax, rsi
	mov	rsi, QWORD PTR 104[rsp]
	adc	rdx, rdi
	mov	QWORD PTR -72[rsp], rax
	xor	edi, edi
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rdi
	mov	r8, rax
	xor	edi, edi
	mov	rax, QWORD PTR -8[rsp]
	add	r8, rsi
	mov	r9, rdx
	mov	rsi, rcx
	adc	r9, rdi
	mov	QWORD PTR 104[rsp], r8
	xor	edx, edx
	mov	r8, r9
	xor	r9d, r9d
	add	rax, r8
	mov	r8, r12
	adc	rdx, r9
	mov	rcx, rax
	xor	edi, edi
	mov	rax, QWORD PTR -24[rsp]
	add	rcx, rsi
	mov	rbx, rdx
	mov	rsi, QWORD PTR 152[rsp]
	adc	rbx, rdi
	xor	r10d, r10d
	xor	edx, edx
	mov	QWORD PTR -8[rsp], rcx
	add	rax, rbx
	mov	rcx, r14
	adc	rdx, r10
	mov	r10, rax
	xor	edi, edi
	add	r10, rsi
	mov	r11, rdx
	mov	QWORD PTR -24[rsp], r10
	mov	rax, QWORD PTR -40[rsp]
	adc	r11, rdi
	xor	esi, esi
	xor	edx, edx
	mov	rdi, QWORD PTR -48[rsp]
	add	rax, r11
	adc	rdx, rsi
	mov	r14, rax
	mov	rsi, QWORD PTR -56[rsp]
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	adc	r15, rbx
	mov	QWORD PTR -40[rsp], r14
	mov	rax, rsi
	xor	edx, edx
	mov	r14, r15
	xor	r15d, r15d
	add	rax, r14
	mov	r14, QWORD PTR 88[rsp]
	adc	rdx, r15
	mov	r9, rax
	mov	r15, QWORD PTR 96[rsp]
	xor	ebx, ebx
	mov	rax, QWORD PTR 176[rsp]
	add	r9, r14
	mov	r10, rdx
	adc	r10, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 88[rsp], r9
	lea	rcx, [rax+r15]
	mov	rax, rdi
	add	rax, rcx
	adc	rdx, rbx
	xor	edi, edi
	mov	rsi, rax
	mov	rbx, rdi
	mov	rdi, rdx
	add	rsi, r10
	movabs	rdx, 620258357900100
	mulx	rdx, rax, r12
	adc	rdi, rbx
	xor	r15d, r15d
	xor	r9d, r9d
	mov	QWORD PTR 168[rsp], rsi
	mov	QWORD PTR 176[rsp], rdi
	mov	r13, rdx
	mov	QWORD PTR -56[rsp], rax
	movabs	rdx, 7853257225132122198
	mulx	r12, r11, r12
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r8
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mulx	rdx, rax, r8
	mov	QWORD PTR 152[rsp], r11
	xor	r11d, r11d
	mov	QWORD PTR 160[rsp], r12
	mov	r14, rax
	mov	rax, rdx
	mov	r10, rdx
	mov	rdx, r11
	add	rax, r14
	adc	rdx, r15
	mov	QWORD PTR 136[rsp], rax
	mov	QWORD PTR 144[rsp], rdx
	mov	rax, rdx
	xor	edx, edx
	add	rax, QWORD PTR 136[rsp]
	adc	rdx, QWORD PTR 144[rsp]
	mov	QWORD PTR 120[rsp], rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 128[rsp], rdx
	mov	r12, QWORD PTR 128[rsp]
	xor	edx, edx
	add	rax, r10
	adc	rdx, r11
	mov	r11, r12
	xor	r12d, r12d
	add	r11, rax
	mov	rax, rcx
	mov	rcx, rbx
	adc	r12, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rsi
	mov	rsi, r12
	adc	rdx, rdi
	mov	QWORD PTR -88[rsp], r11
	xor	r11d, r11d
	add	rsi, rax
	mov	rax, QWORD PTR 152[rsp]
	mov	rdi, r11
	mov	QWORD PTR -80[rsp], r12
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rdi
	adc	r12, rbx
	mov	rbx, QWORD PTR 160[rsp]
	mov	QWORD PTR 152[rsp], r11
	mov	rcx, rbx
	xor	ebx, ebx
	mov	rax, rcx
	mov	rcx, QWORD PTR -56[rsp]
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, r12
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rcx
	mov	rcx, QWORD PTR 136[rsp]
	adc	r12, rbx
	add	r8, r14
	adc	r9, r15
	xor	r10d, r10d
	xor	ebx, ebx
	mov	rax, r9
	mov	rdx, r10
	add	rax, rcx
	mov	rcx, QWORD PTR -72[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rdx, rbx
	mov	QWORD PTR -56[rsp], rax
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 120[rsp]
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, rcx
	adc	r9, rbx
	mov	QWORD PTR 120[rsp], r8
	mov	rcx, QWORD PTR -8[rsp]
	xor	ebx, ebx
	mov	r8, r9
	xor	r9d, r9d
	mov	rax, r8
	mov	rdx, r9
	add	rax, rcx
	mov	rcx, QWORD PTR -88[rsp]
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	rcx, QWORD PTR -24[rsp]
	adc	r10, rbx
	xor	ebx, ebx
	mov	QWORD PTR 104[rsp], r9
	mov	rax, r10
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rdi, rdx
	add	rsi, rcx
	mov	rcx, QWORD PTR -40[rsp]
	adc	rdi, rbx
	mov	QWORD PTR -8[rsp], rsi
	xor	esi, esi
	xor	ebx, ebx
	mov	rax, rdi
	mov	rdx, rsi
	add	rax, rcx
	mov	rcx, QWORD PTR 152[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	r15, rbx
	mov	QWORD PTR -24[rsp], r14
	xor	ebx, ebx
	mov	r14, r15
	xor	r15d, r15d
	mov	rax, r14
	mov	rdx, r15
	add	rax, rcx
	lea	rcx, 0[r13+r12]
	mov	r13, QWORD PTR 72[rsp]
	adc	rdx, rbx
	mov	rsi, rax
	mov	rax, QWORD PTR 168[rsp]
	xor	ebx, ebx
	mov	rdi, rdx
	add	rsi, r11
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	QWORD PTR 88[rsp], rsi
	mov	r12, rdx
	mov	rdx, QWORD PTR 280[rsp]
	add	r11, rdi
	mov	QWORD PTR -40[rsp], r11
	adc	r12, rbx
	xor	r9d, r9d
	mulx	r11, r10, r13
	mov	rdx, r13
	mov	QWORD PTR -32[rsp], r12
	mulx	rsi, rbx, QWORD PTR 232[rsp]
	mulx	r15, r14, QWORD PTR 248[rsp]
	mov	QWORD PTR 152[rsp], r10
	mov	QWORD PTR 160[rsp], r11
	mulx	r11, r10, QWORD PTR 264[rsp]
	mov	QWORD PTR 72[rsp], rbx
	mulx	rbx, rcx, QWORD PTR 216[rsp]
	mov	QWORD PTR 80[rsp], rsi
	mulx	rdi, rsi, QWORD PTR 200[rsp]
	mov	QWORD PTR 136[rsp], r10
	mov	QWORD PTR 144[rsp], r11
	mov	r8, rcx
	xor	r11d, r11d
	mulx	r13, r12, QWORD PTR 184[rsp]
	mov	rax, QWORD PTR 72[rsp]
	mov	rdx, QWORD PTR 80[rsp]
	mov	rcx, rbx
	mov	r10, r13
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, rax
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	rax, rdx
	xor	ebx, ebx
	mov	rcx, r14
	add	rsi, r9
	mov	r14, r15
	adc	rdi, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdx
	mov	rax, QWORD PTR 136[rsp]
	xor	edx, edx
	add	rcx, rdi
	adc	rbx, rdx
	xor	r15d, r15d
	xor	edx, edx
	mov	QWORD PTR 72[rsp], rcx
	add	rax, r14
	mov	r14, rbx
	mov	rbx, QWORD PTR 144[rsp]
	adc	rdx, r15
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 152[rsp]
	mov	rcx, rbx
	adc	r15, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR -56[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	mov	QWORD PTR 136[rsp], rax
	adc	rdx, rbx
	mov	rax, r12
	xor	ebx, ebx
	mov	r12, rcx
	mov	QWORD PTR 144[rsp], rdx
	mov	r13, rbx
	xor	edx, edx
	add	r12, rax
	mov	rcx, QWORD PTR 120[rsp]
	adc	r13, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	rax, r13
	add	rax, r10
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rdx, rbx
	mov	QWORD PTR -56[rsp], rax
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	rcx, QWORD PTR -8[rsp]
	adc	r10, rbx
	xor	r11d, r11d
	xor	ebx, ebx
	mov	QWORD PTR 104[rsp], r9
	mov	rax, r10
	mov	rdx, r11
	add	rax, rcx
	mov	rcx, QWORD PTR -24[rsp]
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, rsi
	adc	r9, rbx
	xor	esi, esi
	xor	ebx, ebx
	mov	QWORD PTR -8[rsp], r8
	mov	rax, r9
	mov	rdx, rsi
	mov	r8, QWORD PTR 136[rsp]
	mov	r9, QWORD PTR 144[rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR 72[rsp]
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 88[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	mov	rcx, r14
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 72[rsp], rsi
	add	rax, rdi
	mov	r14, rax
	adc	rdx, rbx
	xor	ebx, ebx
	add	r14, rcx
	mov	r15, rdx
	mov	QWORD PTR 88[rsp], r14
	mov	r14, QWORD PTR -40[rsp]
	adc	r15, rbx
	xor	ebx, ebx
	mov	rcx, r15
	xor	edx, edx
	mov	r15, QWORD PTR -32[rsp]
	mov	rax, r14
	add	rax, rcx
	mov	rcx, QWORD PTR 176[rsp]
	adc	rdx, rbx
	mov	r10, rax
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, r8
	lea	rax, [r15+rcx]
	mov	r8, r12
	adc	r11, rbx
	xor	esi, esi
	xor	edx, edx
	mov	QWORD PTR -24[rsp], r10
	mov	rbx, rsi
	mov	rsi, QWORD PTR 160[rsp]
	mov	rcx, r11
	add	rcx, rax
	lea	rax, [rsi+r9]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rax
	adc	rbx, rdx
	mov	QWORD PTR 168[rsp], rcx
	xor	r15d, r15d
	xor	r9d, r9d
	movabs	rdx, 620258357900100
	mov	QWORD PTR 176[rsp], rbx
	mulx	rdx, rax, r12
	mov	r13, rdx
	mov	QWORD PTR -40[rsp], rax
	movabs	rdx, 7853257225132122198
	mulx	r12, r11, r12
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r8
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mulx	rdx, rax, r8
	mov	QWORD PTR 152[rsp], r11
	mov	QWORD PTR 160[rsp], r12
	xor	r12d, r12d
	mov	r14, rax
	mov	rax, rdx
	mov	r10, rdx
	mov	rdx, r12
	add	rax, r14
	adc	rdx, r15
	mov	QWORD PTR 136[rsp], rax
	mov	QWORD PTR 144[rsp], rdx
	mov	rax, rdx
	xor	edx, edx
	add	rax, QWORD PTR 136[rsp]
	mov	QWORD PTR 120[rsp], rax
	adc	rdx, QWORD PTR 144[rsp]
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 128[rsp], rdx
	xor	edx, edx
	add	rax, r10
	adc	rdx, r12
	mov	r12, QWORD PTR 128[rsp]
	mov	r11, r12
	xor	r12d, r12d
	add	r11, rax
	mov	rax, rcx
	mov	rcx, rbx
	adc	r12, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rsi
	mov	rsi, r12
	adc	rdx, rdi
	xor	edi, edi
	mov	QWORD PTR -72[rsp], r11
	add	rsi, rax
	mov	rax, QWORD PTR 152[rsp]
	mov	QWORD PTR -64[rsp], r12
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	r12d, r12d
	mov	rbx, r12
	add	r11, rdi
	mov	r12, rdx
	adc	r12, rbx
	mov	rbx, QWORD PTR 160[rsp]
	mov	QWORD PTR 152[rsp], r11
	mov	rcx, rbx
	xor	ebx, ebx
	mov	rax, rcx
	mov	rcx, QWORD PTR -40[rsp]
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, r12
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rcx
	mov	rcx, QWORD PTR 136[rsp]
	adc	r12, rbx
	add	r8, r14
	adc	r9, r15
	xor	r10d, r10d
	xor	ebx, ebx
	mov	rax, r9
	mov	rdx, r10
	add	rax, rcx
	mov	rcx, QWORD PTR -56[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR -40[rsp], rax
	mov	rax, rdx
	xor	edx, edx
	mov	rcx, rax
	mov	rax, QWORD PTR 104[rsp]
	mov	rbx, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 120[rsp]
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	rcx, QWORD PTR -8[rsp]
	adc	r10, rbx
	mov	QWORD PTR 120[rsp], r9
	xor	ebx, ebx
	mov	r9, r10
	xor	r10d, r10d
	mov	rax, r9
	mov	rdx, r10
	add	rax, rcx
	mov	rcx, QWORD PTR -72[rsp]
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, rcx
	mov	rcx, QWORD PTR 72[rsp]
	adc	r9, rbx
	mov	QWORD PTR 104[rsp], r8
	xor	ebx, ebx
	mov	r8, r9
	xor	r9d, r9d
	mov	rax, r8
	mov	rdx, r9
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rdi, rdx
	add	rsi, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	rdi, rbx
	mov	QWORD PTR 72[rsp], rsi
	xor	ebx, ebx
	mov	rsi, rdi
	xor	edi, edi
	mov	rax, rsi
	mov	rdx, rdi
	add	rax, rcx
	mov	rcx, QWORD PTR 152[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR -24[rsp]
	add	r14, rcx
	mov	r15, rdx
	adc	r15, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 88[rsp], r14
	add	rax, r15
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r11
	adc	rdx, rbx
	mov	QWORD PTR -8[rsp], rax
	mov	rax, QWORD PTR 168[rsp]
	xor	esi, esi
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	lea	rcx, 0[r13+r12]
	adc	rdx, rsi
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rcx
	adc	r12, rbx
	mov	QWORD PTR -24[rsp], r11
	xor	r9d, r9d
	mov	QWORD PTR -16[rsp], r12
	mov	rcx, QWORD PTR 56[rsp]
	mov	rdx, QWORD PTR 280[rsp]
	mulx	r11, r10, rcx
	mov	rdx, rcx
	mulx	rsi, rbx, QWORD PTR 232[rsp]
	mulx	r13, r12, QWORD PTR 184[rsp]
	mulx	r15, r14, QWORD PTR 248[rsp]
	mov	QWORD PTR 152[rsp], r10
	mov	QWORD PTR 160[rsp], r11
	mulx	r11, r10, QWORD PTR 264[rsp]
	mov	QWORD PTR 56[rsp], rbx
	mov	rax, QWORD PTR 56[rsp]
	mulx	rbx, rcx, QWORD PTR 216[rsp]
	mov	QWORD PTR 64[rsp], rsi
	mulx	rdi, rsi, QWORD PTR 200[rsp]
	mov	rdx, QWORD PTR 64[rsp]
	mov	QWORD PTR 136[rsp], r10
	mov	r10, r13
	mov	QWORD PTR 144[rsp], r11
	mov	r8, rcx
	xor	r11d, r11d
	mov	rcx, rbx
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, rax
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	rax, rdx
	xor	ebx, ebx
	mov	rcx, r14
	add	rsi, r9
	mov	r14, r15
	adc	rdi, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdx
	mov	rax, QWORD PTR 136[rsp]
	xor	edx, edx
	add	rcx, rdi
	adc	rbx, rdx
	xor	r15d, r15d
	xor	edx, edx
	mov	QWORD PTR 56[rsp], rcx
	add	rax, r14
	mov	r14, rbx
	mov	rbx, QWORD PTR 144[rsp]
	adc	rdx, r15
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 152[rsp]
	mov	rcx, rbx
	adc	r15, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR -40[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	adc	rdx, rbx
	mov	QWORD PTR 136[rsp], rax
	xor	ebx, ebx
	mov	rax, r12
	mov	r12, rcx
	mov	QWORD PTR 144[rsp], rdx
	mov	r13, rbx
	xor	edx, edx
	add	r12, rax
	mov	rcx, QWORD PTR 120[rsp]
	adc	r13, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	rax, r13
	add	rax, r10
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rdx, rbx
	mov	QWORD PTR -40[rsp], rax
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	QWORD PTR 104[rsp], r9
	adc	r10, rbx
	mov	rcx, QWORD PTR 72[rsp]
	xor	r11d, r11d
	mov	rax, r10
	xor	ebx, ebx
	mov	rdx, r11
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rdi, rdx
	add	rsi, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	rdi, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	mov	QWORD PTR 72[rsp], rsi
	mov	rax, rdi
	mov	rdx, r9
	mov	rdi, QWORD PTR -16[rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR 56[rsp]
	adc	rdx, rbx
	mov	r10, rax
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	mov	rcx, QWORD PTR -8[rsp]
	adc	r11, rbx
	xor	ebx, ebx
	mov	QWORD PTR 88[rsp], r10
	mov	rax, r11
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, r14
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	mov	rcx, QWORD PTR 176[rsp]
	adc	r15, rbx
	xor	esi, esi
	mov	QWORD PTR 56[rsp], r14
	xor	edx, edx
	mov	rbx, rsi
	mov	rsi, QWORD PTR -24[rsp]
	mov	r14, QWORD PTR 136[rsp]
	mov	rax, rsi
	add	rax, r15
	mov	r15, QWORD PTR 144[rsp]
	adc	rdx, rbx
	mov	r8, rax
	lea	rax, [rdi+rcx]
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, r14
	adc	r9, rbx
	xor	esi, esi
	xor	edx, edx
	mov	QWORD PTR -8[rsp], r8
	mov	rbx, rsi
	mov	rsi, QWORD PTR 160[rsp]
	mov	rcx, r9
	mov	r8, r12
	add	rcx, rax
	lea	rax, [rsi+r15]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rax
	adc	rbx, rdx
	mov	QWORD PTR 168[rsp], rcx
	xor	r15d, r15d
	xor	r9d, r9d
	movabs	rdx, 620258357900100
	mov	QWORD PTR 176[rsp], rbx
	mulx	rdx, rax, r12
	mov	r13, rdx
	mov	QWORD PTR -24[rsp], rax
	movabs	rdx, 7853257225132122198
	mulx	r12, r11, r12
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r8
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mulx	rdx, rax, r8
	mov	QWORD PTR 152[rsp], r11
	xor	r11d, r11d
	mov	QWORD PTR 160[rsp], r12
	mov	r14, rax
	mov	rax, rdx
	mov	r10, rdx
	mov	rdx, r11
	add	rax, r14
	adc	rdx, r15
	mov	QWORD PTR 136[rsp], rax
	mov	QWORD PTR 144[rsp], rdx
	mov	rax, rdx
	xor	edx, edx
	add	rax, QWORD PTR 136[rsp]
	adc	rdx, QWORD PTR 144[rsp]
	mov	QWORD PTR 120[rsp], rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 128[rsp], rdx
	mov	r12, QWORD PTR 128[rsp]
	xor	edx, edx
	add	rax, r10
	adc	rdx, r11
	mov	r11, r12
	xor	r12d, r12d
	add	r11, rax
	mov	rax, rcx
	mov	rcx, rbx
	adc	r12, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rsi
	mov	rsi, r12
	adc	rdx, rdi
	xor	edi, edi
	mov	QWORD PTR -56[rsp], r11
	add	rsi, rax
	mov	rax, QWORD PTR 152[rsp]
	mov	QWORD PTR -48[rsp], r12
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	r12d, r12d
	mov	rbx, r12
	add	r11, rdi
	mov	r12, rdx
	adc	r12, rbx
	mov	rbx, QWORD PTR 160[rsp]
	mov	rcx, rbx
	xor	ebx, ebx
	mov	rax, rcx
	mov	rcx, QWORD PTR -24[rsp]
	mov	rdx, rbx
	xor	ebx, ebx
	mov	QWORD PTR 152[rsp], r11
	add	rax, rcx
	mov	rcx, r12
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rcx
	mov	rcx, QWORD PTR 136[rsp]
	adc	r12, rbx
	add	r8, r14
	adc	r9, r15
	xor	r10d, r10d
	xor	ebx, ebx
	mov	rax, r9
	mov	rdx, r10
	add	rax, rcx
	mov	rcx, QWORD PTR -40[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR -24[rsp], rax
	mov	rax, rdx
	xor	edx, edx
	mov	rcx, rax
	mov	rax, QWORD PTR 104[rsp]
	mov	rbx, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 120[rsp]
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	rcx, QWORD PTR 72[rsp]
	adc	r10, rbx
	mov	QWORD PTR 120[rsp], r9
	xor	ebx, ebx
	mov	r9, r10
	xor	r10d, r10d
	mov	rax, r9
	mov	rdx, r10
	add	rax, rcx
	mov	rcx, QWORD PTR -56[rsp]
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	r9, rbx
	mov	QWORD PTR 104[rsp], r8
	xor	ebx, ebx
	mov	r8, r9
	xor	r9d, r9d
	mov	rax, r8
	mov	rdx, r9
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rdi, rdx
	add	rsi, rcx
	mov	rcx, QWORD PTR 56[rsp]
	adc	rdi, rbx
	mov	QWORD PTR 88[rsp], rsi
	xor	ebx, ebx
	mov	rsi, rdi
	xor	edi, edi
	mov	rax, rsi
	mov	rdx, rdi
	add	rax, rcx
	mov	rcx, QWORD PTR 152[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR -8[rsp]
	add	r14, rcx
	mov	r15, rdx
	adc	r15, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 72[rsp], r14
	add	rax, r15
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r11
	adc	rdx, rbx
	mov	QWORD PTR 56[rsp], rax
	mov	rax, QWORD PTR 168[rsp]
	xor	esi, esi
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	lea	rcx, 0[r13+r12]
	adc	rdx, rsi
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rcx
	mov	rdx, QWORD PTR 280[rsp]
	mov	rcx, QWORD PTR 40[rsp]
	mov	QWORD PTR -8[rsp], r11
	adc	r12, rbx
	xor	r9d, r9d
	mulx	r11, r10, rcx
	mov	rdx, rcx
	mov	QWORD PTR [rsp], r12
	mulx	rsi, rbx, QWORD PTR 232[rsp]
	mulx	r15, r14, QWORD PTR 248[rsp]
	mov	QWORD PTR 152[rsp], r10
	mov	QWORD PTR 160[rsp], r11
	mulx	r11, r10, QWORD PTR 264[rsp]
	mov	QWORD PTR 40[rsp], rbx
	mov	QWORD PTR 136[rsp], r10
	mov	QWORD PTR 144[rsp], r11
	xor	r11d, r11d
	mov	QWORD PTR 48[rsp], rsi
	mov	rax, QWORD PTR 40[rsp]
	mulx	r13, r12, QWORD PTR 184[rsp]
	mulx	rbx, rcx, QWORD PTR 216[rsp]
	mulx	rdi, rsi, QWORD PTR 200[rsp]
	mov	rdx, QWORD PTR 48[rsp]
	mov	r10, r13
	mov	r8, rcx
	mov	rcx, rbx
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, rax
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	rax, rdx
	xor	ebx, ebx
	mov	rcx, r14
	add	rsi, r9
	mov	r14, r15
	adc	rdi, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdx
	mov	rax, QWORD PTR 136[rsp]
	xor	edx, edx
	add	rcx, rdi
	adc	rbx, rdx
	xor	r15d, r15d
	xor	edx, edx
	mov	QWORD PTR 40[rsp], rcx
	add	rax, r14
	mov	r14, rbx
	mov	rbx, QWORD PTR 144[rsp]
	adc	rdx, r15
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 152[rsp]
	mov	rcx, rbx
	adc	r15, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR -24[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	mov	QWORD PTR 136[rsp], rax
	adc	rdx, rbx
	mov	rax, r12
	xor	ebx, ebx
	mov	r12, rcx
	mov	QWORD PTR 144[rsp], rdx
	mov	r13, rbx
	xor	edx, edx
	add	r12, rax
	mov	rcx, QWORD PTR 120[rsp]
	adc	r13, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	rax, r13
	add	rax, r10
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rdx, rbx
	mov	QWORD PTR -24[rsp], rax
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	r10, rbx
	xor	r11d, r11d
	xor	ebx, ebx
	mov	QWORD PTR -40[rsp], r9
	mov	rax, r10
	mov	rdx, r11
	mov	QWORD PTR -32[rsp], r10
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rdi, rdx
	add	rsi, rcx
	mov	rcx, QWORD PTR 72[rsp]
	adc	rdi, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	mov	QWORD PTR 88[rsp], rsi
	mov	rax, rdi
	mov	rdx, r9
	mov	rdi, QWORD PTR [rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR 40[rsp]
	adc	rdx, rbx
	mov	r10, rax
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	mov	rcx, QWORD PTR 56[rsp]
	adc	r11, rbx
	xor	ebx, ebx
	mov	QWORD PTR 72[rsp], r10
	mov	rax, r11
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, r14
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	mov	rcx, QWORD PTR 176[rsp]
	adc	r15, rbx
	xor	esi, esi
	mov	QWORD PTR 56[rsp], r14
	xor	edx, edx
	mov	rbx, rsi
	mov	rsi, QWORD PTR -8[rsp]
	mov	r14, QWORD PTR 136[rsp]
	mov	rax, rsi
	add	rax, r15
	mov	r15, QWORD PTR 144[rsp]
	adc	rdx, rbx
	mov	r8, rax
	lea	rax, [rdi+rcx]
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, r14
	mov	r14, r12
	adc	r9, rbx
	xor	esi, esi
	mov	QWORD PTR 40[rsp], r8
	xor	edx, edx
	mov	rbx, rsi
	mov	rsi, QWORD PTR 160[rsp]
	mov	rcx, r9
	add	rcx, rax
	lea	rax, [rsi+r15]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rax
	adc	rbx, rdx
	mov	QWORD PTR 168[rsp], rcx
	xor	r13d, r13d
	xor	r15d, r15d
	movabs	rdx, 620258357900100
	mov	QWORD PTR 176[rsp], rbx
	mulx	r12, r11, r12
	movabs	rdx, 7853257225132122198
	mov	QWORD PTR 152[rsp], r11
	mov	QWORD PTR 160[rsp], r12
	mulx	r12, r11, r14
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r14
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r14
	mov	rdx, -1
	mulx	rdx, rax, r14
	mov	QWORD PTR 136[rsp], r11
	mov	r11, r13
	xor	r13d, r13d
	mov	r9, r11
	mov	QWORD PTR 144[rsp], r12
	mov	r8, rdx
	mov	r10, rdx
	mov	r12, rax
	add	r8, rax
	adc	r9, r13
	mov	rdx, r9
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	mov	QWORD PTR 120[rsp], rax
	adc	rdx, r9
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 128[rsp], rdx
	xor	edx, edx
	add	rax, r10
	adc	rdx, r11
	mov	r11, QWORD PTR 128[rsp]
	mov	r10, r11
	xor	r11d, r11d
	add	r10, rax
	mov	rax, rcx
	mov	rcx, rbx
	adc	r11, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rsi
	mov	rsi, QWORD PTR 136[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r11
	adc	rdx, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	mov	rcx, QWORD PTR 152[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, rdx
	mov	QWORD PTR 104[rsp], rsi
	mov	rsi, QWORD PTR 144[rsp]
	adc	rdi, rbx
	mov	QWORD PTR 112[rsp], rdi
	mov	rbx, rsi
	xor	esi, esi
	mov	rdi, rsi
	mov	rsi, rbx
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, rdi
	mov	rdi, QWORD PTR 112[rsp]
	mov	rsi, rdi
	xor	edi, edi
	add	rcx, rsi
	mov	rsi, QWORD PTR -24[rsp]
	adc	rbx, rdi
	add	r14, r12
	mov	QWORD PTR 136[rsp], rcx
	adc	r15, r13
	xor	r14d, r14d
	mov	QWORD PTR 144[rsp], rbx
	xor	edi, edi
	mov	rcx, r15
	mov	rbx, r14
	add	rcx, r8
	adc	rbx, rdi
	mov	r13, rcx
	xor	edi, edi
	mov	r14, rbx
	add	r13, rsi
	mov	rsi, QWORD PTR -40[rsp]
	adc	r14, rdi
	mov	QWORD PTR -8[rsp], r13
	xor	edi, edi
	xor	r13d, r13d
	mov	rcx, r14
	mov	rbx, r13
	add	rcx, rsi
	mov	rsi, QWORD PTR 120[rsp]
	adc	rbx, rdi
	xor	edi, edi
	add	rcx, rsi
	mov	rsi, QWORD PTR 88[rsp]
	adc	rbx, rdi
	mov	QWORD PTR 120[rsp], rcx
	xor	r13d, r13d
	xor	edi, edi
	mov	rcx, rbx
	mov	rbx, r13
	add	rcx, rsi
	mov	rsi, QWORD PTR 72[rsp]
	adc	rbx, rdi
	mov	r11, rcx
	xor	edi, edi
	mov	r12, rbx
	add	r11, r10
	adc	r12, rdi
	xor	r10d, r10d
	xor	edi, edi
	mov	QWORD PTR 88[rsp], r11
	mov	rcx, r12
	mov	rbx, r10
	mov	r10, QWORD PTR 136[rsp]
	add	rcx, rsi
	adc	rbx, rdi
	xor	edi, edi
	add	rcx, rax
	adc	rbx, rdi
	mov	QWORD PTR 72[rsp], rcx
	mov	rcx, QWORD PTR 56[rsp]
	xor	edx, edx
	mov	rax, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 40[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 104[rsp], rsi
	add	rax, rdi
	mov	r11, QWORD PTR 144[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 168[rsp]
	add	r14, r10
	mov	r15, rdx
	adc	r15, rbx
	xor	esi, esi
	xor	edx, edx
	mov	QWORD PTR 56[rsp], r14
	add	rax, r15
	adc	rdx, rsi
	mov	rsi, QWORD PTR 160[rsp]
	mov	r10, rax
	xor	ebx, ebx
	lea	rcx, [rsi+r11]
	mov	r11, rdx
	mov	rdx, QWORD PTR 280[rsp]
	add	r10, rcx
	adc	r11, rbx
	mov	rbx, QWORD PTR 24[rsp]
	mov	QWORD PTR 40[rsp], r10
	mov	QWORD PTR 48[rsp], r11
	xor	r11d, r11d
	mulx	r9, r8, rbx
	mov	rdx, rbx
	mulx	rsi, rbx, QWORD PTR 232[rsp]
	mulx	r13, r12, QWORD PTR 184[rsp]
	mulx	r15, r14, QWORD PTR 248[rsp]
	mov	QWORD PTR 152[rsp], r8
	mov	QWORD PTR 24[rsp], rbx
	mov	r10, r13
	mov	rax, QWORD PTR 24[rsp]
	mulx	rbx, rcx, QWORD PTR 216[rsp]
	mov	QWORD PTR 32[rsp], rsi
	mulx	rdi, rsi, QWORD PTR 200[rsp]
	mov	QWORD PTR 160[rsp], r9
	mulx	r9, r8, QWORD PTR 264[rsp]
	mov	rdx, QWORD PTR 32[rsp]
	mov	QWORD PTR 136[rsp], r8
	mov	r8, rcx
	mov	rcx, rbx
	mov	QWORD PTR 144[rsp], r9
	xor	r9d, r9d
	add	r10, rsi
	mov	rsi, rdi
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	adc	r9, rdi
	mov	rsi, rax
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	mov	rax, rdx
	xor	ebx, ebx
	mov	rcx, r14
	add	rsi, r9
	mov	r14, r15
	adc	rdi, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdx
	mov	rax, QWORD PTR 136[rsp]
	xor	edx, edx
	add	rcx, rdi
	adc	rbx, rdx
	xor	r15d, r15d
	xor	edx, edx
	mov	QWORD PTR 24[rsp], rcx
	add	rax, r14
	mov	r14, rbx
	adc	rdx, r15
	xor	r15d, r15d
	add	r14, rax
	adc	r15, rdx
	mov	rdx, QWORD PTR 144[rsp]
	mov	rax, rdx
	xor	edx, edx
	mov	rcx, rax
	mov	rax, QWORD PTR 152[rsp]
	mov	rbx, rdx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	mov	QWORD PTR 136[rsp], rax
	mov	rcx, QWORD PTR -8[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	rax, r12
	mov	QWORD PTR 144[rsp], rdx
	mov	r13, rbx
	xor	edx, edx
	mov	r12, rcx
	mov	rcx, QWORD PTR 120[rsp]
	add	r12, rax
	adc	r13, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	rax, r13
	add	rax, r10
	adc	rdx, rbx
	mov	r10, rax
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	r11, rbx
	mov	QWORD PTR -8[rsp], r10
	xor	ebx, ebx
	mov	r10, r11
	mov	QWORD PTR [rsp], r11
	xor	r11d, r11d
	mov	rax, r10
	mov	rdx, r11
	add	rax, r8
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	rcx, QWORD PTR 72[rsp]
	adc	r10, rbx
	mov	QWORD PTR 88[rsp], r9
	xor	r9d, r9d
	xor	ebx, ebx
	mov	rax, r10
	mov	rdx, r9
	add	rax, rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rsi
	adc	rdx, rbx
	mov	QWORD PTR 72[rsp], rax
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 24[rsp]
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rdi, rdx
	add	rsi, rcx
	mov	rcx, QWORD PTR 56[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	mov	QWORD PTR 24[rsp], rsi
	mov	rax, rdi
	mov	rdx, rbx
	xor	ebx, ebx
	mov	QWORD PTR 32[rsp], rdi
	add	rax, rcx
	mov	rcx, r14
	mov	rdi, QWORD PTR 48[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	adc	r15, rbx
	xor	esi, esi
	mov	QWORD PTR 56[rsp], r14
	xor	edx, edx
	mov	rbx, rsi
	mov	rsi, QWORD PTR 40[rsp]
	mov	r14, QWORD PTR 136[rsp]
	mov	rax, rsi
	mov	rsi, QWORD PTR 176[rsp]
	mov	QWORD PTR 176[rsp], 0
	add	rax, r15
	mov	r15, QWORD PTR 144[rsp]
	adc	rdx, rbx
	mov	r8, rax
	lea	rax, [rdi+rsi]
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, r14
	mov	rsi, QWORD PTR 160[rsp]
	adc	r9, rbx
	xor	edx, edx
	xor	ebx, ebx
	mov	QWORD PTR 40[rsp], r8
	mov	rcx, r9
	mov	r8, r12
	mov	QWORD PTR 48[rsp], r9
	add	rcx, rax
	lea	rax, [rsi+r15]
	adc	rbx, rdx
	xor	edx, edx
	mov	rsi, rbx
	mov	rbx, rcx
	add	rbx, rax
	adc	rsi, rdx
	mov	QWORD PTR 152[rsp], rbx
	xor	r11d, r11d
	xor	r9d, r9d
	movabs	rdx, 620258357900100
	mov	QWORD PTR 160[rsp], rsi
	mulx	rdx, rax, r12
	mov	QWORD PTR -16[rsp], rdx
	mov	r15, rdx
	movabs	rdx, 7853257225132122198
	mulx	r13, r12, r12
	mov	QWORD PTR -24[rsp], rax
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r8
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mulx	rdx, rax, r8
	mov	QWORD PTR 168[rsp], rax
	mov	rax, QWORD PTR 168[rsp]
	mov	r10, rdx
	mov	rdx, QWORD PTR 176[rsp]
	add	rax, r10
	adc	rdx, r11
	mov	QWORD PTR 136[rsp], rax
	mov	QWORD PTR 144[rsp], rdx
	mov	rax, rdx
	xor	edx, edx
	add	rax, QWORD PTR 136[rsp]
	mov	QWORD PTR 120[rsp], rax
	adc	rdx, QWORD PTR 144[rsp]
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 128[rsp], rdx
	xor	edx, edx
	add	rax, r10
	adc	rdx, r11
	mov	r11, QWORD PTR 128[rsp]
	mov	r10, r11
	xor	r11d, r11d
	add	r10, rax
	mov	rax, rcx
	mov	rcx, rbx
	adc	r11, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rsi
	mov	rsi, r11
	adc	rdx, rdi
	xor	edi, edi
	add	rsi, rax
	mov	rax, r12
	mov	r12, r13
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rdi
	mov	rcx, QWORD PTR -24[rsp]
	adc	rdx, rbx
	mov	QWORD PTR 104[rsp], rax
	xor	r13d, r13d
	mov	rax, r12
	mov	QWORD PTR 112[rsp], rdx
	mov	r14, QWORD PTR 112[rsp]
	xor	ebx, ebx
	mov	rdx, r13
	add	rax, rcx
	mov	r13, r14
	adc	rdx, rbx
	xor	r14d, r14d
	mov	rcx, r13
	mov	r13, rax
	mov	rax, QWORD PTR 168[rsp]
	mov	rbx, r14
	add	r13, rcx
	mov	r14, rdx
	mov	rdx, QWORD PTR 176[rsp]
	mov	rcx, QWORD PTR 136[rsp]
	adc	r14, rbx
	add	rax, r8
	adc	rdx, r9
	xor	ebx, ebx
	mov	rax, rdx
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR -8[rsp]
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 88[rsp]
	add	r8, rcx
	mov	r9, rdx
	mov	rcx, QWORD PTR 120[rsp]
	adc	r9, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 168[rsp], r8
	add	rax, r9
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 136[rsp], rax
	mov	rax, QWORD PTR 72[rsp]
	xor	ebx, ebx
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 24[rsp]
	add	r11, r10
	mov	r12, rdx
	adc	r12, rbx
	xor	r10d, r10d
	xor	edx, edx
	mov	QWORD PTR 120[rsp], r11
	add	rax, r12
	adc	rdx, r10
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 56[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rdi, rbx
	xor	r11d, r11d
	xor	edx, edx
	mov	QWORD PTR 88[rsp], rsi
	add	rax, rdi
	mov	QWORD PTR 96[rsp], rdi
	adc	rdx, r11
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 104[rsp], rax
	mov	rax, QWORD PTR 40[rsp]
	xor	esi, esi
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rsi
	xor	ebx, ebx
	add	rax, r13
	adc	rdx, rbx
	mov	QWORD PTR 72[rsp], rax
	mov	rax, QWORD PTR 152[rsp]
	xor	ebx, ebx
	mov	rcx, rdx
	mov	QWORD PTR 80[rsp], rdx
	xor	edx, edx
	add	rax, rcx
	lea	rcx, [r15+r14]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	adc	r15, rbx
	mov	QWORD PTR 56[rsp], r14
	xor	r9d, r9d
	xor	r11d, r11d
	mov	QWORD PTR 64[rsp], r15
	mov	rdx, QWORD PTR 280[rsp]
	mov	rsi, QWORD PTR 16[rsp]
	mulx	r14, r13, rsi
	mov	rdx, rsi
	mulx	rsi, rbx, QWORD PTR 232[rsp]
	mov	QWORD PTR 280[rsp], r13
	mov	QWORD PTR 288[rsp], r14
	mulx	r14, r13, QWORD PTR 264[rsp]
	mov	QWORD PTR 256[rsp], rsi
	mulx	rdi, rsi, QWORD PTR 200[rsp]
	mov	QWORD PTR 264[rsp], r13
	mulx	r13, r12, QWORD PTR 184[rsp]
	mov	QWORD PTR 272[rsp], r14
	mulx	r15, r14, QWORD PTR 248[rsp]
	mov	QWORD PTR 248[rsp], rbx
	mov	rax, QWORD PTR 248[rsp]
	mulx	rbx, rcx, QWORD PTR 216[rsp]
	mov	rdx, QWORD PTR 256[rsp]
	mov	r10, r13
	add	r10, rsi
	mov	rsi, rdi
	mov	r8, rcx
	adc	r11, r9
	xor	edi, edi
	xor	r9d, r9d
	add	r8, rsi
	mov	rcx, rbx
	mov	rsi, rax
	mov	rax, rdx
	adc	r9, rdi
	xor	edi, edi
	add	r8, r11
	adc	r9, rdi
	xor	edi, edi
	mov	rbx, rdi
	xor	edi, edi
	add	rsi, rcx
	mov	rcx, r14
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, r9
	mov	r14, r15
	adc	rdi, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdx
	mov	rax, QWORD PTR 264[rsp]
	xor	edx, edx
	add	rcx, rdi
	adc	rbx, rdx
	xor	r15d, r15d
	xor	edx, edx
	mov	QWORD PTR 248[rsp], rcx
	add	rax, r14
	mov	r14, rbx
	mov	rbx, QWORD PTR 272[rsp]
	adc	rdx, r15
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 280[rsp]
	mov	rcx, rbx
	adc	r15, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 168[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r15
	adc	rdx, rbx
	mov	QWORD PTR 264[rsp], rax
	xor	ebx, ebx
	mov	rax, r12
	mov	r12, rcx
	mov	QWORD PTR 272[rsp], rdx
	mov	r13, rbx
	xor	edx, edx
	add	r12, rax
	mov	rcx, QWORD PTR 136[rsp]
	adc	r13, rdx
	xor	ebx, ebx
	mov	rax, r13
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, r10
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 120[rsp]
	adc	rdx, rbx
	mov	QWORD PTR 232[rsp], rax
	xor	r11d, r11d
	xor	ebx, ebx
	mov	rax, rdx
	mov	rdx, r11
	add	rax, r8
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	QWORD PTR 216[rsp], r9
	adc	r10, rbx
	mov	rcx, QWORD PTR 88[rsp]
	xor	r9d, r9d
	mov	rax, r10
	xor	ebx, ebx
	mov	rdx, r9
	mov	r8, QWORD PTR 56[rsp]
	add	rax, rcx
	mov	rcx, rsi
	mov	r10, QWORD PTR 264[rsp]
	mov	r9, QWORD PTR 64[rsp]
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	r11, QWORD PTR 272[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	mov	rcx, QWORD PTR 104[rsp]
	mov	QWORD PTR 280[rsp], r12
	adc	rdi, rbx
	mov	QWORD PTR 200[rsp], rsi
	xor	ebx, ebx
	mov	rsi, rdi
	xor	edi, edi
	mov	rax, rsi
	mov	rdx, rdi
	add	rax, rcx
	mov	rcx, QWORD PTR 248[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 72[rsp]
	adc	rdx, rbx
	mov	QWORD PTR 248[rsp], rax
	xor	esi, esi
	xor	ebx, ebx
	mov	rax, rdx
	mov	rdx, rsi
	mov	rsi, QWORD PTR 288[rsp]
	mov	QWORD PTR 288[rsp], 0
	add	rax, rcx
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r14
	adc	rdx, rbx
	mov	QWORD PTR 184[rsp], rax
	mov	rax, r8
	xor	ebx, ebx
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 160[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, r10
	lea	rax, [r9+rcx]
	adc	r15, rbx
	mov	QWORD PTR 168[rsp], r14
	xor	edx, edx
	mov	r14, r15
	xor	r15d, r15d
	mov	rcx, r14
	mov	rbx, r15
	add	rcx, rax
	lea	rax, [rsi+r11]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rax
	mov	QWORD PTR 264[rsp], rcx
	mov	rcx, QWORD PTR 280[rsp]
	adc	rbx, rdx
	movabs	rdx, 620258357900100
	mov	QWORD PTR 272[rsp], rbx
	xor	r9d, r9d
	xor	r15d, r15d
	mulx	r12, r11, rcx
	movabs	rdx, 7853257225132122198
	mov	QWORD PTR 152[rsp], r11
	mov	QWORD PTR 88[rsp], r12
	mulx	r12, r11, rcx
	movabs	rdx, 8918917783347572387
	mov	QWORD PTR 144[rsp], r12
	mulx	r13, r12, rcx
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, rcx
	mov	rdx, -1
	mov	QWORD PTR 136[rsp], r11
	mov	r11, r9
	mulx	rbx, rcx, QWORD PTR 280[rsp]
	mov	r14, rcx
	mov	rdx, rbx
	mov	rcx, r9
	mov	r10, rbx
	add	rdx, r14
	adc	rcx, r15
	mov	r8, rdx
	mov	rdx, rcx
	mov	r9, rcx
	xor	ecx, ecx
	add	rdx, r8
	adc	rcx, r9
	mov	rax, rdx
	xor	ebx, ebx
	mov	rdx, rcx
	mov	rcx, rsi
	mov	rsi, QWORD PTR 136[rsp]
	mov	QWORD PTR 120[rsp], rax
	add	rcx, r10
	mov	r10, rdx
	mov	rdx, rdi
	adc	rbx, r11
	xor	r11d, r11d
	add	r10, rcx
	adc	r11, rbx
	xor	ecx, ecx
	xor	ebx, ebx
	mov	rdi, rcx
	mov	rcx, r12
	mov	r12, r13
	add	rcx, rdx
	adc	rbx, rdi
	xor	edx, edx
	mov	rdi, rdx
	mov	rdx, rcx
	mov	rcx, rbx
	add	rdx, r11
	adc	rcx, rdi
	mov	rax, rdx
	xor	r13d, r13d
	xor	ebx, ebx
	mov	rdx, rcx
	mov	rcx, rsi
	mov	rdi, QWORD PTR 144[rsp]
	mov	QWORD PTR 136[rsp], rax
	add	rcx, r12
	mov	r12, rdx
	adc	rbx, r13
	xor	r13d, r13d
	add	r12, rcx
	mov	rdx, rdi
	adc	r13, rbx
	xor	ecx, ecx
	xor	ebx, ebx
	mov	rdi, rcx
	mov	rcx, QWORD PTR 152[rsp]
	add	rcx, rdx
	adc	rbx, rdi
	mov	rdx, rcx
	xor	edi, edi
	mov	rcx, rbx
	add	rdx, r13
	adc	rcx, rdi
	mov	QWORD PTR 152[rsp], rdx
	mov	QWORD PTR 160[rsp], rcx
	mov	rax, QWORD PTR 280[rsp]
	mov	rdx, QWORD PTR 288[rsp]
	mov	r13, QWORD PTR 160[rsp]
	add	rax, r14
	mov	r14, QWORD PTR 136[rsp]
	adc	rdx, r15
	xor	ecx, ecx
	xor	ebx, ebx
	mov	rax, rdx
	mov	rdx, rcx
	mov	rcx, QWORD PTR 232[rsp]
	add	rax, r8
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 104[rsp], rax
	mov	rax, QWORD PTR 216[rsp]
	xor	ebx, ebx
	mov	rcx, rdx
	mov	QWORD PTR 112[rsp], rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 120[rsp]
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 200[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	mov	rcx, r10
	adc	rdi, rbx
	mov	QWORD PTR 280[rsp], rsi
	xor	edx, edx
	xor	esi, esi
	add	rax, rdi
	mov	QWORD PTR 288[rsp], rdi
	adc	rdx, rsi
	mov	r10, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 248[rsp]
	add	r10, rcx
	mov	r11, rdx
	mov	rsi, QWORD PTR 264[rsp]
	adc	r11, rbx
	xor	ecx, ecx
	xor	edx, edx
	mov	QWORD PTR 216[rsp], r10
	add	rax, r11
	mov	QWORD PTR 224[rsp], r11
	adc	rdx, rcx
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 184[rsp]
	adc	r15, rdx
	xor	r9d, r9d
	xor	edx, edx
	mov	rcx, QWORD PTR 168[rsp]
	add	rax, r15
	adc	rdx, r9
	xor	ebx, ebx
	add	rax, r12
	mov	r12, QWORD PTR 152[rsp]
	adc	rdx, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	mov	QWORD PTR 248[rsp], rax
	add	rcx, rdx
	mov	QWORD PTR 256[rsp], rdx
	mov	rdx, r13
	mov	r13, QWORD PTR 88[rsp]
	adc	rbx, r9
	xor	edi, edi
	add	rcx, r12
	adc	rbx, rdi
	xor	r9d, r9d
	xor	edi, edi
	mov	QWORD PTR 232[rsp], rcx
	add	rsi, rbx
	mov	rcx, QWORD PTR 104[rsp]
	lea	r8, 0[r13+rdx]
	mov	QWORD PTR 240[rsp], rbx
	adc	rdi, r9
	mov	r12, rsi
	xor	r9d, r9d
	mov	rsi, QWORD PTR 280[rsp]
	add	r12, r8
	mov	r13, rdi
	mov	rax, rcx
	adc	r13, r9
	xor	edi, edi
	add	rax, 1
	mov	rdx, rdi
	mov	QWORD PTR 184[rsp], rax
	adc	rdx, -1
	xor	r9d, r9d
	xor	edi, edi
	mov	QWORD PTR 192[rsp], rdx
	neg	edx
	movzx	r8d, dl
	sub	rsi, r8
	sbb	rdi, r9
	mov	r8, rsi
	mov	rsi, r10
	add	r8, 1
	mov	r9, rdi
	adc	r9, -1
	mov	QWORD PTR 168[rsp], r8
	xor	edi, edi
	mov	rdx, r9
	mov	QWORD PTR 176[rsp], r9
	xor	r9d, r9d
	neg	edx
	movzx	r8d, dl
	sub	rsi, r8
	sbb	rdi, r9
	add	rsi, 1
	adc	rdi, -1
	mov	r9, rsi
	mov	rsi, r14
	mov	r10, rdi
	mov	QWORD PTR 152[rsp], r9
	xor	edi, edi
	xor	r9d, r9d
	mov	rdx, r10
	mov	QWORD PTR 160[rsp], r10
	neg	edx
	movzx	r8d, dl
	sub	rsi, r8
	movabs	r8, 161717841442111489
	sbb	rdi, r9
	add	rsi, r8
	mov	r9, -1
	adc	rdi, r9
	mov	rax, rsi
	mov	rsi, QWORD PTR 248[rsp]
	xor	r9d, r9d
	mov	rdx, rdi
	xor	edi, edi
	mov	QWORD PTR 200[rsp], r12
	mov	rbx, QWORD PTR 280[rsp]
	mov	QWORD PTR 144[rsp], rdx
	neg	edx
	mov	r15, QWORD PTR 8[rsp]
	movzx	r8d, dl
	mov	QWORD PTR 208[rsp], r13
	sub	rsi, r8
	mov	QWORD PTR 136[rsp], rax
	movabs	r8, -8918917783347572387
	mov	rax, QWORD PTR 248[rsp]
	sbb	rdi, r9
	add	rsi, r8
	mov	r9, -1
	mov	r8, QWORD PTR 232[rsp]
	adc	rdi, r9
	xor	r11d, r11d
	xor	r9d, r9d
	mov	QWORD PTR 120[rsp], rsi
	mov	rdx, rdi
	mov	QWORD PTR 128[rsp], rdi
	neg	edx
	movzx	r10d, dl
	sub	r8, r10
	sbb	r9, r11
	mov	rsi, r8
	movabs	r8, -7853257225132122198
	add	rsi, r8
	mov	rdi, r9
	mov	r9, -1
	mov	r8, r12
	adc	rdi, r9
	xor	r11d, r11d
	xor	r9d, r9d
	mov	QWORD PTR 104[rsp], rsi
	mov	rdx, rdi
	mov	QWORD PTR 112[rsp], rdi
	mov	rsi, QWORD PTR 104[rsp]
	neg	edx
	movzx	r10d, dl
	mov	rdx, QWORD PTR 272[rsp]
	sub	r8, r10
	movabs	r10, -620258357900100
	sbb	r9, r11
	add	r8, r10
	mov	r11, -1
	adc	r9, r11
	lea	r10, 0[r13+rdx]
	xor	r11d, r11d
	xor	r13d, r13d
	mov	rdx, r9
	mov	QWORD PTR 272[rsp], r9
	neg	edx
	mov	QWORD PTR 264[rsp], r8
	movzx	r12d, dl
	cmp	r10, r12
	mov	r10, QWORD PTR 216[rsp]
	sbb	r11, r13
	mov	r13, QWORD PTR 136[rsp]
	mov	rdx, r11
	mov	rdi, r11
	mov	r11, QWORD PTR 168[rsp]
	not	rdx
	and	rbx, rdi
	and	rcx, rdi
	and	r10, rdi
	and	r11, rdx
	mov	r9, rcx
	and	r13, rdx
	and	rax, rdi
	or	r11, rbx
	mov	rbx, QWORD PTR 152[rsp]
	mov	rcx, QWORD PTR 184[rsp]
	and	rsi, rdx
	and	rbx, rdx
	and	rcx, rdx
	or	r10, rbx
	mov	rbx, r14
	or	r9, rcx
	mov	rcx, QWORD PTR 232[rsp]
	and	rbx, rdi
	vmovq	xmm2, r10
	vmovq	xmm3, r9
	mov	r12, rbx
	mov	rbx, QWORD PTR 120[rsp]
	and	rcx, rdi
	vpinsrq	xmm0, xmm3, r11, 1
	or	r12, r13
	or	rcx, rsi
	and	rdi, QWORD PTR 200[rsp]
	and	rbx, rdx
	vpinsrq	xmm1, xmm2, r12, 1
	and	rdx, QWORD PTR 264[rsp]
	or	rax, rbx
	vinserti128	ymm0, ymm0, xmm1, 0x1
	or	rdi, rdx
	vmovq	xmm4, rax
	vmovdqu	YMMWORD PTR [r15], ymm0
	vpinsrq	xmm0, xmm4, rcx, 1
	mov	QWORD PTR 48[r15], rdi
	vmovdqu	XMMWORD PTR 32[r15], xmm0
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
	.size	fiat_p434_mul_gcc, .-fiat_p434_mul_gcc
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
