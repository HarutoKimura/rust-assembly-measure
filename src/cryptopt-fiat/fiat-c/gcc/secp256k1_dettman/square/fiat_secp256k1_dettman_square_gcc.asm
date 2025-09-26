	.file	"secp256k1_dettman_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_secp256k1_dettman_square_gcc
	.type	fiat_secp256k1_dettman_square_gcc, @function
fiat_secp256k1_dettman_square_gcc:
.LFB2:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	mov	r14, QWORD PTR 16[rsi]
	mov	rbx, rdi
	mov	rcx, QWORD PTR [rsi]
	mov	r15, QWORD PTR 8[rsi]
	lea	rdx, [r14+r14]
	mov	rax, QWORD PTR 24[rsi]
	mov	QWORD PTR -72[rsp], rdx
	mov	rdx, QWORD PTR 32[rsi]
	lea	rbp, [rcx+rcx]
	lea	r8, [r15+r15]
	mov	QWORD PTR -24[rsp], rdx
	mulx	r11, r10, rdx
	mov	rdx, rbp
	mulx	r13, r12, rax
	mov	rdx, r8
	mulx	rdi, rsi, r14
	movabs	rdx, 68719492368
	add	rsi, r12
	adc	rdi, r13
	mulx	r13, r12, r10
	mov	rdx, QWORD PTR -24[rsp]
	add	rsi, r12
	adc	rdi, r13
	mov	QWORD PTR -56[rsp], rsi
	mov	QWORD PTR -48[rsp], rdi
	mulx	rdi, rsi, rbp
	mov	rdx, r8
	mulx	r13, r12, rax
	mov	rdx, r14
	add	r12, rsi
	adc	r13, rdi
	mulx	rdi, rsi, r14
	movabs	rdx, 281475040739328
	mulx	r11, r10, r11
	mov	rdx, QWORD PTR -24[rsp]
	mulx	r9, r8, r8
	mov	rdx, QWORD PTR -72[rsp]
	add	rsi, r12
	mov	r12, QWORD PTR -56[rsp]
	adc	rdi, r13
	mov	r13, QWORD PTR -48[rsp]
	add	rsi, r10
	adc	rdi, r11
	xor	r11d, r11d
	shrd	r12, r13, 52
	add	rsi, r12
	adc	rdi, r11
	mulx	r11, r10, rax
	mov	r13, rsi
	mov	QWORD PTR -16[rsp], r13
	add	r10, r8
	mov	r8, r13
	adc	r11, r9
	shrd	rsi, rdi, 52
	xor	r9d, r9d
	add	r10, rsi
	movabs	rsi, 72057594037927920
	mov	rdi, r10
	adc	r11, r9
	shr	r8, 48
	sal	rdi, 4
	and	r8d, 15
	and	rsi, rdi
	movabs	rdi, 4294968273
	or	rsi, r8
	mov	rdx, rsi
	mulx	rdi, rsi, rdi
	mov	rdx, rcx
	mulx	r9, r8, rcx
	mov	rdx, QWORD PTR -24[rsp]
	movabs	rcx, 4503599627370495
	add	rsi, r8
	adc	rdi, r9
	mov	QWORD PTR -40[rsp], rsi
	mov	QWORD PTR -32[rsp], rdi
	mulx	rdi, rsi, QWORD PTR -72[rsp]
	mov	rdx, rax
	mulx	r9, r8, rax
	movabs	rdx, 68719492368
	add	r8, rsi
	adc	r9, rdi
	shrd	r10, r11, 52
	xor	r13d, r13d
	mov	r11, QWORD PTR -32[rsp]
	mov	r12, r10
	mov	r10, QWORD PTR -40[rsp]
	add	r12, r8
	mov	rdi, r12
	adc	r13, r9
	and	rdi, rcx
	mulx	rdi, rsi, rdi
	mov	rdx, rbp
	mulx	r9, r8, r15
	add	rsi, r8
	adc	rdi, r9
	shrd	r10, r11, 52
	xor	r9d, r9d
	add	rsi, r10
	adc	rdi, r9
	add	rax, rax
	shrd	r12, r13, 52
	xor	r11d, r11d
	mul	QWORD PTR -24[rsp]
	mov	QWORD PTR -64[rsp], rdi
	mov	QWORD PTR -72[rsp], rsi
	add	rax, r12
	adc	rdx, r11
	mov	rdi, rdx
	mov	rdx, rbp
	mulx	r9, r8, r14
	mov	rdx, r15
	mov	r14, QWORD PTR -72[rsp]
	mulx	r11, r10, r15
	mov	r15, QWORD PTR -64[rsp]
	movabs	rdx, 68719492368
	mov	rsi, r14
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rax
	mov	rax, r14
	movabs	rdx, 281475040739328
	add	r10, r8
	adc	r11, r9
	shrd	rax, r15, 52
	xor	r9d, r9d
	mov	r8, rax
	mov	rax, QWORD PTR -56[rsp]
	add	r8, r10
	adc	r9, r11
	mov	r12, r8
	and	rax, rcx
	xor	r11d, r11d
	shrd	r12, r9, 52
	lea	r10, [rax+r12]
	mov	rax, rdi
	mov	rdi, QWORD PTR -40[rsp]
	mul	rdx
	add	rax, r10
	adc	rdx, r11
	and	rdi, rcx
	and	rsi, rcx
	and	r8, rcx
	and	rcx, rax
	shrd	rax, rdx, 52
	mov	QWORD PTR [rbx], rdi
	mov	QWORD PTR 24[rbx], rcx
	movabs	rcx, 281474976710655
	and	rcx, QWORD PTR -16[rsp]
	add	rax, rcx
	mov	QWORD PTR 8[rbx], rsi
	mov	QWORD PTR 16[rbx], r8
	mov	QWORD PTR 32[rbx], rax
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	fiat_secp256k1_dettman_square_gcc, .-fiat_secp256k1_dettman_square_gcc
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
