	.text
	.intel_syntax noprefix
	.file	"poly1305_mul_wrapper.c"
	.globl	fiat_poly1305_carry_mul_clang   # -- Begin function fiat_poly1305_carry_mul_clang
	.p2align	4, 0x90
	.type	fiat_poly1305_carry_mul_clang,@function
fiat_poly1305_carry_mul_clang:          # @fiat_poly1305_carry_mul_clang
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rcx, rdx
	mov	qword ptr [rsp - 8], rdi        # 8-byte Spill
	mov	rdi, qword ptr [rsi + 16]
	mov	r15, qword ptr [rdx + 16]
	lea	rdx, [r15 + 4*r15]
	mulx	rax, rdx, rdi
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rax, qword ptr [rcx]
	mov	r12, qword ptr [rcx + 8]
	lea	r11, [r12 + r12]
	lea	rdx, [r11 + 4*r11]
	mulx	r14, rbx, rdi
	mov	rcx, qword ptr [rsi]
	mov	rsi, qword ptr [rsi + 8]
	lea	rdx, [r15 + r15]
	lea	r10, [rdx + 4*rdx]
	mov	rdx, rsi
	mulx	r10, rbp, r10
	mov	rdx, rax
	mulx	r9, r13, rdi
	add	rbp, rbx
	mov	rdx, rsi
	mulx	r11, rbx, r11
	adc	r10, r14
	mov	rdx, rax
	mulx	rsi, r14, rsi
	mov	rdx, rcx
	mulx	r15, rdi, r15
	mulx	r12, r8, r12
	mulx	rax, rcx, rax
	add	rbp, rcx
	adc	r10, rax
	shld	r10, rbp, 20
	mov	al, 44
	bzhi	rcx, rbp, rax
	add	rbx, r13
	adc	r11, r9
	add	rbx, rdi
	adc	r11, r15
	add	r14, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	r14, r8
	adc	rsi, r12
	add	r14, r10
	adc	rsi, 0
	shld	rsi, r14, 21
	mov	dl, 43
	bzhi	rdi, r14, rdx
	add	rsi, rbx
	adc	r11, 0
	shld	r11, rsi, 21
	lea	r8, [r11 + 4*r11]
	add	r8, rcx
	bzhi	rax, r8, rax
	shr	r8, 44
	add	r8, rdi
	bzhi	rcx, rsi, rdx
	bzhi	rdx, r8, rdx
	shr	r8, 43
	add	r8, rcx
	mov	rcx, qword ptr [rsp - 8]        # 8-byte Reload
	mov	qword ptr [rcx], rax
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rcx + 16], r8
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end0:
	.size	fiat_poly1305_carry_mul_clang, .Lfunc_end0-fiat_poly1305_carry_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
