	.text
	.intel_syntax noprefix
	.file	"p521_mul_wrapper.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function fiat_p521_carry_mul_clang
.LCPI0_0:
	.quad	288230376151711743              # 0x3ffffffffffffff
	.text
	.globl	fiat_p521_carry_mul_clang
	.p2align	4, 0x90
	.type	fiat_p521_carry_mul_clang,@function
fiat_p521_carry_mul_clang:              # @fiat_p521_carry_mul_clang
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
	sub	rsp, 1024
	.cfi_def_cfa_offset 1080
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r9, rdx
	mov	r12, qword ptr [rsi + 64]
	mov	rax, qword ptr [rdx + 64]
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	lea	r13, [rax + rax]
	mov	rdx, r13
	mulx	rax, rdx, r12
	mov	qword ptr [rsp + 1000], rdx     # 8-byte Spill
	mov	qword ptr [rsp + 1008], rax     # 8-byte Spill
	mov	rax, qword ptr [r9 + 56]
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	lea	r8, [rax + rax]
	mov	rdx, r8
	mulx	rax, rdx, r12
	mov	qword ptr [rsp + 896], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 912], rax      # 8-byte Spill
	mov	rax, qword ptr [r9 + 48]
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	lea	r10, [rax + rax]
	mov	rdx, r10
	mulx	rax, rdx, r12
	mov	qword ptr [rsp + 888], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 904], rax      # 8-byte Spill
	mov	rax, qword ptr [r9 + 40]
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	lea	r11, [rax + rax]
	mov	rdx, r11
	mulx	rax, rdx, r12
	mov	qword ptr [rsp + 920], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 936], rax      # 8-byte Spill
	mov	rax, qword ptr [r9 + 32]
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	lea	rbx, [rax + rax]
	mov	rdx, rbx
	mulx	rax, rdx, r12
	mov	qword ptr [rsp + 960], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 968], rax      # 8-byte Spill
	mov	rax, qword ptr [r9 + 24]
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	lea	r14, [rax + rax]
	mov	rdx, r14
	mulx	rax, rdx, r12
	mov	qword ptr [rsp + 976], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 984], rax      # 8-byte Spill
	mov	qword ptr [rsp + 1016], rdi     # 8-byte Spill
	mov	rax, qword ptr [r9 + 16]
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	lea	r15, [rax + rax]
	mov	rdx, r15
	mulx	rax, rdx, r12
	mov	qword ptr [rsp + 992], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr [r9 + 8]
	mov	qword ptr [rsp + 432], rax      # 8-byte Spill
	lea	rdx, [rax + rax]
	mulx	rax, rbp, r12
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	rdi, r12
	mov	rcx, qword ptr [rsi + 56]
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rax, r13
	mov	qword ptr [rsp + 808], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, r8
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, r10
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, r11
	mov	qword ptr [rsp + 872], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 880], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, rbx
	mov	qword ptr [rsp + 784], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 928], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rax, r14
	mov	qword ptr [rsp + 568], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 768], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	r12, rcx, r15
	add	rcx, rbp
	mov	r15, qword ptr [rsi + 48]
	mov	rdx, r15
	mulx	rdx, rbp, r13
	mov	qword ptr [rsp + 128], rbp      # 8-byte Spill
	mov	qword ptr [rsp + 152], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, rbp, r8
	mov	qword ptr [rsp + 192], rbp      # 8-byte Spill
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, rbp, r10
	mov	qword ptr [rsp + 264], rbp      # 8-byte Spill
	mov	qword ptr [rsp + 288], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, rbp, r11
	mov	qword ptr [rsp + 376], rbp      # 8-byte Spill
	mov	qword ptr [rsp + 384], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, rbp, rbx
	mov	qword ptr [rsp + 464], rbp      # 8-byte Spill
	mov	qword ptr [rsp + 480], rdx      # 8-byte Spill
	mov	rbp, r12
	adc	rbp, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mov	rdx, r15
	mulx	rdx, r14, r14
	add	rcx, r14
	adc	rbp, rdx
	mov	r14, qword ptr [rsi + 40]
	mov	rdx, r14
	mulx	rax, rdx, r13
	mov	qword ptr [rsp + 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 104], rax      # 8-byte Spill
	mov	rdx, r14
	mulx	rax, rdx, r8
	mov	qword ptr [rsp + 176], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	mov	rdx, r14
	mulx	rax, rdx, r10
	mov	qword ptr [rsp + 272], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 320], rax      # 8-byte Spill
	mov	rdx, r14
	mulx	rax, rdx, r11
	mov	qword ptr [rsp + 392], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 408], rax      # 8-byte Spill
	mov	rdx, r14
	mulx	rax, rdx, rbx
	add	rcx, rdx
	mov	rbx, qword ptr [rsi + 32]
	mov	rdx, rbx
	mulx	rdx, r12, r13
	mov	qword ptr [rsp + 112], r12      # 8-byte Spill
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, r12, r8
	mov	qword ptr [rsp + 216], r12      # 8-byte Spill
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, r12, r10
	mov	qword ptr [rsp + 352], r12      # 8-byte Spill
	mov	qword ptr [rsp + 368], rdx      # 8-byte Spill
	adc	rbp, rax
	mov	rdx, rbx
	mulx	rax, rdx, r11
	add	rcx, rdx
	adc	rbp, rax
	mov	r11, qword ptr [rsi + 24]
	mov	rdx, r11
	mulx	rax, rdx, r13
	mov	qword ptr [rsp + 144], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 168], rax      # 8-byte Spill
	mov	rdx, r11
	mulx	rax, rdx, r8
	mov	qword ptr [rsp + 312], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 336], rax      # 8-byte Spill
	mov	rdx, r11
	mulx	rax, rdx, r10
	add	rcx, rdx
	mov	r10, qword ptr [rsi + 16]
	mov	rdx, r10
	mulx	rdx, r12, r13
	mov	qword ptr [rsp + 256], r12      # 8-byte Spill
	mov	qword ptr [rsp + 280], rdx      # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, r8, r8
	adc	rbp, rax
	add	rcx, r8
	adc	rbp, rdx
	mov	r8, qword ptr [rsi + 8]
	mov	rdx, r8
	mulx	rax, rdx, r13
	add	rcx, rdx
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	adc	rbp, rax
	mov	rax, qword ptr [r9]
	mov	rcx, qword ptr [rsi]
	mov	rdx, rax
	mulx	rdx, rdi, rdi
	mov	qword ptr [rsp + 944], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 952], rdx      # 8-byte Spill
	mov	rsi, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rdx, rsi
	mov	r9, qword ptr [rsp + 432]       # 8-byte Reload
	mulx	rdx, rdi, r9
	mov	qword ptr [rsp + 856], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 864], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rdi, rsi
	mov	qword ptr [rsp + 800], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 824], rdx      # 8-byte Spill
	mov	rdx, r15
	mov	r12, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	rdx, rdi, r12
	mov	qword ptr [rsp + 840], rdi      # 8-byte Spill
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, rsi, r9
	mov	qword ptr [rsp + 704], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 720], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rsi, r15
	mov	qword ptr [rsp + 656], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 664], rdx      # 8-byte Spill
	mov	rdx, r14
	mov	r13, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rdx, rdi, r13
	mov	qword ptr [rsp + 832], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 848], rdx      # 8-byte Spill
	mov	rdx, r14
	mulx	rdx, rsi, r12
	mov	qword ptr [rsp + 696], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 712], rdx      # 8-byte Spill
	mov	rdx, r14
	mulx	rdx, rsi, r9
	mov	r12, r9
	mov	qword ptr [rsp + 592], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 600], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rsi, r14
	mov	qword ptr [rsp + 544], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 552], rdx      # 8-byte Spill
	mov	rdx, rbx
	mov	r15, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rdx, rdi, r15
	mov	qword ptr [rsp + 792], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 816], rdx      # 8-byte Spill
	mov	rdx, rbx
	mov	rsi, r13
	mulx	rdx, rdi, r13
	mov	qword ptr [rsp + 672], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 688], rdx      # 8-byte Spill
	mov	rdx, rbx
	mov	r9, qword ptr [rsp - 112]       # 8-byte Reload
	mulx	rdx, rdi, r9
	mov	qword ptr [rsp + 560], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 584], rdx      # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, rdi, r12
	mov	qword ptr [rsp + 488], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 496], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rdi, rbx
	mov	qword ptr [rsp + 424], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 440], rdx      # 8-byte Spill
	mov	rdx, r11
	mov	rbx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	rdx, rdi, rbx
	mov	qword ptr [rsp + 760], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 776], rdx      # 8-byte Spill
	mov	rdx, r11
	mulx	rdx, rdi, r15
	mov	qword ptr [rsp + 640], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 648], rdx      # 8-byte Spill
	mov	rdx, r11
	mulx	r13, rdx, r13
	mov	qword ptr [rsp + 536], rdx      # 8-byte Spill
	mov	rdx, r11
	mulx	rdx, rdi, r9
	mov	qword ptr [rsp + 448], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 456], rdx      # 8-byte Spill
	mov	rdx, r11
	mulx	rdx, rdi, r12
	mov	qword ptr [rsp + 304], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rdi, r11
	mov	qword ptr [rsp + 208], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 232], rdx      # 8-byte Spill
	mov	rdx, r10
	mov	r11, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	rdx, rdi, r11
	mov	qword ptr [rsp + 744], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 752], rdx      # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, rdi, rbx
	mov	qword ptr [rsp + 624], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 632], rdx      # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, rdi, r15
	mov	qword ptr [rsp + 520], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 528], rdx      # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, rdi, rsi
	mov	qword ptr [rsp + 400], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 416], rdx      # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, rdi, r9
	mov	qword ptr [rsp + 224], rdi      # 8-byte Spill
	mov	qword ptr [rsp + 248], rdx      # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, rdi, r12
	mov	qword ptr [rsp + 72], rdi       # 8-byte Spill
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rdi, r10
	mov	qword ptr [rsp + 32], rdi       # 8-byte Spill
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	rdx, r8
	mov	rdi, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rdx, r10, rdi
	mov	qword ptr [rsp + 728], r10      # 8-byte Spill
	mov	qword ptr [rsp + 736], rdx      # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r10, r11
	mov	qword ptr [rsp + 608], r10      # 8-byte Spill
	mov	qword ptr [rsp + 616], rdx      # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r10, rbx
	mov	qword ptr [rsp + 504], r10      # 8-byte Spill
	mov	qword ptr [rsp + 512], rdx      # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r10, r15
	mov	qword ptr [rsp + 344], r10      # 8-byte Spill
	mov	qword ptr [rsp + 360], rdx      # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r10, rsi
	mov	qword ptr [rsp + 136], r10      # 8-byte Spill
	mov	qword ptr [rsp + 160], rdx      # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r10, r9
	mov	qword ptr [rsp + 56], r10       # 8-byte Spill
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r10, r12
	mov	qword ptr [rsp + 16], r10       # 8-byte Spill
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r10, r8
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, qword ptr [rsp - 64]   # 8-byte Folded Reload
	mov	qword ptr [rsp + 680], r8       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rdi, rdi
	mov	qword ptr [rsp + 576], rdi      # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rdi, r11
	mov	qword ptr [rsp + 472], rdi      # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rdi, rbx
	mov	qword ptr [rsp + 296], rdi      # 8-byte Spill
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rdi, r15
	mov	qword ptr [rsp + 88], rdi       # 8-byte Spill
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, rsi
	mov	qword ptr [rsp + 40], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, r9
	mov	qword ptr [rsp], rsi            # 8-byte Spill
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	rdx, rcx
	mulx	r11, r8, r12
	mulx	rax, rcx, rax
	mov	r12, qword ptr [rsp - 128]      # 8-byte Reload
	add	r12, rcx
	mov	qword ptr [rsp - 128], r12      # 8-byte Spill
	adc	rbp, rax
	mov	rax, rbp
	shr	rax, 58
	shld	rbp, r12, 6
	mov	r9, rbp
	mov	rcx, qword ptr [rsp + 896]      # 8-byte Reload
	add	qword ptr [rsp - 16], rcx       # 8-byte Folded Spill
	mov	r15, qword ptr [rsp + 808]      # 8-byte Reload
	adc	r15, qword ptr [rsp + 912]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	add	rdx, qword ptr [rsp + 888]      # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp - 32]       # 8-byte Reload
	adc	rcx, qword ptr [rsp + 904]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 128]      # 8-byte Folded Reload
	mov	rbp, rdx
	adc	rcx, qword ptr [rsp + 152]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 120]      # 8-byte Reload
	add	rdx, qword ptr [rsp + 920]      # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp - 24]       # 8-byte Reload
	adc	rcx, qword ptr [rsp + 936]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 192]      # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 200]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 96]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	adc	rcx, qword ptr [rsp + 104]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	mov	rbx, qword ptr [rsp + 872]      # 8-byte Reload
	add	rbx, qword ptr [rsp + 960]      # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp + 880]      # 8-byte Reload
	adc	rcx, qword ptr [rsp + 968]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 288]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 184]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 120]      # 8-byte Folded Reload
	mov	r12, qword ptr [rsp + 784]      # 8-byte Reload
	add	r12, qword ptr [rsp + 976]      # 8-byte Folded Reload
	mov	rdi, qword ptr [rsp + 928]      # 8-byte Reload
	adc	rdi, qword ptr [rsp + 984]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 376]      # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 384]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 272]      # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 320]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 216]      # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 240]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 144]      # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 168]      # 8-byte Folded Reload
	mov	rsi, qword ptr [rsp + 768]      # 8-byte Reload
	add	rsi, qword ptr [rsp + 992]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 568]      # 8-byte Reload
	adc	r14, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 464]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 480]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 392]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 408]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 352]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 368]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 312]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 336]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 256]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 280]      # 8-byte Folded Reload
	add	rsi, r10
	adc	r14, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	rsi, r8
	adc	r14, r11
	add	rsi, r9
	adc	r14, rax
	mov	rdx, r14
	shr	rdx, 58
	shld	r14, rsi, 6
	mov	al, 58
	bzhi	rax, rsi, rax
	mov	r8b, 58
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	add	r12, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rdi, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	r12, r14
	adc	rdi, rdx
	mov	rsi, rdi
	shr	rsi, 58
	shld	rdi, r12, 6
	bzhi	rax, r12, r8
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	add	rbx, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 80]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 208]      # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 232]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 104]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	add	rax, qword ptr [rsp + 304]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp - 24]       # 8-byte Reload
	adc	r11, qword ptr [rsp + 328]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 224]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 248]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 136]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 160]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 424]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 440]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 88]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	adc	r11, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	rax, rbp
	add	rax, qword ptr [rsp + 488]      # 8-byte Folded Reload
	mov	r9, qword ptr [rsp - 32]        # 8-byte Reload
	adc	r9, qword ptr [rsp + 496]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 448]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 456]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 400]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 416]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 344]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 360]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 544]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 552]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 296]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	adc	r9, qword ptr [rsp - 88]        # 8-byte Folded Reload
	mov	r12, qword ptr [rsp - 16]       # 8-byte Reload
	add	r12, qword ptr [rsp + 592]      # 8-byte Folded Reload
	mov	rbp, r15
	adc	rbp, qword ptr [rsp + 600]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 560]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 584]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 536]      # 8-byte Folded Reload
	adc	rbp, r13
	add	r12, qword ptr [rsp + 520]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 528]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 504]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 512]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 656]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 664]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 472]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 704]      # 8-byte Reload
	add	r14, qword ptr [rsp + 1000]     # 8-byte Folded Reload
	mov	r15, qword ptr [rsp + 720]      # 8-byte Reload
	adc	r15, qword ptr [rsp + 1008]     # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 696]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 712]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 672]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 688]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 640]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 648]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 624]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 632]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 608]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 616]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 800]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 824]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 576]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 72]       # 8-byte Folded Reload
	mov	rax, qword ptr [rsp + 840]      # 8-byte Reload
	add	rax, qword ptr [rsp + 856]      # 8-byte Folded Reload
	mov	r13, qword ptr [rsp - 56]       # 8-byte Reload
	adc	r13, qword ptr [rsp + 864]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 832]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 848]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 792]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 816]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 760]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 776]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 744]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 752]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 728]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 736]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 944]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 952]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 680]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 64]       # 8-byte Folded Reload
	mov	dl, 58
	bzhi	r8, qword ptr [rsp - 128], rdx  # 8-byte Folded Reload
	add	rbx, rdi
	adc	rcx, rsi
	mov	r10, rcx
	shr	r10, 58
	shld	rcx, rbx, 6
	add	rcx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r10, r11
	mov	r11, r10
	shr	r11, 58
	shld	r10, rcx, 6
	add	r10, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r11, r9
	mov	r9, r11
	shr	r9, 58
	shld	r11, r10, 6
	add	r11, r12
	adc	r9, rbp
	mov	rdi, r9
	shld	r9, r11, 6
	vmovq	xmm0, r11
	vmovq	xmm1, r10
	vmovq	xmm2, rcx
	shr	rdi, 58
	add	r9, r14
	adc	rdi, r15
	mov	r10, rdi
	shr	r10, 58
	shld	rdi, r9, 6
	bzhi	rsi, r9, rdx
	add	rdi, rax
	adc	r10, r13
	mov	r9, r10
	shld	r10, rdi, 7
	mov	r11b, 57
	bzhi	rdi, rdi, r11
	shr	r9, 57
	add	r10, r8
	adc	r9, 0
	shld	r9, r10, 6
	add	r9, qword ptr [rsp - 112]       # 8-byte Folded Reload
	mov	al, 58
	bzhi	rcx, r10, rax
	bzhi	rax, r9, rax
	shr	r9, 58
	add	r9, qword ptr [rsp - 48]        # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 1016]     # 8-byte Reload
	mov	qword ptr [rdx], rcx
	mov	qword ptr [rdx + 8], rax
	mov	qword ptr [rdx + 16], r9
	vmovq	xmm3, rbx
	vpunpcklqdq	xmm0, xmm1, xmm0        # xmm0 = xmm1[0],xmm0[0]
	vpunpcklqdq	xmm1, xmm3, xmm2        # xmm1 = xmm3[0],xmm2[0]
	vinserti128	ymm0, ymm1, xmm0, 1
	vpbroadcastq	ymm1, qword ptr [rip + .LCPI0_0] # ymm1 = [288230376151711743,288230376151711743,288230376151711743,288230376151711743]
	vpand	ymm0, ymm0, ymm1
	vmovdqu	ymmword ptr [rdx + 24], ymm0
	mov	qword ptr [rdx + 56], rsi
	mov	qword ptr [rdx + 64], rdi
	add	rsp, 1024
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
	.size	fiat_p521_carry_mul_clang, .Lfunc_end0-fiat_p521_carry_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
