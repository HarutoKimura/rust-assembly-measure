	.file	"poly1305_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_poly1305_carry_mul_gcc
	.type	fiat_poly1305_carry_mul_gcc, @function
fiat_poly1305_carry_mul_gcc:
.LFB16:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	r8, rdi
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
	mov	rcx, QWORD PTR 8[rdx]
	mov	r9, QWORD PTR 16[rdx]
	mov	rbp, QWORD PTR 16[rsi]
	lea	rax, [rcx+rcx*4]
	mov	r12, QWORD PTR [rdx]
	mov	r13, QWORD PTR [rsi]
	add	rax, rax
	lea	r10, [r9+r9*4]
	mov	rbx, QWORD PTR 8[rsi]
	mov	rdx, rax
	lea	rsi, [r10+r10]
	mulx	r15, r14, rbp
	mov	rdx, rsi
	mulx	rdi, rsi, rbx
	mov	rdx, r12
	mulx	rdx, rax, r13
	add	rsi, r14
	adc	rdi, r15
	add	rsi, rax
	adc	rdi, rdx
	mov	rdx, r10
	mulx	r15, r14, rbp
	mov	rdx, r12
	mulx	r11, r10, rbx
	mov	rdx, r13
	mulx	rdx, rax, rcx
	add	r10, r14
	mov	r14, rsi
	adc	r11, r15
	add	rax, r10
	adc	rdx, r11
	shrd	r14, rdi, 44
	xor	r11d, r11d
	add	rax, r14
	adc	rdx, r11
	add	rcx, rcx
	mov	QWORD PTR -24[rsp], rax
	mov	QWORD PTR -16[rsp], rdx
	mov	rdx, rcx
	mov	r15, QWORD PTR -16[rsp]
	mulx	rbx, rcx, rbx
	mov	rdx, r12
	mulx	r11, r10, rbp
	mov	rdx, r13
	mulx	r14, r13, r9
	add	r10, rcx
	adc	r11, rbx
	add	r10, r13
	adc	r11, r14
	mov	r14, QWORD PTR -24[rsp]
	xor	ebx, ebx
	mov	rax, r14
	shrd	rax, r15, 43
	add	r10, rax
	mov	rax, r14
	adc	r11, rbx
	mov	rcx, r10
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	shrd	rcx, r11, 43
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	lea	rdx, [rcx+rcx*4]
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	movabs	rcx, 17592186044415
	and	rsi, rcx
	add	rsi, rdx
	movabs	rdx, 8796093022207
	mov	rdi, rsi
	and	rax, rdx
	and	rsi, rcx
	and	r10, rdx
	shr	rdi, 44
	mov	QWORD PTR [r8], rsi
	add	rax, rdi
	mov	rcx, rax
	shr	rax, 43
	and	rcx, rdx
	add	r10, rax
	mov	QWORD PTR 8[r8], rcx
	mov	QWORD PTR 16[r8], r10
	ret
	.cfi_endproc
.LFE16:
	.size	fiat_poly1305_carry_mul_gcc, .-fiat_poly1305_carry_mul_gcc
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
