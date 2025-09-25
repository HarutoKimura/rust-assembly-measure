	.file	"p384_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p384_square_gcc
	.type	fiat_p384_square_gcc, @function
fiat_p384_square_gcc:
.LFB20:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xor	r11d, r11d
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	xor	r13d, r13d
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 392
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -96[rsp], rdi
	xor	edi, edi
	mov	QWORD PTR 64[rsp], rdi
	mov	rax, QWORD PTR [rsi]
	mov	rdx, QWORD PTR 40[rsi]
	mov	QWORD PTR 176[rsp], r11
	mov	rcx, QWORD PTR 8[rsi]
	mov	r10, QWORD PTR 16[rsi]
	mov	QWORD PTR 352[rsp], 0
	mov	r8, QWORD PTR 24[rsi]
	mov	r15, QWORD PTR 32[rsi]
	mulx	rsi, rbx, rax
	mov	QWORD PTR 376[rsp], rdx
	mov	QWORD PTR 200[rsp], r10
	mov	rdx, r15
	mov	QWORD PTR 184[rsp], r8
	mov	QWORD PTR 360[rsp], r15
	xor	r15d, r15d
	mov	QWORD PTR 264[rsp], rbx
	mov	QWORD PTR 272[rsp], rsi
	mov	QWORD PTR 56[rsp], rsi
	mulx	rsi, rbx, rax
	mov	rdx, r8
	mov	QWORD PTR 152[rsp], rcx
	mov	r14, rsi
	mulx	rdi, rsi, rax
	mov	rdx, r10
	mov	QWORD PTR 280[rsp], rbx
	mulx	r9, r8, rax
	mov	rdx, rcx
	xor	ebx, ebx
	mulx	r11, r10, rax
	mul	rax
	mov	r12, rdi
	mov	QWORD PTR 168[rsp], r9
	mov	QWORD PTR 344[rsp], r10
	mov	rcx, r11
	mov	r10, rdx
	xor	r11d, r11d
	add	r10, QWORD PTR 344[rsp]
	adc	r11, QWORD PTR 352[rsp]
	mov	QWORD PTR 328[rsp], r8
	mov	r8, rcx
	mov	r9, r11
	mov	QWORD PTR 136[rsp], r10
	xor	r10d, r10d
	add	r8, QWORD PTR 328[rsp]
	mov	r11, r10
	mov	r10, r9
	mov	r9, rbx
	mov	QWORD PTR 104[rsp], rcx
	mov	rcx, r10
	mov	QWORD PTR 112[rsp], rbx
	mov	rbx, r11
	mov	rdi, QWORD PTR 176[rsp]
	mov	QWORD PTR 312[rsp], rsi
	mov	rsi, QWORD PTR 168[rsp]
	mov	rdx, -1
	mov	QWORD PTR 336[rsp], 0
	adc	r9, QWORD PTR 336[rsp]
	add	rcx, r8
	mov	r8, rax
	adc	rbx, r9
	xor	r9d, r9d
	add	rsi, QWORD PTR 312[rsp]
	mov	QWORD PTR 320[rsp], 0
	mov	r10, r9
	mov	r9, rbx
	adc	rdi, QWORD PTR 320[rsp]
	mov	QWORD PTR 120[rsp], rcx
	add	r9, rsi
	mov	rcx, r12
	mov	QWORD PTR 24[rsp], r12
	mov	rbx, r13
	mov	rsi, QWORD PTR 280[rsp]
	adc	r10, rdi
	mov	QWORD PTR 88[rsp], r9
	mov	r9, r10
	xor	r10d, r10d
	mov	QWORD PTR 32[rsp], r13
	mov	QWORD PTR 296[rsp], rsi
	mov	r11, r9
	add	rcx, QWORD PTR 296[rsp]
	mov	r12, r10
	mov	QWORD PTR 304[rsp], 0
	adc	rbx, QWORD PTR 304[rsp]
	add	r11, rcx
	mov	rcx, r14
	adc	r12, rbx
	mov	rbx, QWORD PTR 264[rsp]
	mov	QWORD PTR 72[rsp], r11
	mov	r11, r12
	xor	r12d, r12d
	mov	QWORD PTR 40[rsp], r14
	mov	QWORD PTR 280[rsp], rbx
	mov	r13, r11
	mov	rbx, r15
	mov	r14, r12
	mov	QWORD PTR 48[rsp], r15
	mov	QWORD PTR 288[rsp], 0
	add	rcx, QWORD PTR 280[rsp]
	adc	rbx, QWORD PTR 288[rsp]
	add	r13, rcx
	adc	r14, rbx
	sal	rax, 32
	xor	r9d, r9d
	mov	QWORD PTR 248[rsp], r13
	add	rax, r8
	xor	ebx, ebx
	mov	QWORD PTR 256[rsp], r14
	mulx	r11, r10, rax
	xor	edx, edx
	mov	rcx, rax
	mov	r13, rdx
	mov	rdx, -2
	mulx	rdx, rax, rax
	mov	r12, r11
	mov	QWORD PTR 232[rsp], rax
	mov	rax, rcx
	mov	QWORD PTR 240[rsp], rdx
	sal	rax, 32
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	mov	rdx, rbx
	shld	rdx, rcx, 32
	sub	rax, rcx
	mov	rcx, r10
	sbb	rdx, rbx
	mov	QWORD PTR 8[rsp], rax
	xor	esi, esi
	xor	ebx, ebx
	mov	QWORD PTR -8[rsp], rdx
	mov	rax, QWORD PTR 232[rsp]
	mov	rdi, rsi
	mov	rdx, QWORD PTR 240[rsp]
	mov	rsi, r15
	mov	QWORD PTR 232[rsp], r12
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
	mov	r13, QWORD PTR 272[rsp]
	add	r10, rcx
	mov	rcx, QWORD PTR 8[rsp]
	mov	QWORD PTR 216[rsp], r10
	adc	r11, rbx
	mov	r10, QWORD PTR -8[rsp]
	xor	ebx, ebx
	add	rcx, r8
	mov	QWORD PTR 224[rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	mov	r14, QWORD PTR 136[rsp]
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, QWORD PTR 120[rsp]
	adc	r15, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	mov	r8, rcx
	xor	r9d, r9d
	mov	rcx, QWORD PTR 88[rsp]
	add	r8, r15
	mov	rdi, r9
	mov	r9, rbx
	adc	r9, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rax
	mov	rax, r9
	mov	r9, rcx
	adc	rbx, rdi
	xor	edx, edx
	add	r9, rax
	mov	rax, QWORD PTR 72[rsp]
	mov	r10, rbx
	mov	rcx, QWORD PTR 248[rsp]
	adc	r10, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 72[rsp], r9
	add	rax, r12
	mov	QWORD PTR 88[rsp], r8
	adc	rdx, rbx
	xor	r12d, r12d
	add	rax, r10
	mov	r11, rax
	mov	rax, QWORD PTR 216[rsp]
	adc	rdx, r12
	xor	ebx, ebx
	mov	r12, rdx
	xor	edx, edx
	mov	QWORD PTR 8[rsp], r11
	add	rax, rcx
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r12
	mov	r9, rax
	mov	rax, QWORD PTR 256[rsp]
	adc	rdx, rsi
	xor	ebx, ebx
	mov	rsi, QWORD PTR 224[rsp]
	mov	r10, rdx
	xor	edx, edx
	mov	QWORD PTR -8[rsp], r9
	lea	rcx, [rax+r13]
	mov	r13, QWORD PTR 232[rsp]
	lea	rax, [rsi+r13]
	add	rax, rcx
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r10
	adc	rdx, rsi
	mov	QWORD PTR -24[rsp], rax
	xor	r10d, r10d
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, QWORD PTR 152[rsp]
	mov	QWORD PTR 160[rsp], r10
	mulx	rsi, rbx, QWORD PTR 376[rsp]
	mulx	r9, r8, QWORD PTR 184[rsp]
	mulx	r11, r10, QWORD PTR 200[rsp]
	mov	QWORD PTR 272[rsp], 0
	mov	QWORD PTR 256[rsp], 0
	mov	r13, rsi
	xor	esi, esi
	mov	r12, rbx
	xor	ebx, ebx
	mov	QWORD PTR -48[rsp], rsi
	mulx	rdi, rsi, QWORD PTR 360[rsp]
	mulx	rdx, rax, rdx
	mov	QWORD PTR 144[rsp], rbx
	xor	ebx, ebx
	mov	QWORD PTR 128[rsp], rbx
	xor	ebx, ebx
	mov	QWORD PTR 264[rsp], r10
	mov	rcx, rax
	mov	rax, rdx
	add	rcx, QWORD PTR 104[rsp]
	adc	rbx, QWORD PTR 112[rsp]
	xor	edx, edx
	add	rax, QWORD PTR 264[rsp]
	mov	QWORD PTR 120[rsp], r11
	adc	rdx, QWORD PTR 272[rsp]
	xor	r11d, r11d
	add	rax, rbx
	mov	QWORD PTR 248[rsp], r8
	adc	rdx, r11
	mov	r8, QWORD PTR 120[rsp]
	xor	r11d, r11d
	add	r8, QWORD PTR 248[rsp]
	mov	r10, rdx
	mov	QWORD PTR 136[rsp], r9
	mov	r9, QWORD PTR 128[rsp]
	adc	r9, QWORD PTR 256[rsp]
	add	r10, r8
	mov	QWORD PTR -56[rsp], r13
	adc	r11, r9
	mov	QWORD PTR 152[rsp], rdi
	xor	r9d, r9d
	mov	QWORD PTR 232[rsp], rsi
	mov	r8, r11
	mov	rsi, QWORD PTR 136[rsp]
	add	rsi, QWORD PTR 232[rsp]
	mov	rdi, QWORD PTR 144[rsp]
	mov	QWORD PTR 240[rsp], 0
	adc	rdi, QWORD PTR 240[rsp]
	add	r8, rsi
	mov	QWORD PTR -32[rsp], r13
	adc	r9, rdi
	xor	r13d, r13d
	mov	QWORD PTR 216[rsp], r12
	mov	rsi, QWORD PTR 152[rsp]
	mov	r12, r9
	add	rsi, QWORD PTR 216[rsp]
	mov	QWORD PTR 224[rsp], 0
	mov	rdi, QWORD PTR 160[rsp]
	adc	rdi, QWORD PTR 224[rsp]
	add	r12, rsi
	mov	rsi, r14
	mov	r14, QWORD PTR 344[rsp]
	mov	r15, QWORD PTR 352[rsp]
	adc	r13, rdi
	xor	edi, edi
	mov	QWORD PTR 112[rsp], r13
	add	r14, rsi
	mov	rsi, QWORD PTR 88[rsp]
	mov	QWORD PTR 104[rsp], r12
	adc	r15, rdi
	xor	r13d, r13d
	xor	edi, edi
	add	rsi, r15
	mov	rbx, rsi
	adc	rdi, r13
	xor	r13d, r13d
	add	rbx, rcx
	mov	rcx, QWORD PTR 72[rsp]
	mov	rsi, rdi
	adc	rsi, r13
	mov	r12, rbx
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rax
	mov	r13, rsi
	mov	rax, QWORD PTR 8[rsp]
	mov	QWORD PTR 88[rsp], r12
	adc	rbx, rdi
	xor	edx, edx
	mov	rsi, rbx
	mov	rbx, rcx
	add	rbx, r13
	mov	r13, QWORD PTR -32[rsp]
	adc	rsi, rdx
	xor	edx, edx
	mov	rdi, rsi
	mov	rsi, rbx
	xor	ebx, ebx
	add	rax, r10
	adc	rdx, rbx
	mov	r11, rax
	xor	r12d, r12d
	mov	rax, QWORD PTR -8[rsp]
	add	r11, rdi
	mov	rbx, r12
	mov	r12, rdx
	mov	QWORD PTR 72[rsp], rsi
	adc	r12, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r8
	adc	rdx, rbx
	mov	QWORD PTR 8[rsp], r11
	xor	r10d, r10d
	mov	r11, QWORD PTR -24[rsp]
	mov	r9, rax
	mov	rax, QWORD PTR 104[rsp]
	mov	rbx, r10
	mov	r10, rdx
	add	r9, r12
	mov	r12, QWORD PTR -16[rsp]
	adc	r10, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r11
	adc	rdx, rbx
	mov	r8, rax
	mov	rax, QWORD PTR 112[rsp]
	mov	QWORD PTR -8[rsp], r9
	xor	esi, esi
	mov	r11, r12
	add	r8, r10
	mov	r9, rdx
	adc	r9, rsi
	lea	rcx, [rax+r13]
	xor	r12d, r12d
	mov	rax, r11
	mov	QWORD PTR -24[rsp], r8
	xor	ebx, ebx
	mov	r8, r9
	add	rax, rcx
	mov	rdx, r12
	mov	r13, r14
	adc	rdx, rbx
	xor	r9d, r9d
	add	rax, r8
	mov	r8, r14
	adc	rdx, r9
	sal	r13, 32
	mov	QWORD PTR 104[rsp], rax
	xor	r9d, r9d
	mov	rax, r13
	mov	QWORD PTR 112[rsp], rdx
	mov	rdx, -1
	add	rax, r14
	xor	ebx, ebx
	xor	r14d, r14d
	mulx	r11, r10, rax
	mov	rdx, -2
	mov	rcx, rax
	mov	r13, r14
	mulx	rdx, rax, rax
	mov	r12, r11
	mov	QWORD PTR 344[rsp], rax
	mov	rax, rcx
	mov	QWORD PTR 352[rsp], rdx
	sal	rax, 32
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	mov	rdx, rbx
	shld	rdx, rcx, 32
	sub	rax, rcx
	mov	rcx, r10
	sbb	rdx, rbx
	mov	QWORD PTR -72[rsp], rax
	xor	esi, esi
	xor	ebx, ebx
	mov	QWORD PTR -88[rsp], rdx
	mov	rax, QWORD PTR 344[rsp]
	mov	rdi, rsi
	mov	rdx, QWORD PTR 352[rsp]
	mov	rsi, r15
	mov	QWORD PTR 344[rsp], r12
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
	mov	r13, QWORD PTR 344[rsp]
	add	r10, rcx
	mov	rcx, QWORD PTR -72[rsp]
	mov	QWORD PTR -40[rsp], r10
	adc	r11, rbx
	mov	r10, QWORD PTR -88[rsp]
	xor	ebx, ebx
	add	rcx, r8
	mov	QWORD PTR -32[rsp], r11
	mov	r8, QWORD PTR -40[rsp]
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	mov	r14, QWORD PTR 88[rsp]
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, QWORD PTR 72[rsp]
	adc	r15, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	xor	r10d, r10d
	mov	r9, rcx
	mov	rcx, QWORD PTR 8[rsp]
	add	r9, r15
	mov	rdi, r10
	mov	r10, rbx
	adc	r10, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rax
	mov	QWORD PTR 8[rsp], r9
	mov	rax, r10
	mov	r9, rcx
	adc	rbx, rdi
	xor	edx, edx
	add	r9, rax
	mov	rax, QWORD PTR -8[rsp]
	mov	r10, rbx
	adc	r10, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR -8[rsp], r9
	add	rax, r12
	mov	r9, QWORD PTR -32[rsp]
	adc	rdx, rbx
	xor	r12d, r12d
	add	rax, r10
	adc	rdx, r12
	mov	QWORD PTR -72[rsp], rax
	mov	rax, QWORD PTR -24[rsp]
	xor	esi, esi
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	lea	rcx, [r9+r13]
	adc	rdx, rsi
	mov	r11, rax
	mov	rax, QWORD PTR 104[rsp]
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, r8
	adc	r12, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	xor	r9d, r9d
	add	rax, r12
	mov	QWORD PTR -24[rsp], r11
	adc	rdx, r9
	xor	r10d, r10d
	mov	QWORD PTR -40[rsp], rax
	xor	r11d, r11d
	mov	QWORD PTR -32[rsp], rdx
	mov	rdx, QWORD PTR 200[rsp]
	mov	QWORD PTR -80[rsp], r10
	xor	r10d, r10d
	mulx	r13, r12, QWORD PTR 376[rsp]
	mov	QWORD PTR -88[rsp], r13
	mulx	rdi, rsi, QWORD PTR 360[rsp]
	mulx	r9, r8, QWORD PTR 184[rsp]
	mulx	rdx, rax, rdx
	mov	QWORD PTR 80[rsp], r11
	mov	r11, QWORD PTR 176[rsp]
	mov	QWORD PTR 96[rsp], r10
	mov	r10, QWORD PTR 168[rsp]
	add	r10, QWORD PTR 264[rsp]
	adc	r11, QWORD PTR 272[rsp]
	xor	ebx, ebx
	mov	QWORD PTR 352[rsp], 0
	mov	rcx, rax
	add	rcx, QWORD PTR 120[rsp]
	mov	QWORD PTR 120[rsp], r10
	mov	r10, r11
	adc	rbx, QWORD PTR 128[rsp]
	xor	r11d, r11d
	add	rcx, r10
	mov	QWORD PTR 72[rsp], r9
	adc	rbx, r11
	mov	rax, rdx
	mov	QWORD PTR 344[rsp], r8
	xor	r9d, r9d
	add	rax, QWORD PTR 344[rsp]
	mov	rdx, r9
	adc	rdx, QWORD PTR 352[rsp]
	xor	r9d, r9d
	add	rax, rbx
	mov	QWORD PTR 264[rsp], rsi
	mov	rsi, QWORD PTR 72[rsp]
	adc	rdx, r9
	xor	r9d, r9d
	add	rsi, QWORD PTR 264[rsp]
	mov	QWORD PTR 88[rsp], rdi
	mov	r8, rdx
	mov	rdi, QWORD PTR 80[rsp]
	mov	QWORD PTR 272[rsp], 0
	adc	rdi, QWORD PTR 272[rsp]
	add	r8, rsi
	mov	QWORD PTR 200[rsp], r12
	adc	r9, rdi
	xor	r11d, r11d
	mov	rsi, QWORD PTR 88[rsp]
	mov	QWORD PTR 208[rsp], 0
	mov	r10, r9
	mov	rdi, QWORD PTR 96[rsp]
	add	rsi, QWORD PTR 200[rsp]
	adc	rdi, QWORD PTR 208[rsp]
	add	r10, rsi
	mov	rsi, r14
	mov	r14, QWORD PTR 328[rsp]
	mov	r15, QWORD PTR 336[rsp]
	adc	r11, rdi
	xor	edi, edi
	mov	QWORD PTR 168[rsp], r10
	add	r14, rsi
	mov	rsi, QWORD PTR 8[rsp]
	mov	r10, QWORD PTR 120[rsp]
	mov	QWORD PTR 176[rsp], r11
	adc	r15, rdi
	xor	r11d, r11d
	xor	edi, edi
	add	rsi, r15
	adc	rdi, r11
	xor	r11d, r11d
	add	rsi, r10
	adc	rdi, r11
	mov	QWORD PTR 328[rsp], rsi
	mov	rsi, QWORD PTR -8[rsp]
	xor	r11d, r11d
	mov	QWORD PTR 336[rsp], rdi
	mov	rbx, QWORD PTR 336[rsp]
	xor	edi, edi
	add	rsi, rcx
	mov	r10, rsi
	mov	rcx, rbx
	adc	rdi, r11
	xor	ebx, ebx
	add	r10, rcx
	mov	rcx, QWORD PTR -72[rsp]
	mov	r11, rdi
	adc	r11, rbx
	xor	edi, edi
	xor	ebx, ebx
	mov	QWORD PTR 8[rsp], r10
	add	rcx, rax
	mov	rax, QWORD PTR -24[rsp]
	adc	rbx, rdi
	xor	edx, edx
	mov	rdi, QWORD PTR -32[rsp]
	mov	rsi, rbx
	mov	rbx, rcx
	mov	rcx, QWORD PTR 112[rsp]
	add	rbx, r11
	adc	rsi, rdx
	mov	r10, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rax, r8
	mov	QWORD PTR -8[rsp], r10
	mov	r8, rax
	adc	rdx, rbx
	mov	rax, QWORD PTR 168[rsp]
	xor	r10d, r10d
	add	r8, rsi
	mov	rsi, QWORD PTR -40[rsp]
	mov	r9, rdx
	adc	r9, r10
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR -24[rsp], r8
	add	rax, rsi
	mov	r8, r9
	mov	rsi, QWORD PTR 176[rsp]
	adc	rdx, rbx
	xor	r9d, r9d
	mov	rbx, r9
	mov	r9, rax
	lea	rax, [rdi+rcx]
	mov	r10, rdx
	add	r9, r8
	lea	rcx, [rsi+r13]
	mov	r13, r14
	mov	r8, r14
	adc	r10, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	r12d, r12d
	mov	QWORD PTR 104[rsp], r9
	add	r11, r10
	mov	rbx, r12
	mov	r12, rdx
	mov	rdx, -1
	adc	r12, rbx
	sal	r13, 32
	xor	r9d, r9d
	mov	QWORD PTR 168[rsp], r11
	mov	rax, r13
	mov	QWORD PTR 176[rsp], r12
	add	rax, r14
	xor	ebx, ebx
	xor	r14d, r14d
	mulx	r11, r10, rax
	mov	rdx, -2
	mov	rcx, rax
	mov	r13, r14
	mulx	rdx, rax, rax
	mov	r12, r11
	mov	QWORD PTR 120[rsp], rax
	mov	rax, rcx
	mov	QWORD PTR 128[rsp], rdx
	sal	rax, 32
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	mov	rdx, rbx
	shld	rdx, rcx, 32
	sub	rax, rcx
	mov	rcx, r10
	sbb	rdx, rbx
	mov	QWORD PTR -72[rsp], rax
	xor	esi, esi
	xor	ebx, ebx
	mov	QWORD PTR -64[rsp], rdx
	mov	rdi, rsi
	mov	QWORD PTR -104[rsp], rdx
	mov	rax, QWORD PTR 120[rsp]
	mov	rsi, r15
	mov	rdx, QWORD PTR 128[rsp]
	mov	QWORD PTR 120[rsp], r12
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
	mov	QWORD PTR -40[rsp], r10
	adc	r11, rbx
	mov	r10, QWORD PTR -104[rsp]
	xor	ebx, ebx
	add	rcx, r8
	mov	r8, QWORD PTR -40[rsp]
	mov	QWORD PTR -32[rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	mov	r14, QWORD PTR 328[rsp]
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, QWORD PTR 8[rsp]
	adc	r15, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	xor	r10d, r10d
	mov	r9, rcx
	mov	rcx, QWORD PTR -8[rsp]
	add	r9, r15
	mov	rdi, r10
	mov	r10, rbx
	adc	r10, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdi
	mov	rax, QWORD PTR -24[rsp]
	xor	edx, edx
	mov	QWORD PTR 8[rsp], r9
	mov	rsi, rbx
	mov	rbx, rcx
	add	rbx, r10
	adc	rsi, rdx
	mov	r9, rbx
	xor	edx, edx
	xor	ebx, ebx
	add	rax, r12
	mov	QWORD PTR -8[rsp], r9
	adc	rdx, rbx
	xor	r9d, r9d
	add	rax, rsi
	mov	QWORD PTR [rsp], rsi
	adc	rdx, r9
	mov	QWORD PTR -24[rsp], rax
	mov	rax, QWORD PTR 104[rsp]
	xor	esi, esi
	mov	rcx, rdx
	mov	QWORD PTR -16[rsp], rdx
	xor	edx, edx
	mov	r9, QWORD PTR -32[rsp]
	add	rax, rcx
	adc	rdx, rsi
	mov	r11, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 168[rsp]
	add	r11, r8
	mov	r12, rdx
	adc	r12, rbx
	mov	QWORD PTR 104[rsp], r11
	xor	edx, edx
	mov	r11, r12
	xor	r12d, r12d
	add	rax, r11
	adc	rdx, r12
	mov	r12, QWORD PTR 120[rsp]
	mov	r8, rax
	xor	ebx, ebx
	lea	rcx, [r9+r12]
	mov	r9, rdx
	mov	rdx, QWORD PTR 184[rsp]
	add	r8, rcx
	mulx	r13, r12, QWORD PTR 376[rsp]
	adc	r9, rbx
	mov	QWORD PTR 120[rsp], r8
	mulx	rdi, rsi, QWORD PTR 360[rsp]
	mov	QWORD PTR 128[rsp], r9
	xor	r9d, r9d
	mulx	rdx, rax, rdx
	mov	QWORD PTR -32[rsp], r9
	xor	r9d, r9d
	mov	QWORD PTR -40[rsp], r13
	mov	QWORD PTR 184[rsp], rdi
	mov	QWORD PTR 192[rsp], r9
	mov	r9, QWORD PTR 24[rsp]
	mov	r10, QWORD PTR 32[rsp]
	add	r9, QWORD PTR 248[rsp]
	mov	QWORD PTR 328[rsp], r12
	adc	r10, QWORD PTR 256[rsp]
	mov	QWORD PTR 24[rsp], r9
	xor	r9d, r9d
	mov	rcx, QWORD PTR 136[rsp]
	mov	r8, r10
	add	rcx, QWORD PTR 344[rsp]
	mov	QWORD PTR 344[rsp], rsi
	mov	rbx, QWORD PTR 144[rsp]
	adc	rbx, QWORD PTR 352[rsp]
	add	r8, rcx
	mov	rcx, rax
	adc	r9, rbx
	xor	ebx, ebx
	add	rcx, QWORD PTR 72[rsp]
	adc	rbx, QWORD PTR 80[rsp]
	xor	r11d, r11d
	add	rcx, r9
	mov	rax, rdx
	mov	QWORD PTR 352[rsp], 0
	adc	rbx, r11
	xor	r11d, r11d
	add	rax, QWORD PTR 344[rsp]
	mov	rsi, QWORD PTR 184[rsp]
	mov	rdx, r11
	adc	rdx, QWORD PTR 352[rsp]
	xor	r11d, r11d
	add	rax, rbx
	adc	rdx, r11
	xor	r11d, r11d
	add	rsi, QWORD PTR 328[rsp]
	mov	QWORD PTR 336[rsp], 0
	mov	r10, rdx
	mov	rdi, QWORD PTR 192[rsp]
	adc	rdi, QWORD PTR 336[rsp]
	add	r10, rsi
	mov	rsi, r14
	mov	r14, QWORD PTR 312[rsp]
	mov	r15, QWORD PTR 320[rsp]
	adc	r11, rdi
	xor	edi, edi
	mov	QWORD PTR 248[rsp], r10
	mov	r10, QWORD PTR 24[rsp]
	add	r14, rsi
	mov	rsi, QWORD PTR 8[rsp]
	mov	QWORD PTR 256[rsp], r11
	adc	r15, rdi
	xor	r11d, r11d
	xor	edi, edi
	add	rsi, r15
	adc	rdi, r11
	xor	r11d, r11d
	add	rsi, r10
	mov	QWORD PTR 312[rsp], rsi
	adc	rdi, r11
	mov	rsi, QWORD PTR -8[rsp]
	xor	r11d, r11d
	mov	QWORD PTR 320[rsp], rdi
	mov	r9, QWORD PTR 320[rsp]
	xor	edi, edi
	add	rsi, r8
	adc	rdi, r11
	mov	r8, r9
	mov	r10, rsi
	mov	rsi, QWORD PTR -24[rsp]
	xor	r9d, r9d
	mov	r11, rdi
	add	r10, r8
	adc	r11, r9
	xor	r9d, r9d
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, r9
	mov	rcx, QWORD PTR 104[rsp]
	mov	r9, rsi
	xor	ebx, ebx
	mov	QWORD PTR 136[rsp], r10
	add	r9, r11
	mov	r10, rdi
	adc	r10, rbx
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rax
	mov	QWORD PTR 104[rsp], r9
	mov	rax, r10
	mov	r9, rcx
	adc	rbx, rdi
	mov	rcx, QWORD PTR 120[rsp]
	xor	edx, edx
	add	r9, rax
	mov	r10, rbx
	mov	rax, QWORD PTR 248[rsp]
	adc	r10, rdx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 72[rsp], r9
	add	rax, rcx
	mov	rcx, QWORD PTR 176[rsp]
	adc	rdx, rbx
	mov	r8, rax
	xor	esi, esi
	mov	r9, rdx
	add	r8, r10
	adc	r9, rsi
	mov	rsi, QWORD PTR 128[rsp]
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 120[rsp], r8
	mov	r8, r14
	lea	rax, [rsi+rcx]
	mov	rsi, QWORD PTR 256[rsp]
	lea	rcx, [rsi+r13]
	mov	r13, r14
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	r12d, r12d
	mov	rbx, r12
	add	r11, r9
	mov	r12, rdx
	mov	rdx, -1
	adc	r12, rbx
	sal	r13, 32
	xor	r9d, r9d
	mov	QWORD PTR 248[rsp], r11
	mov	rax, r13
	mov	QWORD PTR 256[rsp], r12
	add	rax, r14
	xor	r14d, r14d
	xor	ebx, ebx
	mulx	r11, r10, rax
	mov	rcx, rax
	mov	r13, r14
	mov	rdi, rbx
	mov	rdx, -2
	mov	rsi, rcx
	shld	rdi, rcx, 32
	mulx	rdx, rax, rax
	sal	rsi, 32
	sub	rsi, rcx
	sbb	rdi, rbx
	mov	QWORD PTR 8[rsp], rsi
	xor	ebx, ebx
	mov	r12, r11
	mov	QWORD PTR -8[rsp], rdi
	mov	QWORD PTR 176[rsp], rdx
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	mov	QWORD PTR 168[rsp], rax
	mov	rdx, QWORD PTR 176[rsp]
	mov	rcx, r10
	mov	rax, QWORD PTR 168[rsp]
	mov	QWORD PTR 16[rsp], rdi
	mov	rdi, rbx
	xor	ebx, ebx
	mov	QWORD PTR 168[rsp], r12
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
	mov	r12, rdx
	adc	rbx, r13
	xor	r13d, r13d
	add	r12, rcx
	adc	r13, rbx
	xor	r11d, r11d
	mov	r10, r13
	add	r10, rcx
	mov	rcx, QWORD PTR 8[rsp]
	adc	r11, rbx
	mov	QWORD PTR 24[rsp], r10
	xor	ebx, ebx
	mov	r10, QWORD PTR -8[rsp]
	add	rcx, r8
	mov	QWORD PTR 32[rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	mov	r14, QWORD PTR 312[rsp]
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, QWORD PTR 136[rsp]
	adc	r15, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	xor	r9d, r9d
	add	rcx, r15
	mov	r8, rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rbx, r9
	xor	edi, edi
	mov	r9, rbx
	xor	ebx, ebx
	mov	QWORD PTR 312[rsp], r8
	add	rcx, rax
	mov	rax, QWORD PTR 72[rsp]
	adc	rbx, rdi
	xor	edx, edx
	add	rcx, r9
	mov	r9, QWORD PTR 24[rsp]
	adc	rbx, rdx
	xor	edx, edx
	mov	QWORD PTR 136[rsp], rcx
	mov	r10, rbx
	xor	ebx, ebx
	add	rax, r12
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r10
	mov	QWORD PTR 144[rsp], r10
	adc	rdx, rbx
	mov	QWORD PTR 104[rsp], rax
	mov	rax, QWORD PTR 120[rsp]
	xor	esi, esi
	mov	rcx, rdx
	mov	QWORD PTR 112[rsp], rdx
	xor	edx, edx
	mov	r10, QWORD PTR 32[rsp]
	add	rax, rcx
	adc	rdx, rsi
	mov	r11, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 248[rsp]
	add	r11, r9
	mov	r12, rdx
	adc	r12, rbx
	mov	QWORD PTR 120[rsp], r11
	xor	edx, edx
	mov	r11, r12
	mov	QWORD PTR 128[rsp], r12
	xor	r12d, r12d
	add	rax, r11
	mov	r11, QWORD PTR 160[rsp]
	adc	rdx, r12
	mov	r12, QWORD PTR 168[rsp]
	xor	ebx, ebx
	mov	r13, rdx
	mov	rdx, QWORD PTR 360[rsp]
	lea	rcx, [r10+r12]
	mov	r12, rax
	mov	rax, QWORD PTR 40[rsp]
	mov	r10, QWORD PTR 152[rsp]
	add	r12, rcx
	adc	r13, rbx
	xor	ebx, ebx
	mov	QWORD PTR 168[rsp], r12
	add	rax, QWORD PTR 232[rsp]
	mov	QWORD PTR 176[rsp], r13
	mulx	r13, r12, QWORD PTR 376[rsp]
	mov	QWORD PTR 80[rsp], rbx
	mulx	rbx, rcx, rdx
	mov	rdx, QWORD PTR 48[rsp]
	adc	rdx, QWORD PTR 240[rsp]
	xor	r9d, r9d
	add	r10, QWORD PTR 264[rsp]
	mov	QWORD PTR 232[rsp], rax
	mov	r8, rdx
	adc	r11, QWORD PTR 272[rsp]
	add	r8, r10
	mov	QWORD PTR 72[rsp], r13
	mov	r10, QWORD PTR 88[rsp]
	adc	r9, r11
	xor	r11d, r11d
	mov	rax, rcx
	mov	rcx, rbx
	mov	rsi, r9
	mov	rdi, r11
	mov	r11, QWORD PTR 96[rsp]
	add	r10, QWORD PTR 344[rsp]
	adc	r11, QWORD PTR 352[rsp]
	add	rsi, r10
	mov	QWORD PTR 360[rsp], r12
	adc	rdi, r11
	xor	edx, edx
	add	rax, QWORD PTR 184[rsp]
	adc	rdx, QWORD PTR 192[rsp]
	xor	r11d, r11d
	add	rax, rdi
	mov	QWORD PTR 368[rsp], 0
	mov	r15, QWORD PTR 304[rsp]
	adc	rdx, r11
	xor	ebx, ebx
	add	rcx, QWORD PTR 360[rsp]
	adc	rbx, QWORD PTR 368[rsp]
	xor	r11d, r11d
	add	rcx, rdx
	mov	r10, QWORD PTR 232[rsp]
	mov	QWORD PTR 344[rsp], rcx
	mov	rcx, r14
	adc	rbx, r11
	mov	r14, QWORD PTR 296[rsp]
	mov	QWORD PTR 352[rsp], rbx
	xor	ebx, ebx
	add	r14, rcx
	mov	rcx, QWORD PTR 312[rsp]
	adc	r15, rbx
	xor	r11d, r11d
	xor	ebx, ebx
	add	rcx, r15
	adc	rbx, r11
	xor	r11d, r11d
	add	rcx, r10
	adc	rbx, r11
	mov	QWORD PTR 312[rsp], rcx
	xor	r11d, r11d
	mov	rcx, QWORD PTR 136[rsp]
	mov	QWORD PTR 320[rsp], rbx
	mov	r9, QWORD PTR 320[rsp]
	xor	ebx, ebx
	add	rcx, r8
	adc	rbx, r11
	mov	r8, r9
	mov	r10, rcx
	mov	rcx, QWORD PTR 104[rsp]
	xor	r9d, r9d
	mov	r11, rbx
	add	r10, r8
	adc	r11, r9
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	mov	r9, rcx
	mov	rcx, QWORD PTR 120[rsp]
	mov	QWORD PTR 264[rsp], r10
	xor	edi, edi
	mov	r10, rbx
	add	r9, r11
	mov	rsi, QWORD PTR 168[rsp]
	adc	r10, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdi
	mov	rax, QWORD PTR 344[rsp]
	xor	edx, edx
	add	rcx, r10
	adc	rbx, rdx
	mov	rdi, QWORD PTR 176[rsp]
	xor	edx, edx
	mov	QWORD PTR 232[rsp], r9
	mov	r10, rbx
	xor	ebx, ebx
	add	rax, rsi
	mov	rsi, QWORD PTR 256[rsp]
	mov	r8, rax
	adc	rdx, rbx
	mov	QWORD PTR 184[rsp], rcx
	xor	ebx, ebx
	lea	rax, [rdi+rsi]
	add	r8, r10
	mov	rsi, QWORD PTR 352[rsp]
	mov	r9, rdx
	adc	r9, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 192[rsp], r10
	lea	rcx, [rsi+r13]
	mov	r13, r14
	mov	QWORD PTR 248[rsp], r8
	mov	r8, r14
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	r12d, r12d
	mov	rbx, r12
	add	r11, r9
	mov	r12, rdx
	mov	rdx, -1
	adc	r12, rbx
	sal	r13, 32
	xor	r9d, r9d
	mov	QWORD PTR 344[rsp], r11
	mov	rax, r13
	mov	QWORD PTR 352[rsp], r12
	add	rax, r14
	xor	r15d, r15d
	xor	ebx, ebx
	mulx	r11, r10, rax
	mov	rcx, rax
	mov	r13, r15
	mov	rdi, rbx
	mov	rdx, -2
	mov	rsi, rcx
	shld	rdi, rcx, 32
	mulx	rdx, rax, rax
	sal	rsi, 32
	sub	rsi, rcx
	sbb	rdi, rbx
	mov	QWORD PTR 152[rsp], rsi
	xor	ebx, ebx
	mov	r12, r11
	mov	QWORD PTR 136[rsp], rdi
	mov	QWORD PTR 304[rsp], rdx
	movabs	rdx, -4294967296
	mulx	r15, r14, rcx
	mov	QWORD PTR 296[rsp], rax
	mov	rcx, r10
	mov	rax, QWORD PTR 296[rsp]
	mov	rdx, QWORD PTR 304[rsp]
	mov	QWORD PTR 160[rsp], rdi
	xor	edi, edi
	mov	QWORD PTR 296[rsp], r12
	mov	rsi, r15
	add	rsi, rax
	mov	rax, rdx
	adc	rdi, rbx
	xor	r11d, r11d
	xor	ebx, ebx
	add	rax, r10
	mov	rdx, r11
	adc	rdx, rbx
	xor	r11d, r11d
	add	rax, rdi
	adc	rdx, r11
	add	rcx, r12
	adc	rbx, r13
	mov	r12, rdx
	xor	r11d, r11d
	mov	r13, r11
	add	r12, rcx
	adc	r13, rbx
	xor	r11d, r11d
	mov	r10, r13
	mov	r13, QWORD PTR 64[rsp]
	add	r10, rcx
	mov	rcx, QWORD PTR 152[rsp]
	mov	QWORD PTR 168[rsp], r10
	adc	r11, rbx
	mov	r10, QWORD PTR 136[rsp]
	xor	ebx, ebx
	add	rcx, r8
	mov	QWORD PTR 176[rsp], r11
	adc	rbx, r9
	mov	rcx, rbx
	xor	ebx, ebx
	add	r10, r14
	mov	r14, QWORD PTR 312[rsp]
	xor	r9d, r9d
	add	rcx, r10
	adc	rbx, r9
	xor	r15d, r15d
	add	r14, rcx
	mov	rcx, QWORD PTR 264[rsp]
	adc	r15, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, r9
	mov	r10, rcx
	mov	rcx, QWORD PTR 232[rsp]
	xor	edi, edi
	mov	r11, rbx
	add	r10, r15
	adc	r11, rdi
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rax
	adc	rbx, rdi
	mov	rsi, rcx
	mov	rax, QWORD PTR 184[rsp]
	xor	edx, edx
	mov	rdi, rbx
	add	rsi, r11
	mov	QWORD PTR 312[rsp], r10
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, r12
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 248[rsp]
	add	r9, rdi
	mov	r10, rdx
	mov	QWORD PTR 264[rsp], rsi
	mov	rsi, QWORD PTR 168[rsp]
	adc	r10, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	rdi, QWORD PTR 176[rsp]
	add	rax, r10
	mov	QWORD PTR 232[rsp], r9
	mov	r10, QWORD PTR 296[rsp]
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 344[rsp]
	add	r11, rsi
	mov	r12, rdx
	lea	rcx, [rdi+r10]
	adc	r12, rbx
	xor	r9d, r9d
	xor	edx, edx
	mov	QWORD PTR 248[rsp], r11
	add	rax, r12
	mov	r12, QWORD PTR 56[rsp]
	adc	rdx, r9
	mov	r10, rax
	xor	ebx, ebx
	mov	r11, rdx
	mov	rdx, QWORD PTR 376[rsp]
	add	r10, rcx
	adc	r11, rbx
	mov	QWORD PTR 296[rsp], r10
	mulx	rsi, rbx, rdx
	mov	QWORD PTR 304[rsp], r11
	add	r12, QWORD PTR 216[rsp]
	adc	r13, QWORD PTR 224[rsp]
	mov	rax, QWORD PTR -56[rsp]
	mov	r8, r13
	mov	rdx, QWORD PTR -48[rsp]
	mov	r15, QWORD PTR 288[rsp]
	mov	r11, rsi
	xor	esi, esi
	add	rax, QWORD PTR 200[rsp]
	mov	r10, rbx
	adc	rdx, QWORD PTR 208[rsp]
	mov	r9, rsi
	add	r8, rax
	mov	rax, QWORD PTR -88[rsp]
	adc	r9, rdx
	xor	esi, esi
	add	rax, QWORD PTR 328[rsp]
	mov	rdx, QWORD PTR -80[rsp]
	mov	rdi, rsi
	mov	rsi, r9
	adc	rdx, QWORD PTR 336[rsp]
	add	rsi, rax
	mov	rax, QWORD PTR -40[rsp]
	adc	rdi, rdx
	xor	edx, edx
	add	rax, QWORD PTR 360[rsp]
	mov	rcx, rdi
	mov	rbx, rdx
	mov	rdx, QWORD PTR -32[rsp]
	adc	rdx, QWORD PTR 368[rsp]
	add	rcx, rax
	mov	rax, r10
	mov	QWORD PTR 368[rsp], r11
	adc	rbx, rdx
	xor	edx, edx
	add	rax, QWORD PTR 72[rsp]
	adc	rdx, QWORD PTR 80[rsp]
	xor	r11d, r11d
	add	rax, rbx
	mov	QWORD PTR 376[rsp], rax
	mov	rax, r14
	adc	rdx, r11
	mov	r14, QWORD PTR 280[rsp]
	mov	QWORD PTR 384[rsp], rdx
	xor	edx, edx
	add	r14, rax
	mov	rax, QWORD PTR 312[rsp]
	adc	r15, rdx
	xor	edx, edx
	mov	r11, rdx
	xor	edx, edx
	add	rax, r15
	adc	rdx, r11
	xor	r11d, r11d
	add	rax, r12
	mov	r12, rax
	mov	rax, QWORD PTR 264[rsp]
	adc	rdx, r11
	xor	r11d, r11d
	mov	r13, rdx
	xor	edx, edx
	mov	QWORD PTR 328[rsp], r12
	add	rax, r8
	mov	r8, r14
	adc	rdx, r11
	xor	r9d, r9d
	add	rax, r13
	mov	r10, rax
	mov	rax, QWORD PTR 232[rsp]
	adc	rdx, r9
	xor	r9d, r9d
	mov	r11, rdx
	xor	edx, edx
	mov	QWORD PTR 312[rsp], r10
	add	rax, rsi
	adc	rdx, r9
	xor	edi, edi
	add	rax, r11
	mov	r9, rax
	mov	rax, QWORD PTR 248[rsp]
	adc	rdx, rdi
	xor	edi, edi
	mov	r10, rdx
	xor	edx, edx
	mov	QWORD PTR 280[rsp], r9
	mov	r9, QWORD PTR 296[rsp]
	add	rax, rcx
	adc	rdx, rdi
	xor	ebx, ebx
	add	rax, r10
	mov	rdi, QWORD PTR 384[rsp]
	mov	r11, rax
	mov	rax, QWORD PTR 376[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	mov	r12, rdx
	xor	edx, edx
	mov	r10, QWORD PTR 304[rsp]
	mov	QWORD PTR 296[rsp], r11
	add	rax, r9
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r12
	adc	rdx, rsi
	mov	rsi, QWORD PTR 368[rsp]
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	mov	rdx, QWORD PTR 352[rsp]
	mov	QWORD PTR 264[rsp], r11
	lea	rax, [rsi+rdi]
	lea	rcx, [r10+rdx]
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, r12
	mov	QWORD PTR 376[rsp], rax
	mov	rax, r14
	adc	rdx, rbx
	xor	r9d, r9d
	sal	rax, 32
	mov	QWORD PTR 384[rsp], rdx
	mov	rdx, -1
	add	rax, r14
	xor	edi, edi
	mov	rsi, rax
	mulx	rdx, rax, rax
	mov	r11, rdi
	mov	r10, rsi
	shld	r11, rsi, 32
	sal	r10, 32
	mov	QWORD PTR 360[rsp], rax
	mov	rax, rdx
	xor	edx, edx
	sub	r10, rsi
	mov	r13, rdx
	mov	rdx, -2
	sbb	r11, rdi
	xor	edi, edi
	mulx	rbx, rcx, rsi
	mov	QWORD PTR 248[rsp], r10
	movabs	rdx, -4294967296
	mulx	r15, r14, rsi
	mov	rsi, QWORD PTR 360[rsp]
	mov	rdx, r11
	mov	r11, rdi
	xor	edi, edi
	mov	QWORD PTR 360[rsp], rax
	mov	r10, r15
	add	r10, rcx
	mov	rcx, rbx
	adc	r11, rdi
	mov	QWORD PTR 344[rsp], r10
	xor	edi, edi
	xor	ebx, ebx
	mov	r10, r11
	add	rcx, rsi
	adc	rbx, rdi
	xor	r11d, r11d
	add	rcx, r10
	adc	rbx, r11
	add	rsi, rax
	mov	rax, QWORD PTR 328[rsp]
	adc	rdi, r13
	mov	r10, rbx
	xor	r12d, r12d
	mov	r11, r12
	add	r10, rsi
	adc	r11, rdi
	xor	r13d, r13d
	mov	r12, r11
	add	r12, rsi
	mov	rsi, QWORD PTR 248[rsp]
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
	mov	r8, QWORD PTR 296[rsp]
	adc	rdi, rdx
	xor	edx, edx
	add	rsi, rax
	mov	rax, QWORD PTR 312[rsp]
	adc	rdi, rdx
	mov	r14, rsi
	mov	rsi, QWORD PTR 344[rsp]
	xor	edx, edx
	mov	r15, rdi
	mov	QWORD PTR 344[rsp], r14
	xor	edi, edi
	mov	r14, r15
	add	rax, rsi
	mov	QWORD PTR 352[rsp], r15
	adc	rdx, rdi
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 280[rsp]
	adc	r15, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 264[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r15
	adc	rdx, rdi
	mov	QWORD PTR 328[rsp], rax
	xor	ebx, ebx
	xor	r9d, r9d
	mov	rax, rdx
	add	r8, r10
	mov	QWORD PTR 336[rsp], rdx
	adc	r9, rbx
	xor	edx, edx
	add	r8, rax
	adc	r9, rdx
	xor	ebx, ebx
	xor	edi, edi
	mov	rsi, r9
	add	rsi, rcx
	mov	rcx, QWORD PTR 376[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, r12
	adc	rdi, rbx
	mov	QWORD PTR 312[rsp], rsi
	xor	ebx, ebx
	mov	rsi, rdi
	mov	QWORD PTR 320[rsp], rdi
	xor	edi, edi
	add	rcx, rsi
	mov	rsi, QWORD PTR 360[rsp]
	adc	rbx, rdi
	xor	r11d, r11d
	lea	r10, 0[r13+rsi]
	mov	rsi, rcx
	mov	rcx, QWORD PTR 344[rsp]
	mov	rdi, rbx
	add	rsi, r10
	movabs	r10, -4294967295
	adc	rdi, r11
	xor	ebx, ebx
	mov	r11, -1
	add	rcx, r10
	adc	rbx, r11
	mov	r11, rcx
	mov	rcx, r14
	mov	r12, rbx
	mov	QWORD PTR 296[rsp], r11
	xor	ebx, ebx
	xor	r11d, r11d
	mov	rdx, r12
	mov	QWORD PTR 304[rsp], r12
	neg	edx
	mov	QWORD PTR 368[rsp], rdi
	movzx	r10d, dl
	mov	QWORD PTR 360[rsp], rsi
	sub	rcx, r10
	movabs	r10, 4294967296
	sbb	rbx, r11
	add	rcx, r10
	mov	r11, -1
	adc	rbx, r11
	mov	r10, rcx
	mov	rcx, QWORD PTR 328[rsp]
	mov	r11, rbx
	mov	QWORD PTR 280[rsp], r10
	xor	ebx, ebx
	mov	rdx, r11
	mov	QWORD PTR 288[rsp], r11
	xor	r11d, r11d
	neg	edx
	movzx	r10d, dl
	sub	rcx, r10
	sbb	rbx, r11
	mov	rdx, rcx
	add	rdx, 2
	mov	rcx, rbx
	adc	rcx, -1
	mov	QWORD PTR 264[rsp], rdx
	xor	r11d, r11d
	xor	ebx, ebx
	mov	r13, rcx
	mov	rcx, r8
	mov	rdx, r13
	mov	QWORD PTR 272[rsp], r13
	neg	edx
	movzx	r10d, dl
	sub	rcx, r10
	sbb	rbx, r11
	add	rcx, 1
	adc	rbx, -1
	mov	r11, rcx
	mov	rcx, QWORD PTR 312[rsp]
	mov	r12, rbx
	mov	QWORD PTR 248[rsp], r11
	xor	ebx, ebx
	xor	r11d, r11d
	mov	rdx, r12
	mov	QWORD PTR 256[rsp], r12
	mov	r9, QWORD PTR 248[rsp]
	neg	edx
	movzx	r10d, dl
	sub	rcx, r10
	mov	r10, rsi
	mov	rsi, QWORD PTR 312[rsp]
	sbb	rbx, r11
	mov	rax, rcx
	add	rax, 1
	mov	rdx, rbx
	adc	rdx, -1
	xor	ebx, ebx
	xor	r11d, r11d
	mov	QWORD PTR 232[rsp], rax
	mov	QWORD PTR 240[rsp], rdx
	neg	edx
	mov	rax, QWORD PTR 328[rsp]
	movzx	ecx, dl
	mov	rdx, QWORD PTR 384[rsp]
	sub	r10, rcx
	sbb	r11, rbx
	lea	rcx, [rdi+rdx]
	mov	rdi, QWORD PTR 344[rsp]
	mov	r12, r11
	mov	r11, r10
	add	r11, 1
	adc	r12, -1
	xor	r13d, r13d
	xor	ebx, ebx
	mov	QWORD PTR 376[rsp], r11
	mov	rdx, r12
	mov	QWORD PTR 384[rsp], r12
	mov	r11, QWORD PTR 296[rsp]
	neg	edx
	movzx	r12d, dl
	cmp	rcx, r12
	sbb	rbx, r13
	mov	rdx, rbx
	mov	rcx, rbx
	mov	rbx, QWORD PTR 280[rsp]
	not	rdx
	and	rdi, rcx
	and	rax, rcx
	and	r8, rcx
	and	r11, rdx
	and	rbx, rdx
	and	r9, rdx
	and	rsi, rcx
	or	rdi, r11
	mov	r11, r14
	mov	r14, QWORD PTR 232[rsp]
	or	r8, r9
	and	r11, rcx
	vmovq	xmm3, rdi
	and	rcx, QWORD PTR 360[rsp]
	mov	rdi, QWORD PTR -96[rsp]
	or	r11, rbx
	mov	rbx, QWORD PTR 264[rsp]
	and	r14, rdx
	vpinsrq	xmm1, xmm3, r11, 1
	or	rsi, r14
	and	rbx, rdx
	and	rdx, QWORD PTR 376[rsp]
	vmovq	xmm4, rsi
	or	rax, rbx
	or	rcx, rdx
	vmovq	xmm2, rax
	vpinsrq	xmm0, xmm2, r8, 1
	vinserti128	ymm0, ymm1, xmm0, 0x1
	vmovdqu	YMMWORD PTR [rdi], ymm0
	vpinsrq	xmm0, xmm4, rcx, 1
	vmovdqu	XMMWORD PTR 32[rdi], xmm0
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
	.size	fiat_p384_square_gcc, .-fiat_p384_square_gcc
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
