	.text
	.intel_syntax noprefix
	.file	"curve25519_64_mul_wrapper.c"
	.globl	fiat_curve25519_carry_mul_clang # -- Begin function fiat_curve25519_carry_mul_clang
	.p2align	4, 0x90
	.type	fiat_curve25519_carry_mul_clang,@function
fiat_curve25519_carry_mul_clang:        # @fiat_curve25519_carry_mul_clang
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
	sub	rsp, 136
	.cfi_def_cfa_offset 192
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, rdx
	mov	r11, qword ptr [rsi + 32]
	mov	rdx, qword ptr [rdx + 32]
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	lea	rcx, [rdx + 8*rdx]
	lea	rcx, [rdx + 2*rcx]
	mov	rdx, rcx
	mulx	rdx, r8, r11
	mov	qword ptr [rsp + 112], r8       # 8-byte Spill
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	r8, qword ptr [rax + 24]
	mov	qword ptr [rsp - 120], r8       # 8-byte Spill
	lea	rdx, [r8 + 8*r8]
	lea	r9, [r8 + 2*rdx]
	mov	rdx, r9
	mulx	rdx, r8, r11
	mov	qword ptr [rsp + 88], r8        # 8-byte Spill
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	r8, qword ptr [rax + 16]
	mov	qword ptr [rsp - 128], r8       # 8-byte Spill
	lea	rdx, [r8 + 8*r8]
	lea	r10, [r8 + 2*rdx]
	mov	rdx, r10
	mulx	rdx, r8, r11
	mov	qword ptr [rsp + 80], r8        # 8-byte Spill
	mov	qword ptr [rsp + 96], rdx       # 8-byte Spill
	mov	r15, qword ptr [rax + 8]
	lea	rdx, [r15 + 8*r15]
	lea	rdx, [r15 + 2*rdx]
	mulx	rdx, rbp, r11
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 128], rdi      # 8-byte Spill
	mov	r8, qword ptr [rsi + 24]
	mov	rdx, r8
	mulx	rdx, rdi, rcx
	mov	qword ptr [rsp + 24], rdi       # 8-byte Spill
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	r12, r13, r9
	mulx	r14, rbx, r10
	add	rbx, rbp
	mov	r10, qword ptr [rsi + 16]
	mov	rdx, r10
	mulx	rdx, rdi, rcx
	mov	qword ptr [rsp - 40], rdi       # 8-byte Spill
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	adc	r14, qword ptr [rsp - 104]      # 8-byte Folded Reload
	mov	rdx, r10
	mulx	rdx, r9, r9
	add	rbx, r9
	adc	r14, rdx
	mov	r9, qword ptr [rsi + 8]
	mov	rdx, r9
	mulx	rcx, rdx, rcx
	add	rbx, rdx
	adc	r14, rcx
	mov	rdi, qword ptr [rax]
	mov	rcx, qword ptr [rsi]
	mov	rdx, rdi
	mulx	rdx, rsi, r11
	mov	qword ptr [rsp + 72], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rdx, r8
	mov	qword ptr [rsp - 96], r15       # 8-byte Spill
	mulx	rdx, rsi, r15
	mov	qword ptr [rsp + 56], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	rdx, rdi
	mulx	rax, rdx, r8
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	rdx, r10
	mov	rax, qword ptr [rsp - 128]      # 8-byte Reload
	mulx	r8, rsi, rax
	mulx	rbp, r11, r15
	mov	rdx, rdi
	mulx	rdx, r10, r10
	mov	qword ptr [rsp - 56], r10       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, r9
	mov	r10, qword ptr [rsp - 120]      # 8-byte Reload
	mulx	rdx, r15, r10
	mov	qword ptr [rsp + 32], r15       # 8-byte Spill
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	rdx, r9
	mulx	rdx, r15, rax
	mov	qword ptr [rsp - 16], r15       # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rdx, r9
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rdx, r15, rax
	mov	qword ptr [rsp - 72], r15       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rdx, rdi
	mulx	rdx, r9, r9
	mov	qword ptr [rsp - 88], r9        # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r9, qword ptr [rsp - 112]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 16], r9        # 8-byte Spill
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r9, r10
	mov	qword ptr [rsp - 24], r9        # 8-byte Spill
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	r15, rdx, qword ptr [rsp - 128] # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	r10, r9, rax
	mulx	rax, rcx, rdi
	add	rbx, rcx
	adc	r14, rax
	shld	r14, rbx, 13
	mov	al, 51
	bzhi	rcx, rbx, rax
	mov	rbx, qword ptr [rsp + 24]       # 8-byte Reload
	add	rbx, qword ptr [rsp + 88]       # 8-byte Folded Reload
	mov	rdi, qword ptr [rsp + 48]       # 8-byte Reload
	adc	rdi, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 96]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 32]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	r13, r9
	adc	r12, r10
	add	r13, r14
	adc	r12, 0
	shld	r12, r13, 13
	bzhi	rdx, r13, rax
	mov	r10, rbx
	add	r10, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	rdi, r15
	add	r10, r12
	adc	rdi, 0
	shld	rdi, r10, 13
	mov	r9, rdi
	bzhi	rdi, r10, rax
	add	r11, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 120]      # 8-byte Folded Reload
	add	r11, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r11, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	r11, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	r11, r9
	adc	rbp, 0
	shld	rbp, r11, 13
	bzhi	r9, r11, rax
	add	rsi, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 64]        # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 40]        # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 104]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 112]       # 8-byte Folded Reload
	add	rsi, rbp
	adc	r8, 0
	shld	r8, rsi, 13
	lea	r10, [r8 + 8*r8]
	lea	r8, [r8 + 2*r10]
	add	r8, rcx
	bzhi	rcx, r8, rax
	shr	r8, 51
	add	r8, rdx
	bzhi	rdx, rsi, rax
	bzhi	rax, r8, rax
	shr	r8, 51
	add	r8, rdi
	mov	rsi, qword ptr [rsp + 128]      # 8-byte Reload
	mov	qword ptr [rsi], rcx
	mov	qword ptr [rsi + 8], rax
	mov	qword ptr [rsi + 16], r8
	mov	qword ptr [rsi + 24], r9
	mov	qword ptr [rsi + 32], rdx
	add	rsp, 136
	.cfi_def_cfa_offset 56
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
	.size	fiat_curve25519_carry_mul_clang, .Lfunc_end0-fiat_curve25519_carry_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
