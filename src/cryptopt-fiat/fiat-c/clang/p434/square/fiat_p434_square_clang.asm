	.text
	.intel_syntax noprefix
	.file	"p434_square_wrapper.c"
	.globl	fiat_p434_square_clang          # -- Begin function fiat_p434_square_clang
	.p2align	4, 0x90
	.type	fiat_p434_square_clang,@function
fiat_p434_square_clang:                 # @fiat_p434_square_clang
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
	sub	rsp, 272
	.cfi_def_cfa_offset 328
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r14, qword ptr [rsi]
	mov	rdx, r14
	mulx	rax, r10, r14
	mov	qword ptr [rsp + 104], rax      # 8-byte Spill
	mov	r11, qword ptr [rsi + 8]
	mov	rax, -1
	mov	rdx, r10
	mulx	rax, rdx, rax
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	rcx, rax
	add	rcx, rdx
	adc	rcx, 0
	mov	qword ptr [rsp + 40], rcx       # 8-byte Spill
	mov	rcx, rax
	add	rcx, rdx
	mov	qword ptr [rsp + 112], rcx      # 8-byte Spill
	mov	r12, qword ptr [rsi + 16]
	mov	qword ptr [rsp + 80], r12       # 8-byte Spill
	mov	rbx, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 80], rbx       # 8-byte Spill
	mov	r9, qword ptr [rsi + 32]
	mov	qword ptr [rsp + 56], r9        # 8-byte Spill
	mov	r8, qword ptr [rsi + 40]
	mov	qword ptr [rsp - 88], r8        # 8-byte Spill
	mov	rcx, qword ptr [rsi + 48]
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mov	rdx, r14
	mulx	rdx, rcx, rcx
	mov	qword ptr [rsp + 96], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	rdx, r14
	mulx	rcx, rdx, r8
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 128], rcx      # 8-byte Spill
	mov	rdx, r14
	mulx	rcx, rdx, r9
	mov	qword ptr [rsp + 144], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 136], rcx      # 8-byte Spill
	mov	rdx, r14
	mulx	rcx, rdx, rbx
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	mov	rdx, r14
	mulx	rcx, r12, r12
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 24], r12       # 8-byte Spill
	mulx	r14, rbp, r11
	mov	qword ptr [rsp + 48], r14       # 8-byte Spill
	mov	qword ptr [rsp + 72], rbp       # 8-byte Spill
	movabs	rcx, 620258357900100
	mov	rdx, r10
	mulx	r15, rcx, rcx
	mov	qword ptr [rsp + 120], rcx      # 8-byte Spill
	movabs	rsi, 7853257225132122198
	mulx	rsi, rcx, rsi
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	movabs	r8, 8918917783347572387
	mulx	rbx, r8, r8
	movabs	r9, -161717841442111489
	mulx	r9, r13, r9
	mov	rdx, rax
	mov	rcx, qword ptr [rsp + 64]       # 8-byte Reload
	adc	rdx, rcx
	adc	r13, rax
	mov	qword ptr [rsp - 24], r13       # 8-byte Spill
	adc	r9, r8
	mov	qword ptr [rsp - 16], r9        # 8-byte Spill
	adc	rbx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 8], rbx        # 8-byte Spill
	adc	rsi, qword ptr [rsp + 120]      # 8-byte Folded Reload
	mov	qword ptr [rsp], rsi            # 8-byte Spill
	adc	r15, 0
	mov	qword ptr [rsp + 16], r15       # 8-byte Spill
	mov	r8, qword ptr [rsp + 104]       # 8-byte Reload
	mov	r9, r8
	add	r9, rbp
	adc	r12, r14
	mov	qword ptr [rsp - 40], r12       # 8-byte Spill
	mov	rax, qword ptr [rsp + 88]       # 8-byte Reload
	adc	rax, qword ptr [rsp - 32]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 144]      # 8-byte Reload
	adc	rax, qword ptr [rsp - 72]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp + 192]      # 8-byte Reload
	adc	rax, qword ptr [rsp + 136]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 96]       # 8-byte Reload
	adc	rax, qword ptr [rsp + 128]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp + 200]      # 8-byte Reload
	adc	rax, 0
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	add	rcx, r10
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	rax, rcx, r11
	mov	qword ptr [rsp + 120], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 216], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	rsi, rbp, r11
	mov	qword ptr [rsp + 264], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 208], rbp      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 56]       # 8-byte Reload
	mulx	rbx, rax, r11
	mov	qword ptr [rsp + 176], rbx      # 8-byte Spill
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r14, r12, r11
	mov	qword ptr [rsp + 168], r14      # 8-byte Spill
	mov	qword ptr [rsp + 32], r12       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 80]       # 8-byte Reload
	mulx	r15, r13, r11
	mov	qword ptr [rsp - 64], r13       # 8-byte Spill
	mov	qword ptr [rsp + 8], r15        # 8-byte Spill
	adc	r8, qword ptr [rsp + 72]        # 8-byte Folded Reload
	mov	rdx, r11
	mulx	rdx, rcx, r11
	mov	qword ptr [rsp + 152], rcx      # 8-byte Spill
	mov	r11, qword ptr [rsp + 48]       # 8-byte Reload
	add	r11, rcx
	adc	rdx, r13
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	adc	r12, r15
	adc	rax, r14
	mov	qword ptr [rsp + 160], rax      # 8-byte Spill
	adc	rbp, rbx
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	adc	rax, rsi
	mov	rsi, rax
	mov	r14, qword ptr [rsp + 216]      # 8-byte Reload
	adc	r14, 0
	add	qword ptr [rsp + 64], r10       # 8-byte Folded Spill
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	adc	r9, rax
	lea	rdx, [r8 + rax]
	mov	r8, qword ptr [rsp - 40]        # 8-byte Reload
	adc	r8, qword ptr [rsp + 40]        # 8-byte Folded Reload
	mov	qword ptr [rsp - 40], r8        # 8-byte Spill
	mov	rcx, qword ptr [rsp - 56]       # 8-byte Reload
	adc	rcx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp - 120]      # 8-byte Reload
	adc	rbx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	r15, qword ptr [rsp - 96]       # 8-byte Reload
	adc	r15, qword ptr [rsp - 8]        # 8-byte Folded Reload
	mov	r10, qword ptr [rsp - 104]      # 8-byte Reload
	adc	r10, qword ptr [rsp]            # 8-byte Folded Reload
	mov	r13, qword ptr [rsp - 112]      # 8-byte Reload
	adc	r13, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	r14, 0
	setb	byte ptr [rsp + 64]             # 1-byte Folded Spill
	mov	r9, rdx
	mov	rax, qword ptr [rsp + 72]       # 8-byte Reload
	add	r9, rax
	mov	r9, qword ptr [rsp + 152]       # 8-byte Reload
	adc	qword ptr [rsp + 48], r9        # 8-byte Folded Spill
	add	rdx, rax
	adc	r11, r8
	adc	rcx, qword ptr [rsp + 104]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	adc	rbx, r12
	mov	qword ptr [rsp - 120], rbx      # 8-byte Spill
	adc	r15, qword ptr [rsp + 160]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], r15       # 8-byte Spill
	adc	r10, rbp
	mov	qword ptr [rsp - 104], r10      # 8-byte Spill
	adc	r13, rsi
	mov	qword ptr [rsp - 112], r13      # 8-byte Spill
	adc	r14, 0
	mov	rax, -1
	mulx	r11, rax, rax
	setb	byte ptr [rsp + 72]             # 1-byte Folded Spill
	mov	rcx, r11
	add	rcx, rax
	adc	rcx, 0
	mov	r13, rcx
	mov	r10, r11
	add	r10, rax
	movabs	rcx, 620258357900100
	mulx	r15, rcx, rcx
	mov	qword ptr [rsp + 40], rcx       # 8-byte Spill
	movabs	rcx, 7853257225132122198
	mulx	rbp, r9, rcx
	movabs	rcx, 8918917783347572387
	mulx	r8, rsi, rcx
	movabs	rcx, -161717841442111489
	mulx	r12, rbx, rcx
	mov	rcx, r11
	adc	rcx, rax
	adc	rbx, r11
	adc	r12, rsi
	adc	r8, r9
	adc	rbp, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	r15, 0
	mov	rcx, rax
	add	rcx, rdx
	mov	rsi, qword ptr [rsp + 48]       # 8-byte Reload
	mov	rcx, rsi
	mov	r9, qword ptr [rsp - 40]        # 8-byte Reload
	adc	rcx, r9
	add	rdx, rax
	lea	rax, [rsi + r9]
	adc	rax, r10
	adc	r13, qword ptr [rsp - 56]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 40], r13       # 8-byte Spill
	adc	rbx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 24], rbx       # 8-byte Spill
	adc	r12, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 16], r12       # 8-byte Spill
	adc	r8, qword ptr [rsp - 104]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 8], r8         # 8-byte Spill
	adc	rbp, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rbp      # 8-byte Spill
	adc	r15, r14
	mov	qword ptr [rsp - 120], r15      # 8-byte Spill
	lea	r10, [rcx + r10]
	setb	al
	add	byte ptr [rsp + 72], 255        # 1-byte Folded Spill
	movzx	ecx, byte ptr [rsp + 64]        # 1-byte Folded Reload
	movzx	eax, al
	adc	rax, rcx
	mov	qword ptr [rsp], rax            # 8-byte Spill
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mov	rcx, qword ptr [rsp + 80]       # 8-byte Reload
	mulx	r11, rbx, rcx
	mov	qword ptr [rsp + 48], rbx       # 8-byte Spill
	mov	qword ptr [rsp + 72], r11       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	r9, rax, rcx
	mov	qword ptr [rsp + 64], r9        # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 56]       # 8-byte Reload
	mulx	rsi, r14, rcx
	mov	qword ptr [rsp + 112], r14      # 8-byte Spill
	mov	qword ptr [rsp + 40], rsi       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r12, r8, rcx
	mov	qword ptr [rsp - 104], r8       # 8-byte Spill
	mov	qword ptr [rsp + 16], r12       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r13, rcx
	mov	r15, qword ptr [rsp - 32]       # 8-byte Reload
	mov	rcx, r15
	mov	rbp, qword ptr [rsp - 64]       # 8-byte Reload
	add	rcx, rbp
	adc	r13, qword ptr [rsp + 8]        # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], r13       # 8-byte Spill
	adc	rdx, r8
	mov	r13, rdx
	adc	r14, r12
	adc	rax, rsi
	adc	rbx, r9
	mov	r9, r11
	adc	r9, 0
	mov	rdx, r10
	mov	r8, qword ptr [rsp + 24]        # 8-byte Reload
	add	rdx, r8
	adc	r15, rbp
	mov	qword ptr [rsp - 32], r15       # 8-byte Spill
	add	r10, r8
	adc	rcx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp - 24]       # 8-byte Reload
	adc	qword ptr [rsp - 96], rcx       # 8-byte Folded Spill
	adc	r13, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	qword ptr [rsp + 24], r13       # 8-byte Spill
	adc	r14, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	rdx, r10
	mov	rcx, -1
	mulx	rcx, r15, rcx
	setb	byte ptr [rsp + 80]             # 1-byte Folded Spill
	mov	rdx, rcx
	add	rdx, r15
	adc	rdx, 0
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	r13, rcx
	add	r13, r15
	mov	rdx, rcx
	adc	rdx, r15
	mov	rdx, r10
	movabs	r8, 620258357900100
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp - 64], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	rdx, r10
	movabs	r8, 7853257225132122198
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rdx, r10
	movabs	r8, 8918917783347572387
	mulx	rbp, r8, r8
	movabs	r11, -161717841442111489
	mulx	rdx, r12, r11
	adc	r12, rcx
	adc	rdx, r8
	mov	rcx, rdx
	adc	rbp, rsi
	mov	r11, qword ptr [rsp - 112]      # 8-byte Reload
	adc	r11, qword ptr [rsp - 64]       # 8-byte Folded Reload
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	mov	rdx, r15
	add	rdx, r10
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	mov	rdx, rsi
	mov	r8, qword ptr [rsp - 40]        # 8-byte Reload
	adc	rdx, r8
	add	r10, r15
	lea	r8, [rsi + r8]
	adc	r8, r13
	mov	rsi, qword ptr [rsp - 96]       # 8-byte Reload
	adc	qword ptr [rsp - 120], rsi      # 8-byte Folded Spill
	adc	r12, qword ptr [rsp + 24]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 16], r12       # 8-byte Spill
	adc	rcx, r14
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	adc	rbp, rax
	mov	qword ptr [rsp - 64], rbp       # 8-byte Spill
	adc	r11, rbx
	mov	qword ptr [rsp - 112], r11      # 8-byte Spill
	movzx	r10d, byte ptr [rsp - 24]       # 1-byte Folded Reload
	adc	r10, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	byte ptr [rsp + 80], 255        # 1-byte Folded Spill
	adc	r9, 0
	setb	al
	mov	r8, qword ptr [rsp]             # 8-byte Reload
	lea	rcx, [r9 + r8]
	xor	esi, esi
	add	r10, rcx
	setb	sil
	add	r9, r8
	lea	r9, [rdx + r13]
	movzx	eax, al
	adc	rsi, rax
	mov	qword ptr [rsp + 8], rsi        # 8-byte Spill
	mov	r11, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rcx, r11
	mov	rbp, qword ptr [rsp + 32]       # 8-byte Reload
	add	rcx, rbp
	mov	rbx, qword ptr [rsp - 104]      # 8-byte Reload
	adc	rbx, qword ptr [rsp + 168]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mov	rsi, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r8, r13, rsi
	mov	qword ptr [rsp + 80], r13       # 8-byte Spill
	mov	qword ptr [rsp - 40], r8        # 8-byte Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	r15, rax, rsi
	mov	qword ptr [rsp + 168], r15      # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 56]       # 8-byte Reload
	mulx	r14, r12, rsi
	mov	qword ptr [rsp - 96], r12       # 8-byte Spill
	mov	qword ptr [rsp + 24], r14       # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, rsi, rsi
	adc	rsi, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rdx, r12
	mov	r12, rdx
	adc	rax, r14
	mov	r14, rax
	adc	r13, r15
	mov	rax, r8
	adc	rax, 0
	mov	rdx, r9
	mov	r8, qword ptr [rsp + 88]        # 8-byte Reload
	add	rdx, r8
	adc	r11, rbp
	mov	qword ptr [rsp - 72], r11       # 8-byte Spill
	add	r9, r8
	adc	rcx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], rbx      # 8-byte Spill
	adc	rsi, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 64]       # 8-byte Folded Reload
	mov	qword ptr [rsp + 88], r12       # 8-byte Spill
	adc	r14, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], r14      # 8-byte Spill
	adc	r13, r10
	mov	rdx, r9
	mov	rcx, -1
	mulx	rcx, r12, rcx
	setb	byte ptr [rsp - 80]             # 1-byte Folded Spill
	mov	r11, rcx
	add	r11, r12
	adc	r11, 0
	mov	r8, rcx
	add	r8, r12
	mov	rdx, rcx
	adc	rdx, r12
	mov	rdx, r9
	movabs	r10, 620258357900100
	mulx	rdx, r10, r10
	mov	qword ptr [rsp + 32], r10       # 8-byte Spill
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	rdx, r9
	movabs	r10, 7853257225132122198
	mulx	r14, r10, r10
	movabs	r15, 8918917783347572387
	mulx	rbx, rbp, r15
	movabs	r15, -161717841442111489
	mulx	rdx, r15, r15
	adc	r15, rcx
	mov	rcx, r15
	adc	rdx, rbp
	mov	rbp, rdx
	adc	rbx, r10
	mov	r15, rbx
	adc	r14, qword ptr [rsp + 32]       # 8-byte Folded Reload
	setb	byte ptr [rsp]                  # 1-byte Folded Spill
	mov	rdx, r12
	add	rdx, r9
	mov	r10, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rdx, r10
	mov	rbx, qword ptr [rsp - 120]      # 8-byte Reload
	adc	rdx, rbx
	add	r9, r12
	lea	r9, [r10 + rbx]
	adc	r9, r8
	adc	r11, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	rcx, rsi
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	adc	rbp, qword ptr [rsp + 88]       # 8-byte Folded Reload
	mov	qword ptr [rsp + 32], rbp       # 8-byte Spill
	adc	r15, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], r15      # 8-byte Spill
	adc	r14, r13
	mov	qword ptr [rsp - 120], r14      # 8-byte Spill
	movzx	ecx, byte ptr [rsp]             # 1-byte Folded Reload
	adc	rcx, qword ptr [rsp + 16]       # 8-byte Folded Reload
	add	byte ptr [rsp - 80], 255        # 1-byte Folded Spill
	adc	rax, 0
	setb	sil
	mov	rbx, qword ptr [rsp + 8]        # 8-byte Reload
	lea	r9, [rax + rbx]
	xor	r10d, r10d
	add	rcx, r9
	setb	r10b
	add	rax, rbx
	lea	rax, [rdx + r8]
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	movzx	eax, sil
	adc	r10, rax
	mov	qword ptr [rsp + 16], r10       # 8-byte Spill
	mov	rax, qword ptr [rsp + 136]      # 8-byte Reload
	mov	rsi, rax
	mov	rbx, qword ptr [rsp + 184]      # 8-byte Reload
	add	rsi, rbx
	mov	r14, qword ptr [rsp + 112]      # 8-byte Reload
	adc	r14, qword ptr [rsp + 176]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mov	r9, qword ptr [rsp + 56]        # 8-byte Reload
	mulx	r12, r13, r9
	mov	qword ptr [rsp + 88], r13       # 8-byte Spill
	mov	qword ptr [rsp - 112], r12      # 8-byte Spill
	mov	rbp, qword ptr [rsp - 96]       # 8-byte Reload
	adc	rbp, qword ptr [rsp + 40]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	r15, r10, r9
	mov	qword ptr [rsp - 72], r10       # 8-byte Spill
	mov	qword ptr [rsp + 8], r15        # 8-byte Spill
	mov	rdx, r9
	mulx	r8, r9, r9
	adc	r9, qword ptr [rsp + 24]        # 8-byte Folded Reload
	adc	r8, r10
	adc	r13, r15
	adc	r12, 0
	mov	qword ptr [rsp], r12            # 8-byte Spill
	mov	r15, qword ptr [rsp - 80]       # 8-byte Reload
	mov	rdx, r15
	mov	r10, qword ptr [rsp + 144]      # 8-byte Reload
	add	rdx, r10
	adc	rax, rbx
	mov	rbx, rax
	add	r15, r10
	mov	rdx, r15
	adc	rsi, r11
	adc	r14, qword ptr [rsp - 64]       # 8-byte Folded Reload
	mov	r15, r14
	adc	rbp, qword ptr [rsp + 32]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], rbp       # 8-byte Spill
	adc	r9, qword ptr [rsp - 104]       # 8-byte Folded Reload
	mov	qword ptr [rsp + 160], r9       # 8-byte Spill
	adc	r8, qword ptr [rsp - 120]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 24], r8        # 8-byte Spill
	adc	r13, rcx
	mov	qword ptr [rsp + 104], r13      # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rax, -1
	mulx	r8, r14, rax
	setb	byte ptr [rsp - 121]            # 1-byte Folded Spill
	mov	rcx, r8
	add	rcx, r14
	mov	rsi, rcx
	adc	rsi, 0
	mov	r9, rsi
	mov	rsi, r14
	add	rsi, rdx
	mov	rsi, rbx
	lea	r10, [rbx + r11]
	adc	rsi, r11
	mov	r11, r14
	add	r11, rdx
	adc	r10, rcx
	lea	rsi, [rsi + rcx]
	mov	qword ptr [rsp - 16], rsi       # 8-byte Spill
	adc	r9, r15
	mov	qword ptr [rsp - 120], r9       # 8-byte Spill
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	add	rsi, qword ptr [rsp + 192]      # 8-byte Folded Reload
	mov	rdx, rsi
	mulx	rbp, rax, rax
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rbx, -1
	mov	rdx, qword ptr [rsp + 128]      # 8-byte Reload
	adc	rdx, qword ptr [rsp + 208]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rcx, rax
	add	rcx, rsi
	mov	rcx, rdx
	adc	rcx, r9
	lea	rdx, [rax + rbp]
	add	rcx, rdx
	mov	qword ptr [rsp + 56], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp + 96]       # 8-byte Reload
	lea	rdx, [rcx + rax]
	mulx	rbx, r12, rbx
	mov	rax, rbx
	add	rax, r12
	adc	rax, 0
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	mov	rax, rbx
	add	rax, r12
	mov	qword ptr [rsp + 24], r12       # 8-byte Spill
	mov	qword ptr [rsp + 136], rax      # 8-byte Spill
	movabs	rax, 620258357900100
	mulx	r11, r15, rax
	movabs	rax, 7853257225132122198
	mulx	r9, r13, rax
	movabs	rax, 8918917783347572387
	mulx	r10, rax, rax
	mov	rcx, rbx
	adc	rcx, r12
	movabs	rcx, -161717841442111489
	mulx	rcx, rdx, rcx
	adc	rdx, rbx
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	adc	rcx, rax
	mov	qword ptr [rsp + 32], rcx       # 8-byte Spill
	adc	r10, r13
	mov	qword ptr [rsp + 40], r10       # 8-byte Spill
	adc	r9, r15
	mov	qword ptr [rsp + 176], r9       # 8-byte Spill
	adc	r11, 0
	mov	qword ptr [rsp + 144], r11      # 8-byte Spill
	mov	rax, rbp
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	add	rax, rdx
	mov	rax, rbp
	mov	r12, rbp
	mov	qword ptr [rsp + 224], rbp      # 8-byte Spill
	adc	rax, rdx
	mov	rdx, rsi
	movabs	r15, 620258357900100
	mulx	rcx, rax, r15
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	movabs	r13, 7853257225132122198
	mulx	r9, rcx, r13
	movabs	rbp, 8918917783347572387
	mulx	r10, rbx, rbp
	movabs	rsi, -161717841442111489
	mulx	rdx, r11, rsi
	adc	r11, r12
	mov	qword ptr [rsp + 232], r11      # 8-byte Spill
	adc	rdx, rbx
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	adc	r10, rcx
	mov	qword ptr [rsp + 248], r10      # 8-byte Spill
	adc	r9, rax
	mov	qword ptr [rsp + 256], r9       # 8-byte Spill
	setb	byte ptr [rsp + 152]            # 1-byte Folded Spill
	mov	rax, r8
	add	rax, r14
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r10, rax, r15
	mulx	r15, rbx, r13
	adc	r14, r8
	mulx	r14, r13, rbp
	mulx	rsi, rcx, rsi
	adc	rcx, r8
	adc	rsi, r13
	adc	r14, rbx
	adc	r15, rax
	setb	al
	add	byte ptr [rsp - 122], 255       # 1-byte Folded Spill
	adc	rcx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 104]      # 8-byte Folded Reload
	movzx	r9d, al
	adc	r9, r10
	add	byte ptr [rsp - 121], 255       # 1-byte Folded Spill
	mov	rbp, qword ptr [rsp]            # 8-byte Reload
	adc	rbp, 0
	setb	byte ptr [rsp - 96]             # 1-byte Folded Spill
	mov	rbx, qword ptr [rsp + 128]      # 8-byte Reload
	add	rbx, qword ptr [rsp + 208]      # 8-byte Folded Reload
	mov	r12, qword ptr [rsp - 56]       # 8-byte Reload
	adc	r12, qword ptr [rsp + 264]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp - 32]       # 8-byte Reload
	adc	r11, qword ptr [rsp + 64]       # 8-byte Folded Reload
	mov	r10, qword ptr [rsp - 72]       # 8-byte Reload
	adc	r10, qword ptr [rsp + 168]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	r13, r8, rax
	mov	qword ptr [rsp - 80], r8        # 8-byte Spill
	mov	qword ptr [rsp + 128], r13      # 8-byte Spill
	mov	rdx, rax
	mulx	rax, rdx, rax
	adc	rdx, qword ptr [rsp + 8]        # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	adc	rax, r8
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	rdx, r13
	adc	rdx, 0
	mov	rax, qword ptr [rsp - 16]       # 8-byte Reload
	add	rax, qword ptr [rsp + 192]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r12, rcx
	mov	qword ptr [rsp - 56], r12       # 8-byte Spill
	adc	r11, rsi
	mov	qword ptr [rsp - 32], r11       # 8-byte Spill
	mov	r11, r10
	adc	r11, r14
	mov	r8, qword ptr [rsp - 72]        # 8-byte Reload
	adc	r8, r15
	mov	r10, qword ptr [rsp + 16]       # 8-byte Reload
	mov	r14, rbp
	lea	rcx, [rbp + r10]
	lea	rsi, [r9 + rcx]
	mov	r13, qword ptr [rsp - 88]       # 8-byte Reload
	adc	r13, rsi
	setb	r15b
	mov	rsi, qword ptr [rsp + 224]      # 8-byte Reload
	mov	rbx, qword ptr [rsp - 104]      # 8-byte Reload
	add	rsi, rbx
	mov	r12, rsi
	mov	rbp, rsi
	adc	r12, 0
	mov	rsi, qword ptr [rsp + 56]       # 8-byte Reload
	add	rsi, qword ptr [rsp + 96]       # 8-byte Folded Reload
	mov	rsi, qword ptr [rsp + 200]      # 8-byte Reload
	adc	rsi, qword ptr [rsp + 120]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 88], rsi       # 8-byte Spill
	xor	esi, esi
	add	r9, rcx
	setb	sil
	add	r14, r10
	movzx	ecx, byte ptr [rsp - 96]        # 1-byte Folded Reload
	adc	rsi, rcx
	add	rax, rbx
	mov	rax, qword ptr [rsp - 64]       # 8-byte Reload
	mov	rcx, qword ptr [rsp - 120]      # 8-byte Reload
	lea	rcx, [rax + rcx]
	adc	rcx, rbp
	adc	r12, qword ptr [rsp - 56]       # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp - 32]       # 8-byte Reload
	adc	rbp, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 240]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], r11       # 8-byte Spill
	adc	r8, qword ptr [rsp + 248]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 256]      # 8-byte Folded Reload
	movzx	ecx, byte ptr [rsp + 152]       # 1-byte Folded Reload
	adc	rcx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r15b, 255
	adc	rdx, 0
	setb	r10b
	lea	r11, [rdx + rsi]
	xor	r9d, r9d
	add	rcx, r11
	setb	r9b
	add	rdx, rsi
	movzx	edx, r10b
	adc	r9, rdx
	mov	r10, qword ptr [rsp + 200]      # 8-byte Reload
	add	r10, qword ptr [rsp + 120]      # 8-byte Folded Reload
	mov	rsi, qword ptr [rsp + 48]       # 8-byte Reload
	adc	rsi, qword ptr [rsp + 216]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 80]       # 8-byte Reload
	adc	r14, qword ptr [rsp + 72]       # 8-byte Folded Reload
	mov	r15, qword ptr [rsp + 88]       # 8-byte Reload
	adc	r15, qword ptr [rsp - 40]       # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 80]       # 8-byte Reload
	adc	rax, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r11, rbx, rdx
	adc	rbx, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	r11, 0
	mov	rdx, qword ptr [rsp + 56]       # 8-byte Reload
	add	rdx, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r10, r12
	adc	rsi, rbp
	adc	r14, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r15, r8
	adc	rax, r13
	mov	r13, rax
	adc	rbx, rcx
	adc	r11, 0
	setb	bpl
	add	rdx, qword ptr [rsp + 24]       # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	lea	r10, [rax + r12]
	adc	r10, 0
	setb	al
	xor	r8d, r8d
	mov	rcx, rsi
	add	rcx, qword ptr [rsp + 184]      # 8-byte Folded Reload
	setb	r8b
	xor	esi, esi
	add	r14, qword ptr [rsp + 112]      # 8-byte Folded Reload
	setb	sil
	xor	edx, edx
	add	r15, qword ptr [rsp + 32]       # 8-byte Folded Reload
	setb	dl
	mov	r12, rdx
	mov	qword ptr [rsp + 96], rdi       # 8-byte Spill
	xor	edx, edx
	add	r13, qword ptr [rsp + 40]       # 8-byte Folded Reload
	setb	dl
	mov	rdi, rdx
	xor	edx, edx
	add	rbx, qword ptr [rsp + 176]      # 8-byte Folded Reload
	setb	dl
	add	r10, qword ptr [rsp + 136]      # 8-byte Folded Reload
	movzx	eax, al
	adc	rcx, rax
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	adc	r8, r14
	adc	rsi, r15
	lea	rax, [r11 + r9]
	adc	r12, r13
	mov	qword ptr [rsp - 88], r12       # 8-byte Spill
	adc	rdi, rbx
	mov	qword ptr [rsp - 48], rdi       # 8-byte Spill
	adc	rdx, qword ptr [rsp + 144]      # 8-byte Folded Reload
	xor	r12d, r12d
	add	rdx, rax
	setb	r12b
	add	r11, r9
	movzx	eax, bpl
	adc	r12, rax
	xor	r9d, r9d
	mov	r11, r10
	add	r11, 1
	mov	eax, 0
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	rbx, rcx
	sub	rbx, rax
	mov	eax, 0
	sbb	rax, rax
	add	rbx, 1
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	r14, r8
	sub	r14, rax
	mov	eax, 0
	sbb	rax, rax
	add	r14, 1
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	r13, rsi
	sub	r13, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	r15, 161717841442111489
	add	r15, r13
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	rbp, qword ptr [rsp - 88]       # 8-byte Reload
	sub	rbp, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	r13, -8918917783347572387
	add	r13, rbp
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	rdi, qword ptr [rsp - 48]       # 8-byte Reload
	sub	rdi, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	rbp, -7853257225132122198
	add	rbp, rdi
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	rdi, rdx
	sub	rdi, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	rcx, -620258357900100
	add	rcx, rdi
	adc	al, -1
	neg	al
	movzx	eax, al
	cmp	r12, rax
	mov	eax, 0
	sbb	rax, rax
	neg	al
	sbb	r9, r9
	mov	r12, r9
	#APP
	#NO_APP
	and	r10, r12
	not	r9
	#APP
	#NO_APP
	and	r11, r9
	or	r11, r10
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	and	rax, r12
	and	rbx, r9
	or	rbx, rax
	and	r8, r12
	and	r14, r9
	or	r14, r8
	and	rsi, r12
	and	r15, r9
	or	r15, rsi
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	and	rax, r12
	and	r13, r9
	or	r13, rax
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	and	rax, r12
	and	rbp, r9
	or	rbp, rax
	and	r12, rdx
	and	r9, rcx
	or	r9, r12
	mov	rax, qword ptr [rsp + 96]       # 8-byte Reload
	mov	qword ptr [rax], r11
	mov	qword ptr [rax + 8], rbx
	mov	qword ptr [rax + 16], r14
	mov	qword ptr [rax + 24], r15
	mov	qword ptr [rax + 32], r13
	mov	qword ptr [rax + 40], rbp
	mov	qword ptr [rax + 48], r9
	add	rsp, 272
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
	.size	fiat_p434_square_clang, .Lfunc_end0-fiat_p434_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
