	.text
	.intel_syntax noprefix
	.file	"p448_solinas_square_wrapper.c"
	.globl	fiat_p448_solinas_carry_square_clang # -- Begin function fiat_p448_solinas_carry_square_clang
	.p2align	4, 0x90
	.type	fiat_p448_solinas_carry_square_clang,@function
fiat_p448_solinas_carry_square_clang:   # @fiat_p448_solinas_carry_square_clang
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
	sub	rsp, 328
	.cfi_def_cfa_offset 384
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	qword ptr [rsp + 320], rdi      # 8-byte Spill
	mov	rdx, qword ptr [rsi + 56]
	lea	r11, [rdx + rdx]
	mov	rax, qword ptr [rsi + 48]
	lea	r12, [rax + rax]
	mov	rcx, qword ptr [rsi + 40]
	mulx	rdx, rdi, rdx
	mov	qword ptr [rsp - 64], rdi       # 8-byte Spill
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rdi, r11
	mov	qword ptr [rsp - 80], rdi       # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rax, rdx, rax
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, r11
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, r9, r12
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	lea	r15, [rcx + rcx]
	mulx	rax, rcx, rcx
	mov	qword ptr [rsp + 304], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 312], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsi + 32]
	mulx	rdi, r13, r11
	mulx	r8, rax, r12
	mov	qword ptr [rsp + 296], rax      # 8-byte Spill
	mulx	rax, rcx, r15
	mov	qword ptr [rsp + 256], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 272], rax      # 8-byte Spill
	lea	rbp, [rdx + rdx]
	mulx	rax, rcx, rdx
	mov	qword ptr [rsp + 104], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rsi + 24]
	mov	rdx, rax
	mulx	rcx, rdx, r11
	mov	qword ptr [rsp + 280], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 288], rcx      # 8-byte Spill
	mov	rdx, rax
	mulx	rcx, rdx, r12
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 216], rcx      # 8-byte Spill
	mov	rdx, rax
	mulx	r14, rcx, r15
	mov	qword ptr [rsp + 16], rcx       # 8-byte Spill
	mulx	rcx, rdx, rbp
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 72], rcx       # 8-byte Spill
	add	r13, r9
	mov	rdx, rax
	mulx	rcx, rdx, rax
	mov	qword ptr [rsp + 248], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 264], rcx      # 8-byte Spill
	mov	rdx, qword ptr [rsi + 16]
	mulx	rcx, r9, r11
	mov	qword ptr [rsp + 152], r9       # 8-byte Spill
	mov	qword ptr [rsp + 160], rcx      # 8-byte Spill
	lea	r9, [rax + rax]
	mulx	rax, rcx, r12
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	mulx	rax, rcx, r15
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	rbx, qword ptr [rsi]
	mov	r10, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 120], rbp      # 8-byte Spill
	mulx	rax, rcx, rbp
	mov	qword ptr [rsp + 208], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 224], rax      # 8-byte Spill
	mulx	rax, rcx, r9
	mov	qword ptr [rsp + 136], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 144], rax      # 8-byte Spill
	lea	rsi, [rdx + rdx]
	mov	qword ptr [rsp + 80], rsi       # 8-byte Spill
	mulx	rax, rcx, rdx
	mov	qword ptr [rsp + 8], rcx        # 8-byte Spill
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	mov	rdx, r10
	mulx	rax, rcx, r11
	mov	qword ptr [rsp + 24], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 40], rax       # 8-byte Spill
	mulx	rax, rcx, r12
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mulx	rax, rcx, r15
	mov	qword ptr [rsp + 184], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 192], rax      # 8-byte Spill
	mulx	rax, rcx, rbp
	mov	qword ptr [rsp + 112], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mulx	rax, rcx, r9
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	mov	qword ptr [rsp], rax            # 8-byte Spill
	mulx	rcx, rax, rsi
	mulx	rdx, rbp, r10
	mov	qword ptr [rsp + 232], rbp      # 8-byte Spill
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	rdx, rbx
	mulx	rbp, r11, r11
	mulx	rdx, r12, r12
	mov	qword ptr [rsp + 168], r12      # 8-byte Spill
	mov	qword ptr [rsp + 176], rdx      # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, r15, r15
	mov	qword ptr [rsp + 88], r15       # 8-byte Spill
	mov	qword ptr [rsp + 96], rdx       # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, rsi, qword ptr [rsp - 120] # 8-byte Folded Reload
	mov	qword ptr [rsp - 16], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	adc	rdi, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	rdx, rbx
	mulx	rdx, r9, r9
	add	rax, r13
	adc	rcx, rdi
	add	rax, r9
	adc	rcx, rdx
	shld	rcx, rax, 8
	mov	dl, 56
	bzhi	rax, rax, rdx
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	dl, 56
	add	r13, qword ptr [rsp + 64]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 72]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r13, r11
	adc	rdi, rbp
	mov	r11, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 64]       # 8-byte Reload
	shld	r11, rax, 1
	mov	r12, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 80]       # 8-byte Reload
	shld	r12, rax, 1
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	add	rax, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	rbp, qword ptr [rsp - 128]      # 8-byte Reload
	adc	rbp, qword ptr [rsp - 104]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rbp      # 8-byte Spill
	shld	rdi, r13, 8
	bzhi	rdx, r13, rdx
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	shld	rbp, rax, 1
	mov	rsi, qword ptr [rsp + 16]       # 8-byte Reload
	add	rsi, qword ptr [rsp + 104]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 120]      # 8-byte Folded Reload
	lea	rdx, [rax + rax]
	add	rdx, rsi
	adc	rbp, r14
	mov	r15, qword ptr [rsp + 48]       # 8-byte Reload
	add	rdx, r15
	mov	r13, qword ptr [rsp + 56]       # 8-byte Reload
	adc	rbp, r13
	add	rdx, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 32]       # 8-byte Folded Reload
	mov	r9, qword ptr [rsp + 24]        # 8-byte Reload
	add	rdx, r9
	mov	rax, qword ptr [rsp + 40]       # 8-byte Reload
	adc	rbp, rax
	add	rdx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp]            # 8-byte Folded Reload
	add	rdx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	rdx, rcx
	adc	rbp, 0
	add	rdx, rdi
	adc	rbp, 0
	shld	rbp, rdx, 8
	mov	cl, 56
	bzhi	rcx, rdx, rcx
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	add	rsi, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	rsi, r15
	adc	r14, r13
	add	rsi, r9
	adc	r14, rax
	mov	rdx, rbx
	mulx	rax, r13, qword ptr [rsp + 80]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	lea	rax, [r10 + r10]
	mulx	r10, r9, rax
	mulx	rax, rcx, rbx
	add	rsi, rcx
	adc	r14, rax
	add	rsi, rdi
	adc	r14, 0
	mov	rdi, qword ptr [rsp + 200]      # 8-byte Reload
	add	rdi, qword ptr [rsp + 256]      # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp + 216]      # 8-byte Reload
	adc	rbx, qword ptr [rsp + 272]      # 8-byte Folded Reload
	add	rdi, qword ptr [rsp + 152]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 160]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	lea	rcx, [rdx + rdx]
	add	rcx, rdi
	adc	r12, rbx
	add	rcx, qword ptr [rsp + 136]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 144]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 128]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 88]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 96]       # 8-byte Folded Reload
	add	rcx, rbp
	adc	r12, 0
	shld	r14, rsi, 8
	mov	r15b, 56
	bzhi	rax, rsi, r15
	add	rdi, rdx
	mov	rdx, rbx
	adc	rdx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	rdi, r9
	adc	rdx, r10
	add	rdi, r14
	mov	rsi, rdi
	adc	rdx, 0
	mov	r9, rdx
	shld	r12, rcx, 8
	bzhi	rcx, rcx, r15
	mov	rbx, qword ptr [rsp + 296]      # 8-byte Reload
	add	rbx, qword ptr [rsp + 304]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 312]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 280]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 288]       # 8-byte Folded Reload
	mov	rdi, qword ptr [rsp - 64]       # 8-byte Reload
	lea	rdx, [rdi + rdi]
	add	rdx, rbx
	adc	r11, r8
	add	rdx, qword ptr [rsp + 248]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 264]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 208]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 224]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 184]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 192]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 168]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 176]      # 8-byte Folded Reload
	add	rdx, r12
	adc	r11, 0
	shld	r9, rsi, 8
	mov	r14b, 56
	bzhi	rsi, rsi, r14
	add	rbx, rdi
	adc	r8, qword ptr [rsp - 56]        # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 240]       # 8-byte Folded Reload
	add	rbx, r13
	adc	r8, qword ptr [rsp - 128]       # 8-byte Folded Reload
	add	rbx, r9
	adc	r8, 0
	shld	r11, rdx, 8
	add	r11, qword ptr [rsp - 104]      # 8-byte Folded Reload
	shld	r8, rbx, 8
	add	r8, qword ptr [rsp - 96]        # 8-byte Folded Reload
	bzhi	rdi, r8, r14
	shr	r8, 56
	add	r8, qword ptr [rsp - 112]       # 8-byte Folded Reload
	bzhi	r9, r11, r14
	shr	r11, 56
	add	rax, r11
	add	r8, r11
	bzhi	r10, r8, r14
	shr	r8, 56
	add	r8, rcx
	bzhi	rcx, rdx, r14
	bzhi	rdx, rbx, r14
	bzhi	r11, rax, r14
	shr	rax, 56
	add	rax, rsi
	mov	rsi, qword ptr [rsp + 320]      # 8-byte Reload
	mov	qword ptr [rsi], r11
	mov	qword ptr [rsi + 8], rax
	mov	qword ptr [rsi + 16], rdx
	mov	qword ptr [rsi + 24], rdi
	mov	qword ptr [rsi + 32], r10
	mov	qword ptr [rsi + 40], r8
	mov	qword ptr [rsi + 48], rcx
	mov	qword ptr [rsi + 56], r9
	add	rsp, 328
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
	.size	fiat_p448_solinas_carry_square_clang, .Lfunc_end0-fiat_p448_solinas_carry_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
