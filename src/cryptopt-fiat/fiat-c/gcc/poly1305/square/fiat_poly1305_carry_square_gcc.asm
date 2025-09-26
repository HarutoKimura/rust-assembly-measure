	.file	"poly1305_square_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_poly1305_carry_square_gcc
	.type	fiat_poly1305_carry_square_gcc, @function
fiat_poly1305_carry_square_gcc:
.LFB16:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	mov	r14, rdi
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	rax, QWORD PTR 16[rsi]
	mov	rcx, QWORD PTR 8[rsi]
	mov	rbx, QWORD PTR [rsi]
	lea	rsi, [rax+rax*4]
	lea	r8, 0[0+rsi*4]
	lea	rbp, [rcx+rcx]
	mov	rdx, r8
	mulx	r9, r8, rcx
	mov	rdx, rbx
	mulx	r11, r10, rbx
	mov	rdx, rsi
	mulx	rdi, rsi, rax
	mov	rdx, rbx
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rbp
	mov	r12, r8
	add	r10, rsi
	adc	r11, rdi
	shrd	r12, r9, 44
	xor	edi, edi
	mov	rsi, r12
	add	rsi, r10
	lea	r10, [rax+rax]
	adc	rdi, r11
	mulx	r11, r10, r10
	mov	rdx, rcx
	mov	QWORD PTR -16[rsp], rsi
	mulx	rbx, rcx, rbp
	mov	QWORD PTR -8[rsp], rdi
	add	rcx, r10
	adc	rbx, r11
	shrd	rsi, rdi, 43
	xor	r13d, r13d
	movabs	rdi, 17592186044415
	add	rcx, rsi
	mov	rsi, QWORD PTR -16[rsp]
	adc	rbx, r13
	mov	r10, rcx
	and	r8, rdi
	shrd	r10, rbx, 43
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	lea	rax, [r10+r10*4]
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	add	r8, rax
	movabs	rax, 8796093022207
	mov	r9, r8
	and	rsi, rax
	and	r8, rdi
	and	rcx, rax
	shr	r9, 44
	mov	QWORD PTR [r14], r8
	add	rsi, r9
	mov	rdi, rsi
	shr	rsi, 43
	and	rdi, rax
	add	rcx, rsi
	mov	QWORD PTR 8[r14], rdi
	mov	QWORD PTR 16[r14], rcx
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE16:
	.size	fiat_poly1305_carry_square_gcc, .-fiat_poly1305_carry_square_gcc
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
