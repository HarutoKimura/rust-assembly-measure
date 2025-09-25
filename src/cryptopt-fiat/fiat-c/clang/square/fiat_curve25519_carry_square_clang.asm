	.text
	.intel_syntax noprefix
	.file	"curve25519_64_square_wrapper.c"
	.globl	fiat_curve25519_carry_square_clang # -- Begin function fiat_curve25519_carry_square_clang
	.p2align	4, 0x90
	.type	fiat_curve25519_carry_square_clang,@function
fiat_curve25519_carry_square_clang:     # @fiat_curve25519_carry_square_clang
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
	mov	qword ptr [rsp - 8], rdi        # 8-byte Spill
	mov	r10, qword ptr [rsi + 32]
	lea	rax, [r10 + 8*r10]
	lea	rdx, [r10 + 2*rax]
	imul	rdi, r10, 38
	mov	rax, qword ptr [rsi + 24]
	lea	rcx, [rax + 8*rax]
	lea	r8, [rax + 2*rcx]
	imul	r11, rax, 38
	mov	rcx, qword ptr [rsi + 16]
	mulx	rdx, r9, r10
	mov	qword ptr [rsp - 56], r9        # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r9, rdi
	mov	qword ptr [rsp - 40], r9        # 8-byte Spill
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r8, rax
	mov	qword ptr [rsp - 24], r8        # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	r8, rbx, rdi
	mulx	r11, r9, r11
	mulx	rdx, r14, rcx
	mov	qword ptr [rsp - 72], r14       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsi + 8]
	mulx	r14, rdi, rdi
	add	rdi, r9
	adc	r14, r11
	lea	r12, [r10 + r10]
	lea	r13, [rax + rax]
	lea	r9, [rcx + rcx]
	mulx	r11, rax, r13
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rsi]
	mulx	rcx, r15, r9
	lea	rbp, [rdx + rdx]
	mulx	rsi, r10, rdx
	mov	rdx, rax
	mulx	rdx, r12, r12
	mov	qword ptr [rsp - 112], r12      # 8-byte Spill
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r13, r13
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r9, r9
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rbp, rdx, rbp
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rax, rdx, rax
	add	rdi, rdx
	adc	r14, rax
	shld	r14, rdi, 13
	mov	al, 51
	bzhi	rdx, rdi, rax
	mov	r12, qword ptr [rsp - 120]      # 8-byte Reload
	add	r12, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r15, r13
	adc	rcx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 32]       # 8-byte Folded Reload
	add	r10, r9
	adc	rsi, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 16]        # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r8, rbp
	add	rbx, r14
	adc	r8, 0
	shld	r8, rbx, 13
	bzhi	rdi, rbx, rax
	add	r8, r10
	adc	rsi, 0
	shld	rsi, r8, 13
	bzhi	r8, r8, rax
	add	rsi, r15
	adc	rcx, 0
	shld	rcx, rsi, 13
	bzhi	rsi, rsi, rax
	add	rcx, r12
	adc	r11, 0
	shld	r11, rcx, 13
	lea	r9, [r11 + 8*r11]
	lea	r9, [r11 + 2*r9]
	add	r9, rdx
	bzhi	rdx, r9, rax
	shr	r9, 51
	add	r9, rdi
	bzhi	rcx, rcx, rax
	bzhi	rax, r9, rax
	shr	r9, 51
	add	r9, r8
	mov	rdi, qword ptr [rsp - 8]        # 8-byte Reload
	mov	qword ptr [rdi], rdx
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], r9
	mov	qword ptr [rdi + 24], rsi
	mov	qword ptr [rdi + 32], rcx
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
	.size	fiat_curve25519_carry_square_clang, .Lfunc_end0-fiat_curve25519_carry_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
