	.text
	.intel_syntax noprefix
	.file	"secp256k1_dettman_mul_wrapper.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function fiat_secp256k1_dettman_mul_clang
.LCPI0_0:
	.quad	4503599627370495                # 0xfffffffffffff
	.text
	.globl	fiat_secp256k1_dettman_mul_clang
	.p2align	4, 0x90
	.type	fiat_secp256k1_dettman_mul_clang,@function
fiat_secp256k1_dettman_mul_clang:       # @fiat_secp256k1_dettman_mul_clang
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
	mov	r10, rdx
	mov	rax, qword ptr [rsi + 32]
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	rdx, qword ptr [rdx + 32]
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mulx	rax, r9, rax
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	rdx, qword ptr [r10 + 24]
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	r12, qword ptr [rsi]
	mov	r13, qword ptr [rsi + 8]
	mulx	rdx, rax, r12
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	qword ptr [rsp], r12            # 8-byte Spill
	mov	rdx, qword ptr [r10 + 16]
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mulx	rdx, r11, r13
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 48], r13       # 8-byte Spill
	mov	rcx, qword ptr [r10]
	mov	rdx, qword ptr [r10 + 8]
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	rbp, qword ptr [rsi + 16]
	mulx	r10, rbx, rbp
	mov	r15, qword ptr [rsi + 24]
	mov	rdx, rcx
	mov	rsi, rcx
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	mulx	rcx, r14, r15
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	movabs	rcx, 68719492368
	mov	rdx, r9
	mulx	rcx, r8, rcx
	add	r8, rax
	adc	rcx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	r8, r11
	adc	rcx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	r8, rbx
	adc	rcx, r10
	add	r8, r14
	adc	rcx, qword ptr [rsp - 128]      # 8-byte Folded Reload
	shld	rcx, r8, 12
	mov	rdx, r12
	mov	r12, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r9, r10, r12
	mov	rdx, r13
	mov	r13, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r11, rbx, r13
	mov	rdx, rbp
	mov	qword ptr [rsp - 32], rbp       # 8-byte Spill
	mulx	rax, rdx, qword ptr [rsp - 88]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rdx, r15
	mov	r14, qword ptr [rsp - 56]       # 8-byte Reload
	mulx	rax, rdx, r14
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rdx, rsi
	mulx	rax, rdx, qword ptr [rsp - 72]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	movabs	rax, 281475040739328
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rsi, rax, rax
	mov	dl, 52
	bzhi	rdx, r8, rdx
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	add	rax, r10
	adc	rsi, r9
	add	rax, rbx
	adc	rsi, r11
	add	rax, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	rax, rcx
	adc	rsi, 0
	shld	rsi, rax, 12
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r9, r10, r12
	mov	rdx, rbp
	mulx	rcx, r8, r13
	add	r8, r10
	adc	rcx, r9
	mov	qword ptr [rsp - 8], r15        # 8-byte Spill
	mov	rdx, r15
	mov	rbx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	r9, r10, rbx
	mov	rdx, r14
	mov	rbp, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rdx, r11, rbp
	add	r8, r11
	adc	rcx, rdx
	add	r8, r10
	adc	rcx, r9
	add	r8, rsi
	adc	rcx, 0
	shld	rcx, r8, 12
	shl	r8, 4
	movabs	rsi, 72057594037927920
	and	rsi, r8
	mov	dl, 48
	bzhi	rdx, rax, rdx
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	shr	rax, 48
	and	eax, 15
	or	rsi, rax
	mov	r12, qword ptr [rsp - 40]       # 8-byte Reload
	mov	rdx, r12
	mov	r14, qword ptr [rsp]            # 8-byte Reload
	mulx	rax, rdx, r14
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	movabs	rax, 4294968273
	mov	rdx, rsi
	mulx	r8, rax, rax
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	mov	r13, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	rsi, r9, r13
	mov	rdx, r15
	mulx	r10, r11, qword ptr [rsp - 80]  # 8-byte Folded Reload
	mov	rdx, rbx
	mulx	rax, rbx, rbp
	add	rbx, r9
	adc	rax, rsi
	add	rbx, r11
	adc	rax, r10
	add	rbx, rcx
	adc	rax, 0
	mov	r10, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rdx, r10
	mulx	rcx, rsi, r14
	mov	rbp, r14
	mov	rdx, r12
	mov	r12, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r14, r9, r12
	shld	rax, rbx, 12
	add	r9, rsi
	adc	r14, rcx
	mov	cl, 52
	bzhi	rdx, rbx, rcx
	movabs	rcx, 68719492368
	mulx	rcx, r15, rcx
	add	r15, r9
	mov	rdx, qword ptr [rsp - 8]        # 8-byte Reload
	mulx	r9, rbx, r13
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r11, rsi, qword ptr [rsp - 72]  # 8-byte Folded Reload
	adc	rcx, r14
	add	rsi, rbx
	adc	r11, r9
	add	rsi, rax
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	rbx, r14, rbp
	adc	r11, 0
	mov	rdx, r10
	mulx	r9, rax, r12
	add	rax, r14
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mulx	rdx, r14, qword ptr [rsp - 32]  # 8-byte Folded Reload
	adc	r9, rbx
	add	rax, r14
	adc	r9, rdx
	mov	rdx, rsi
	movabs	rsi, 68719492368
	mulx	rdx, rsi, rsi
	add	rax, rsi
	adc	r9, rdx
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	add	rdx, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 120]       # 8-byte Folded Reload
	shld	r8, rdx, 12
	mov	rsi, rdx
	add	r8, r15
	adc	rcx, 0
	shld	rcx, r8, 12
	add	rcx, rax
	mov	rdx, r11
	movabs	rax, 281475040739328
	mulx	rdx, rax, rax
	adc	r9, 0
	shld	r9, rcx, 12
	add	r9, qword ptr [rsp - 96]        # 8-byte Folded Reload
	add	r9, rax
	adc	rdx, 0
	shld	rdx, r9, 12
	add	rdx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	vmovq	xmm0, r9
	vmovq	xmm1, rcx
	vmovq	xmm2, r8
	vmovq	xmm3, rsi
	vpunpcklqdq	xmm0, xmm1, xmm0        # xmm0 = xmm1[0],xmm0[0]
	vpunpcklqdq	xmm1, xmm3, xmm2        # xmm1 = xmm3[0],xmm2[0]
	vinserti128	ymm0, ymm1, xmm0, 1
	vpbroadcastq	ymm1, qword ptr [rip + .LCPI0_0] # ymm1 = [4503599627370495,4503599627370495,4503599627370495,4503599627370495]
	vpand	ymm0, ymm0, ymm1
	vmovdqu	ymmword ptr [rdi], ymm0
	mov	qword ptr [rdi + 32], rdx
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
	vzeroupper
	ret
.Lfunc_end0:
	.size	fiat_secp256k1_dettman_mul_clang, .Lfunc_end0-fiat_secp256k1_dettman_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
