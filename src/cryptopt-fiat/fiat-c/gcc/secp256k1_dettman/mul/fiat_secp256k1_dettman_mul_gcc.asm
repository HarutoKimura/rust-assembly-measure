	.file	"secp256k1_dettman_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_secp256k1_dettman_mul_gcc
	.type	fiat_secp256k1_dettman_mul_gcc, @function
fiat_secp256k1_dettman_mul_gcc:
.LFB2:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	rcx, rdi
	mov	r9, rdx
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
	mov	rbx, QWORD PTR 32[rsi]
	mov	rdi, QWORD PTR 32[rdx]
	mov	rax, QWORD PTR 8[rsi]
	mov	rdx, rbx
	mov	r13, QWORD PTR 16[r9]
	mov	r15, QWORD PTR [rsi]
	mulx	r11, r10, rdi
	mov	rdx, QWORD PTR [r9]
	mov	r12, QWORD PTR 24[r9]
	mov	QWORD PTR -104[rsp], rax
	mov	r14, QWORD PTR 8[r9]
	mov	rbp, QWORD PTR 16[rsi]
	mov	QWORD PTR -96[rsp], r15
	mov	QWORD PTR -112[rsp], rdx
	mov	rdx, rax
	mov	rsi, QWORD PTR 24[rsi]
	mulx	r9, r8, r13
	mov	rdx, r15
	mov	QWORD PTR -40[rsp], r14
	mulx	rdx, rax, r12
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR -88[rsp], rax
	mov	QWORD PTR -80[rsp], rdx
	mov	rdx, r14
	mulx	r9, r8, rbp
	mov	rdx, QWORD PTR -112[rsp]
	add	r8, QWORD PTR -88[rsp]
	adc	r9, QWORD PTR -80[rsp]
	mulx	rdx, rax, rsi
	add	rax, r8
	adc	rdx, r9
	mov	r15, rdx
	movabs	rdx, 68719492368
	mulx	r9, r8, r10
	mov	rdx, r15
	add	rax, r8
	adc	rdx, r9
	mov	r14, rax
	mov	r15, rdx
	mov	rdx, QWORD PTR -96[rsp]
	mov	r10, r14
	mulx	rdx, rax, rdi
	mov	QWORD PTR -80[rsp], rdx
	mov	rdx, rbp
	mulx	r9, r8, r13
	mov	QWORD PTR -88[rsp], rax
	add	r8, QWORD PTR -88[rsp]
	adc	r9, QWORD PTR -80[rsp]
	mov	rdx, QWORD PTR -104[rsp]
	mov	QWORD PTR -48[rsp], r15
	mov	QWORD PTR -56[rsp], r14
	mulx	rdx, rax, r12
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR -88[rsp], rax
	mov	QWORD PTR -80[rsp], rdx
	mov	rdx, QWORD PTR -40[rsp]
	mulx	r9, r8, rsi
	mov	rdx, QWORD PTR -112[rsp]
	add	r8, QWORD PTR -88[rsp]
	adc	r9, QWORD PTR -80[rsp]
	mulx	rdx, rax, rbx
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR -88[rsp], rax
	mov	rax, QWORD PTR -88[rsp]
	mov	QWORD PTR -80[rsp], rdx
	movabs	rdx, 281475040739328
	mulx	r9, r8, r11
	mov	rdx, QWORD PTR -80[rsp]
	mov	QWORD PTR -88[rsp], rbp
	add	rax, r8
	adc	rdx, r9
	shrd	r10, r15, 52
	xor	r9d, r9d
	add	rax, r10
	adc	rdx, r9
	mov	QWORD PTR -72[rsp], rax
	mov	r15, rax
	mov	rax, QWORD PTR -72[rsp]
	mov	QWORD PTR -64[rsp], rdx
	mov	rdx, rbp
	mov	rbp, QWORD PTR -96[rsp]
	mulx	r11, r10, r12
	mov	rdx, QWORD PTR -104[rsp]
	mov	QWORD PTR -32[rsp], r15
	mulx	r9, r8, rdi
	mov	rdx, r13
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rsi
	mov	rdx, QWORD PTR -40[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR -64[rsp]
	add	r8, r10
	adc	r9, r11
	shrd	rax, rdx, 52
	xor	r11d, r11d
	mov	r10, rax
	add	r10, r8
	mov	r8, r15
	mov	rax, r10
	adc	r11, r9
	shr	r8, 48
	sal	rax, 4
	and	r8d, 15
	mov	rdx, rax
	movabs	rax, 72057594037927920
	and	rax, rdx
	movabs	rdx, 4294968273
	or	rax, r8
	mulx	r15, r14, rax
	mov	rdx, QWORD PTR -112[rsp]
	mulx	r9, r8, rbp
	mov	rax, r14
	mov	rdx, r15
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR -72[rsp], rax
	mov	QWORD PTR -64[rsp], rdx
	mov	rdx, QWORD PTR -88[rsp]
	mulx	r9, r8, rdi
	mov	rdx, r12
	mulx	rdx, rax, rsi
	add	rax, r8
	adc	rdx, r9
	mov	r15, rdx
	mov	rdx, r13
	mulx	r9, r8, rbx
	mov	rdx, r15
	add	rax, r8
	adc	rdx, r9
	shrd	r10, r11, 52
	xor	r15d, r15d
	movabs	r11, 68719492368
	mov	r14, r10
	add	r14, rax
	adc	r15, rdx
	mov	rdx, rbp
	movabs	rbp, 4503599627370495
	mulx	r9, r8, QWORD PTR -40[rsp]
	mov	rdx, QWORD PTR -112[rsp]
	mulx	rdx, rax, QWORD PTR -104[rsp]
	mov	r10, QWORD PTR -72[rsp]
	add	r8, rax
	mov	rax, r14
	adc	r9, rdx
	and	rax, rbp
	mul	r11
	mov	r11, QWORD PTR -64[rsp]
	add	r8, rax
	adc	r9, rdx
	shrd	r10, r11, 52
	xor	edx, edx
	mov	rax, r10
	add	rax, r8
	adc	rdx, r9
	mov	QWORD PTR -24[rsp], rax
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, rdi
	mulx	rdi, rsi, rsi
	mov	rdx, r12
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR -96[rsp]
	mov	rbx, QWORD PTR -56[rsp]
	add	rsi, r8
	adc	rdi, r9
	shrd	r14, r15, 52
	xor	r9d, r9d
	mov	r15, QWORD PTR -16[rsp]
	mov	r8, r14
	mulx	r14, r13, r13
	mov	rdx, QWORD PTR -104[rsp]
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, QWORD PTR -40[rsp]
	mov	rdx, QWORD PTR -112[rsp]
	add	r13, rsi
	adc	r14, rdi
	mulx	rdi, rsi, QWORD PTR -88[rsp]
	movabs	rdx, 68719492368
	mulx	r11, r10, r8
	movabs	rdx, 281475040739328
	mulx	r9, r8, r9
	mov	rdx, QWORD PTR -72[rsp]
	add	rsi, r13
	adc	rdi, r14
	mov	r14, QWORD PTR -24[rsp]
	add	rsi, r10
	adc	rdi, r11
	xor	r11d, r11d
	mov	r12, r14
	mov	rax, r14
	shrd	r12, r15, 52
	mov	r10, r12
	add	r10, rsi
	adc	r11, rdi
	mov	r12, r10
	and	rbx, rbp
	xor	edi, edi
	shrd	r12, r11, 52
	lea	rsi, [rbx+r12]
	add	r8, rsi
	adc	r9, rdi
	and	rax, rbp
	and	rdx, rbp
	and	r10, rbp
	mov	QWORD PTR 8[rcx], rax
	and	rbp, r8
	shrd	r8, r9, 52
	movabs	rax, 281474976710655
	and	rax, QWORD PTR -32[rsp]
	pop	rbx
	.cfi_def_cfa_offset 48
	mov	QWORD PTR 24[rcx], rbp
	add	r8, rax
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	mov	QWORD PTR [rcx], rdx
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	mov	QWORD PTR 16[rcx], r10
	mov	QWORD PTR 32[rcx], r8
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	fiat_secp256k1_dettman_mul_gcc, .-fiat_secp256k1_dettman_mul_gcc
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
