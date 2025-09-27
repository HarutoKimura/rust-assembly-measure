	.text
	.intel_syntax noprefix
	.file	"curve25519_solinas_square_wrapper.c"
	.globl	fiat_curve25519_solinas_square_clang # -- Begin function fiat_curve25519_solinas_square_clang
	.p2align	4, 0x90
	.type	fiat_curve25519_solinas_square_clang,@function
fiat_curve25519_solinas_square_clang:   # @fiat_curve25519_solinas_square_clang
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
	mov	rax, qword ptr [rsi + 24]
	mov	rcx, qword ptr [rsi]
	mov	rdx, rax
	mulx	rdx, rbx, rcx
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	r8, qword ptr [rsi + 8]
	mov	rsi, qword ptr [rsi + 16]
	mov	rdx, rsi
	mulx	rbp, r15, rcx
	mov	rdx, r8
	mulx	r13, r11, rcx
	mov	rdx, rsi
	mulx	r10, r12, rax
	mov	rdx, r8
	mulx	r9, r14, rax
	add	r13, r15
	adc	rbp, rbx
	adc	r14, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r9, r12
	adc	r10, 0
	mulx	rbx, r12, rsi
	add	r12, rbp
	adc	rbx, r14
	adc	r9, 0
	adc	r10, 0
	setb	dl
	lea	r14, [2*r13]
	mov	qword ptr [rsp - 32], r14       # 8-byte Spill
	shr	r13, 63
	lea	r14, [r10 + r10]
	mov	qword ptr [rsp - 8], r14        # 8-byte Spill
	shr	r10, 63
	movzx	edx, dl
	lea	rdx, [r10 + 2*rdx]
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rax, r15, rax
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	rdx, rsi
	mulx	rsi, rax, rsi
	mov	rdx, r8
	mulx	r10, r8, r8
	add	r10, r13
	lea	r14, [r11 + r11]
	shr	r11, 63
	add	r8, r11
	lea	r11, [r12 + r12]
	shr	r12, 63
	lea	rdx, [rbx + rbx]
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	shr	rbx, 63
	mov	rbp, r9
	shr	rbp, 63
	add	r9, r9
	mov	rdx, rcx
	mulx	r13, rcx, rcx
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	add	r13, r14
	adc	r8, qword ptr [rsp - 32]        # 8-byte Folded Reload
	adc	r10, 0
	setb	cl
	add	rax, r12
	add	r10, r11
	movzx	ecx, cl
	adc	rax, rcx
	setb	r11b
	add	rsi, rbx
	xor	ecx, ecx
	add	rsi, r9
	setb	cl
	add	r15, rbp
	xor	edx, edx
	add	r15, qword ptr [rsp - 8]        # 8-byte Folded Reload
	setb	dl
	mov	rbx, qword ptr [rsp - 24]       # 8-byte Reload
	add	rbx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	movzx	r9d, r11b
	add	rax, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rsi, r9
	adc	rcx, r15
	adc	rdx, rbx
	mov	ebx, 38
	mulx	r9, r14, rbx
	mov	rdx, rcx
	mulx	r11, r15, rbx
	mov	rdx, rsi
	mulx	r12, rcx, rbx
	add	rcx, r13
	adc	r8, 0
	setb	dl
	add	r8, r15
	movzx	esi, dl
	adc	rsi, r10
	setb	r10b
	add	rsi, r14
	mov	rdx, rax
	mulx	rax, rdx, rbx
	movzx	r10d, r10b
	adc	r10, 0
	add	rdx, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	rcx, rax
	adc	r8, r12
	adc	rsi, r11
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
	.size	fiat_curve25519_solinas_square_clang, .Lfunc_end0-fiat_curve25519_solinas_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
