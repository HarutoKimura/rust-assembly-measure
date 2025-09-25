	.text
	.intel_syntax noprefix
	.file	"p256_square_wrapper.c"
	.globl	fiat_p256_square_clang          # -- Begin function fiat_p256_square_clang
	.p2align	4, 0x90
	.type	fiat_p256_square_clang,@function
fiat_p256_square_clang:                 # @fiat_p256_square_clang
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
	push	rax
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rdx, qword ptr [rsi]
	mov	r8, qword ptr [rsi + 8]
	mov	rcx, qword ptr [rsi + 16]
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	mov	rbp, qword ptr [rsi + 24]
	mulx	rbx, r14, rbp
	mov	qword ptr [rsp - 8], rbx        # 8-byte Spill
	mov	qword ptr [rsp], r14            # 8-byte Spill
	mov	qword ptr [rsp - 88], rbp       # 8-byte Spill
	mulx	r9, r12, rcx
	mov	qword ptr [rsp - 40], r9        # 8-byte Spill
	mov	qword ptr [rsp - 32], r12       # 8-byte Spill
	mulx	r13, r11, r8
	mulx	rcx, rdx, rdx
	mov	eax, 4294967295
	mulx	rax, r15, rax
	mov	qword ptr [rsp - 80], r15       # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, -1
	mulx	r10, rsi, rax
	mov	rax, rsi
	add	rax, rdx
	mov	rax, rcx
	mov	qword ptr [rsp - 64], r11       # 8-byte Spill
	adc	rax, r11
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	add	rcx, r11
	adc	r12, r13
	adc	r14, r9
	movabs	rax, -4294967295
	mulx	r9, rax, rax
	adc	r9, rbx
	setb	byte ptr [rsp - 121]            # 1-byte Folded Spill
	add	rsi, rdx
	lea	rdx, [r10 + r15]
	adc	rcx, rdx
	adc	r12, 0
	setb	byte ptr [rsp - 112]            # 1-byte Folded Spill
	xor	ebx, ebx
	add	rax, r14
	setb	bl
	mov	rdx, rbp
	mulx	r11, rcx, r8
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 16], r11       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	r15, rbp, r8
	mov	qword ptr [rsp - 56], rbp       # 8-byte Spill
	mov	qword ptr [rsp - 48], r15       # 8-byte Spill
	mov	rdx, r8
	mulx	r14, rdx, r8
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rsi, r13
	add	rsi, rdx
	adc	r14, rbp
	mov	r8, rcx
	adc	r8, r15
	mov	rdx, r11
	adc	rdx, 0
	add	r10, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 120]      # 8-byte Folded Reload
	movzx	ecx, byte ptr [rsp - 112]       # 1-byte Folded Reload
	adc	rcx, rax
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	adc	rbx, r9
	movzx	r11d, byte ptr [rsp - 121]      # 1-byte Folded Reload
	adc	r11, rdx
	setb	byte ptr [rsp - 120]            # 1-byte Folded Spill
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	lea	rdx, [rax + r10]
	mov	rax, rdx
	mov	rcx, qword ptr [rsp - 64]       # 8-byte Reload
	add	rax, rcx
	adc	r13, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	rdx, rcx
	adc	rsi, r12
	adc	r14, 0
	setb	bpl
	xor	r15d, r15d
	add	rbx, r8
	setb	r15b
	mov	eax, 4294967295
	mulx	rax, r9, rax
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, -1
	mulx	r10, rcx, rax
	mov	rsi, rcx
	add	rsi, rdx
	lea	rax, [r13 + r12]
	adc	r13, r12
	add	r14, qword ptr [rsp - 112]      # 8-byte Folded Reload
	movzx	r8d, bpl
	adc	rbx, r8
	adc	r15, r11
	setb	r8b
	add	rcx, rdx
	movabs	rcx, -4294967295
	mulx	rcx, r11, rcx
	lea	rdx, [r10 + r9]
	adc	rax, rdx
	adc	r14, 0
	setb	al
	xor	ebp, ebp
	add	r11, rbx
	setb	bpl
	xor	edx, edx
	add	rcx, r15
	setb	dl
	add	r10, r9
	adc	r14, qword ptr [rsp - 104]      # 8-byte Folded Reload
	movzx	r9d, al
	adc	r9, r11
	adc	rbp, rcx
	lea	rsi, [r13 + r10]
	adc	rdx, 0
	add	r8b, 255
	movzx	r15d, byte ptr [rsp - 120]      # 1-byte Folded Reload
	adc	r15, rdx
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rcx, r8, rax
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mov	rdx, rax
	mulx	rax, r12, rax
	mov	r11, qword ptr [rsp - 40]       # 8-byte Reload
	mov	rdx, r11
	mov	r13, qword ptr [rsp - 56]       # 8-byte Reload
	add	rdx, r13
	adc	r12, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	rax, r8
	adc	rcx, 0
	mov	r10, rsi
	mov	rbx, qword ptr [rsp - 32]       # 8-byte Reload
	add	r10, rbx
	adc	r11, r13
	mov	r13, r11
	add	rsi, rbx
	adc	rdx, r14
	adc	r12, r9
	adc	rax, rbp
	mov	rdx, rsi
	mov	r9d, 4294967295
	mulx	rbp, rbx, r9
	mov	r9, -1
	mulx	r9, rdx, r9
	setb	r11b
	mov	r10, rdx
	add	r10, rsi
	lea	r10, [r13 + r14]
	adc	r13, r14
	add	rdx, rsi
	lea	rdx, [r9 + rbx]
	adc	r10, rdx
	mov	rdx, rsi
	movabs	rsi, -4294967295
	mulx	rdx, rsi, rsi
	adc	r12, 0
	setb	r14b
	xor	r10d, r10d
	add	rsi, rax
	setb	r10b
	add	r9, rbx
	adc	r12, rbp
	movzx	eax, r14b
	adc	rax, rsi
	adc	r10, rdx
	setb	dl
	add	r11b, 255
	adc	rcx, 0
	setb	sil
	lea	r11, [rcx + r15]
	add	r10, r11
	movzx	edx, dl
	adc	rdx, 0
	add	rcx, r15
	lea	rcx, [r13 + r9]
	movzx	esi, sil
	adc	rsi, rdx
	mov	rbx, qword ptr [rsp - 8]        # 8-byte Reload
	mov	r11, rbx
	mov	r13, qword ptr [rsp - 24]       # 8-byte Reload
	add	r11, r13
	adc	r8, qword ptr [rsp - 16]        # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	r9, r14, rdx
	adc	r14, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r9, 0
	mov	rdx, rcx
	mov	r15, qword ptr [rsp]            # 8-byte Reload
	add	rdx, r15
	adc	rbx, r13
	mov	rbp, rbx
	add	rcx, r15
	adc	r11, r12
	adc	r8, rax
	adc	r14, r10
	mov	rdx, rcx
	mov	eax, 4294967295
	mulx	r15, r13, rax
	mov	rax, -1
	mulx	r10, rax, rax
	setb	bl
	mov	rdx, rax
	add	rdx, rcx
	mov	r11, rbp
	lea	rdx, [rbp + r12]
	adc	r11, r12
	add	rax, rcx
	lea	rax, [r10 + r13]
	adc	rdx, rax
	mov	rdx, rcx
	movabs	rbp, -4294967295
	mulx	rdx, r12, rbp
	adc	r8, 0
	setb	cl
	xor	eax, eax
	add	r12, r14
	setb	al
	add	r10, r13
	movzx	ecx, cl
	adc	r8, r15
	adc	rcx, r12
	adc	rax, rdx
	setb	dl
	add	bl, 255
	adc	r9, 0
	setb	bl
	lea	r14, [r9 + rsi]
	movzx	edx, dl
	add	rax, r14
	adc	rdx, 0
	add	r9, rsi
	movzx	ebx, bl
	lea	r10, [r11 + r10]
	adc	rbx, rdx
	xor	edx, edx
	mov	rsi, r10
	add	rsi, 1
	mov	r9d, 0
	adc	r9b, -1
	neg	r9b
	movzx	r11d, r9b
	mov	r9, r8
	sub	r9, r11
	mov	r11d, 0
	sbb	r11, r11
	add	r9, rbp
	adc	r11b, -1
	neg	r11b
	movzx	r14d, r11b
	mov	r11, rcx
	sub	r11, r14
	mov	r14d, 0
	sbb	r14, r14
	neg	r14b
	movzx	r15d, r14b
	mov	r14, rax
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
	sbb	rdx, rdx
	mov	rbx, rdx
	#APP
	#NO_APP
	and	r10, rbx
	not	rdx
	#APP
	#NO_APP
	and	rsi, rdx
	or	rsi, r10
	and	r8, rbx
	and	r9, rdx
	or	r9, r8
	and	rcx, rbx
	and	r11, rdx
	or	r11, rcx
	and	rbx, rax
	and	rdx, r14
	or	rdx, rbx
	mov	qword ptr [rdi], rsi
	mov	qword ptr [rdi + 8], r9
	mov	qword ptr [rdi + 16], r11
	mov	qword ptr [rdi + 24], rdx
	add	rsp, 8
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
	.size	fiat_p256_square_clang, .Lfunc_end0-fiat_p256_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
