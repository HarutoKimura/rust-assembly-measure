	.file	"p434_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p434_square_gcc
	.type	fiat_p434_square_gcc, @function
fiat_p434_square_gcc:
.LFB20:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xor	r10d, r10d
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	xor	r12d, r12d
	push	rbx
	and	rsp, -32
	sub	rsp, 552
	.cfi_offset 3, -56
	mov	QWORD PTR -96[rsp], rdi
	xor	edi, edi
	mov	QWORD PTR 80[rsp], rdi
	mov	rax, QWORD PTR [rsi]
	mov	rdx, QWORD PTR 48[rsi]
	mov	QWORD PTR 272[rsp], r10
	mov	r14, QWORD PTR 8[rsi]
	mov	r13, QWORD PTR 24[rsi]
	mov	QWORD PTR 256[rsp], r12
	xor	r12d, r12d
	mov	r11, QWORD PTR 32[rsi]
	mov	rcx, QWORD PTR 40[rsi]
	mov	QWORD PTR 536[rsp], rdx
	mov	r8, QWORD PTR 16[rsi]
	mulx	rsi, rbx, rax
	mov	QWORD PTR 280[rsp], r13
	mov	rdx, rcx
	mov	QWORD PTR 520[rsp], rcx
	mov	QWORD PTR 504[rsp], r11
	mov	QWORD PTR 376[rsp], rbx
	mulx	rbx, rcx, rax
	mov	rdx, r11
	xor	r11d, r11d
	mov	QWORD PTR 384[rsp], rsi
	mov	QWORD PTR 72[rsp], rsi
	mulx	rdi, rsi, rax
	mov	rdx, r13
	xor	r13d, r13d
	mulx	r10, r9, rax
	mov	rdx, r8
	mov	QWORD PTR 240[rsp], r11
	xor	r11d, r11d
	mov	QWORD PTR 264[rsp], rbx
	mov	QWORD PTR 248[rsp], rdi
	mov	QWORD PTR 440[rsp], r9
	mov	QWORD PTR 232[rsp], r10
	mov	QWORD PTR 312[rsp], r8
	mulx	r9, r8, rax
	mov	rdx, rax
	mov	r15, QWORD PTR 440[rsp]
	mov	QWORD PTR 304[rsp], r11
	mulx	r11, r10, r14
	mul	rax
	mov	QWORD PTR 496[rsp], 0
	mov	QWORD PTR 368[rsp], r13
	mov	QWORD PTR 472[rsp], r8
	mov	QWORD PTR 360[rsp], r11
	mov	r11, rdx
	mov	r8, QWORD PTR 360[rsp]
	movabs	rdx, 620258357900100
	mov	QWORD PTR 488[rsp], r10
	add	r11, QWORD PTR 488[rsp]
	adc	r12, QWORD PTR 496[rsp]
	mov	QWORD PTR 216[rsp], r11
	mov	r11, r12
	xor	r12d, r12d
	add	r8, QWORD PTR 472[rsp]
	mov	QWORD PTR 296[rsp], r9
	mov	r10, r11
	mov	r11, r12
	mov	QWORD PTR 480[rsp], 0
	mov	r9, QWORD PTR 368[rsp]
	mov	r12, r10
	adc	r9, QWORD PTR 480[rsp]
	mov	r13, r11
	mov	QWORD PTR 456[rsp], r15
	add	r12, r8
	mov	r8, QWORD PTR 296[rsp]
	mov	QWORD PTR 464[rsp], 0
	adc	r13, r9
	xor	r10d, r10d
	add	r8, QWORD PTR 456[rsp]
	mov	r9, QWORD PTR 304[rsp]
	mov	r11, r10
	mov	r10, r13
	adc	r9, QWORD PTR 464[rsp]
	mov	QWORD PTR 200[rsp], r12
	add	r10, r8
	mov	QWORD PTR 440[rsp], rsi
	adc	r11, r9
	xor	edi, edi
	mov	QWORD PTR 184[rsp], r10
	mov	r10, QWORD PTR 232[rsp]
	mov	QWORD PTR 448[rsp], 0
	mov	r8, r11
	mov	r11, QWORD PTR 240[rsp]
	mov	r9, rdi
	add	r10, QWORD PTR 440[rsp]
	adc	r11, QWORD PTR 448[rsp]
	mov	QWORD PTR 424[rsp], rcx
	add	r8, r10
	mov	rcx, QWORD PTR 248[rsp]
	mov	QWORD PTR 432[rsp], 0
	mov	QWORD PTR 168[rsp], r8
	mov	r8, rax
	adc	r9, r11
	xor	esi, esi
	mulx	rdx, rax, r8
	add	rcx, QWORD PTR 424[rsp]
	mov	rdi, rsi
	mov	rsi, r9
	mov	rbx, QWORD PTR 256[rsp]
	adc	rbx, QWORD PTR 432[rsp]
	add	rsi, rcx
	mov	QWORD PTR 416[rsp], 0
	adc	rdi, rbx
	mov	QWORD PTR 152[rsp], rsi
	mov	r9, QWORD PTR 264[rsp]
	mov	rbx, rdi
	mov	rdi, QWORD PTR 376[rsp]
	mov	r10, QWORD PTR 272[rsp]
	mov	QWORD PTR 400[rsp], 0
	mov	r15, rdx
	mov	QWORD PTR 120[rsp], rax
	mov	rsi, rbx
	movabs	rdx, 7853257225132122198
	mulx	rdx, rax, r8
	mov	QWORD PTR 408[rsp], rdi
	xor	edi, edi
	add	r9, QWORD PTR 408[rsp]
	adc	r10, QWORD PTR 416[rsp]
	add	rsi, r9
	adc	rdi, r10
	mov	QWORD PTR 136[rsp], rsi
	xor	ebx, ebx
	xor	r9d, r9d
	mov	QWORD PTR 144[rsp], rdi
	mov	r11, rbx
	mov	QWORD PTR 112[rsp], rdx
	movabs	rdx, 8918917783347572387
	mulx	r13, r12, r8
	mov	QWORD PTR 104[rsp], rax
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mulx	rdx, rax, r8
	mov	QWORD PTR 392[rsp], rax
	mov	rcx, rdx
	mov	r10, rdx
	mov	rax, QWORD PTR 392[rsp]
	mov	rdx, QWORD PTR 400[rsp]
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 344[rsp], rax
	mov	rbx, rdx
	mov	rcx, rbx
	xor	ebx, ebx
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
	mov	rsi, QWORD PTR 104[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r11
	adc	rdx, rdi
	mov	QWORD PTR 328[rsp], rax
	xor	r13d, r13d
	mov	rax, rsi
	mov	QWORD PTR 336[rsp], rdx
	xor	edx, edx
	mov	rdi, QWORD PTR 112[rsp]
	add	rax, r12
	mov	rsi, QWORD PTR 120[rsp]
	adc	rdx, r13
	mov	r13, QWORD PTR 336[rsp]
	mov	r12, r13
	xor	r13d, r13d
	add	r12, rax
	mov	rax, rdi
	adc	r13, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r13
	mov	rsi, QWORD PTR 344[rsp]
	mov	QWORD PTR 120[rsp], rax
	adc	rdx, rdi
	mov	rax, QWORD PTR 392[rsp]
	mov	QWORD PTR 128[rsp], rdx
	mov	rdx, QWORD PTR 400[rsp]
	add	rax, r8
	adc	rdx, r9
	xor	edi, edi
	mov	rax, rdx
	xor	edx, edx
	add	rax, rsi
	mov	rsi, QWORD PTR 216[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, rsi
	mov	r8, rax
	mov	rax, QWORD PTR 200[rsp]
	adc	rdx, rdi
	xor	edi, edi
	mov	r9, rdx
	xor	edx, edx
	mov	QWORD PTR 104[rsp], r8
	add	rax, rcx
	adc	rdx, rdi
	xor	esi, esi
	add	rax, r9
	mov	rcx, rax
	mov	rax, QWORD PTR 184[rsp]
	adc	rdx, rsi
	xor	edi, edi
	mov	rbx, rdx
	xor	edx, edx
	mov	rsi, QWORD PTR 328[rsp]
	mov	QWORD PTR 88[rsp], rcx
	add	rax, r10
	adc	rdx, rdi
	xor	edi, edi
	add	rax, rbx
	mov	r9, rax
	mov	rax, QWORD PTR 168[rsp]
	adc	rdx, rdi
	xor	edi, edi
	mov	r10, rdx
	xor	edx, edx
	mov	QWORD PTR 56[rsp], r9
	add	rax, rsi
	adc	rdx, rdi
	xor	esi, esi
	add	rax, r10
	mov	rdi, QWORD PTR 144[rsp]
	mov	r9, rax
	mov	rax, QWORD PTR 152[rsp]
	adc	rdx, rsi
	xor	ebx, ebx
	mov	QWORD PTR 40[rsp], r9
	mov	r10, rdx
	xor	edx, edx
	mov	r9, QWORD PTR 120[rsp]
	add	rax, r12
	mov	rsi, QWORD PTR 136[rsp]
	adc	rdx, rbx
	xor	r12d, r12d
	add	rax, r10
	mov	r10, QWORD PTR 128[rsp]
	adc	rdx, r12
	mov	r11, rax
	mov	rax, r9
	xor	ebx, ebx
	mov	r12, rdx
	xor	edx, edx
	add	rax, rsi
	mov	rsi, rdi
	mov	rdi, QWORD PTR 384[rsp]
	adc	rdx, rbx
	xor	r13d, r13d
	add	rax, r12
	adc	rdx, r13
	lea	rcx, [r15+r10]
	mov	QWORD PTR 136[rsp], r11
	mov	r11, rax
	lea	rax, [rsi+rdi]
	mov	r12, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	mov	QWORD PTR 120[rsp], r11
	adc	rdx, rbx
	xor	esi, esi
	add	rax, r12
	adc	rdx, rsi
	mov	QWORD PTR 24[rsp], rax
	xor	esi, esi
	xor	edi, edi
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, QWORD PTR 536[rsp]
	xor	r13d, r13d
	xor	ebx, ebx
	mov	QWORD PTR 16[rsp], rsi
	mulx	rdx, rax, r14
	mov	QWORD PTR 216[rsp], rax
	mov	QWORD PTR 224[rsp], rdx
	mov	QWORD PTR 8[rsp], rdx
	mov	rdx, QWORD PTR 520[rsp]
	mov	QWORD PTR 208[rsp], rdi
	mulx	r11, r10, r14
	mov	rdx, QWORD PTR 504[rsp]
	mov	QWORD PTR 192[rsp], r13
	xor	r13d, r13d
	mov	QWORD PTR 176[rsp], r13
	mulx	rdi, rsi, r14
	mov	rdx, QWORD PTR 280[rsp]
	mov	QWORD PTR 400[rsp], 0
	mov	QWORD PTR 384[rsp], 0
	mulx	r9, r8, r14
	mov	rdx, QWORD PTR 312[rsp]
	mov	QWORD PTR 200[rsp], r11
	mulx	r13, r12, r14
	xor	edx, edx
	mov	QWORD PTR 184[rsp], rdi
	mov	QWORD PTR 160[rsp], rdx
	mov	rdx, r14
	mulx	r15, r14, r14
	mov	QWORD PTR 168[rsp], r9
	mov	QWORD PTR 376[rsp], r8
	mov	QWORD PTR 392[rsp], r12
	mov	QWORD PTR 152[rsp], r13
	mov	r13, QWORD PTR 168[rsp]
	mov	rcx, r14
	mov	r14, r15
	add	rcx, QWORD PTR 360[rsp]
	adc	rbx, QWORD PTR 368[rsp]
	mov	rax, r14
	xor	r15d, r15d
	add	rax, QWORD PTR 392[rsp]
	mov	QWORD PTR 360[rsp], rsi
	mov	QWORD PTR 368[rsp], 0
	mov	rdx, r15
	adc	rdx, QWORD PTR 400[rsp]
	xor	r14d, r14d
	add	rax, rbx
	mov	r15, QWORD PTR 160[rsp]
	adc	rdx, r14
	xor	r14d, r14d
	mov	r8, rdx
	mov	r9, r14
	mov	r14, QWORD PTR 152[rsp]
	add	r14, QWORD PTR 376[rsp]
	adc	r15, QWORD PTR 384[rsp]
	add	r8, r14
	adc	r9, r15
	xor	r14d, r14d
	mov	rsi, r9
	mov	rdi, r14
	mov	r14, QWORD PTR 176[rsp]
	add	r13, QWORD PTR 360[rsp]
	adc	r14, QWORD PTR 368[rsp]
	add	rsi, r13
	mov	QWORD PTR 344[rsp], r10
	adc	rdi, r14
	xor	r14d, r14d
	mov	QWORD PTR 352[rsp], 0
	mov	r15, QWORD PTR 192[rsp]
	mov	r13, r14
	mov	r14, QWORD PTR 184[rsp]
	add	r14, QWORD PTR 344[rsp]
	mov	QWORD PTR 336[rsp], 0
	adc	r15, QWORD PTR 352[rsp]
	add	r14, rdi
	mov	r10, QWORD PTR 200[rsp]
	adc	r15, r13
	mov	r13, QWORD PTR 216[rsp]
	mov	r11, QWORD PTR 208[rsp]
	mov	r12, r15
	mov	QWORD PTR 328[rsp], r13
	xor	r13d, r13d
	add	r10, QWORD PTR 328[rsp]
	adc	r11, QWORD PTR 336[rsp]
	add	r12, r10
	mov	r10, QWORD PTR 104[rsp]
	adc	r13, r11
	mov	QWORD PTR -8[rsp], r12
	mov	r12, QWORD PTR 488[rsp]
	xor	r11d, r11d
	mov	QWORD PTR [rsp], r13
	mov	r13, QWORD PTR 496[rsp]
	add	r12, r10
	adc	r13, r11
	xor	r11d, r11d
	mov	QWORD PTR 488[rsp], r12
	mov	r10, r13
	xor	r13d, r13d
	add	r10, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	r11, r13
	mov	r12, r10
	xor	ebx, ebx
	mov	r13, r11
	add	r12, rcx
	adc	r13, rbx
	xor	r11d, r11d
	xor	ebx, ebx
	mov	QWORD PTR 104[rsp], r12
	mov	rcx, r13
	add	rcx, rax
	mov	rax, QWORD PTR 56[rsp]
	adc	rbx, r11
	xor	edx, edx
	add	rcx, rax
	mov	rax, QWORD PTR 40[rsp]
	adc	rbx, rdx
	mov	QWORD PTR 88[rsp], rcx
	xor	edx, edx
	mov	rcx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, r14
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 136[rsp]
	add	r9, r8
	mov	r10, rdx
	adc	r10, rbx
	mov	QWORD PTR 56[rsp], r9
	xor	edx, edx
	mov	r9, r10
	xor	r10d, r10d
	add	rax, r9
	adc	rdx, r10
	xor	ebx, ebx
	add	rax, rsi
	adc	rdx, rbx
	mov	QWORD PTR 40[rsp], rax
	mov	rax, QWORD PTR 120[rsp]
	xor	edi, edi
	mov	rsi, rdx
	xor	edx, edx
	add	rax, rsi
	mov	r13, rax
	adc	rdx, rdi
	xor	ebx, ebx
	add	r13, rcx
	mov	r14, rdx
	mov	QWORD PTR 120[rsp], r13
	mov	r11, QWORD PTR 24[rsp]
	adc	r14, rbx
	xor	edx, edx
	mov	r13, r14
	mov	r8, QWORD PTR -8[rsp]
	mov	r12, QWORD PTR 32[rsp]
	xor	r14d, r14d
	mov	rax, r11
	mov	r9, QWORD PTR [rsp]
	mov	rdi, QWORD PTR 224[rsp]
	mov	QWORD PTR 496[rsp], 0
	add	rax, r13
	mov	r11, r12
	adc	rdx, r14
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, r11
	add	r14, r8
	mov	r15, rdx
	lea	rcx, [r9+rdi]
	adc	r15, rbx
	xor	r12d, r12d
	xor	ebx, ebx
	add	rax, rcx
	mov	rdx, r12
	mov	QWORD PTR 24[rsp], r14
	mov	r14, QWORD PTR 488[rsp]
	adc	rdx, rbx
	xor	r12d, r12d
	add	rax, r15
	adc	rdx, r12
	mov	QWORD PTR 216[rsp], rax
	xor	r15d, r15d
	mov	QWORD PTR 224[rsp], rdx
	movabs	rdx, 620258357900100
	mulx	rdx, rax, r14
	mov	r13, rdx
	mov	QWORD PTR -8[rsp], rax
	movabs	rdx, 7853257225132122198
	mulx	r12, r11, r14
	movabs	rdx, 8918917783347572387
	mulx	rdi, rsi, r14
	movabs	rdx, -161717841442111489
	mulx	r9, r8, r14
	mov	rdx, -1
	mulx	rdx, rax, r14
	mov	QWORD PTR -24[rsp], r11
	mov	QWORD PTR -16[rsp], r12
	xor	r12d, r12d
	mov	rbx, r12
	mov	r12, QWORD PTR 496[rsp]
	mov	QWORD PTR 488[rsp], rax
	mov	rcx, rdx
	mov	rax, r8
	mov	r11, QWORD PTR 488[rsp]
	mov	r8, r9
	add	r11, rdx
	adc	r12, rbx
	xor	edx, edx
	mov	QWORD PTR 136[rsp], r11
	mov	QWORD PTR 144[rsp], r12
	mov	r11, r12
	mov	r12, rdx
	add	r11, QWORD PTR 136[rsp]
	adc	r12, QWORD PTR 144[rsp]
	mov	QWORD PTR -40[rsp], r11
	xor	edx, edx
	add	rax, rcx
	mov	r11, r12
	adc	rdx, rbx
	xor	r12d, r12d
	mov	rbx, rdi
	add	rax, r11
	mov	rcx, QWORD PTR -8[rsp]
	adc	rdx, r12
	mov	r10, rax
	mov	rax, rsi
	xor	r9d, r9d
	mov	r11, rdx
	xor	edx, edx
	add	rax, r8
	mov	r12, QWORD PTR -16[rsp]
	mov	r8, r11
	mov	r11, QWORD PTR -24[rsp]
	adc	rdx, r9
	xor	r9d, r9d
	add	r8, rax
	mov	QWORD PTR -56[rsp], r10
	mov	rax, r11
	adc	r9, rdx
	xor	esi, esi
	xor	edx, edx
	add	rax, rbx
	adc	rdx, rsi
	xor	esi, esi
	mov	rdi, rsi
	mov	rsi, r9
	add	rsi, rax
	mov	rax, r12
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	xor	r12d, r12d
	add	rax, rdi
	mov	rcx, QWORD PTR 136[rsp]
	adc	rdx, r12
	mov	r11, rax
	mov	rax, QWORD PTR 488[rsp]
	mov	r12, rdx
	mov	rdx, QWORD PTR 496[rsp]
	add	rax, r14
	adc	rdx, r15
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 104[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR -8[rsp], rax
	mov	rax, rdx
	xor	edx, edx
	mov	rcx, rax
	mov	rax, QWORD PTR 88[rsp]
	mov	rbx, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR -40[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 56[rsp]
	add	r14, rcx
	mov	r15, rdx
	mov	rcx, QWORD PTR -56[rsp]
	adc	r15, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR -24[rsp], r14
	add	rax, r15
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 56[rsp], rax
	mov	rax, QWORD PTR 40[rsp]
	xor	ebx, ebx
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, rsi
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 120[rsp]
	add	r9, r8
	mov	r10, rdx
	adc	r10, rbx
	mov	QWORD PTR 40[rsp], r9
	xor	edx, edx
	mov	r9, r10
	xor	r10d, r10d
	add	rax, r9
	adc	rdx, r10
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 24[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	lea	rcx, 0[r13+r12]
	adc	rdi, rbx
	mov	QWORD PTR -40[rsp], rsi
	xor	edx, edx
	xor	esi, esi
	add	rax, rdi
	adc	rdx, rsi
	mov	rsi, rax
	mov	rax, QWORD PTR 216[rsp]
	xor	ebx, ebx
	mov	rdi, rdx
	add	rsi, r11
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	adc	rdx, rbx
	mov	r11, rax
	xor	r12d, r12d
	mov	QWORD PTR 24[rsp], rsi
	add	r11, rdi
	mov	rbx, r12
	mov	r12, rdx
	mov	rdx, QWORD PTR 312[rsp]
	adc	r12, rbx
	mov	QWORD PTR -56[rsp], r11
	xor	r15d, r15d
	xor	r9d, r9d
	mov	QWORD PTR -48[rsp], r12
	mulx	r12, r11, QWORD PTR 536[rsp]
	mov	QWORD PTR 128[rsp], r15
	xor	r15d, r15d
	mov	QWORD PTR 112[rsp], r15
	mulx	r15, r14, QWORD PTR 280[rsp]
	mov	QWORD PTR 136[rsp], r11
	mov	r11, r12
	mov	QWORD PTR 144[rsp], r12
	xor	r12d, r12d
	mov	QWORD PTR -72[rsp], r11
	mulx	r11, r10, QWORD PTR 520[rsp]
	mov	QWORD PTR -64[rsp], r12
	mulx	r13, r12, QWORD PTR 504[rsp]
	mulx	rdx, rax, rdx
	mov	QWORD PTR 88[rsp], r15
	mov	QWORD PTR 120[rsp], r11
	mov	QWORD PTR 104[rsp], r13
	mov	rcx, rax
	mov	rax, rdx
	mov	QWORD PTR 96[rsp], r9
	mov	r8, QWORD PTR 296[rsp]
	mov	r9, QWORD PTR 304[rsp]
	add	r8, QWORD PTR 392[rsp]
	mov	QWORD PTR 488[rsp], r14
	adc	r9, QWORD PTR 400[rsp]
	xor	ebx, ebx
	add	rcx, QWORD PTR 152[rsp]
	mov	QWORD PTR 496[rsp], 0
	mov	rsi, r9
	adc	rbx, QWORD PTR 160[rsp]
	xor	edi, edi
	mov	QWORD PTR 392[rsp], r12
	add	rsi, rcx
	mov	r12, QWORD PTR 88[rsp]
	mov	r13, QWORD PTR 96[rsp]
	mov	QWORD PTR 400[rsp], 0
	adc	rdi, rbx
	xor	edx, edx
	add	rax, QWORD PTR 488[rsp]
	adc	rdx, QWORD PTR 496[rsp]
	xor	ebx, ebx
	add	rax, rdi
	mov	QWORD PTR 312[rsp], r10
	mov	r15, QWORD PTR 112[rsp]
	adc	rdx, rbx
	xor	r14d, r14d
	add	r12, QWORD PTR 392[rsp]
	adc	r13, QWORD PTR 400[rsp]
	mov	rcx, rdx
	mov	rbx, r14
	mov	QWORD PTR 320[rsp], 0
	mov	r11, QWORD PTR 128[rsp]
	add	rcx, r12
	mov	r10, QWORD PTR 120[rsp]
	mov	QWORD PTR 304[rsp], 0
	adc	rbx, r13
	xor	r14d, r14d
	mov	r13, r14
	mov	r14, QWORD PTR 104[rsp]
	add	r14, QWORD PTR 312[rsp]
	adc	r15, QWORD PTR 320[rsp]
	add	r14, rbx
	adc	r15, r13
	mov	r13, QWORD PTR 136[rsp]
	mov	r12, r15
	mov	QWORD PTR 296[rsp], r13
	xor	r13d, r13d
	add	r10, QWORD PTR 296[rsp]
	adc	r11, QWORD PTR 304[rsp]
	add	r12, r10
	mov	r10, QWORD PTR -8[rsp]
	adc	r13, r11
	xor	r11d, r11d
	mov	QWORD PTR 152[rsp], r12
	mov	QWORD PTR 160[rsp], r13
	mov	r12, r10
	mov	r13, r11
	add	r12, QWORD PTR 472[rsp]
	adc	r13, QWORD PTR 480[rsp]
	mov	QWORD PTR 472[rsp], r12
	mov	r12, r13
	xor	r13d, r13d
	mov	r10, r12
	mov	r11, r13
	xor	r13d, r13d
	mov	r12, QWORD PTR -48[rsp]
	add	r10, r8
	mov	r8, QWORD PTR -24[rsp]
	adc	r11, r13
	xor	r9d, r9d
	add	r10, r8
	adc	r11, r9
	xor	r9d, r9d
	mov	QWORD PTR -8[rsp], r10
	mov	r8, r11
	xor	r11d, r11d
	add	r8, rsi
	mov	rsi, QWORD PTR 56[rsp]
	adc	r9, r11
	xor	edi, edi
	mov	r11, QWORD PTR -56[rsp]
	add	r8, rsi
	adc	r9, rdi
	mov	QWORD PTR 56[rsp], r8
	mov	r8, r9
	xor	r9d, r9d
	mov	rsi, r8
	mov	r8, QWORD PTR 40[rsp]
	mov	rdi, r9
	xor	r9d, r9d
	add	rsi, r8
	mov	r8, rax
	adc	rdi, r9
	mov	rax, rsi
	xor	r9d, r9d
	mov	rsi, QWORD PTR -40[rsp]
	add	rax, r8
	mov	rdx, rdi
	mov	r8, QWORD PTR 472[rsp]
	adc	rdx, r9
	mov	QWORD PTR 40[rsp], rax
	xor	edi, edi
	mov	rax, rdx
	xor	edx, edx
	add	rax, rsi
	adc	rdx, rdi
	mov	r9, rax
	xor	edi, edi
	mov	r10, rdx
	add	r9, rcx
	mov	rcx, QWORD PTR 24[rsp]
	adc	r10, rdi
	mov	QWORD PTR -24[rsp], r9
	xor	ebx, ebx
	mov	r9, r10
	xor	r10d, r10d
	mov	rax, r9
	mov	rdx, r10
	mov	r9, QWORD PTR 152[rsp]
	mov	r10, QWORD PTR 160[rsp]
	add	rax, rcx
	mov	rcx, r14
	adc	rdx, rbx
	mov	r13, rax
	xor	ebx, ebx
	mov	rax, r11
	add	r13, rcx
	mov	r14, rdx
	mov	rcx, QWORD PTR 224[rsp]
	mov	r11, QWORD PTR 144[rsp]
	adc	r14, rbx
	mov	QWORD PTR 24[rsp], r13
	xor	edx, edx
	mov	r13, r14
	xor	r14d, r14d
	add	rax, r13
	adc	rdx, r14
	mov	r14, rax
	lea	rax, [r12+rcx]
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, r9
	adc	r15, rbx
	xor	edx, edx
	xor	ebx, ebx
	mov	QWORD PTR -40[rsp], r14
	mov	rcx, r15
	add	rcx, rax
	lea	rax, [r10+r11]
	adc	rbx, rdx
	mov	r11, rcx
	xor	edx, edx
	mov	r12, rbx
	add	r11, rax
	adc	r12, rdx
	mov	QWORD PTR 216[rsp], r11
	xor	r15d, r15d
	xor	r9d, r9d
	movabs	rdx, 620258357900100
	mov	QWORD PTR 224[rsp], r12
	mulx	rdx, rax, r8
	mov	r13, rdx
	mov	QWORD PTR -56[rsp], rax
	movabs	rdx, 7853257225132122198
	mulx	r12, r11, r8
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r8
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mulx	rdx, rax, r8
	mov	QWORD PTR 472[rsp], r11
	mov	r11, r15
	xor	r15d, r15d
	mov	QWORD PTR 480[rsp], r12
	mov	r14, rax
	mov	rax, rdx
	mov	r10, rdx
	mov	rdx, r11
	add	rax, r14
	adc	rdx, r15
	mov	QWORD PTR 152[rsp], rax
	mov	QWORD PTR 160[rsp], rdx
	mov	rax, rdx
	xor	edx, edx
	add	rax, QWORD PTR 152[rsp]
	adc	rdx, QWORD PTR 160[rsp]
	mov	QWORD PTR 136[rsp], rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 144[rsp], rdx
	mov	r12, QWORD PTR 144[rsp]
	xor	edx, edx
	add	rax, r10
	adc	rdx, r11
	mov	r10, r9
	mov	r9, r8
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
	mov	QWORD PTR -88[rsp], r11
	add	rsi, rax
	mov	rax, QWORD PTR 472[rsp]
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
	mov	rbx, QWORD PTR 480[rsp]
	mov	QWORD PTR 472[rsp], r11
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
	mov	rcx, QWORD PTR 152[rsp]
	adc	r12, rbx
	add	r9, r14
	adc	r10, r15
	xor	r15d, r15d
	xor	ebx, ebx
	mov	rax, r10
	mov	rdx, r15
	add	rax, rcx
	mov	rcx, QWORD PTR -8[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 56[rsp]
	add	r14, rcx
	mov	r15, rdx
	mov	rcx, QWORD PTR 136[rsp]
	adc	r15, rbx
	mov	QWORD PTR -8[rsp], r14
	xor	edx, edx
	mov	r14, r15
	xor	r15d, r15d
	add	rax, r14
	adc	rdx, r15
	mov	r8, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 40[rsp]
	add	r8, rcx
	mov	r9, rdx
	mov	rcx, QWORD PTR -88[rsp]
	adc	r9, rbx
	mov	QWORD PTR 56[rsp], r8
	xor	edx, edx
	mov	r8, r9
	xor	r9d, r9d
	add	rax, r8
	adc	rdx, r9
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 40[rsp], rax
	mov	rax, rdx
	xor	edx, edx
	mov	rcx, rax
	mov	rax, QWORD PTR -24[rsp]
	mov	rbx, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 472[rsp]
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 24[rsp]
	add	r9, rsi
	mov	r10, rdx
	adc	r10, rbx
	mov	QWORD PTR -24[rsp], r9
	xor	edx, edx
	mov	r9, r10
	xor	r10d, r10d
	add	rax, r9
	adc	rdx, r10
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR -40[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	adc	rdi, rbx
	mov	QWORD PTR 24[rsp], rsi
	xor	edx, edx
	xor	esi, esi
	add	rax, rdi
	adc	rdx, rsi
	xor	ebx, ebx
	add	rax, r11
	adc	rdx, rbx
	mov	QWORD PTR -40[rsp], rax
	mov	rax, QWORD PTR 216[rsp]
	xor	ebx, ebx
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	lea	rcx, 0[r13+r12]
	adc	rdx, rbx
	mov	r13, rax
	xor	ebx, ebx
	mov	r14, rdx
	add	r13, rcx
	adc	r14, rbx
	mov	QWORD PTR -56[rsp], r13
	xor	r10d, r10d
	xor	edi, edi
	mov	QWORD PTR -48[rsp], r14
	mov	rdx, QWORD PTR 280[rsp]
	xor	r14d, r14d
	mov	QWORD PTR -80[rsp], r14
	mov	r11, QWORD PTR 240[rsp]
	mov	QWORD PTR 160[rsp], r10
	mov	r10, QWORD PTR 232[rsp]
	mulx	r9, r8, QWORD PTR 536[rsp]
	mulx	r13, r12, QWORD PTR 520[rsp]
	add	r10, QWORD PTR 376[rsp]
	adc	r11, QWORD PTR 384[rsp]
	mov	QWORD PTR 144[rsp], rdi
	mov	rbx, QWORD PTR 168[rsp]
	mov	rsi, QWORD PTR 176[rsp]
	mulx	r15, r14, QWORD PTR 504[rsp]
	mulx	rdx, rax, rdx
	mov	QWORD PTR 280[rsp], r8
	mov	r8, r11
	mov	QWORD PTR 288[rsp], r9
	mov	QWORD PTR -88[rsp], r9
	xor	r9d, r9d
	mov	rcx, rax
	add	rbx, QWORD PTR 488[rsp]
	adc	rsi, QWORD PTR 496[rsp]
	add	r8, rbx
	mov	QWORD PTR 488[rsp], r14
	mov	rax, rdx
	adc	r9, rsi
	xor	ebx, ebx
	add	rcx, QWORD PTR 88[rsp]
	adc	rbx, QWORD PTR 96[rsp]
	mov	rsi, r9
	xor	edi, edi
	mov	QWORD PTR 152[rsp], r13
	add	rsi, rcx
	mov	QWORD PTR 136[rsp], r15
	mov	QWORD PTR 496[rsp], 0
	adc	rdi, rbx
	xor	edx, edx
	add	rax, QWORD PTR 488[rsp]
	adc	rdx, QWORD PTR 496[rsp]
	xor	ebx, ebx
	add	rax, rdi
	mov	QWORD PTR 472[rsp], r12
	adc	rdx, rbx
	mov	r14, QWORD PTR 136[rsp]
	xor	r13d, r13d
	add	r14, QWORD PTR 472[rsp]
	mov	r12, QWORD PTR 280[rsp]
	mov	r15, QWORD PTR 144[rsp]
	mov	QWORD PTR 480[rsp], 0
	adc	r15, QWORD PTR 480[rsp]
	add	r14, rdx
	mov	rcx, QWORD PTR 152[rsp]
	mov	QWORD PTR 384[rsp], 0
	adc	r15, r13
	xor	r13d, r13d
	mov	QWORD PTR 376[rsp], r12
	add	rcx, QWORD PTR 376[rsp]
	mov	r12, r15
	mov	rbx, QWORD PTR 160[rsp]
	adc	rbx, QWORD PTR 384[rsp]
	movabs	rdx, 620258357900100
	add	r12, rcx
	mov	rcx, QWORD PTR -8[rsp]
	adc	r13, rbx
	mov	QWORD PTR 232[rsp], r12
	xor	ebx, ebx
	mov	r12, QWORD PTR 456[rsp]
	mov	QWORD PTR 240[rsp], r13
	mov	r13, QWORD PTR 464[rsp]
	add	r12, rcx
	adc	r13, rbx
	mov	QWORD PTR 168[rsp], r12
	mov	r12, r13
	xor	r13d, r13d
	mov	rcx, r12
	mov	rbx, r13
	xor	r13d, r13d
	add	rcx, r10
	mov	r10, QWORD PTR 56[rsp]
	adc	rbx, r13
	mov	r12, rcx
	xor	r11d, r11d
	mov	r13, rbx
	add	r12, r10
	adc	r13, r11
	mov	QWORD PTR 88[rsp], r12
	xor	r11d, r11d
	mov	r12, r13
	xor	r13d, r13d
	mov	rcx, r12
	mov	rbx, r13
	add	rcx, r8
	mov	r8, QWORD PTR 40[rsp]
	adc	rbx, r11
	mov	r11, rcx
	xor	r9d, r9d
	mov	r12, rbx
	add	r11, r8
	mov	r8, QWORD PTR -24[rsp]
	adc	r12, r9
	xor	r9d, r9d
	mov	QWORD PTR 56[rsp], r11
	mov	rcx, r12
	mov	rbx, r9
	xor	r9d, r9d
	add	rcx, r8
	adc	rbx, r9
	mov	r10, rcx
	xor	r9d, r9d
	mov	r11, rbx
	add	r10, rsi
	mov	rsi, QWORD PTR 24[rsp]
	adc	r11, r9
	mov	QWORD PTR 40[rsp], r10
	xor	r10d, r10d
	xor	edi, edi
	mov	rcx, r11
	mov	rbx, r10
	add	rcx, rsi
	adc	rbx, rdi
	mov	r10, rcx
	xor	edi, edi
	mov	r11, rbx
	add	r10, rax
	adc	r11, rdi
	xor	esi, esi
	xor	edi, edi
	mov	QWORD PTR 24[rsp], r10
	mov	rbx, rsi
	mov	rsi, QWORD PTR -40[rsp]
	mov	rcx, r11
	add	rcx, rsi
	mov	rsi, r14
	mov	r13, rcx
	adc	rbx, rdi
	xor	edi, edi
	add	r13, rsi
	mov	r14, rbx
	mov	QWORD PTR -8[rsp], r13
	mov	r10, QWORD PTR -56[rsp]
	adc	r14, rdi
	xor	ebx, ebx
	mov	r13, r14
	xor	r14d, r14d
	mov	rax, QWORD PTR 224[rsp]
	mov	r11, QWORD PTR -48[rsp]
	mov	rcx, r10
	mov	r15, QWORD PTR 240[rsp]
	add	rcx, r13
	adc	rbx, r14
	mov	r14, QWORD PTR 232[rsp]
	mov	r8, rcx
	xor	edi, edi
	mov	r9, rbx
	lea	rcx, [r11+rax]
	add	r8, r14
	adc	r9, rdi
	mov	QWORD PTR -24[rsp], r8
	xor	ebx, ebx
	xor	r11d, r11d
	mov	r8, QWORD PTR 288[rsp]
	mov	rsi, r9
	mov	rdi, r11
	mov	QWORD PTR -16[rsp], r9
	add	rsi, rcx
	lea	rcx, [r15+r8]
	mov	r8, rsi
	adc	rdi, rbx
	xor	ebx, ebx
	add	r8, rcx
	mov	r9, rdi
	mov	QWORD PTR 456[rsp], r8
	mov	r8, QWORD PTR 168[rsp]
	adc	r9, rbx
	xor	r12d, r12d
	xor	r15d, r15d
	mov	QWORD PTR 464[rsp], r9
	xor	r9d, r9d
	mulx	rdx, rax, r8
	mov	r13, rdx
	mov	QWORD PTR 168[rsp], rax
	movabs	rdx, 7853257225132122198
	mulx	rdx, rax, r8
	mov	QWORD PTR 288[rsp], rdx
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r8
	mov	QWORD PTR 280[rsp], rax
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mulx	rdx, rax, r8
	mov	r14, rax
	mov	rax, rdx
	mov	r10, rdx
	mov	rdx, r12
	add	rax, r14
	adc	rdx, r15
	mov	QWORD PTR 232[rsp], rax
	mov	QWORD PTR 240[rsp], rdx
	mov	rax, rdx
	xor	edx, edx
	add	rax, QWORD PTR 232[rsp]
	adc	rdx, QWORD PTR 240[rsp]
	mov	QWORD PTR 216[rsp], rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 224[rsp], rdx
	mov	r11, QWORD PTR 224[rsp]
	xor	edx, edx
	add	rax, r10
	adc	rdx, r12
	mov	r10, r11
	xor	r11d, r11d
	mov	r12, r11
	mov	r11, r10
	add	r11, rax
	mov	rax, rcx
	mov	rcx, rbx
	adc	r12, rdx
	mov	QWORD PTR -40[rsp], r11
	xor	edi, edi
	xor	edx, edx
	mov	r11, r12
	add	rax, rsi
	mov	QWORD PTR -32[rsp], r12
	mov	rsi, r11
	adc	rdx, rdi
	xor	r12d, r12d
	add	rsi, rax
	mov	rax, QWORD PTR 280[rsp]
	mov	rdi, r12
	adc	rdi, rdx
	xor	ebx, ebx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 168[rsp]
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	mov	rdx, QWORD PTR 288[rsp]
	add	r11, rdi
	adc	r12, rbx
	xor	ebx, ebx
	mov	QWORD PTR 280[rsp], r11
	mov	rax, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, r12
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rcx
	mov	rcx, QWORD PTR 232[rsp]
	adc	r12, rbx
	add	r8, r14
	adc	r9, r15
	xor	ebx, ebx
	xor	edx, edx
	mov	rax, r9
	add	rax, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 232[rsp], rax
	mov	rax, QWORD PTR 56[rsp]
	xor	r9d, r9d
	mov	rcx, QWORD PTR 216[rsp]
	mov	r8, rdx
	xor	edx, edx
	add	rax, r8
	adc	rdx, r9
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR -40[rsp]
	adc	rdx, rbx
	mov	QWORD PTR 216[rsp], rax
	mov	rax, QWORD PTR 40[rsp]
	xor	r10d, r10d
	mov	r9, rdx
	xor	edx, edx
	add	rax, r9
	adc	rdx, r10
	mov	r9, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 24[rsp]
	add	r9, rcx
	mov	r10, rdx
	mov	rcx, QWORD PTR 280[rsp]
	adc	r10, rbx
	mov	QWORD PTR 168[rsp], r9
	xor	edx, edx
	mov	r9, r10
	xor	r10d, r10d
	add	rax, r9
	adc	rdx, r10
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR -8[rsp]
	add	r14, rsi
	mov	r15, rdx
	adc	r15, rbx
	xor	esi, esi
	xor	edx, edx
	mov	QWORD PTR 88[rsp], r14
	add	rax, r15
	mov	QWORD PTR 96[rsp], r15
	adc	rdx, rsi
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR -24[rsp]
	add	r14, rcx
	mov	r15, rdx
	lea	rcx, 0[r13+r12]
	adc	r15, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 56[rsp], r14
	add	rax, r15
	mov	QWORD PTR 64[rsp], r15
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 456[rsp]
	add	r8, r11
	mov	r9, rdx
	adc	r9, rbx
	mov	QWORD PTR 40[rsp], r8
	xor	edx, edx
	mov	r8, r9
	mov	QWORD PTR 48[rsp], r9
	xor	r9d, r9d
	add	rax, r8
	adc	rdx, r9
	mov	r13, rax
	xor	ebx, ebx
	mov	r14, rdx
	add	r13, rcx
	mov	rdx, QWORD PTR 504[rsp]
	mov	rcx, QWORD PTR 248[rsp]
	adc	r14, rbx
	mov	QWORD PTR 24[rsp], r13
	xor	r11d, r11d
	mov	rbx, QWORD PTR 256[rsp]
	mulx	r13, r12, QWORD PTR 536[rsp]
	mov	QWORD PTR 32[rsp], r14
	mulx	r15, r14, QWORD PTR 520[rsp]
	mulx	rdx, rax, rdx
	mov	QWORD PTR [rsp], r11
	xor	r11d, r11d
	add	rcx, QWORD PTR 360[rsp]
	adc	rbx, QWORD PTR 368[rsp]
	mov	QWORD PTR 288[rsp], r11
	xor	r11d, r11d
	mov	r10, rbx
	mov	QWORD PTR -8[rsp], r13
	mov	QWORD PTR 280[rsp], r15
	mov	QWORD PTR 360[rsp], rcx
	mov	rbx, QWORD PTR 104[rsp]
	mov	rcx, rax
	mov	rax, rdx
	mov	r8, QWORD PTR 184[rsp]
	add	r8, QWORD PTR 392[rsp]
	mov	QWORD PTR 504[rsp], r14
	mov	r9, QWORD PTR 192[rsp]
	adc	r9, QWORD PTR 400[rsp]
	add	r10, r8
	mov	QWORD PTR 512[rsp], 0
	adc	r11, r9
	xor	esi, esi
	add	rbx, QWORD PTR 488[rsp]
	mov	QWORD PTR 488[rsp], r12
	mov	r8, r11
	mov	r9, rsi
	mov	rsi, QWORD PTR 112[rsp]
	adc	rsi, QWORD PTR 496[rsp]
	mov	QWORD PTR 496[rsp], 0
	add	r8, rbx
	adc	r9, rsi
	xor	ebx, ebx
	add	rcx, QWORD PTR 136[rsp]
	adc	rbx, QWORD PTR 144[rsp]
	mov	rsi, r9
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	xor	r15d, r15d
	add	rax, QWORD PTR 504[rsp]
	mov	r14, rdi
	mov	rdx, r15
	adc	rdx, QWORD PTR 512[rsp]
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 280[rsp]
	adc	r15, rdx
	xor	ebx, ebx
	add	rax, QWORD PTR 488[rsp]
	mov	rdx, QWORD PTR 288[rsp]
	mov	rcx, r15
	adc	rdx, QWORD PTR 496[rsp]
	add	rcx, rax
	mov	rax, QWORD PTR 232[rsp]
	adc	rbx, rdx
	xor	edx, edx
	add	rax, QWORD PTR 440[rsp]
	mov	QWORD PTR 392[rsp], rcx
	adc	rdx, QWORD PTR 448[rsp]
	mov	QWORD PTR 400[rsp], rbx
	xor	ebx, ebx
	mov	QWORD PTR 440[rsp], rax
	mov	rcx, QWORD PTR 360[rsp]
	mov	rax, rdx
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 216[rsp]
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 168[rsp]
	adc	rdx, rbx
	mov	QWORD PTR 232[rsp], rax
	xor	ebx, ebx
	mov	rax, rdx
	xor	edx, edx
	add	rax, r10
	adc	rdx, rbx
	mov	r10, rax
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	mov	rcx, QWORD PTR 88[rsp]
	adc	r11, rbx
	mov	QWORD PTR 216[rsp], r10
	xor	ebx, ebx
	mov	r10, r11
	xor	r11d, r11d
	mov	rax, r10
	mov	rdx, r11
	mov	r11, QWORD PTR 400[rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR 56[rsp]
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, r8
	adc	r10, rbx
	mov	QWORD PTR 184[rsp], r9
	xor	ebx, ebx
	mov	r9, r10
	xor	r10d, r10d
	mov	rax, r9
	mov	rdx, r10
	mov	r10, QWORD PTR 392[rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR 40[rsp]
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, rsi
	adc	r9, rbx
	xor	esi, esi
	xor	ebx, ebx
	mov	QWORD PTR 168[rsp], r8
	mov	rax, r9
	mov	rdx, rsi
	add	rax, rcx
	mov	rcx, r14
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, rcx
	adc	r15, rbx
	mov	QWORD PTR 136[rsp], r14
	xor	edx, edx
	mov	r14, r15
	mov	QWORD PTR 144[rsp], r15
	xor	r15d, r15d
	mov	rcx, r14
	mov	r14, QWORD PTR 24[rsp]
	mov	rbx, r15
	mov	r15, QWORD PTR 32[rsp]
	mov	rax, r14
	add	rax, rcx
	mov	rcx, QWORD PTR 464[rsp]
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, r10
	lea	rax, [r15+rcx]
	adc	r9, rbx
	mov	QWORD PTR 104[rsp], r8
	xor	edx, edx
	mov	r8, r9
	mov	QWORD PTR 112[rsp], r9
	xor	r9d, r9d
	mov	rcx, r8
	mov	rbx, r9
	add	rcx, rax
	lea	rax, [r11+r13]
	adc	rbx, rdx
	mov	r13, rcx
	xor	edx, edx
	mov	r14, rbx
	add	r13, rax
	adc	r14, rdx
	mov	QWORD PTR 456[rsp], r13
	xor	r15d, r15d
	movabs	rdx, 620258357900100
	mov	QWORD PTR 464[rsp], r14
	mov	r14, QWORD PTR 440[rsp]
	mulx	r13, r12, r14
	movabs	rdx, 7853257225132122198
	mov	QWORD PTR 440[rsp], r12
	mov	QWORD PTR 448[rsp], r13
	mulx	r13, r12, r14
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r14
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, r14
	mov	rdx, -1
	mulx	rdx, rax, r14
	mov	QWORD PTR 392[rsp], r12
	xor	r12d, r12d
	mov	r11, r12
	mov	QWORD PTR 400[rsp], r13
	xor	r13d, r13d
	mov	r9, r11
	mov	r8, rdx
	mov	r10, rdx
	mov	r12, rax
	add	r8, rax
	adc	r9, r13
	mov	rdx, r9
	mov	rax, rdx
	xor	edx, edx
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR 360[rsp], rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 368[rsp], rdx
	xor	edx, edx
	add	rax, r10
	adc	rdx, r11
	mov	r11, QWORD PTR 368[rsp]
	mov	r10, r11
	xor	r11d, r11d
	add	r10, rax
	mov	rax, rcx
	mov	rcx, rbx
	adc	r11, rdx
	xor	edi, edi
	xor	edx, edx
	add	rax, rsi
	mov	rsi, QWORD PTR 392[rsp]
	adc	rdx, rdi
	xor	edi, edi
	add	rax, r11
	adc	rdx, rdi
	xor	ebx, ebx
	xor	edi, edi
	add	rsi, rcx
	adc	rdi, rbx
	xor	ebx, ebx
	add	rsi, rdx
	adc	rdi, rbx
	mov	QWORD PTR 248[rsp], rsi
	mov	QWORD PTR 256[rsp], rdi
	mov	rbx, QWORD PTR 400[rsp]
	mov	rcx, rbx
	xor	ebx, ebx
	mov	rsi, rcx
	mov	rcx, QWORD PTR 440[rsp]
	mov	rdi, rbx
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, rdi
	mov	rdi, QWORD PTR 256[rsp]
	mov	rsi, rdi
	xor	edi, edi
	add	rcx, rsi
	mov	rsi, QWORD PTR 232[rsp]
	mov	QWORD PTR 392[rsp], rcx
	adc	rbx, rdi
	mov	rcx, r14
	add	rcx, r12
	mov	QWORD PTR 400[rsp], rbx
	mov	rbx, r15
	adc	rbx, r13
	xor	edi, edi
	mov	rcx, rbx
	xor	ebx, ebx
	add	rcx, r8
	adc	rbx, rdi
	xor	edi, edi
	add	rcx, rsi
	mov	rsi, QWORD PTR 360[rsp]
	adc	rbx, rdi
	mov	QWORD PTR 232[rsp], rcx
	xor	r14d, r14d
	mov	rcx, QWORD PTR 216[rsp]
	mov	r13, rbx
	mov	QWORD PTR 240[rsp], rbx
	xor	ebx, ebx
	add	rcx, r13
	adc	rbx, r14
	mov	r12, rcx
	xor	edi, edi
	mov	rcx, QWORD PTR 184[rsp]
	add	r12, rsi
	mov	r13, rbx
	adc	r13, rdi
	mov	QWORD PTR 360[rsp], r12
	xor	ebx, ebx
	mov	r12, r13
	xor	r13d, r13d
	add	rcx, r12
	adc	rbx, r13
	mov	r11, rcx
	xor	edi, edi
	mov	rcx, QWORD PTR 168[rsp]
	add	r11, r10
	mov	r12, rbx
	adc	r12, rdi
	mov	QWORD PTR 216[rsp], r11
	xor	ebx, ebx
	mov	r11, r12
	mov	QWORD PTR 224[rsp], r12
	xor	r12d, r12d
	add	rcx, r11
	adc	rbx, r12
	xor	edi, edi
	add	rcx, rax
	mov	rax, QWORD PTR 136[rsp]
	adc	rbx, rdi
	mov	QWORD PTR 184[rsp], rcx
	xor	esi, esi
	xor	edx, edx
	mov	rcx, QWORD PTR 248[rsp]
	add	rax, rbx
	mov	QWORD PTR 192[rsp], rbx
	adc	rdx, rsi
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 104[rsp]
	add	r14, rcx
	mov	r15, rdx
	mov	rdi, QWORD PTR 448[rsp]
	adc	r15, rbx
	mov	QWORD PTR 248[rsp], r14
	xor	edx, edx
	mov	r14, r15
	xor	r15d, r15d
	add	rax, r14
	mov	r14, QWORD PTR 392[rsp]
	adc	rdx, r15
	mov	r8, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 456[rsp]
	add	r8, r14
	mov	r9, rdx
	mov	r15, QWORD PTR 400[rsp]
	adc	r9, rbx
	mov	QWORD PTR 392[rsp], r8
	xor	edx, edx
	mov	r8, r9
	xor	r9d, r9d
	lea	rcx, [rdi+r15]
	add	rax, r8
	adc	rdx, r9
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	mov	rdx, QWORD PTR 520[rsp]
	add	r9, rcx
	adc	r10, rbx
	mov	QWORD PTR 440[rsp], r9
	mulx	r15, r14, QWORD PTR 536[rsp]
	mov	QWORD PTR 448[rsp], r10
	xor	r10d, r10d
	mulx	rdx, rax, rdx
	mov	QWORD PTR 168[rsp], r15
	mov	QWORD PTR 176[rsp], r10
	mov	rcx, QWORD PTR 264[rsp]
	mov	rbx, QWORD PTR 272[rsp]
	add	rcx, QWORD PTR 344[rsp]
	mov	QWORD PTR 520[rsp], r14
	adc	rbx, QWORD PTR 352[rsp]
	xor	r10d, r10d
	mov	rsi, QWORD PTR 200[rsp]
	mov	QWORD PTR 528[rsp], 0
	add	rsi, QWORD PTR 312[rsp]
	mov	r11, r10
	mov	r10, rbx
	mov	rdi, QWORD PTR 208[rsp]
	adc	rdi, QWORD PTR 320[rsp]
	add	r10, rsi
	mov	rsi, QWORD PTR 120[rsp]
	adc	r11, rdi
	xor	r9d, r9d
	add	rsi, QWORD PTR 472[rsp]
	mov	rdi, QWORD PTR 128[rsp]
	mov	r8, r11
	adc	rdi, QWORD PTR 480[rsp]
	add	r8, rsi
	mov	rsi, QWORD PTR 152[rsp]
	adc	r9, rdi
	xor	edi, edi
	add	rsi, QWORD PTR 504[rsp]
	mov	r12, r9
	mov	r13, rdi
	mov	rdi, QWORD PTR 160[rsp]
	adc	rdi, QWORD PTR 512[rsp]
	add	r12, rsi
	mov	rsi, rax
	mov	rax, rdx
	adc	r13, rdi
	mov	QWORD PTR 504[rsp], r12
	xor	edi, edi
	add	rsi, QWORD PTR 280[rsp]
	mov	r12, r13
	adc	rdi, QWORD PTR 288[rsp]
	xor	r13d, r13d
	add	r12, rsi
	adc	r13, rdi
	xor	edi, edi
	add	rax, QWORD PTR 520[rsp]
	mov	rdx, rdi
	adc	rdx, QWORD PTR 528[rsp]
	xor	edi, edi
	add	rax, r13
	adc	rdx, rdi
	mov	QWORD PTR 472[rsp], rax
	mov	rax, QWORD PTR 232[rsp]
	mov	QWORD PTR 480[rsp], rdx
	xor	edx, edx
	mov	rsi, rax
	mov	rdi, rdx
	add	rsi, QWORD PTR 424[rsp]
	adc	rdi, QWORD PTR 432[rsp]
	mov	QWORD PTR 424[rsp], rsi
	mov	rsi, rdi
	xor	edi, edi
	mov	rax, rsi
	mov	rdx, rdi
	xor	edi, edi
	add	rax, rcx
	mov	rcx, QWORD PTR 360[rsp]
	adc	rdx, rdi
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, QWORD PTR 216[rsp]
	adc	rdx, rbx
	mov	QWORD PTR 360[rsp], rax
	xor	ebx, ebx
	mov	rax, rdx
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, r10
	adc	rdx, rbx
	mov	r10, rax
	xor	ebx, ebx
	mov	r11, rdx
	add	r10, rcx
	mov	rcx, QWORD PTR 184[rsp]
	adc	r11, rbx
	mov	QWORD PTR 344[rsp], r10
	xor	ebx, ebx
	mov	r10, r11
	xor	r11d, r11d
	mov	rax, r10
	mov	rdx, r11
	mov	r11, QWORD PTR 480[rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR 248[rsp]
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, r8
	adc	r10, rbx
	mov	QWORD PTR 312[rsp], r9
	xor	ebx, ebx
	mov	r9, r10
	xor	r10d, r10d
	mov	rax, r9
	mov	rdx, r10
	add	rax, rcx
	mov	rcx, QWORD PTR 504[rsp]
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	r10, rdx
	add	r9, rcx
	mov	rcx, QWORD PTR 392[rsp]
	adc	r10, rbx
	xor	esi, esi
	xor	ebx, ebx
	mov	QWORD PTR 280[rsp], r9
	mov	rax, r10
	mov	rdx, rsi
	mov	QWORD PTR 288[rsp], r10
	mov	r10, QWORD PTR 472[rsp]
	add	rax, rcx
	adc	rdx, rbx
	mov	r8, rax
	xor	ebx, ebx
	mov	r9, rdx
	add	r8, r12
	adc	r9, rbx
	mov	QWORD PTR 392[rsp], r8
	xor	edx, edx
	mov	r8, r9
	xor	r9d, r9d
	mov	rcx, r8
	mov	r8, QWORD PTR 440[rsp]
	mov	rbx, r9
	mov	r9, QWORD PTR 448[rsp]
	mov	rax, r8
	mov	r8, QWORD PTR 424[rsp]
	add	rax, rcx
	mov	rcx, QWORD PTR 464[rsp]
	adc	rdx, rbx
	mov	r12, rax
	xor	ebx, ebx
	mov	r13, rdx
	add	r12, r10
	lea	rax, [r9+rcx]
	adc	r13, rbx
	xor	edx, edx
	xor	ebx, ebx
	mov	QWORD PTR 264[rsp], r12
	mov	rcx, r13
	mov	QWORD PTR 272[rsp], r13
	add	rcx, rax
	lea	rax, [r11+r15]
	adc	rbx, rdx
	mov	r14, rcx
	xor	edx, edx
	mov	r15, rbx
	add	r14, rax
	adc	r15, rdx
	mov	QWORD PTR 504[rsp], r14
	xor	r9d, r9d
	movabs	rdx, 620258357900100
	mulx	rdx, rax, r8
	mov	QWORD PTR 512[rsp], r15
	xor	r15d, r15d
	mov	r11, r15
	xor	r15d, r15d
	mov	r13, rdx
	mov	QWORD PTR 424[rsp], rax
	movabs	rdx, 7853257225132122198
	mulx	rdi, rsi, r8
	movabs	rdx, 8918917783347572387
	mulx	rbx, rcx, r8
	movabs	rdx, -161717841442111489
	mov	QWORD PTR 472[rsp], rsi
	mov	QWORD PTR 480[rsp], rdi
	mulx	rdi, rsi, r8
	mov	rdx, -1
	mulx	rdx, rax, r8
	mov	r14, rax
	mov	rax, rdx
	mov	r10, rdx
	mov	rdx, r11
	add	rax, r14
	adc	rdx, r15
	mov	QWORD PTR 456[rsp], rax
	mov	QWORD PTR 464[rsp], rdx
	mov	rax, rdx
	xor	edx, edx
	add	rax, QWORD PTR 456[rsp]
	adc	rdx, QWORD PTR 464[rsp]
	mov	QWORD PTR 440[rsp], rax
	mov	rax, rsi
	mov	rsi, rdi
	mov	QWORD PTR 448[rsp], rdx
	mov	r12, QWORD PTR 448[rsp]
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
	mov	QWORD PTR 248[rsp], r11
	add	rsi, rax
	mov	rax, QWORD PTR 472[rsp]
	mov	QWORD PTR 256[rsp], r12
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
	mov	rbx, QWORD PTR 480[rsp]
	mov	QWORD PTR 472[rsp], r11
	mov	rcx, rbx
	xor	ebx, ebx
	mov	rax, rcx
	mov	rcx, QWORD PTR 424[rsp]
	mov	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	mov	rcx, r12
	adc	rdx, rbx
	mov	r11, rax
	xor	ebx, ebx
	mov	r12, rdx
	add	r11, rcx
	mov	rcx, QWORD PTR 456[rsp]
	adc	r12, rbx
	add	r8, r14
	adc	r9, r15
	xor	r15d, r15d
	xor	ebx, ebx
	mov	rax, r9
	mov	rdx, r15
	add	rax, rcx
	mov	rcx, QWORD PTR 360[rsp]
	adc	rdx, rbx
	mov	r14, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 344[rsp]
	add	r14, rcx
	mov	r15, rdx
	mov	rcx, QWORD PTR 440[rsp]
	adc	r15, rbx
	mov	QWORD PTR 456[rsp], r14
	xor	edx, edx
	mov	r14, r15
	xor	r15d, r15d
	add	rax, r14
	adc	rdx, r15
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 440[rsp], rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 312[rsp]
	mov	rcx, rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 248[rsp]
	adc	rdx, rbx
	mov	r9, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 280[rsp]
	add	r9, rcx
	mov	r10, rdx
	mov	rcx, rsi
	adc	r10, rbx
	mov	QWORD PTR 424[rsp], r9
	xor	edx, edx
	mov	r9, r10
	xor	r10d, r10d
	add	rax, r9
	adc	rdx, r10
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 392[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	mov	rcx, QWORD PTR 472[rsp]
	adc	rdi, rbx
	mov	QWORD PTR 360[rsp], rsi
	xor	edx, edx
	xor	esi, esi
	add	rax, rdi
	adc	rdx, rsi
	mov	r8, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 264[rsp]
	add	r8, rcx
	mov	r9, rdx
	lea	rcx, 0[r13+r12]
	adc	r9, rbx
	mov	QWORD PTR 392[rsp], r8
	xor	edx, edx
	mov	r8, r9
	xor	r9d, r9d
	add	rax, r8
	adc	rdx, r9
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 504[rsp]
	add	rsi, r11
	mov	rdi, rdx
	adc	rdi, rbx
	xor	ebx, ebx
	xor	edx, edx
	mov	QWORD PTR 344[rsp], rsi
	add	rax, rdi
	adc	rdx, rbx
	mov	r10, rax
	xor	ebx, ebx
	mov	r11, rdx
	mov	rdx, QWORD PTR 536[rsp]
	add	r10, rcx
	adc	r11, rbx
	mov	QWORD PTR 312[rsp], r10
	mulx	r14, r13, rdx
	mov	QWORD PTR 320[rsp], r11
	mov	QWORD PTR 472[rsp], r13
	mov	QWORD PTR 480[rsp], r14
	mov	r12, QWORD PTR 72[rsp]
	mov	r13, QWORD PTR 80[rsp]
	add	r12, QWORD PTR 328[rsp]
	adc	r13, QWORD PTR 336[rsp]
	mov	rax, QWORD PTR 8[rsp]
	xor	r9d, r9d
	mov	r8, r13
	add	rax, QWORD PTR 296[rsp]
	mov	rdx, QWORD PTR 16[rsp]
	adc	rdx, QWORD PTR 304[rsp]
	add	r8, rax
	mov	rax, QWORD PTR -72[rsp]
	adc	r9, rdx
	xor	esi, esi
	mov	rdx, QWORD PTR -64[rsp]
	add	rax, QWORD PTR 376[rsp]
	mov	rdi, rsi
	mov	rsi, r9
	adc	rdx, QWORD PTR 384[rsp]
	mov	QWORD PTR 328[rsp], r8
	add	rsi, rax
	mov	rax, QWORD PTR -88[rsp]
	mov	QWORD PTR 336[rsp], r9
	adc	rdi, rdx
	xor	ebx, ebx
	add	rax, QWORD PTR 488[rsp]
	mov	rdx, QWORD PTR -80[rsp]
	mov	rcx, rdi
	adc	rdx, QWORD PTR 496[rsp]
	add	rcx, rax
	mov	rax, QWORD PTR -8[rsp]
	adc	rbx, rdx
	xor	edx, edx
	add	rax, QWORD PTR 520[rsp]
	mov	r11, rdx
	mov	r14, rax
	mov	rdx, QWORD PTR [rsp]
	adc	rdx, QWORD PTR 528[rsp]
	mov	r15, rdx
	add	r14, rbx
	mov	rax, QWORD PTR 472[rsp]
	adc	r15, r11
	xor	edx, edx
	add	rax, QWORD PTR 168[rsp]
	adc	rdx, QWORD PTR 176[rsp]
	xor	r11d, r11d
	add	rax, r15
	adc	rdx, r11
	mov	QWORD PTR 520[rsp], rax
	mov	QWORD PTR 528[rsp], rdx
	mov	rax, QWORD PTR 456[rsp]
	xor	edx, edx
	mov	r10, QWORD PTR 408[rsp]
	mov	r11, QWORD PTR 416[rsp]
	mov	QWORD PTR 536[rsp], r12
	mov	r12, QWORD PTR 440[rsp]
	mov	QWORD PTR 544[rsp], 0
	add	r10, rax
	adc	r11, rdx
	xor	edx, edx
	mov	rax, r11
	add	rax, QWORD PTR 536[rsp]
	adc	rdx, QWORD PTR 544[rsp]
	xor	r13d, r13d
	add	rax, r12
	mov	r12, QWORD PTR 328[rsp]
	mov	r11, QWORD PTR 424[rsp]
	mov	QWORD PTR 544[rsp], 0
	adc	rdx, r13
	mov	QWORD PTR 488[rsp], rax
	xor	r13d, r13d
	mov	rax, rdx
	xor	edx, edx
	mov	QWORD PTR 536[rsp], r11
	add	rax, r12
	adc	rdx, r13
	mov	r11, rax
	add	r11, QWORD PTR 536[rsp]
	mov	QWORD PTR 536[rsp], rsi
	mov	r12, rdx
	adc	r12, QWORD PTR 544[rsp]
	xor	r13d, r13d
	mov	QWORD PTR 544[rsp], 0
	mov	rax, r12
	mov	r12, QWORD PTR 360[rsp]
	mov	rdx, r13
	xor	r13d, r13d
	mov	rsi, QWORD PTR 392[rsp]
	mov	QWORD PTR 456[rsp], r11
	add	rax, r12
	mov	r11, QWORD PTR 520[rsp]
	adc	rdx, r13
	mov	r12, rax
	add	r12, QWORD PTR 536[rsp]
	mov	r13, rdx
	adc	r13, QWORD PTR 544[rsp]
	xor	edi, edi
	mov	QWORD PTR 440[rsp], r12
	mov	r12, r13
	xor	r13d, r13d
	mov	rax, r12
	mov	rdx, r13
	add	rax, rsi
	mov	rsi, rcx
	adc	rdx, rdi
	mov	rcx, rax
	xor	edi, edi
	mov	rbx, rdx
	add	rcx, rsi
	adc	rbx, rdi
	mov	QWORD PTR 424[rsp], rcx
	xor	esi, esi
	mov	rcx, QWORD PTR 344[rsp]
	mov	rax, rbx
	xor	ebx, ebx
	mov	rdx, rsi
	add	rax, rcx
	mov	rsi, rax
	adc	rdx, rbx
	xor	ebx, ebx
	add	rsi, r14
	mov	rdi, rdx
	mov	QWORD PTR 408[rsp], rsi
	mov	rsi, QWORD PTR 312[rsp]
	adc	rdi, rbx
	xor	ebx, ebx
	mov	rcx, rdi
	xor	edx, edx
	mov	rdi, QWORD PTR 320[rsp]
	mov	r12, QWORD PTR 528[rsp]
	mov	rax, rsi
	mov	rsi, QWORD PTR 512[rsp]
	mov	QWORD PTR 536[rsp], r10
	mov	QWORD PTR 544[rsp], 0
	add	rax, rcx
	adc	rdx, rbx
	mov	r14, rax
	lea	rax, [rdi+rsi]
	xor	ebx, ebx
	mov	r15, rdx
	add	r14, r11
	mov	rsi, QWORD PTR 480[rsp]
	adc	r15, rbx
	mov	QWORD PTR 392[rsp], r14
	xor	r14d, r14d
	xor	edx, edx
	mov	rcx, r15
	mov	rbx, r14
	add	rcx, rax
	lea	rax, [rsi+r12]
	adc	rbx, rdx
	xor	edx, edx
	add	rcx, rax
	adc	rbx, rdx
	mov	QWORD PTR 520[rsp], rcx
	mov	rcx, -1
	xor	r11d, r11d
	mov	QWORD PTR 528[rsp], rbx
	mov	rbx, QWORD PTR 536[rsp]
	xor	r15d, r15d
	movabs	rdx, 620258357900100
	mulx	r10, r9, rbx
	movabs	rdx, 7853257225132122198
	mov	QWORD PTR 504[rsp], r9
	mov	QWORD PTR 328[rsp], r10
	mulx	r10, r9, rbx
	movabs	rdx, 8918917783347572387
	mulx	r13, r12, rbx
	movabs	rdx, -161717841442111489
	mulx	rdi, rsi, rbx
	mov	rdx, rbx
	mulx	rbx, rcx, rcx
	mov	QWORD PTR 472[rsp], r9
	mov	r9, r11
	mov	QWORD PTR 480[rsp], r10
	mov	r8, rbx
	mov	r14, rcx
	mov	r10, rbx
	add	r8, rcx
	adc	r9, r15
	xor	ecx, ecx
	mov	rdx, r9
	add	rdx, r8
	adc	rcx, r9
	mov	rax, rdx
	xor	ebx, ebx
	mov	rdx, rcx
	mov	rcx, rsi
	mov	rsi, rdi
	mov	QWORD PTR 376[rsp], rax
	add	rcx, r10
	mov	r10, rdx
	mov	rax, QWORD PTR 472[rsp]
	adc	rbx, r11
	xor	r11d, r11d
	add	r10, rcx
	mov	rcx, r12
	adc	r11, rbx
	xor	edi, edi
	xor	ebx, ebx
	add	rcx, rsi
	adc	rbx, rdi
	mov	rdx, rcx
	xor	edi, edi
	mov	r12, r13
	add	rdx, r11
	mov	rcx, rbx
	adc	rcx, rdi
	mov	rsi, rdx
	xor	ebx, ebx
	mov	rdx, QWORD PTR 480[rsp]
	mov	rdi, rcx
	xor	ecx, ecx
	mov	QWORD PTR 472[rsp], rsi
	mov	r13, rcx
	mov	rcx, rax
	mov	rsi, rdi
	mov	rax, QWORD PTR 536[rsp]
	add	rcx, r12
	mov	r12, rsi
	adc	rbx, r13
	xor	edi, edi
	add	r12, rcx
	mov	r13, rdi
	adc	r13, rbx
	xor	ecx, ecx
	xor	ebx, ebx
	mov	rdi, rcx
	mov	rcx, QWORD PTR 504[rsp]
	add	rcx, rdx
	mov	rdx, rcx
	adc	rbx, rdi
	xor	edi, edi
	add	rdx, r13
	mov	rcx, rbx
	mov	QWORD PTR 360[rsp], rdx
	mov	rdx, QWORD PTR 544[rsp]
	adc	rcx, rdi
	add	rax, r14
	mov	QWORD PTR 368[rsp], rcx
	mov	r14, QWORD PTR 472[rsp]
	adc	rdx, r15
	xor	ecx, ecx
	xor	ebx, ebx
	mov	rax, rdx
	mov	rdx, rcx
	mov	rcx, QWORD PTR 488[rsp]
	add	rax, r8
	adc	rdx, rbx
	xor	ebx, ebx
	add	rax, rcx
	adc	rdx, rbx
	mov	QWORD PTR 344[rsp], rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 456[rsp]
	mov	rcx, rdx
	mov	QWORD PTR 352[rsp], rdx
	xor	edx, edx
	add	rax, rcx
	mov	rcx, QWORD PTR 376[rsp]
	adc	rdx, rbx
	mov	rsi, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 440[rsp]
	add	rsi, rcx
	mov	rdi, rdx
	mov	rcx, r10
	adc	rdi, rbx
	mov	QWORD PTR 536[rsp], rsi
	xor	edx, edx
	xor	esi, esi
	add	rax, rdi
	mov	QWORD PTR 544[rsp], rdi
	adc	rdx, rsi
	mov	r10, rax
	xor	ebx, ebx
	mov	rax, QWORD PTR 424[rsp]
	add	r10, rcx
	mov	r11, rdx
	adc	r11, rbx
	xor	ecx, ecx
	xor	edx, edx
	add	rax, r11
	adc	rdx, rcx
	xor	r15d, r15d
	add	r14, rax
	mov	rax, QWORD PTR 408[rsp]
	adc	r15, rdx
	xor	r9d, r9d
	xor	edx, edx
	mov	rcx, QWORD PTR 392[rsp]
	add	rax, r15
	mov	r13, QWORD PTR 368[rsp]
	mov	rsi, QWORD PTR 520[rsp]
	mov	QWORD PTR 472[rsp], r10
	adc	rdx, r9
	xor	ebx, ebx
	add	rax, r12
	mov	r12, QWORD PTR 360[rsp]
	adc	rdx, rbx
	xor	r9d, r9d
	xor	ebx, ebx
	mov	QWORD PTR 504[rsp], rax
	add	rcx, rdx
	mov	QWORD PTR 512[rsp], rdx
	mov	rdx, r13
	mov	r13, QWORD PTR 328[rsp]
	adc	rbx, r9
	xor	edi, edi
	add	rcx, r12
	mov	QWORD PTR 480[rsp], r11
	adc	rbx, rdi
	xor	r9d, r9d
	xor	edi, edi
	mov	QWORD PTR 488[rsp], rcx
	add	rsi, rbx
	mov	rcx, QWORD PTR 344[rsp]
	lea	r8, 0[r13+rdx]
	mov	QWORD PTR 496[rsp], rbx
	adc	rdi, r9
	mov	r12, rsi
	xor	r9d, r9d
	mov	rsi, QWORD PTR 536[rsp]
	add	r12, r8
	mov	r13, rdi
	mov	rax, rcx
	adc	r13, r9
	xor	edi, edi
	add	rax, 1
	mov	QWORD PTR 456[rsp], r12
	mov	rdx, rdi
	mov	QWORD PTR 440[rsp], rax
	adc	rdx, -1
	xor	r9d, r9d
	xor	edi, edi
	mov	QWORD PTR 464[rsp], r13
	mov	QWORD PTR 448[rsp], rdx
	neg	edx
	movzx	r8d, dl
	sub	rsi, r8
	sbb	rdi, r9
	mov	r8, rsi
	mov	rsi, r10
	add	r8, 1
	mov	r9, rdi
	adc	r9, -1
	mov	QWORD PTR 424[rsp], r8
	xor	edi, edi
	mov	rdx, r9
	mov	QWORD PTR 432[rsp], r9
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
	mov	QWORD PTR 408[rsp], r9
	xor	edi, edi
	xor	r9d, r9d
	mov	rdx, r10
	mov	QWORD PTR 416[rsp], r10
	neg	edx
	movzx	r8d, dl
	sub	rsi, r8
	movabs	r8, 161717841442111489
	sbb	rdi, r9
	add	rsi, r8
	mov	r9, -1
	adc	rdi, r9
	mov	rax, rsi
	mov	rsi, QWORD PTR 504[rsp]
	xor	r9d, r9d
	mov	rdx, rdi
	xor	edi, edi
	mov	QWORD PTR 392[rsp], rax
	mov	QWORD PTR 400[rsp], rdx
	neg	edx
	movzx	r8d, dl
	sub	rsi, r8
	movabs	r8, -8918917783347572387
	sbb	rdi, r9
	add	rsi, r8
	mov	r9, -1
	mov	r8, QWORD PTR 488[rsp]
	adc	rdi, r9
	xor	r11d, r11d
	xor	r9d, r9d
	mov	QWORD PTR 376[rsp], rsi
	mov	rdx, rdi
	mov	QWORD PTR 384[rsp], rdi
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
	mov	QWORD PTR 360[rsp], rsi
	mov	rdx, rdi
	mov	QWORD PTR 368[rsp], rdi
	neg	edx
	movzx	r10d, dl
	mov	rdx, QWORD PTR 528[rsp]
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
	mov	QWORD PTR 520[rsp], r8
	neg	edx
	mov	QWORD PTR 528[rsp], r9
	mov	r15, QWORD PTR -96[rsp]
	movzx	r12d, dl
	mov	rbx, QWORD PTR 536[rsp]
	mov	rax, QWORD PTR 504[rsp]
	cmp	r10, r12
	mov	r10, QWORD PTR 472[rsp]
	mov	rsi, QWORD PTR 360[rsp]
	sbb	r11, r13
	mov	r13, QWORD PTR 392[rsp]
	mov	rdx, r11
	mov	rdi, r11
	mov	r11, QWORD PTR 424[rsp]
	not	rdx
	and	rbx, rdi
	and	rcx, rdi
	and	r10, rdi
	and	r11, rdx
	mov	r9, rcx
	and	r13, rdx
	and	rax, rdi
	or	r11, rbx
	mov	rbx, QWORD PTR 408[rsp]
	mov	rcx, QWORD PTR 440[rsp]
	and	rsi, rdx
	and	rbx, rdx
	and	rcx, rdx
	or	r10, rbx
	mov	rbx, r14
	or	r9, rcx
	mov	rcx, QWORD PTR 488[rsp]
	and	rbx, rdi
	vmovq	xmm2, r10
	vmovq	xmm3, r9
	mov	r12, rbx
	mov	rbx, QWORD PTR 376[rsp]
	and	rcx, rdi
	vpinsrq	xmm0, xmm3, r11, 1
	or	r12, r13
	or	rcx, rsi
	and	rdi, QWORD PTR 456[rsp]
	and	rbx, rdx
	vpinsrq	xmm1, xmm2, r12, 1
	and	rdx, QWORD PTR 520[rsp]
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
	.size	fiat_p434_square_gcc, .-fiat_p434_square_gcc
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
