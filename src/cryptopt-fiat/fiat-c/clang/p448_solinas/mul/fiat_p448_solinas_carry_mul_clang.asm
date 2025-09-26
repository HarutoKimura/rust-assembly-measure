	.text
	.intel_syntax noprefix
	.file	"p448_solinas_mul_wrapper.c"
	.globl	fiat_p448_solinas_carry_mul_clang # -- Begin function fiat_p448_solinas_carry_mul_clang
	.p2align	4, 0x90
	.type	fiat_p448_solinas_carry_mul_clang,@function
fiat_p448_solinas_carry_mul_clang:      # @fiat_p448_solinas_carry_mul_clang
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
	sub	rsp, 744
	.cfi_def_cfa_offset 800
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r10, rdx
	mov	r8, rsi
	mov	qword ptr [rsp - 80], rsi       # 8-byte Spill
	mov	r11, qword ptr [rsi + 56]
	mov	rsi, qword ptr [rdx + 56]
	mov	qword ptr [rsp - 88], rsi       # 8-byte Spill
	mov	rdx, rsi
	mulx	rax, rcx, r11
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	mov	qword ptr [rsp + 120], rax      # 8-byte Spill
	mov	rbp, qword ptr [r10 + 48]
	mov	rdx, rbp
	mulx	rax, rcx, r11
	mov	qword ptr [rsp + 536], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 552], rax      # 8-byte Spill
	mov	rdx, qword ptr [r10 + 40]
	mov	r9, rdx
	mulx	rax, rcx, r11
	mov	qword ptr [rsp + 544], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 560], rax      # 8-byte Spill
	mov	r12, qword ptr [r8 + 48]
	mov	rdx, r12
	mulx	rax, rcx, rsi
	mov	qword ptr [rsp - 104], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mulx	rax, rcx, rbp
	mov	qword ptr [rsp + 336], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 344], rax      # 8-byte Spill
	mov	r15, qword ptr [r8 + 40]
	mov	rdx, r15
	mulx	rax, rcx, rsi
	mov	qword ptr [rsp + 520], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 528], rax      # 8-byte Spill
	mov	r14, qword ptr [r10 + 32]
	mov	rdx, r14
	mulx	rax, rsi, r11
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	r8, qword ptr [r10 + 24]
	mov	rdx, r8
	mulx	rdx, rbx, r11
	mov	qword ptr [rsp + 720], rbx      # 8-byte Spill
	mov	qword ptr [rsp + 728], rdx      # 8-byte Spill
	mov	rax, qword ptr [r10 + 16]
	mov	rdx, rax
	mov	qword ptr [rsp + 16], rax       # 8-byte Spill
	mulx	rdx, rbx, r11
	mov	qword ptr [rsp + 96], rbx       # 8-byte Spill
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 736], rdi      # 8-byte Spill
	mov	rdx, qword ptr [r10 + 8]
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mulx	rdx, rdi, r11
	mov	qword ptr [rsp - 56], rdi       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, r12
	mulx	rdi, rbx, r9
	mov	rcx, r9
	mov	rdx, r14
	mulx	rdx, r13, r12
	mov	qword ptr [rsp + 712], r13      # 8-byte Spill
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	mov	rdx, r8
	mov	r9, r8
	mov	qword ptr [rsp], r8             # 8-byte Spill
	mulx	rdx, r13, r12
	mov	qword ptr [rsp + 80], r13       # 8-byte Spill
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r8, r12
	mov	qword ptr [rsp + 504], r8       # 8-byte Spill
	mov	qword ptr [rsp + 512], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	r8, rdx, rbp
	add	rdx, rbx
	adc	r8, rdi
	add	rdx, rsi
	mov	rsi, rdx
	adc	r8, qword ptr [rsp - 128]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], r8       # 8-byte Spill
	mov	rdx, r15
	mov	r13, rcx
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mulx	rdi, rax, rcx
	mov	qword ptr [rsp + 384], rax      # 8-byte Spill
	mov	qword ptr [rsp - 96], r14       # 8-byte Spill
	mov	rdx, r14
	mulx	rcx, rax, r15
	mov	qword ptr [rsp + 472], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 64], rax       # 8-byte Spill
	mov	rdx, r9
	mulx	rcx, rax, r15
	mov	qword ptr [rsp + 24], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rbx, qword ptr [rsp - 80]       # 8-byte Reload
	mov	rax, qword ptr [rbx + 32]
	mov	rdx, rax
	mov	r8, qword ptr [rsp - 88]        # 8-byte Reload
	mulx	rdx, rcx, r8
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	add	rsi, rcx
	mov	qword ptr [rsp + 160], rsi      # 8-byte Spill
	mov	rdx, rax
	mulx	rcx, rdx, rbp
	mov	qword ptr [rsp + 664], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 696], rcx      # 8-byte Spill
	mov	r9, qword ptr [r10]
	mov	rdx, rax
	mulx	rcx, rdx, r13
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 72], rcx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rcx, r14
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	mov	rcx, qword ptr [rbx + 24]
	mov	rdx, rcx
	mulx	rdx, r10, r8
	mov	rsi, r8
	mov	qword ptr [rsp + 656], r10      # 8-byte Spill
	mov	qword ptr [rsp + 688], rdx      # 8-byte Spill
	mov	rdx, rcx
	mov	r10, rbp
	mov	qword ptr [rsp - 24], rbp       # 8-byte Spill
	mulx	rdx, r8, rbp
	mov	qword ptr [rsp + 456], r8       # 8-byte Spill
	mov	qword ptr [rsp + 480], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, r13
	mov	qword ptr [rsp + 32], r8        # 8-byte Spill
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	rbp, qword ptr [rbx + 16]
	mov	rdx, rbp
	mulx	rdx, r8, rsi
	mov	qword ptr [rsp + 488], r8       # 8-byte Spill
	mov	qword ptr [rsp + 496], rdx      # 8-byte Spill
	mov	rdx, rbp
	mulx	rdx, r8, r10
	mov	qword ptr [rsp + 304], r8       # 8-byte Spill
	mov	qword ptr [rsp + 312], rdx      # 8-byte Spill
	mov	r13, qword ptr [rbx + 8]
	mov	rdx, r13
	mulx	rdx, r8, rsi
	mov	qword ptr [rsp + 320], r8       # 8-byte Spill
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	r14, r9
	mov	rdx, r9
	mulx	rdx, r8, r11
	mov	qword ptr [rsp + 216], r8       # 8-byte Spill
	mov	qword ptr [rsp + 224], rdx      # 8-byte Spill
	mov	r10, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rdx, r10
	mulx	rdx, r9, r12
	mov	qword ptr [rsp + 200], r9       # 8-byte Spill
	mov	qword ptr [rsp + 208], rdx      # 8-byte Spill
	mov	rdx, r14
	mulx	rdx, r9, r12
	mov	qword ptr [rsp + 648], r9       # 8-byte Spill
	mov	qword ptr [rsp + 672], rdx      # 8-byte Spill
	mov	r11, qword ptr [rsp + 16]       # 8-byte Reload
	mov	rdx, r11
	mulx	r12, r9, r15
	mov	rdx, r10
	mulx	rdx, r8, r15
	mov	qword ptr [rsp + 600], r8       # 8-byte Spill
	mov	qword ptr [rsp + 624], rdx      # 8-byte Spill
	mov	rdx, r14
	mulx	rdx, r8, r15
	mov	qword ptr [rsp + 448], r8       # 8-byte Spill
	mov	qword ptr [rsp + 464], rdx      # 8-byte Spill
	mov	rdx, rax
	mov	r8, qword ptr [rsp]             # 8-byte Reload
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp + 176], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r15, r11
	mov	qword ptr [rsp + 616], r15      # 8-byte Spill
	mov	qword ptr [rsp + 640], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rsi, r10
	mov	qword ptr [rsp + 416], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 432], rdx      # 8-byte Spill
	mov	rdx, r14
	mulx	rax, rdx, rax
	mov	qword ptr [rsp + 280], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 296], rax      # 8-byte Spill
	mov	rdx, rcx
	mov	rbx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rax, rdx, rbx
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, r8
	mov	qword ptr [rsp + 608], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 632], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, r11
	mov	qword ptr [rsp + 408], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 424], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, r10
	mov	qword ptr [rsp + 264], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 272], rax      # 8-byte Spill
	mov	rdx, r14
	mulx	rax, rcx, rcx
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rdx, rbp
	mov	rsi, qword ptr [rsp - 120]      # 8-byte Reload
	mulx	rax, rcx, rsi
	mov	qword ptr [rsp + 144], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 152], rax      # 8-byte Spill
	mulx	rax, rcx, rbx
	mov	qword ptr [rsp + 584], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 592], rax      # 8-byte Spill
	mulx	rax, rcx, r8
	mov	qword ptr [rsp + 392], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 400], rax      # 8-byte Spill
	mulx	rax, rcx, r11
	mov	qword ptr [rsp + 248], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 256], rax      # 8-byte Spill
	mulx	rcx, rax, r10
	mov	rdx, r14
	mov	r15, r14
	mov	qword ptr [rsp + 288], r14      # 8-byte Spill
	mulx	rdx, rbp, rbp
	mov	qword ptr [rsp + 680], rbp      # 8-byte Spill
	mov	qword ptr [rsp + 704], rdx      # 8-byte Spill
	mov	rdx, r13
	mov	r14, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rdx, r8, r14
	mov	qword ptr [rsp + 128], r8       # 8-byte Spill
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	rdx, r13
	mulx	rdx, r8, rsi
	mov	qword ptr [rsp + 568], r8       # 8-byte Spill
	mov	qword ptr [rsp + 576], rdx      # 8-byte Spill
	mov	rdx, r13
	mulx	rdx, rsi, rbx
	mov	qword ptr [rsp + 368], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 376], rdx      # 8-byte Spill
	mov	rdx, r13
	mov	rbx, qword ptr [rsp]            # 8-byte Reload
	mulx	rdx, rsi, rbx
	mov	qword ptr [rsp + 232], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	rdx, r13
	mulx	rdx, rbp, r11
	mov	rsi, qword ptr [rsp - 128]      # 8-byte Reload
	adc	rsi, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rsi      # 8-byte Spill
	mov	r11, qword ptr [rsp + 160]      # 8-byte Reload
	add	rax, r11
	adc	rcx, rsi
	add	rax, rbp
	adc	rcx, rdx
	add	rax, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mov	rsi, qword ptr [rdx]
	mov	rdx, r13
	mulx	rdx, r10, r10
	mov	qword ptr [rsp - 16], r10       # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, r8, r13
	mov	qword ptr [rsp + 440], r8       # 8-byte Spill
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	rdx, rsi
	mulx	r13, rbp, qword ptr [rsp - 88]  # 8-byte Folded Reload
	mulx	rdx, r8, r14
	mov	qword ptr [rsp - 32], r8        # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, r8, qword ptr [rsp - 120]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 352], r8       # 8-byte Spill
	mov	qword ptr [rsp + 360], rdx      # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, r8, qword ptr [rsp - 96]   # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], r8        # 8-byte Spill
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, r10, rbx
	add	rax, r10
	adc	rcx, rdx
	shld	rcx, rax, 8
	mov	dl, 56
	bzhi	rax, rax, rdx
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	dl, 56
	add	r9, qword ptr [rsp + 200]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 208]      # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 176]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 192]      # 8-byte Folded Reload
	add	r9, r11
	adc	r12, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 168]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 184]      # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 144]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 152]      # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 128]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 136]      # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 216]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 224]      # 8-byte Folded Reload
	add	r9, rbp
	adc	r12, r13
	mov	r13, qword ptr [rsp + 120]      # 8-byte Reload
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	shld	r13, rax, 1
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	add	rax, qword ptr [rsp + 536]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp + 552]      # 8-byte Reload
	adc	qword ptr [rsp - 112], rax      # 8-byte Folded Spill
	mov	r14, qword ptr [rsp + 336]      # 8-byte Reload
	add	r14, qword ptr [rsp + 544]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp + 344]      # 8-byte Reload
	adc	r11, qword ptr [rsp + 560]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 520]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 528]      # 8-byte Folded Reload
	shld	r12, r9, 8
	bzhi	rax, r9, rdx
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	r9, r11
	shld	r9, r14, 1
	lea	rax, [r14 + r14]
	add	rax, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 24]        # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 504]      # 8-byte Reload
	add	rax, rbp
	mov	r15, qword ptr [rsp + 512]      # 8-byte Reload
	adc	r9, r15
	add	rax, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 48]        # 8-byte Folded Reload
	add	rax, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 40]        # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 48]        # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 272]       # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp + 304]      # 8-byte Reload
	add	rax, rbx
	mov	r10, qword ptr [rsp + 312]      # 8-byte Reload
	adc	r9, r10
	add	rax, qword ptr [rsp + 248]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 256]       # 8-byte Folded Reload
	mov	r8, qword ptr [rsp + 320]       # 8-byte Reload
	add	rax, r8
	mov	rdx, qword ptr [rsp + 328]      # 8-byte Reload
	adc	r9, rdx
	add	rax, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 240]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 280]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 296]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 120]       # 8-byte Folded Reload
	add	rax, rcx
	adc	r9, 0
	add	rax, r12
	adc	r9, 0
	shld	r9, rax, 8
	mov	cl, 56
	bzhi	rax, rax, rcx
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	add	r14, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	r14, rbp
	adc	r11, r15
	add	r14, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 40]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	r14, rbx
	adc	r11, r10
	add	r14, r8
	adc	r11, rdx
	mov	rbx, r11
	mov	rdx, rsi
	mulx	rax, rcx, qword ptr [rsp + 16]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mulx	rcx, rax, qword ptr [rsp + 8]   # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mulx	rdx, rsi, qword ptr [rsp + 288] # 8-byte Folded Reload
	add	r14, rsi
	adc	rbx, rdx
	add	r14, r12
	adc	rbx, 0
	mov	r11, qword ptr [rsp - 112]      # 8-byte Reload
	mov	rsi, r11
	mov	r8, qword ptr [rsp - 104]       # 8-byte Reload
	shld	rsi, r8, 1
	lea	r10, [r8 + r8]
	add	r10, qword ptr [rsp + 64]       # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 472]      # 8-byte Reload
	adc	rsi, rbp
	add	r10, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 88]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 72]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 416]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 432]      # 8-byte Folded Reload
	mov	r15, qword ptr [rsp + 456]      # 8-byte Reload
	add	r10, r15
	mov	r12, qword ptr [rsp + 480]      # 8-byte Reload
	adc	rsi, r12
	add	r10, qword ptr [rsp + 408]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 424]      # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp + 488]      # 8-byte Reload
	add	r10, rcx
	mov	rax, qword ptr [rsp + 496]      # 8-byte Reload
	adc	rsi, rax
	add	r10, qword ptr [rsp + 392]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 400]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 368]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 376]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 448]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 464]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 352]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 360]      # 8-byte Folded Reload
	add	r10, r9
	adc	rsi, 0
	shld	rbx, r14, 8
	mov	dl, 56
	bzhi	rdx, r14, rdx
	mov	r14b, 56
	add	r8, qword ptr [rsp + 64]        # 8-byte Folded Reload
	adc	r11, rbp
	add	r8, qword ptr [rsp + 80]        # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 88]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 96]        # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 56]        # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 72]       # 8-byte Folded Reload
	add	r8, r15
	adc	r11, r12
	add	r8, rcx
	adc	r11, rax
	add	r8, qword ptr [rsp + 440]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 64]        # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	r8, rbx
	adc	r11, 0
	mov	qword ptr [rsp - 112], r11      # 8-byte Spill
	shld	rsi, r10, 8
	bzhi	rax, r10, r14
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	lea	r10, [rax + rax]
	mov	r14, qword ptr [rsp + 384]      # 8-byte Reload
	add	r10, r14
	adc	r13, rdi
	mov	rbp, qword ptr [rsp + 712]      # 8-byte Reload
	add	r10, rbp
	adc	r13, qword ptr [rsp + 112]      # 8-byte Folded Reload
	mov	r12, qword ptr [rsp + 720]      # 8-byte Reload
	add	r10, r12
	mov	r15, qword ptr [rsp + 728]      # 8-byte Reload
	adc	r13, r15
	add	r10, qword ptr [rsp + 600]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 624]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp + 664]      # 8-byte Reload
	add	r10, r11
	mov	rbx, qword ptr [rsp + 696]      # 8-byte Reload
	adc	r13, rbx
	add	r10, qword ptr [rsp + 616]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 640]      # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp + 656]      # 8-byte Reload
	add	r10, rcx
	mov	r9, qword ptr [rsp + 688]       # 8-byte Reload
	adc	r13, r9
	add	r10, qword ptr [rsp + 608]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 632]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 584]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 592]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 568]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 576]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 648]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 672]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	r10, rsi
	adc	r13, 0
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	shld	rax, r8, 8
	mov	sil, 56
	bzhi	rsi, r8, rsi
	mov	qword ptr [rsp - 112], rsi      # 8-byte Spill
	add	r14, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 120]      # 8-byte Folded Reload
	add	r14, rbp
	adc	rdi, qword ptr [rsp + 112]      # 8-byte Folded Reload
	add	r14, r12
	adc	rdi, r15
	add	r14, r11
	adc	rdi, rbx
	add	r14, rcx
	adc	rdi, r9
	add	r14, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 680]      # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 704]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r14, rax
	adc	rdi, 0
	shld	r13, r10, 8
	add	r13, qword ptr [rsp - 128]      # 8-byte Folded Reload
	shld	rdi, r14, 8
	add	rdi, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	al, 56
	bzhi	rcx, rdi, rax
	shr	rdi, 56
	add	rdi, qword ptr [rsp - 120]      # 8-byte Folded Reload
	bzhi	rsi, r13, rax
	shr	r13, 56
	add	rdx, r13
	add	rdi, r13
	bzhi	r8, rdi, rax
	shr	rdi, 56
	add	rdi, qword ptr [rsp - 104]      # 8-byte Folded Reload
	bzhi	r9, r10, rax
	bzhi	r10, r14, rax
	bzhi	r11, rdx, rax
	shr	rdx, 56
	add	rdx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp + 736]      # 8-byte Reload
	mov	qword ptr [rax], r11
	mov	qword ptr [rax + 8], rdx
	mov	qword ptr [rax + 16], r10
	mov	qword ptr [rax + 24], rcx
	mov	qword ptr [rax + 32], r8
	mov	qword ptr [rax + 40], rdi
	mov	qword ptr [rax + 48], r9
	mov	qword ptr [rax + 56], rsi
	add	rsp, 744
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
	.size	fiat_p448_solinas_carry_mul_clang, .Lfunc_end0-fiat_p448_solinas_carry_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
