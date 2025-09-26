	.text
	.intel_syntax noprefix
	.file	"secp256k1_montgomery_square_wrapper.c"
	.globl	fiat_secp256k1_montgomery_square_clang # -- Begin function fiat_secp256k1_montgomery_square_clang
	.p2align	4, 0x90
	.type	fiat_secp256k1_montgomery_square_clang,@function
fiat_secp256k1_montgomery_square_clang: # @fiat_secp256k1_montgomery_square_clang
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
	mov	r10, qword ptr [rsi + 24]
	mulx	rax, rbp, r10
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mov	qword ptr [rsp], rbp            # 8-byte Spill
	mov	qword ptr [rsp - 112], r10      # 8-byte Spill
	mulx	rbx, r11, rcx
	mov	qword ptr [rsp - 40], rbx       # 8-byte Spill
	mov	qword ptr [rsp - 32], r11       # 8-byte Spill
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mulx	rsi, r14, r8
	mulx	r9, r15, rdx
	mov	rdx, r9
	add	rdx, r14
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	r13, r14
	mov	qword ptr [rsp - 88], r14       # 8-byte Spill
	adc	r11, rsi
	mov	qword ptr [rsp - 72], r11       # 8-byte Spill
	adc	rbp, rbx
	mov	qword ptr [rsp - 120], rbp      # 8-byte Spill
	adc	rax, 0
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	movabs	rax, -2866531139136965327
	mov	rbp, r15
	mov	qword ptr [rsp - 104], r15      # 8-byte Spill
	mov	rdx, r15
	imul	rdx, rax
	mov	rax, -1
	mulx	r11, rbx, rax
	movabs	rax, -4294968273
	mulx	r15, r14, rax
	add	r15, rbx
	mov	r12, rbx
	adc	r12, r11
	adc	rbx, r11
	adc	r11, 0
	mov	rdx, r14
	add	rdx, rbp
	adc	r9, r13
	mov	rdx, r10
	mulx	rbp, rax, r8
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	qword ptr [rsp - 16], rbp       # 8-byte Spill
	mov	rdx, rcx
	mulx	rcx, r10, r8
	mov	qword ptr [rsp - 64], r10       # 8-byte Spill
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r8, r8
	mov	qword ptr [rsp - 96], r8        # 8-byte Spill
	mov	r13, rsi
	add	r13, r8
	adc	rdx, r10
	adc	rax, rcx
	mov	r8, rbp
	adc	r8, 0
	add	r14, qword ptr [rsp - 104]      # 8-byte Folded Reload
	lea	r9, [r9 + r15]
	adc	r15, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r8, 0
	setb	byte ptr [rsp - 128]            # 1-byte Folded Spill
	mov	rcx, r9
	mov	r10, qword ptr [rsp - 88]       # 8-byte Reload
	add	rcx, r10
	adc	rsi, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r9, r10
	adc	r13, r12
	adc	rbx, rdx
	adc	r11, rax
	adc	r8, 0
	setb	al
	mov	rdx, r9
	movabs	rcx, -2866531139136965327
	imul	rdx, rcx
	mov	rcx, -1
	mulx	r10, r14, rcx
	movabs	rcx, -4294968273
	mulx	rdx, rcx, rcx
	add	rdx, r14
	mov	rbp, r14
	adc	rbp, r10
	adc	r14, r10
	adc	r10, 0
	mov	r15, rcx
	add	r15, r9
	mov	r15, rsi
	adc	r15, r12
	add	r9, rcx
	lea	rcx, [rsi + r12]
	adc	rcx, rdx
	adc	rbp, rbx
	adc	r14, r11
	adc	r10, r8
	lea	r13, [r15 + rdx]
	setb	cl
	add	al, 255
	movzx	eax, byte ptr [rsp - 128]       # 1-byte Folded Reload
	movzx	ebx, cl
	adc	rbx, rax
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	rsi, r11, rax
	mov	qword ptr [rsp - 120], r11      # 8-byte Spill
	mov	qword ptr [rsp - 128], rsi      # 8-byte Spill
	mov	rdx, rax
	mulx	r9, rax, rax
	mov	r8, qword ptr [rsp - 40]        # 8-byte Reload
	mov	rcx, r8
	mov	r15, qword ptr [rsp - 64]       # 8-byte Reload
	add	rcx, r15
	adc	rax, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r9, r11
	mov	r11, rsi
	adc	r11, 0
	mov	rdx, r13
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	add	rdx, rsi
	adc	r8, r15
	add	r13, rsi
	adc	rcx, rbp
	adc	rax, r14
	adc	r9, r10
	adc	r11, 0
	setb	r10b
	mov	rdx, r13
	movabs	rcx, -2866531139136965327
	imul	rdx, rcx
	mov	rcx, -1
	mulx	r12, rsi, rcx
	movabs	rcx, -4294968273
	mulx	rdx, rcx, rcx
	add	rdx, rsi
	mov	r14, rsi
	adc	r14, r12
	adc	rsi, r12
	adc	r12, 0
	mov	r15, rcx
	add	r15, r13
	mov	r15, r8
	adc	r15, rbp
	add	r13, rcx
	lea	rcx, [r8 + rbp]
	adc	rcx, rdx
	adc	r14, rax
	adc	rsi, r9
	lea	rax, [r11 + rbx]
	adc	r12, rax
	setb	al
	add	r11, rbx
	lea	rcx, [r15 + rdx]
	movzx	edx, r10b
	movzx	r9d, al
	adc	r9, rdx
	mov	r11, qword ptr [rsp - 8]        # 8-byte Reload
	mov	rax, r11
	mov	r13, qword ptr [rsp - 24]       # 8-byte Reload
	add	rax, r13
	mov	r8, qword ptr [rsp - 120]       # 8-byte Reload
	adc	r8, qword ptr [rsp - 16]        # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	r10, rbx, rdx
	adc	rbx, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r10, 0
	mov	rdx, rcx
	mov	r15, qword ptr [rsp]            # 8-byte Reload
	add	rdx, r15
	adc	r11, r13
	add	rcx, r15
	adc	rax, r14
	lea	r15, [r11 + r14]
	adc	r8, rsi
	adc	rbx, r12
	adc	r10, 0
	setb	r11b
	lea	r14, [r10 + r9]
	movabs	rdx, -2866531139136965327
	imul	rdx, rcx
	mov	rsi, -1
	mulx	rsi, r12, rsi
	movabs	rax, -4294968273
	mulx	rax, rdx, rax
	add	rdx, rcx
	adc	r15, 0
	setb	bpl
	add	rax, r12
	mov	rcx, r12
	adc	rcx, rsi
	adc	r12, rsi
	adc	r14, rsi
	setb	r13b
	xor	edx, edx
	add	rcx, r8
	setb	dl
	xor	esi, esi
	add	r12, rbx
	setb	sil
	movzx	r8d, bpl
	add	rax, r15
	adc	rcx, r8
	adc	rdx, r12
	movzx	r8d, r13b
	adc	rsi, r14
	adc	r8, 0
	add	r10, r9
	movzx	ebx, r11b
	adc	rbx, r8
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
	movzx	r14d, r11b
	mov	r11, rdx
	sub	r11, r14
	mov	r14d, 0
	sbb	r14, r14
	add	r11, 1
	adc	r14b, -1
	neg	r14b
	movzx	r15d, r14b
	mov	r14, rsi
	sub	r14, r15
	mov	r15d, 0
	sbb	r15, r15
	add	r14, 1
	adc	r15b, -1
	neg	r15b
	movzx	r15d, r15b
	cmp	rbx, r15
	mov	ebx, 0
	sbb	rbx, rbx
	neg	bl
	sbb	r8, r8
	mov	rbx, r8
	#APP
	#NO_APP
	and	rax, rbx
	not	r8
	#APP
	#NO_APP
	and	r9, r8
	or	r9, rax
	and	rcx, rbx
	and	r10, r8
	or	r10, rcx
	and	rdx, rbx
	and	r11, r8
	or	r11, rdx
	and	rbx, rsi
	and	r8, r14
	or	r8, rbx
	mov	qword ptr [rdi], r9
	mov	qword ptr [rdi + 8], r10
	mov	qword ptr [rdi + 16], r11
	mov	qword ptr [rdi + 24], r8
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
	.size	fiat_secp256k1_montgomery_square_clang, .Lfunc_end0-fiat_secp256k1_montgomery_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
