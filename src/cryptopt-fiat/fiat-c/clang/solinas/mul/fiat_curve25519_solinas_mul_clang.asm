	.text
	.intel_syntax noprefix
	.file	"curve25519_solinas_mul_wrapper.c"
	.globl	fiat_curve25519_solinas_mul_clang # -- Begin function fiat_curve25519_solinas_mul_clang
	.p2align	4, 0x90
	.type	fiat_curve25519_solinas_mul_clang,@function
fiat_curve25519_solinas_mul_clang:      # @fiat_curve25519_solinas_mul_clang
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
	sub	rsp, 16
	.cfi_def_cfa_offset 72
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, rdx
	mov	rcx, qword ptr [rsi + 24]
	mov	r8, qword ptr [rdx + 24]
	mov	rdx, r8
	mulx	r9, rdx, rcx
	mov	qword ptr [rsp - 40], r9        # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	r9, qword ptr [rax + 16]
	mov	rdx, r9
	mulx	rdx, r10, rcx
	mov	qword ptr [rsp - 88], r10       # 8-byte Spill
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	r10, qword ptr [rax + 8]
	mov	rdx, r10
	mulx	rdx, r11, rcx
	mov	qword ptr [rsp - 120], r11      # 8-byte Spill
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	rax, qword ptr [rax]
	mov	rdx, rax
	mulx	rcx, rbx, rcx
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	rdx, qword ptr [rsi + 16]
	mulx	r15, rcx, r8
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mulx	rcx, r11, r9
	mov	qword ptr [rsp], rcx            # 8-byte Spill
	mulx	rcx, r12, r10
	mov	qword ptr [rsp - 80], rcx       # 8-byte Spill
	mulx	rcx, rdx, rax
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 104], rcx      # 8-byte Spill
	mov	rcx, qword ptr [rsi]
	mov	rdx, qword ptr [rsi + 8]
	mulx	rbp, rsi, r8
	mov	qword ptr [rsp - 48], rsi       # 8-byte Spill
	mulx	r14, rsi, r9
	mov	qword ptr [rsp - 8], r14        # 8-byte Spill
	mulx	r14, r13, r10
	mov	qword ptr [rsp - 96], r13       # 8-byte Spill
	mulx	rdx, r13, rax
	mov	qword ptr [rsp - 72], r13       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	r13, rdx, r8
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	r9, r8, r9
	add	r9, rbx
	adc	r13, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rbp, 0
	add	r9, r12
	adc	r13, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mulx	r10, rdx, r10
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	adc	rbp, 0
	adc	r15, 0
	add	r10, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 104]       # 8-byte Folded Reload
	adc	r11, 0
	setb	bl
	xor	edx, edx
	add	rbp, qword ptr [rsp - 88]       # 8-byte Folded Reload
	setb	dl
	add	r11, r13
	movzx	ebx, bl
	adc	rbp, rbx
	adc	rdx, r15
	setb	bl
	add	r10, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	rsi, 0
	setb	r15b
	add	rsi, r9
	movzx	r9d, r15b
	adc	r9, qword ptr [rsp - 80]        # 8-byte Folded Reload
	setb	r15b
	add	r9, r11
	movzx	r12d, r15b
	adc	r12, qword ptr [rsp - 56]       # 8-byte Folded Reload
	setb	r11b
	add	r12, rbp
	movzx	ebp, r11b
	adc	rbp, rdx
	mov	rdx, rcx
	mulx	r15, r11, rax
	movzx	eax, bl
	adc	rax, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r14, 0
	setb	cl
	add	r14, rsi
	movzx	edx, cl
	adc	rdx, qword ptr [rsp - 48]       # 8-byte Folded Reload
	setb	cl
	add	rdx, r9
	movzx	ebx, cl
	adc	rbx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	setb	cl
	xor	r9d, r9d
	add	rbp, qword ptr [rsp - 16]       # 8-byte Folded Reload
	setb	r9b
	add	rbx, r12
	movzx	ecx, cl
	adc	rbp, rcx
	adc	r9, rax
	add	r15, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r8, 0
	setb	al
	add	r8, r10
	movzx	r10d, al
	adc	r10, qword ptr [rsp - 24]       # 8-byte Folded Reload
	setb	al
	add	r10, r14
	movzx	eax, al
	adc	rax, qword ptr [rsp - 8]        # 8-byte Folded Reload
	setb	cl
	movzx	ecx, cl
	add	rax, rdx
	adc	rcx, qword ptr [rsp]            # 8-byte Folded Reload
	setb	dl
	movzx	esi, dl
	add	rcx, rbx
	adc	rsi, qword ptr [rsp + 8]        # 8-byte Folded Reload
	setb	dl
	movzx	edx, dl
	add	rsi, rbp
	adc	rdx, r9
	mov	r14d, 38
	mulx	r9, r12, r14
	mov	rdx, rsi
	mulx	rbx, rsi, r14
	mov	rdx, rcx
	mulx	r13, rcx, r14
	add	rcx, r15
	adc	r8, 0
	setb	dl
	add	r8, rsi
	movzx	esi, dl
	adc	rsi, r10
	setb	r10b
	add	rsi, r12
	mov	rdx, rax
	mulx	rax, rdx, r14
	movzx	r10d, r10b
	adc	r10, 0
	add	rdx, r11
	adc	rcx, rax
	adc	r8, r13
	adc	rsi, rbx
	adc	r10, r9
	imul	rax, r10, 38
	xor	r9d, r9d
	add	rax, rdx
	adc	rcx, 0
	adc	r8, 0
	adc	rsi, 0
	sbb	r9, r9
	#APP
	#NO_APP
	and	r9d, 38
	add	rax, r9
	mov	qword ptr [rdi], rax
	mov	qword ptr [rdi + 8], rcx
	mov	qword ptr [rdi + 16], r8
	mov	qword ptr [rdi + 24], rsi
	add	rsp, 16
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
	.size	fiat_curve25519_solinas_mul_clang, .Lfunc_end0-fiat_curve25519_solinas_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
