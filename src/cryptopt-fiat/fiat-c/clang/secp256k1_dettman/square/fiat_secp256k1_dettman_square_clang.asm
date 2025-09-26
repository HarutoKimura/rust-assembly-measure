	.text
	.intel_syntax noprefix
	.file	"secp256k1_dettman_square_wrapper.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function fiat_secp256k1_dettman_square_clang
.LCPI0_0:
	.quad	4503599627370495                # 0xfffffffffffff
	.text
	.globl	fiat_secp256k1_dettman_square_clang
	.p2align	4, 0x90
	.type	fiat_secp256k1_dettman_square_clang,@function
fiat_secp256k1_dettman_square_clang:    # @fiat_secp256k1_dettman_square_clang
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
	mov	r10, qword ptr [rsi + 24]
	mov	r14, qword ptr [rsi + 16]
	mov	r9, qword ptr [rsi]
	mov	rax, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	lea	r11, [rax + rax]
	lea	rcx, [r9 + r9]
	mov	r8, qword ptr [rsi + 32]
	mov	rdx, r8
	mulx	rbx, rsi, r8
	mov	rdx, rcx
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mulx	rdi, r15, r10
	mov	rdx, r11
	mulx	r13, r12, r14
	add	r12, r15
	movabs	rax, 68719492368
	mov	rdx, rsi
	mulx	rsi, rdx, rax
	adc	r13, rdi
	add	rdx, r12
	adc	rsi, r13
	shld	rsi, rdx, 12
	movabs	rax, 4503599627370494
	and	rax, rdx
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rdx, rcx
	mulx	r15, r12, r8
	mov	rdx, r11
	mulx	r13, rbp, r10
	mov	rdx, r14
	mulx	rcx, rax, r14
	add	rax, rbp
	adc	rcx, r13
	add	rax, r12
	movabs	rdi, 281475040739328
	mov	rdx, rbx
	mulx	r12, r13, rdi
	adc	rcx, r15
	add	r13, rax
	adc	r12, rcx
	lea	rdi, [r14 + r14]
	add	r13, rsi
	adc	r12, 0
	shld	r12, r13, 12
	mov	rdx, r8
	mulx	rax, rcx, r11
	mov	rdx, rdi
	mulx	r15, rdx, r10
	add	rdx, rcx
	adc	r15, rax
	add	rdx, r12
	adc	r15, 0
	shld	r15, rdx, 12
	shl	rdx, 4
	movabs	rsi, 72057594037927920
	and	rsi, rdx
	mov	rax, r13
	shr	rax, 48
	and	eax, 15
	or	rsi, rax
	mov	rdx, r9
	mulx	rax, rcx, r9
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	movabs	rax, 4294968273
	mov	rdx, rsi
	mulx	r11, rbx, rax
	mov	rdx, r8
	mulx	rsi, rcx, rdi
	mov	dl, 48
	bzhi	rax, r13, rdx
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	rdx, r10
	mulx	rax, rdx, r10
	add	rdx, rcx
	adc	rax, rsi
	add	rdx, r15
	adc	rax, 0
	shld	rax, rdx, 12
	mov	cl, 52
	bzhi	rsi, rdx, rcx
	mov	r12, qword ptr [rsp - 32]       # 8-byte Reload
	mov	rdx, r12
	mov	rdi, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	r9, rcx, rdi
	mov	rdx, rsi
	movabs	rbp, 68719492368
	mulx	r13, r15, rbp
	add	r15, rcx
	lea	rcx, [r10 + r10]
	mov	rdx, r8
	mulx	r8, rsi, rcx
	adc	r13, r9
	add	rsi, rax
	mov	rdx, r12
	mulx	rax, rcx, r14
	mov	rdx, rdi
	mulx	r9, rdi, rdi
	adc	r8, 0
	add	rdi, rcx
	adc	r9, rax
	mov	rdx, rsi
	mulx	rax, rcx, rbp
	add	rcx, rdi
	adc	rax, r9
	add	rbx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 48]       # 8-byte Folded Reload
	shld	r11, rbx, 12
	add	r11, r15
	adc	r13, 0
	shld	r13, r11, 12
	add	r13, rcx
	mov	rdx, r8
	movabs	rcx, 281475040739328
	mulx	rdx, rcx, rcx
	adc	rax, 0
	shld	rax, r13, 12
	add	rax, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	rax, rcx
	adc	rdx, 0
	shld	rdx, rax, 12
	add	rdx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	vmovq	xmm0, rax
	vmovq	xmm1, r13
	vmovq	xmm2, r11
	vmovq	xmm3, rbx
	vpunpcklqdq	xmm0, xmm1, xmm0        # xmm0 = xmm1[0],xmm0[0]
	vpunpcklqdq	xmm1, xmm3, xmm2        # xmm1 = xmm3[0],xmm2[0]
	vinserti128	ymm0, ymm1, xmm0, 1
	vpbroadcastq	ymm1, qword ptr [rip + .LCPI0_0] # ymm1 = [4503599627370495,4503599627370495,4503599627370495,4503599627370495]
	vpand	ymm0, ymm0, ymm1
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	vmovdqu	ymmword ptr [rax], ymm0
	mov	qword ptr [rax + 32], rdx
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
	vzeroupper
	ret
.Lfunc_end0:
	.size	fiat_secp256k1_dettman_square_clang, .Lfunc_end0-fiat_secp256k1_dettman_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
