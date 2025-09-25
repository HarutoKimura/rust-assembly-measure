	.text
	.intel_syntax noprefix
	.file	"p224_square_wrapper.c"
	.globl	fiat_p224_square_clang          # -- Begin function fiat_p224_square_clang
	.p2align	4, 0x90
	.type	fiat_p224_square_clang,@function
fiat_p224_square_clang:                 # @fiat_p224_square_clang
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
	mov	rdx, qword ptr [rsi]
	mov	r8, qword ptr [rsi + 8]
	mov	rax, qword ptr [rsi + 16]
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	r9, qword ptr [rsi + 24]
	mulx	r11, r14, r9
	mov	qword ptr [rsp - 16], r11       # 8-byte Spill
	mov	qword ptr [rsp - 8], r14        # 8-byte Spill
	mov	qword ptr [rsp - 88], r9        # 8-byte Spill
	mulx	rax, rbx, rax
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	qword ptr [rsp - 40], rbx       # 8-byte Spill
	mulx	r10, rsi, r8
	mov	qword ptr [rsp - 72], r10       # 8-byte Spill
	mov	qword ptr [rsp - 104], rsi      # 8-byte Spill
	mulx	r12, rcx, rdx
	add	r12, rsi
	adc	rbx, r10
	adc	r14, rax
	adc	r11, 0
	mov	rsi, rcx
	neg	rsi
	mov	eax, 4294967295
	mov	rdx, rsi
	mulx	r13, rbp, rax
	mov	rax, -1
	mulx	rax, r15, rax
	add	rsi, rcx
	movabs	rcx, -4294967296
	mulx	r10, rcx, rcx
	adc	r12, 0
	setb	sil
	add	r10, r15
	adc	rax, rbp
	adc	r13, r11
	setb	byte ptr [rsp - 80]             # 1-byte Folded Spill
	xor	r11d, r11d
	add	r10, rbx
	setb	r11b
	xor	ebx, ebx
	add	rax, r14
	setb	bl
	mov	rdx, r9
	mulx	r15, r14, r8
	mov	qword ptr [rsp - 32], r14       # 8-byte Spill
	mov	qword ptr [rsp - 24], r15       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rbp, r9, r8
	mov	qword ptr [rsp - 64], r9        # 8-byte Spill
	mov	qword ptr [rsp - 56], rbp       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r8, r8
	add	r8, qword ptr [rsp - 72]        # 8-byte Folded Reload
	adc	rdx, r9
	adc	r14, rbp
	adc	r15, 0
	add	r12, rcx
	movzx	ecx, sil
	adc	r10, rcx
	adc	r11, rax
	adc	rbx, r13
	movzx	r9d, byte ptr [rsp - 80]        # 1-byte Folded Reload
	adc	r9, r15
	setb	byte ptr [rsp - 72]             # 1-byte Folded Spill
	add	r12, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r8, 0
	setb	r13b
	xor	esi, esi
	add	r11, rdx
	setb	sil
	xor	eax, eax
	add	rbx, r14
	setb	al
	mov	rdx, r12
	neg	rdx
	add	r12, rdx
	mov	rcx, -1
	mulx	rcx, rbp, rcx
	mov	qword ptr [rsp - 104], rcx      # 8-byte Spill
	movabs	rcx, -4294967296
	mulx	r15, r12, rcx
	lea	rcx, [r8 + r10]
	adc	r12, rcx
	setb	cl
	mov	r14, r15
	adc	r14, rbp
	add	r8, r10
	movzx	r13d, r13b
	adc	r13, r11
	adc	rsi, rbx
	adc	rax, r9
	setb	r8b
	add	r15, rbp
	mov	r9d, 4294967295
	mulx	r11, rbp, r9
	adc	rbp, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r11, 0
	add	cl, 255
	adc	r15, r13
	adc	rbp, rsi
	adc	r11, rax
	setb	al
	add	r8b, 255
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rsi, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	r8, r10, rsi
	mov	qword ptr [rsp - 80], r10       # 8-byte Spill
	mov	qword ptr [rsp - 104], r8       # 8-byte Spill
	movzx	ecx, byte ptr [rsp - 72]        # 1-byte Folded Reload
	movzx	ebx, al
	adc	rbx, rcx
	mov	rdx, rsi
	mulx	rax, rcx, rsi
	mov	r9, qword ptr [rsp - 48]        # 8-byte Reload
	mov	rdx, r9
	mov	r15, qword ptr [rsp - 64]       # 8-byte Reload
	add	rdx, r15
	adc	rcx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rax, r10
	mov	r10, r8
	adc	r10, 0
	mov	rsi, r12
	mov	r8, qword ptr [rsp - 40]        # 8-byte Reload
	add	rsi, r8
	adc	r9, r15
	add	r12, r8
	lea	r14, [r14 + r13]
	adc	rdx, r14
	adc	rcx, rbp
	adc	rax, r11
	adc	r10, 0
	setb	byte ptr [rsp - 96]             # 1-byte Folded Spill
	mov	rdx, r12
	neg	rdx
	mov	esi, 4294967295
	mulx	rsi, r8, rsi
	mov	r11, -1
	mulx	r15, rbp, r11
	movabs	r11, -4294967296
	mulx	r13, r11, r11
	add	r9, r14
	mov	r14, r13
	add	r14, rbp
	adc	r15, r8
	adc	rsi, 0
	add	rdx, r12
	adc	r11, r9
	setb	dl
	adc	r13, rbp
	add	dl, 255
	adc	r14, rcx
	adc	r15, rax
	lea	rax, [r10 + rbx]
	adc	rsi, rax
	setb	al
	add	r10, rbx
	movzx	edx, byte ptr [rsp - 96]        # 1-byte Folded Reload
	movzx	ebx, al
	adc	rbx, rdx
	mov	r9, qword ptr [rsp - 16]        # 8-byte Reload
	mov	rax, r9
	mov	r8, qword ptr [rsp - 32]        # 8-byte Reload
	add	rax, r8
	mov	rbp, qword ptr [rsp - 80]       # 8-byte Reload
	adc	rbp, qword ptr [rsp - 24]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	r14, r10, rdx
	adc	r10, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r14, 0
	mov	rdx, r11
	mov	r12, qword ptr [rsp - 8]        # 8-byte Reload
	add	rdx, r12
	adc	r9, r8
	add	r11, r12
	lea	r12, [r13 + rcx]
	adc	rax, r12
	adc	rbp, r15
	mov	r8, rbp
	adc	r10, rsi
	adc	r14, 0
	setb	byte ptr [rsp - 88]             # 1-byte Folded Spill
	mov	rdx, r11
	neg	rdx
	mov	eax, 4294967295
	mulx	rax, r15, rax
	mov	rcx, -1
	mulx	rcx, r13, rcx
	add	r9, r12
	movabs	rsi, -4294967296
	mulx	r12, rsi, rsi
	mov	rbp, r12
	add	rbp, r13
	adc	rcx, r15
	adc	rax, 0
	add	rdx, r11
	adc	rsi, r9
	setb	dl
	adc	r12, r13
	lea	r11, [r14 + rbx]
	add	dl, 255
	adc	rbp, r8
	adc	rcx, r10
	adc	rax, r11
	setb	dl
	add	r14, rbx
	movzx	r10d, byte ptr [rsp - 88]       # 1-byte Folded Reload
	lea	r9, [r12 + r8]
	movzx	ebx, dl
	adc	rbx, r10
	xor	edx, edx
	mov	r8, rsi
	add	r8, -1
	mov	r10d, 0
	adc	r10b, -1
	neg	r10b
	movzx	r11d, r10b
	movabs	r10, -4294967296
	or	r11, r10
	mov	r10, r9
	sub	r10, r11
	mov	r11d, 0
	sbb	r11, r11
	neg	r11b
	movzx	r14d, r11b
	mov	r11, rcx
	sub	r11, r14
	mov	r14d, 0
	sbb	r14, r14
	add	r11, 1
	adc	r14b, -1
	neg	r14b
	movzx	r14d, r14b
	mov	r15, rax
	sub	r15, r14
	mov	r12d, 0
	sbb	r12, r12
	movabs	r14, -4294967295
	add	r14, r15
	adc	r12b, -1
	neg	r12b
	movzx	r15d, r12b
	cmp	rbx, r15
	mov	ebx, 0
	sbb	rbx, rbx
	neg	bl
	sbb	rdx, rdx
	mov	rbx, rdx
	#APP
	#NO_APP
	and	rsi, rbx
	not	rdx
	#APP
	#NO_APP
	and	r8, rdx
	or	r8, rsi
	and	r9, rbx
	and	r10, rdx
	or	r10, r9
	and	rcx, rbx
	and	r11, rdx
	or	r11, rcx
	and	rbx, rax
	and	rdx, r14
	or	rdx, rbx
	mov	qword ptr [rdi], r8
	mov	qword ptr [rdi + 8], r10
	mov	qword ptr [rdi + 16], r11
	mov	qword ptr [rdi + 24], rdx
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
	.size	fiat_p224_square_clang, .Lfunc_end0-fiat_p224_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
