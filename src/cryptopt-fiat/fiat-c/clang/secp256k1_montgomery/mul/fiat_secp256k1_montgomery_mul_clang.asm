	.text
	.intel_syntax noprefix
	.file	"secp256k1_montgomery_mul_wrapper.c"
	.globl	fiat_secp256k1_montgomery_mul_clang # -- Begin function fiat_secp256k1_montgomery_mul_clang
	.p2align	4, 0x90
	.type	fiat_secp256k1_montgomery_mul_clang,@function
fiat_secp256k1_montgomery_mul_clang:    # @fiat_secp256k1_montgomery_mul_clang
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
	mov	qword ptr [rsp - 88], rsi       # 8-byte Spill
	mov	r8, qword ptr [rsi]
	mov	qword ptr [rsp - 56], r8        # 8-byte Spill
	mov	rsi, rdx
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rdx + 16]
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mulx	rax, rcx, r8
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rbp, qword ptr [rsi]
	mov	rdx, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mulx	r15, rsi, r8
	mov	rdx, rbp
	mov	qword ptr [rsp - 80], rbp       # 8-byte Spill
	mulx	rbx, r9, r8
	movabs	rax, -2866531139136965327
	mov	rdx, r9
	imul	rdx, rax
	mov	rax, -1
	mulx	r12, r13, rax
	mov	qword ptr [rsp - 8], rdi        # 8-byte Spill
	movabs	rax, -4294968273
	mulx	rdx, rdi, rax
	mov	rax, rdi
	add	rax, r9
	mov	r11, rbx
	mov	qword ptr [rsp - 64], rsi       # 8-byte Spill
	adc	r11, rsi
	add	rdx, r13
	mov	r10, r13
	adc	r10, r12
	setb	r8b
	mov	r14, rbx
	add	r14, rsi
	lea	rax, [r15 + rcx]
	adc	rax, r10
	add	rdi, r9
	adc	r14, rdx
	lea	r14, [r11 + rdx]
	setb	r11b
	mov	rcx, rax
	adc	rcx, 0
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	r9, qword ptr [rdx + 8]
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rcx, rsi, r9
	mov	qword ptr [rsp - 72], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	mov	rdx, rbp
	mulx	rbp, rcx, r9
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	rdx, r14
	add	rdx, rcx
	mov	rdi, rbp
	adc	rdi, rsi
	mov	edx, r11d
	add	dl, 255
	adc	rdi, rax
	add	r8b, 255
	adc	r13, r12
	adc	r12, 0
	add	rbx, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 48]       # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mov	rdx, qword ptr [rax + 24]
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mulx	rcx, r8, qword ptr [rsp - 56]   # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 16]        # 8-byte Folded Reload
	mulx	rsi, rax, r9
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r9, rdx, r9
	adc	rcx, 0
	add	rbp, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r9, rax
	adc	rsi, 0
	add	r11b, 255
	adc	r15, r10
	adc	r8, r13
	adc	rcx, r12
	adc	rsi, 0
	setb	r13b
	add	r14, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r8, rdx
	adc	rcx, r9
	adc	rsi, 0
	setb	r9b
	mov	rdx, r14
	movabs	rax, -2866531139136965327
	imul	rdx, rax
	mov	rax, -1
	mulx	rax, rbx, rax
	movabs	r10, -4294968273
	mulx	r15, rdx, r10
	add	r15, rbx
	mov	r12, rbx
	adc	r12, rax
	adc	rbx, rax
	adc	rax, 0
	add	rdx, r14
	adc	r15, rdi
	adc	r12, r8
	adc	rbx, rcx
	adc	rax, rsi
	setb	cl
	add	r9b, 255
	mov	rbp, qword ptr [rsp - 88]       # 8-byte Reload
	mov	r9, qword ptr [rbp + 16]
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	r8, r10, r9
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r14, r11, r9
	movzx	edx, r13b
	movzx	esi, cl
	adc	rsi, rdx
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rdi, rcx, r9
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r9, rdx, r9
	mov	r13, r9
	add	r13, rcx
	adc	rdi, r11
	adc	r14, r10
	adc	r8, 0
	mov	r10, r15
	add	r10, rdx
	adc	r9, rcx
	add	r15, rdx
	adc	r13, r12
	adc	rdi, rbx
	adc	r14, rax
	adc	r8, 0
	setb	r11b
	mov	rdx, r15
	movabs	rax, -2866531139136965327
	imul	rdx, rax
	mov	rax, -1
	mulx	rax, rcx, rax
	movabs	r10, -4294968273
	mulx	rdx, r10, r10
	add	rdx, rcx
	mov	rbx, rcx
	adc	rbx, rax
	adc	rcx, rax
	adc	rax, 0
	mov	r13, r10
	add	r13, r15
	mov	r13, r9
	adc	r13, r12
	add	r15, r10
	lea	r9, [r9 + r12]
	adc	r9, rdx
	adc	rbx, rdi
	adc	rcx, r14
	lea	rdi, [r8 + rsi]
	adc	rax, rdi
	setb	dil
	add	r8, rsi
	mov	r15, qword ptr [rbp + 24]
	lea	r9, [r13 + rdx]
	movzx	edx, r11b
	movzx	r14d, dil
	adc	r14, rdx
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	r10, rdi, r15
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r8, r11, r15
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rsi, r12, r15
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r15, rdx, r15
	mov	r13, r15
	add	r13, r12
	adc	rsi, r11
	adc	r8, rdi
	adc	r10, 0
	mov	rdi, r9
	add	rdi, rdx
	adc	r15, r12
	add	r9, rdx
	adc	r13, rbx
	lea	rbx, [r15 + rbx]
	adc	rsi, rcx
	adc	r8, rax
	adc	r10, 0
	setb	dil
	lea	r11, [r10 + r14]
	movabs	rdx, -2866531139136965327
	imul	rdx, r9
	mov	rcx, -1
	mulx	r12, r15, rcx
	movabs	rax, -4294968273
	mulx	rax, rcx, rax
	add	rcx, r9
	adc	rbx, 0
	setb	r9b
	add	rax, r15
	mov	rcx, r15
	adc	rcx, r12
	adc	r15, r12
	adc	r11, r12
	setb	bpl
	xor	edx, edx
	add	rcx, rsi
	setb	dl
	xor	esi, esi
	add	r15, r8
	setb	sil
	movzx	r8d, r9b
	add	rax, rbx
	adc	rcx, r8
	adc	rdx, r15
	movzx	r8d, bpl
	adc	rsi, r11
	adc	r8, 0
	add	r10, r14
	movzx	edi, dil
	adc	rdi, r8
	xor	r8d, r8d
	movabs	r9, 4294968273
	add	r9, rax
	mov	r10d, 0
	adc	r10b, -1
	neg	r10b
	movzx	r11d, r10b
	mov	r10, rcx
	sub	r10, r11
	mov	r11d, 0
	sbb	r11, r11
	add	r10, 1
	adc	r11b, -1
	neg	r11b
	movzx	ebx, r11b
	mov	r11, rdx
	sub	r11, rbx
	mov	ebx, 0
	sbb	rbx, rbx
	add	r11, 1
	adc	bl, -1
	neg	bl
	movzx	r14d, bl
	mov	rbx, rsi
	sub	rbx, r14
	mov	r14d, 0
	sbb	r14, r14
	add	rbx, 1
	adc	r14b, -1
	neg	r14b
	movzx	r14d, r14b
	cmp	rdi, r14
	mov	edi, 0
	sbb	rdi, rdi
	neg	dil
	sbb	r8, r8
	mov	rdi, r8
	#APP
	#NO_APP
	and	rax, rdi
	not	r8
	#APP
	#NO_APP
	and	r9, r8
	or	r9, rax
	and	rcx, rdi
	and	r10, r8
	or	r10, rcx
	and	rdx, rdi
	and	r11, r8
	or	r11, rdx
	and	rdi, rsi
	and	r8, rbx
	or	r8, rdi
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	mov	qword ptr [rax], r9
	mov	qword ptr [rax + 8], r10
	mov	qword ptr [rax + 16], r11
	mov	qword ptr [rax + 24], r8
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
	.size	fiat_secp256k1_montgomery_mul_clang, .Lfunc_end0-fiat_secp256k1_montgomery_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
