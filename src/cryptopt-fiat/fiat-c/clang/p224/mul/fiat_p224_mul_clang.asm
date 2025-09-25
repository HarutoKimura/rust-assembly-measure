	.text
	.intel_syntax noprefix
	.file	"p224_mul_wrapper.c"
	.globl	fiat_p224_mul_clang             # -- Begin function fiat_p224_mul_clang
	.p2align	4, 0x90
	.type	fiat_p224_mul_clang,@function
fiat_p224_mul_clang:                    # @fiat_p224_mul_clang
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
	mov	qword ptr [rsp - 32], rsi       # 8-byte Spill
	mov	rax, qword ptr [rsi]
	mov	rdx, qword ptr [rdx + 24]
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mulx	rsi, r8, rax
	mov	r11, qword ptr [r9 + 16]
	mov	rdx, r11
	mov	qword ptr [rsp - 8], r11        # 8-byte Spill
	mulx	rcx, r10, rax
	mov	rbx, qword ptr [r9]
	mov	qword ptr [rsp - 16], rbx       # 8-byte Spill
	mov	rdx, qword ptr [r9 + 8]
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mulx	r12, r9, rax
	mov	rdx, rbx
	mulx	r14, rbx, rax
	add	r14, r9
	adc	r12, r10
	adc	rcx, r8
	adc	rsi, 0
	mov	r10, rbx
	neg	r10
	mov	eax, 4294967295
	mov	rdx, r10
	mulx	r9, r13, rax
	mov	rax, -1
	mulx	rax, rbp, rax
	add	r10, rbx
	movabs	r8, -4294967296
	mulx	r15, rdx, r8
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	adc	r14, 0
	setb	byte ptr [rsp - 57]             # 1-byte Folded Spill
	add	r15, rbp
	adc	rax, r13
	adc	r9, rsi
	mov	qword ptr [rsp - 56], r9        # 8-byte Spill
	setb	byte ptr [rsp - 58]             # 1-byte Folded Spill
	xor	r13d, r13d
	add	r15, r12
	setb	r13b
	xor	r12d, r12d
	add	rax, rcx
	setb	r12b
	mov	rcx, qword ptr [rsp - 32]       # 8-byte Reload
	mov	rcx, qword ptr [rcx + 8]
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	rbx, r8, rcx
	mov	rdx, r11
	mulx	rsi, r9, rcx
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rbp, r11, rcx
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	r10, rdx, rcx
	add	r10, r11
	adc	rbp, r9
	adc	rsi, r8
	adc	rbx, 0
	add	r14, qword ptr [rsp - 40]       # 8-byte Folded Reload
	movzx	ecx, byte ptr [rsp - 57]        # 1-byte Folded Reload
	adc	r15, rcx
	adc	r13, rax
	adc	r12, qword ptr [rsp - 56]       # 8-byte Folded Reload
	movzx	ecx, byte ptr [rsp - 58]        # 1-byte Folded Reload
	adc	rcx, rbx
	setb	byte ptr [rsp - 58]             # 1-byte Folded Spill
	add	r14, rdx
	adc	r10, 0
	setb	r11b
	xor	eax, eax
	add	r13, rbp
	setb	al
	xor	ebx, ebx
	add	r12, rsi
	setb	bl
	mov	rdx, r14
	neg	rdx
	add	r14, rdx
	mov	rsi, -1
	mulx	rsi, r8, rsi
	mov	qword ptr [rsp - 40], rsi       # 8-byte Spill
	movabs	rsi, -4294967296
	mulx	rsi, r14, rsi
	lea	r9, [r10 + r15]
	adc	r14, r9
	setb	r9b
	mov	rbp, rsi
	adc	rbp, r8
	mov	qword ptr [rsp - 56], rbp       # 8-byte Spill
	add	r10, r15
	movzx	r10d, r11b
	adc	r10, r13
	adc	rax, r12
	adc	rbx, rcx
	setb	r11b
	add	rsi, r8
	mov	ecx, 4294967295
	mulx	rcx, r12, rcx
	adc	r12, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rcx, 0
	add	r9b, 255
	adc	rsi, r10
	adc	r12, rax
	adc	rcx, rbx
	setb	al
	add	r11b, 255
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	mov	rsi, qword ptr [rdx + 16]
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r13, r8, rsi
	mov	rdx, qword ptr [rsp - 8]        # 8-byte Reload
	mulx	rbx, r9, rsi
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	r15, r11, rsi
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rsi, rdx, rsi
	movzx	ebp, byte ptr [rsp - 58]        # 1-byte Folded Reload
	movzx	eax, al
	adc	rax, rbp
	mov	rbp, rsi
	add	rbp, r11
	adc	r15, r9
	adc	rbx, r8
	adc	r13, 0
	mov	r8, r14
	add	r8, rdx
	adc	rsi, r11
	add	r14, rdx
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	lea	r9, [rdx + r10]
	adc	rbp, r9
	adc	r15, r12
	mov	r8, r15
	mov	qword ptr [rsp - 56], r15       # 8-byte Spill
	adc	rbx, rcx
	adc	r13, 0
	setb	byte ptr [rsp - 58]             # 1-byte Folded Spill
	mov	rdx, r14
	neg	rdx
	mov	ecx, 4294967295
	mulx	r11, r10, rcx
	add	rsi, r9
	mov	rcx, -1
	mulx	rbp, r9, rcx
	movabs	rcx, -4294967296
	mulx	r15, r12, rcx
	mov	rcx, r15
	add	rcx, r9
	adc	rbp, r10
	adc	r11, 0
	add	rdx, r14
	adc	r12, rsi
	setb	dl
	adc	r15, r9
	add	dl, 255
	adc	rcx, r8
	adc	rbp, rbx
	lea	rcx, [r13 + rax]
	adc	r11, rcx
	setb	cl
	add	r13, rax
	movzx	eax, byte ptr [rsp - 58]        # 1-byte Folded Reload
	movzx	r14d, cl
	adc	r14, rax
	mov	rax, qword ptr [rsp - 32]       # 8-byte Reload
	mov	rax, qword ptr [rax + 24]
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r10, rcx, rax
	mov	rdx, qword ptr [rsp - 8]        # 8-byte Reload
	mulx	rbx, rsi, rax
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	r8, r13, rax
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	r9, rax, rax
	mov	rdx, r9
	add	rdx, r13
	adc	r8, rsi
	adc	rbx, rcx
	adc	r10, 0
	mov	rcx, r12
	add	rcx, rax
	adc	r9, r13
	add	r12, rax
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	lea	rsi, [r15 + rax]
	adc	rdx, rsi
	adc	r8, rbp
	adc	rbx, r11
	adc	r10, 0
	setb	r11b
	mov	qword ptr [rsp - 48], rdi       # 8-byte Spill
	mov	rdx, r12
	neg	rdx
	mov	eax, 4294967295
	mulx	rdi, r15, rax
	mov	rax, -1
	mulx	rcx, r13, rax
	add	r9, rsi
	movabs	rax, -4294967296
	mulx	rax, rsi, rax
	mov	rbp, rax
	add	rbp, r13
	adc	rcx, r15
	adc	rdi, 0
	add	rdx, r12
	adc	rsi, r9
	setb	dl
	adc	rax, r13
	lea	r9, [r10 + r14]
	add	dl, 255
	adc	rbp, r8
	adc	rcx, rbx
	adc	rdi, r9
	setb	dl
	add	r10, r14
	movzx	r10d, r11b
	lea	r9, [rax + r8]
	movzx	ebx, dl
	adc	rbx, r10
	xor	edx, edx
	mov	r8, rsi
	add	r8, -1
	mov	eax, 0
	adc	al, -1
	neg	al
	movzx	eax, al
	movabs	r10, -4294967296
	or	rax, r10
	mov	r10, r9
	sub	r10, rax
	mov	eax, 0
	sbb	rax, rax
	neg	al
	movzx	eax, al
	mov	r11, rcx
	sub	r11, rax
	mov	eax, 0
	sbb	rax, rax
	add	r11, 1
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	r15, rdi
	sub	r15, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	r14, -4294967295
	add	r14, r15
	adc	al, -1
	neg	al
	movzx	eax, al
	cmp	rbx, rax
	mov	eax, 0
	sbb	rax, rax
	neg	al
	sbb	rdx, rdx
	mov	rax, rdx
	#APP
	#NO_APP
	and	rsi, rax
	not	rdx
	#APP
	#NO_APP
	and	r8, rdx
	or	r8, rsi
	and	r9, rax
	and	r10, rdx
	or	r10, r9
	and	rcx, rax
	and	r11, rdx
	or	r11, rcx
	and	rax, rdi
	and	rdx, r14
	or	rdx, rax
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	mov	qword ptr [rax], r8
	mov	qword ptr [rax + 8], r10
	mov	qword ptr [rax + 16], r11
	mov	qword ptr [rax + 24], rdx
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
	.size	fiat_p224_mul_clang, .Lfunc_end0-fiat_p224_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
