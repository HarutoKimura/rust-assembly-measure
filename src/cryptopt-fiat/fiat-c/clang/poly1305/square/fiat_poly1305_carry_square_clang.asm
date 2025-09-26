	.text
	.intel_syntax noprefix
	.file	"poly1305_square_wrapper.c"
	.globl	fiat_poly1305_carry_square_clang # -- Begin function fiat_poly1305_carry_square_clang
	.p2align	4, 0x90
	.type	fiat_poly1305_carry_square_clang,@function
fiat_poly1305_carry_square_clang:       # @fiat_poly1305_carry_square_clang
	.cfi_startproc
# %bb.0:
	push	r15
	.cfi_def_cfa_offset 16
	push	r14
	.cfi_def_cfa_offset 24
	push	r12
	.cfi_def_cfa_offset 32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset rbx, -40
	.cfi_offset r12, -32
	.cfi_offset r14, -24
	.cfi_offset r15, -16
	mov	r8, qword ptr [rsi + 16]
	lea	rdx, [r8 + 4*r8]
	lea	r9, [r8 + r8]
	mov	rax, qword ptr [rsi]
	mov	rcx, qword ptr [rsi + 8]
	lea	rsi, [rcx + rcx]
	mulx	r10, r11, r8
	shl	r8, 2
	lea	r8, [r8 + 4*r8]
	mov	rdx, rcx
	mulx	rbx, r14, r8
	mov	rdx, rsi
	mulx	r15, r12, rcx
	mov	rdx, rax
	mulx	rcx, r8, r9
	mulx	rsi, r9, rsi
	mulx	rdx, rax, rax
	add	rax, r14
	adc	rdx, rbx
	shld	rdx, rax, 20
	mov	bl, 44
	bzhi	rax, rax, rbx
	add	r8, r12
	adc	rcx, r15
	add	r9, r11
	adc	rsi, r10
	add	r9, rdx
	adc	rsi, 0
	shld	rsi, r9, 21
	mov	dl, 43
	bzhi	r9, r9, rdx
	add	rsi, r8
	adc	rcx, 0
	shld	rcx, rsi, 21
	bzhi	rsi, rsi, rdx
	lea	rcx, [rcx + 4*rcx]
	add	rcx, rax
	bzhi	rax, rcx, rbx
	shr	rcx, 44
	add	rcx, r9
	bzhi	rdx, rcx, rdx
	shr	rcx, 43
	add	rcx, rsi
	mov	qword ptr [rdi], rax
	mov	qword ptr [rdi + 8], rdx
	mov	qword ptr [rdi + 16], rcx
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end0:
	.size	fiat_poly1305_carry_square_clang, .Lfunc_end0-fiat_poly1305_carry_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
