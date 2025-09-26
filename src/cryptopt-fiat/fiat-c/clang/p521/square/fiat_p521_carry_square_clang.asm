	.text
	.intel_syntax noprefix
	.file	"p521_square_wrapper.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function fiat_p521_carry_square_clang
.LCPI0_0:
	.quad	288230376151711743              # 0x3ffffffffffffff
	.text
	.globl	fiat_p521_carry_square_clang
	.p2align	4, 0x90
	.type	fiat_p521_carry_square_clang,@function
fiat_p521_carry_square_clang:           # @fiat_p521_carry_square_clang
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
	sub	rsp, 480
	.cfi_def_cfa_offset 536
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r15, rsi
	mov	qword ptr [rsp + 472], rdi      # 8-byte Spill
	mov	rsi, qword ptr [rsi + 64]
	lea	rdx, [rsi + rsi]
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	r10, qword ptr [r15 + 56]
	lea	rax, [r10 + r10]
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	r14, qword ptr [r15 + 48]
	mulx	rcx, rdx, rsi
	mov	qword ptr [rsp + 248], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 256], rcx      # 8-byte Spill
	shl	rsi, 2
	mov	rdx, r10
	mulx	rcx, rdx, rsi
	mov	qword ptr [rsp + 264], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 272], rcx      # 8-byte Spill
	mov	rdx, rax
	mulx	rcx, rdx, r10
	mov	qword ptr [rsp + 296], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 304], rcx      # 8-byte Spill
	mov	rdx, r14
	mulx	rcx, rdx, rsi
	mov	qword ptr [rsp + 280], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 288], rcx      # 8-byte Spill
	shl	r10, 2
	mov	rdx, r14
	mulx	rcx, rdx, r10
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 344], rcx      # 8-byte Spill
	lea	rdx, [r14 + r14]
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mulx	rcx, rdx, r14
	mov	qword ptr [rsp + 400], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 416], rcx      # 8-byte Spill
	mov	r11, qword ptr [r15 + 40]
	mov	rdx, r11
	mulx	rcx, rdx, rsi
	mov	qword ptr [rsp + 312], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 320], rcx      # 8-byte Spill
	mov	rdx, r11
	mulx	rcx, rdx, r10
	mov	qword ptr [rsp + 376], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 384], rcx      # 8-byte Spill
	shl	r14, 2
	mov	rdx, r11
	mulx	rcx, rdx, r14
	mov	qword ptr [rsp + 432], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 448], rcx      # 8-byte Spill
	lea	rbp, [r11 + r11]
	mov	rdx, rbp
	mulx	rcx, rdx, r11
	mov	qword ptr [rsp + 456], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 464], rcx      # 8-byte Spill
	mov	rbx, qword ptr [r15 + 32]
	mov	rdx, rbx
	mulx	rcx, rdx, rsi
	mov	qword ptr [rsp + 336], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 352], rcx      # 8-byte Spill
	mov	rdx, rbx
	mulx	rcx, rdx, r10
	mov	qword ptr [rsp + 392], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 408], rcx      # 8-byte Spill
	mov	rdx, rbx
	mulx	r8, r13, r14
	shl	r11, 2
	mulx	rdi, rcx, r11
	mulx	rdx, rax, rbx
	mov	qword ptr [rsp + 216], rax      # 8-byte Spill
	mov	qword ptr [rsp + 224], rdx      # 8-byte Spill
	mov	r11, qword ptr [r15 + 24]
	mov	rdx, r11
	mulx	rdx, r9, rsi
	mov	qword ptr [rsp + 360], r9       # 8-byte Spill
	mov	qword ptr [rsp + 368], rdx      # 8-byte Spill
	mov	rdx, r11
	mulx	rdx, r9, r10
	mov	qword ptr [rsp + 424], r9       # 8-byte Spill
	mov	qword ptr [rsp + 440], rdx      # 8-byte Spill
	mov	rdx, r11
	mulx	r12, r14, r14
	add	r14, rcx
	lea	rcx, [rbx + rbx]
	mulx	rax, rdx, rbp
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rdx, r11
	mulx	rax, rdx, rcx
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	adc	r12, rdi
	mov	rdx, r11
	mulx	rax, rdx, r11
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	rbx, qword ptr [r15 + 16]
	mov	rdx, rbx
	mulx	rdx, rdi, rsi
	mov	qword ptr [rsp + 232], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	rdx, rbx
	mulx	r10, rdx, r10
	add	r14, rdx
	lea	rdi, [r11 + r11]
	mov	rdx, rbx
	mov	rax, qword ptr [rsp - 128]      # 8-byte Reload
	mulx	rdx, r9, rax
	mov	qword ptr [rsp], r9             # 8-byte Spill
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, r9, rbp
	mov	qword ptr [rsp + 40], r9        # 8-byte Spill
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, r9, rcx
	mov	qword ptr [rsp + 80], r9        # 8-byte Spill
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, r9, rdi
	mov	qword ptr [rsp + 128], r9       # 8-byte Spill
	mov	qword ptr [rsp + 152], rdx      # 8-byte Spill
	adc	r12, r10
	mov	rdx, rbx
	mulx	rdx, r9, rbx
	mov	qword ptr [rsp + 160], r9       # 8-byte Spill
	mov	qword ptr [rsp + 176], rdx      # 8-byte Spill
	mov	rdx, qword ptr [r15 + 8]
	mulx	rsi, r10, rsi
	mov	qword ptr [rsp - 56], rsi       # 8-byte Spill
	add	r14, r10
	lea	r9, [rbx + rbx]
	mov	r10, qword ptr [rsp - 120]      # 8-byte Reload
	mulx	rsi, r11, r10
	mov	qword ptr [rsp - 40], r11       # 8-byte Spill
	mov	qword ptr [rsp - 24], rsi       # 8-byte Spill
	mulx	rsi, r11, rax
	mov	qword ptr [rsp - 8], r11        # 8-byte Spill
	mov	qword ptr [rsp + 16], rsi       # 8-byte Spill
	mulx	rsi, r11, rbp
	mov	qword ptr [rsp + 32], r11       # 8-byte Spill
	mov	qword ptr [rsp + 48], rsi       # 8-byte Spill
	mulx	rsi, r11, rcx
	mov	qword ptr [rsp + 72], r11       # 8-byte Spill
	mov	qword ptr [rsp + 96], rsi       # 8-byte Spill
	mulx	rsi, r11, rdi
	mov	qword ptr [rsp + 120], r11      # 8-byte Spill
	mov	qword ptr [rsp + 144], rsi      # 8-byte Spill
	mov	rsi, qword ptr [r15]
	mulx	r11, rbx, r9
	mov	qword ptr [rsp + 168], rbx      # 8-byte Spill
	mov	qword ptr [rsp + 184], r11      # 8-byte Spill
	lea	r11, [rdx + rdx]
	mulx	rdx, rbx, rdx
	mov	qword ptr [rsp + 200], rbx      # 8-byte Spill
	mov	qword ptr [rsp + 208], rdx      # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, rbx, qword ptr [rsp - 112] # 8-byte Folded Reload
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, r10, r10
	mov	qword ptr [rsp - 32], r10       # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rdx, rsi
	mulx	r10, rax, rax
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mulx	rax, r15, rbp
	mov	qword ptr [rsp + 64], rax       # 8-byte Spill
	mulx	rax, rcx, rcx
	mov	qword ptr [rsp + 88], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 112], rax      # 8-byte Spill
	mulx	rdi, rax, rdi
	mov	qword ptr [rsp + 136], rax      # 8-byte Spill
	mulx	rax, r9, r9
	mov	qword ptr [rsp + 192], rax      # 8-byte Spill
	mulx	rax, rcx, r11
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mulx	rax, rcx, rsi
	adc	r12, qword ptr [rsp - 56]       # 8-byte Folded Reload
	add	r14, rcx
	mov	qword ptr [rsp - 112], r14      # 8-byte Spill
	adc	r12, rax
	mov	rdx, r12
	shr	rdx, 58
	shld	r12, r14, 6
	mov	rcx, qword ptr [rsp - 72]       # 8-byte Reload
	add	rcx, qword ptr [rsp + 216]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 64]       # 8-byte Reload
	adc	rax, qword ptr [rsp + 224]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	rcx, rbx
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	adc	rax, qword ptr [rsp - 48]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	add	rcx, qword ptr [rsp + 248]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 80]       # 8-byte Reload
	adc	rax, qword ptr [rsp + 256]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 56]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 16]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	adc	rax, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rcx, qword ptr [rsp - 104]      # 8-byte Reload
	add	rcx, qword ptr [rsp + 264]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	adc	rax, qword ptr [rsp + 272]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 8]        # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], rcx      # 8-byte Spill
	adc	rax, r10
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 280]      # 8-byte Reload
	add	rax, qword ptr [rsp + 296]      # 8-byte Folded Reload
	mov	r10, qword ptr [rsp + 288]      # 8-byte Reload
	adc	r10, qword ptr [rsp + 304]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 152]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 96]       # 8-byte Folded Reload
	add	rax, r15
	mov	rbp, rax
	adc	r10, qword ptr [rsp + 64]       # 8-byte Folded Reload
	mov	rsi, qword ptr [rsp + 312]      # 8-byte Reload
	add	rsi, qword ptr [rsp + 328]      # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp + 320]      # 8-byte Reload
	adc	rbx, qword ptr [rsp + 344]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 176]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 120]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 144]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 88]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 112]      # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp + 376]      # 8-byte Reload
	add	rcx, qword ptr [rsp + 400]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp + 384]      # 8-byte Reload
	adc	r11, qword ptr [rsp + 416]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 336]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 352]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 168]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 184]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 136]      # 8-byte Folded Reload
	adc	r11, rdi
	mov	rdi, qword ptr [rsp + 392]      # 8-byte Reload
	add	rdi, qword ptr [rsp + 432]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp + 408]      # 8-byte Reload
	adc	rax, qword ptr [rsp + 448]      # 8-byte Folded Reload
	add	rdi, qword ptr [rsp + 360]      # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 368]      # 8-byte Folded Reload
	add	rdi, qword ptr [rsp + 200]      # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 208]      # 8-byte Folded Reload
	add	rdi, r9
	mov	r9, rdi
	adc	rax, qword ptr [rsp + 192]      # 8-byte Folded Reload
	mov	rdi, rax
	add	r13, qword ptr [rsp + 456]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 464]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 424]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 440]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 240]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 120]       # 8-byte Folded Reload
	add	r13, r12
	adc	r8, rdx
	mov	rax, r8
	shr	rax, 58
	shld	r8, r13, 6
	mov	dl, 58
	bzhi	r14, r13, rdx
	add	r8, r9
	adc	rax, rdi
	movabs	rdi, 288230376151711741
	and	rdi, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	r9, rax
	shr	r9, 58
	shld	rax, r8, 6
	bzhi	r15, r8, rdx
	add	rax, rcx
	adc	r9, r11
	mov	r11, r9
	shr	r11, 58
	shld	r9, rax, 6
	add	r9, rsi
	adc	r11, rbx
	mov	rbx, r11
	shr	rbx, 58
	shld	r11, r9, 6
	add	r11, rbp
	adc	rbx, r10
	mov	r8, rbx
	shr	r8, 58
	shld	rbx, r11, 6
	add	rbx, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 96]        # 8-byte Folded Reload
	mov	r10, r8
	shld	r8, rbx, 6
	vmovq	xmm0, rbx
	vmovq	xmm1, r11
	vmovq	xmm2, r9
	shr	r10, 58
	add	r8, qword ptr [rsp - 88]        # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	r9, r10
	shr	r9, 58
	shld	r10, r8, 6
	bzhi	r8, r8, rdx
	add	r10, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 64]        # 8-byte Folded Reload
	mov	r11, r9
	shld	r9, r10, 7
	mov	bl, 57
	bzhi	r10, r10, rbx
	shr	r11, 57
	add	r9, rdi
	adc	r11, 0
	shld	r11, r9, 6
	add	r11, r14
	bzhi	rsi, r9, rdx
	bzhi	rdx, r11, rdx
	shr	r11, 58
	add	r11, r15
	mov	rcx, qword ptr [rsp + 472]      # 8-byte Reload
	mov	qword ptr [rcx], rsi
	mov	qword ptr [rcx + 8], rdx
	mov	qword ptr [rcx + 16], r11
	vmovq	xmm3, rax
	vpunpcklqdq	xmm0, xmm1, xmm0        # xmm0 = xmm1[0],xmm0[0]
	vpunpcklqdq	xmm1, xmm3, xmm2        # xmm1 = xmm3[0],xmm2[0]
	vinserti128	ymm0, ymm1, xmm0, 1
	vpbroadcastq	ymm1, qword ptr [rip + .LCPI0_0] # ymm1 = [288230376151711743,288230376151711743,288230376151711743,288230376151711743]
	vpand	ymm0, ymm0, ymm1
	vmovdqu	ymmword ptr [rcx + 24], ymm0
	mov	qword ptr [rcx + 56], r8
	mov	qword ptr [rcx + 64], r10
	add	rsp, 480
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
	.size	fiat_p521_carry_square_clang, .Lfunc_end0-fiat_p521_carry_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
