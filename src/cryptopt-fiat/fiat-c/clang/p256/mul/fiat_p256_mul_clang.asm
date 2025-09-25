	.text
	.intel_syntax noprefix
	.file	"p256_mul_wrapper.c"
	.globl	fiat_p256_mul_clang             # -- Begin function fiat_p256_mul_clang
	.p2align	4, 0x90
	.type	fiat_p256_mul_clang,@function
fiat_p256_mul_clang:                    # @fiat_p256_mul_clang
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
	mov	r9, rdx
	mov	qword ptr [rsp - 56], rsi       # 8-byte Spill
	mov	rcx, qword ptr [rsi]
	mov	rbx, qword ptr [rdx + 24]
	mov	rdx, rbx
	mov	qword ptr [rsp - 24], rbx       # 8-byte Spill
	mulx	rbp, rax, rcx
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	rsi, qword ptr [r9 + 16]
	mov	rdx, rsi
	mov	qword ptr [rsp - 32], rsi       # 8-byte Spill
	mulx	rax, r11, rcx
	mov	rdx, qword ptr [r9 + 8]
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mulx	r10, r15, rcx
	mov	rdx, qword ptr [r9]
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mulx	r12, rdx, rcx
	mov	ecx, 4294967295
	mulx	rcx, r8, rcx
	mov	qword ptr [rsp - 16], r8        # 8-byte Spill
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	mov	rcx, -1
	mulx	r14, r13, rcx
	mov	rcx, r13
	add	rcx, rdx
	mov	rcx, r12
	adc	rcx, r15
	mov	qword ptr [rsp - 80], rcx       # 8-byte Spill
	add	r12, r15
	adc	r10, r11
	adc	rax, qword ptr [rsp - 72]       # 8-byte Folded Reload
	movabs	rcx, -4294967295
	mulx	rcx, r9, rcx
	adc	rcx, rbp
	setb	byte ptr [rsp - 72]             # 1-byte Folded Spill
	add	r13, rdx
	lea	rdx, [r14 + r8]
	adc	r12, rdx
	adc	r10, 0
	setb	byte ptr [rsp - 81]             # 1-byte Folded Spill
	xor	r12d, r12d
	add	r9, rax
	setb	r12b
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	mov	r8, qword ptr [rax + 8]
	mov	rdx, rbx
	mulx	r11, rbx, r8
	mov	rdx, rsi
	mulx	rax, rsi, r8
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mulx	r15, rbp, r8
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r8, rdx, r8
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	r13, r8
	add	r13, rbp
	adc	r15, rsi
	adc	rax, rbx
	adc	r11, 0
	add	r14, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 64]       # 8-byte Folded Reload
	movzx	ebx, byte ptr [rsp - 81]        # 1-byte Folded Reload
	adc	rbx, r9
	adc	r12, rcx
	movzx	ecx, byte ptr [rsp - 72]        # 1-byte Folded Reload
	adc	rcx, r11
	setb	byte ptr [rsp - 64]             # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	add	rdx, r14
	mov	rsi, rdx
	mov	r9, qword ptr [rsp - 8]         # 8-byte Reload
	add	rsi, r9
	adc	r8, rbp
	add	rdx, r9
	adc	r13, r10
	adc	r15, 0
	setb	r9b
	xor	ebp, ebp
	add	r12, rax
	setb	bpl
	mov	eax, 4294967295
	mulx	rax, rsi, rax
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rax, -1
	mulx	r11, r14, rax
	mov	r13, r14
	add	r13, rdx
	lea	rax, [r8 + r10]
	mov	r13, r8
	adc	r13, r10
	add	r15, rbx
	movzx	r8d, r9b
	adc	r12, r8
	adc	rbp, rcx
	setb	r9b
	add	r14, rdx
	movabs	rcx, -4294967295
	mulx	rdx, r8, rcx
	lea	rcx, [r11 + rsi]
	adc	rax, rcx
	adc	r15, 0
	setb	al
	xor	r14d, r14d
	add	r8, r12
	setb	r14b
	xor	ecx, ecx
	add	rdx, rbp
	setb	cl
	add	r11, rsi
	adc	r15, qword ptr [rsp - 80]       # 8-byte Folded Reload
	movzx	r12d, al
	adc	r12, r8
	adc	r14, rdx
	lea	r10, [r13 + r11]
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rsi, qword ptr [rax + 16]
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	r13, rax, rsi
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	mulx	r11, rbx, rsi
	adc	rcx, 0
	add	r9b, 255
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mulx	rax, r9, rsi
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r8, rdx, rsi
	movzx	ebp, byte ptr [rsp - 64]        # 1-byte Folded Reload
	adc	rbp, rcx
	mov	rcx, r8
	add	rcx, r9
	adc	rax, rbx
	adc	r11, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r13, 0
	mov	rsi, r10
	add	rsi, rdx
	adc	r8, r9
	add	r10, rdx
	adc	rcx, r15
	adc	rax, r12
	mov	rdx, r10
	mov	ecx, 4294967295
	mulx	r12, rcx, rcx
	adc	r11, r14
	mov	rsi, -1
	mulx	rbx, rdx, rsi
	setb	sil
	add	rbx, rcx
	adc	r12, 0
	mov	rcx, rdx
	add	rcx, r10
	lea	rcx, [r8 + r15]
	adc	r8, r15
	add	rdx, r10
	adc	rcx, rbx
	adc	r12, rax
	mov	rdx, r10
	movabs	rax, -4294967295
	mulx	rax, r14, rax
	adc	r14, r11
	setb	cl
	mov	rdx, rax
	adc	rdx, 0
	setb	dl
	add	sil, 255
	adc	r13, 0
	setb	r9b
	add	cl, 255
	lea	rcx, [r13 + rbp]
	adc	rcx, rax
	movzx	eax, dl
	adc	rax, 0
	add	r13, rbp
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	mov	r13, qword ptr [rdx + 24]
	lea	rsi, [r8 + rbx]
	movzx	r10d, r9b
	adc	r10, rax
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	r15, r8, r13
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	mulx	r11, rbx, r13
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mulx	rax, rbp, r13
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r9, rdx, r13
	mov	r13, r9
	add	r13, rbp
	adc	rax, rbx
	adc	r11, r8
	adc	r15, 0
	mov	r8, rsi
	add	r8, rdx
	adc	r9, rbp
	add	rsi, rdx
	adc	r13, r12
	adc	rax, r14
	adc	r11, rcx
	mov	rdx, rsi
	mov	ecx, 4294967295
	mulx	r14, r13, rcx
	mov	rcx, -1
	mulx	r8, rcx, rcx
	setb	bl
	mov	rdx, rcx
	add	rdx, rsi
	lea	rdx, [r9 + r12]
	adc	r9, r12
	add	rcx, rsi
	lea	rcx, [r8 + r13]
	adc	rdx, rcx
	mov	rdx, rsi
	movabs	rbp, -4294967295
	mulx	rsi, r12, rbp
	adc	rax, 0
	setb	dl
	xor	ecx, ecx
	add	r12, r11
	setb	cl
	add	r8, r13
	movzx	edx, dl
	adc	rax, r14
	adc	rdx, r12
	adc	rcx, rsi
	setb	sil
	add	bl, 255
	adc	r15, 0
	setb	r11b
	lea	rbx, [r15 + r10]
	movzx	esi, sil
	add	rcx, rbx
	adc	rsi, 0
	add	r15, r10
	movzx	ebx, r11b
	lea	r10, [r9 + r8]
	adc	rbx, rsi
	xor	esi, esi
	mov	r8, r10
	add	r8, 1
	mov	r9d, 0
	adc	r9b, -1
	neg	r9b
	movzx	r11d, r9b
	mov	r9, rax
	sub	r9, r11
	mov	r11d, 0
	sbb	r11, r11
	add	r9, rbp
	adc	r11b, -1
	neg	r11b
	movzx	r14d, r11b
	mov	r11, rdx
	sub	r11, r14
	mov	r14d, 0
	sbb	r14, r14
	neg	r14b
	movzx	r15d, r14b
	mov	r14, rcx
	sub	r14, r15
	mov	r15d, 0
	sbb	r15, r15
	mov	r12d, 4294967295
	add	r14, r12
	adc	r15b, -1
	neg	r15b
	movzx	r15d, r15b
	cmp	rbx, r15
	mov	ebx, 0
	sbb	rbx, rbx
	neg	bl
	sbb	rsi, rsi
	mov	rbx, rsi
	#APP
	#NO_APP
	and	r10, rbx
	not	rsi
	#APP
	#NO_APP
	and	r8, rsi
	or	r8, r10
	and	rax, rbx
	and	r9, rsi
	or	r9, rax
	and	rdx, rbx
	and	r11, rsi
	or	r11, rdx
	and	rbx, rcx
	and	rsi, r14
	or	rsi, rbx
	mov	qword ptr [rdi], r8
	mov	qword ptr [rdi + 8], r9
	mov	qword ptr [rdi + 16], r11
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
	.size	fiat_p256_mul_clang, .Lfunc_end0-fiat_p256_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
