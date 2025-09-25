	.text
	.intel_syntax noprefix
	.file	"p434_mul_wrapper.c"
	.globl	fiat_p434_mul_clang             # -- Begin function fiat_p434_mul_clang
	.p2align	4, 0x90
	.type	fiat_p434_mul_clang,@function
fiat_p434_mul_clang:                    # @fiat_p434_mul_clang
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
	sub	rsp, 216
	.cfi_def_cfa_offset 272
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r14, rdx
	mov	qword ptr [rsp - 112], rsi      # 8-byte Spill
	mov	r10, qword ptr [rsi]
	mov	rdx, qword ptr [rdx]
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mulx	rsi, rbx, r10
	mov	rax, -1
	mov	rdx, rbx
	mulx	r8, rcx, rax
	mov	rax, r8
	add	rax, rcx
	adc	rax, 0
	mov	r9, r8
	add	r9, rcx
	mov	rdx, qword ptr [r14 + 16]
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	r11, r8
	adc	r11, rcx
	mulx	rdx, rbp, r10
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	rdx, qword ptr [r14 + 8]
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mulx	r15, r13, r10
	mov	qword ptr [rsp - 120], r10      # 8-byte Spill
	movabs	r11, -161717841442111489
	mov	rdx, rbx
	mulx	rdx, r12, r11
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	adc	r12, r8
	setb	byte ptr [rsp + 128]            # 1-byte Folded Spill
	mov	rdx, rcx
	add	rdx, rbx
	mov	r11, rbx
	mov	qword ptr [rsp - 16], rbx       # 8-byte Spill
	mov	r8, rsi
	adc	r8, r13
	mov	rdx, rsi
	add	rdx, r13
	lea	rbx, [r15 + rbp]
	adc	rbx, rax
	add	rcx, r11
	adc	rdx, r9
	setb	r11b
	mov	rcx, rbx
	adc	rcx, 0
	mov	qword ptr [rsp - 80], rcx       # 8-byte Spill
	add	rsi, r13
	adc	r15, rbp
	mov	rdx, qword ptr [r14 + 24]
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	mulx	rdx, rsi, r10
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	adc	rsi, qword ptr [rsp + 40]       # 8-byte Folded Reload
	lea	rbp, [r8 + r9]
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mov	r10, qword ptr [rdx + 8]
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rcx, r8, r10
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	r13, rcx, r10
	setb	byte ptr [rsp - 8]              # 1-byte Folded Spill
	mov	rdx, rbp
	add	rdx, rcx
	mov	r9, r13
	adc	r9, r8
	mov	edx, r11d
	add	dl, 255
	adc	r9, rbx
	add	r11b, 255
	adc	r15, rax
	adc	rsi, r12
	mov	rdx, qword ptr [r14 + 40]
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 24], r10       # 8-byte Spill
	mulx	rdx, rax, r10
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	add	r13, r8
	mov	rdx, qword ptr [r14 + 32]
	mov	rbx, r14
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mulx	r14, r8, r10
	mov	rdx, qword ptr [rsp + 192]      # 8-byte Reload
	mulx	r12, r11, r10
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	rdx, r15, r10
	adc	r15, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	rdx, r11
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	adc	r12, r8
	mov	qword ptr [rsp + 136], r12      # 8-byte Spill
	adc	r14, rax
	mov	qword ptr [rsp + 176], r14      # 8-byte Spill
	setb	byte ptr [rsp + 16]             # 1-byte Folded Spill
	add	rbp, rcx
	adc	r13, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	rdx, rbp
	mov	qword ptr [rsp - 88], rbp       # 8-byte Spill
	mov	rax, -1
	mulx	r8, rdx, rax
	adc	r15, rsi
	setb	byte ptr [rsp - 32]             # 1-byte Folded Spill
	mov	rsi, r8
	add	rsi, rdx
	adc	rsi, 0
	mov	r11, r8
	add	r11, rdx
	mov	rax, r15
	adc	rax, r11
	mov	rcx, rdx
	add	rcx, rbp
	adc	r11, r9
	mov	qword ptr [rsp - 80], r11       # 8-byte Spill
	setb	r10b
	mov	byte ptr [rsp + 88], r10b       # 1-byte Spill
	mov	rcx, rax
	adc	rcx, 0
	mov	qword ptr [rsp + 104], rcx      # 8-byte Spill
	mov	r9, r8
	add	r9, rdx
	adc	rdx, r8
	mov	rdx, rbp
	movabs	rcx, -161717841442111489
	mulx	rcx, rdx, rcx
	mov	qword ptr [rsp + 184], rcx      # 8-byte Spill
	adc	rdx, r8
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rcx, qword ptr [rsp - 112]      # 8-byte Reload
	mov	rcx, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 32], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rdx, r8, rcx
	mov	qword ptr [rsp - 56], r8        # 8-byte Spill
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	r9, rcx, rcx
	mov	qword ptr [rsp + 96], rcx       # 8-byte Spill
	setb	byte ptr [rsp + 120]            # 1-byte Folded Spill
	mov	rdx, r11
	add	rdx, rcx
	mov	r13, r9
	adc	r13, r8
	mov	edx, r10d
	add	dl, 255
	adc	r13, rax
	add	byte ptr [rsp + 128], 255       # 1-byte Folded Spill
	movabs	rax, 620258357900100
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rcx, r8, rax
	movabs	rax, 7853257225132122198
	mulx	r12, r11, rax
	movabs	rax, 8918917783347572387
	mulx	r14, rax, rax
	adc	rax, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	r14, r11
	adc	r12, r8
	adc	rcx, 0
	mov	qword ptr [rsp - 16], rcx       # 8-byte Spill
	add	byte ptr [rsp - 8], 255         # 1-byte Folded Spill
	mov	rdx, qword ptr [rbx + 48]
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	r8, qword ptr [rsp - 120]       # 8-byte Reload
	mulx	rbx, r10, r8
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	rbp, rcx, r8
	mov	rdx, qword ptr [rsp + 200]      # 8-byte Reload
	mulx	r11, r8, r8
	adc	r8, qword ptr [rsp]             # 8-byte Folded Reload
	adc	r11, rcx
	adc	rbp, r10
	adc	rbx, 0
	mov	qword ptr [rsp - 120], rbx      # 8-byte Spill
	add	byte ptr [rsp - 24], 255        # 1-byte Folded Spill
	adc	r8, rax
	adc	r11, r14
	adc	rbp, r12
	mov	rbx, rbp
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	add	byte ptr [rsp - 32], 255        # 1-byte Folded Spill
	adc	r8, qword ptr [rsp + 112]       # 8-byte Folded Reload
	setb	r12b
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	rsi, r15
	adc	r8, qword ptr [rsp - 48]        # 8-byte Folded Reload
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	add	r9, qword ptr [rsp - 56]        # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	rax, rbp, qword ptr [rsp + 32]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	adc	rbp, qword ptr [rsp - 40]       # 8-byte Folded Reload
	setb	r14b
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	add	rdx, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 104]       # 8-byte Folded Reload
	adc	rbp, r8
	mov	r8, rdx
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rax, -1
	mulx	rsi, r15, rax
	setb	byte ptr [rsp - 56]             # 1-byte Folded Spill
	mov	rax, rsi
	add	rax, r15
	adc	rax, 0
	mov	rdx, rsi
	add	rdx, r15
	mov	r10, rbp
	adc	r10, rdx
	mov	rcx, r15
	add	rcx, r8
	adc	rdx, r13
	mov	r8, rdx
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	setb	r13b
	mov	rcx, r10
	adc	rcx, 0
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	add	r12b, 255
	adc	r11, qword ptr [rsp + 136]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 176]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 32], rbx       # 8-byte Spill
	mov	rcx, qword ptr [rsp - 112]      # 8-byte Reload
	mov	rbx, qword ptr [rcx + 24]
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rcx, r12, rbx
	mov	qword ptr [rsp - 64], r12       # 8-byte Spill
	mov	qword ptr [rsp + 136], rcx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	r9, rcx, rbx
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	setb	byte ptr [rsp + 112]            # 1-byte Folded Spill
	mov	rdx, r8
	add	rdx, rcx
	mov	r8, r9
	adc	r8, r12
	mov	edx, r13d
	add	dl, 255
	adc	r8, r10
	add	r14b, 255
	mov	rdx, qword ptr [rsp + 200]      # 8-byte Reload
	mov	r14, qword ptr [rsp + 32]       # 8-byte Reload
	mulx	rcx, r10, r14
	mov	qword ptr [rsp + 128], rcx      # 8-byte Spill
	mov	rcx, qword ptr [rsp + 192]      # 8-byte Reload
	mov	rdx, rcx
	mulx	rdx, r12, r14
	adc	r12, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rdx, r10
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	setb	byte ptr [rsp - 8]              # 1-byte Folded Spill
	add	byte ptr [rsp + 120], 255       # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	movabs	r10, 8918917783347572387
	mulx	rdx, r14, r10
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	adc	r14, qword ptr [rsp + 184]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 72]             # 1-byte Folded Spill
	add	byte ptr [rsp - 48], 255        # 1-byte Folded Spill
	adc	r14, r11
	setb	byte ptr [rsp + 80]             # 1-byte Folded Spill
	mov	rdx, rsi
	add	rdx, r15
	adc	r15, rsi
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	movabs	r10, -161717841442111489
	mulx	r10, rdx, r10
	mov	qword ptr [rsp + 120], r10      # 8-byte Spill
	adc	rdx, rsi
	setb	byte ptr [rsp + 96]             # 1-byte Folded Spill
	add	byte ptr [rsp - 56], 255        # 1-byte Folded Spill
	adc	r14, r12
	setb	byte ptr [rsp - 56]             # 1-byte Folded Spill
	add	r13b, 255
	adc	rax, rbp
	adc	r14, rdx
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	add	r9, qword ptr [rsp - 64]        # 8-byte Folded Reload
	mov	rdx, rcx
	mov	qword ptr [rsp + 176], rbx      # 8-byte Spill
	mulx	rcx, rax, rbx
	mov	qword ptr [rsp + 184], rcx      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	rcx, r12, rbx
	adc	r12, qword ptr [rsp + 136]      # 8-byte Folded Reload
	adc	rcx, rax
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	setb	byte ptr [rsp + 136]            # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	add	rdx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 40]        # 8-byte Folded Reload
	adc	r12, r14
	mov	rsi, rdx
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	mov	rax, -1
	mulx	rax, r9, rax
	setb	byte ptr [rsp + 144]            # 1-byte Folded Spill
	mov	r10, rax
	add	r10, r9
	adc	r10, 0
	mov	rcx, rax
	add	rcx, r9
	mov	r11, r12
	adc	r11, rcx
	mov	rbx, rcx
	add	byte ptr [rsp + 16], 255        # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mulx	rcx, r14, qword ptr [rsp + 24]  # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	rcx, 0
	mov	rdx, r9
	add	rdx, rsi
	adc	rbx, r8
	mov	r8, rbx
	mov	qword ptr [rsp - 104], rbx      # 8-byte Spill
	setb	byte ptr [rsp - 121]            # 1-byte Folded Spill
	mov	rdx, r11
	adc	rdx, 0
	mov	qword ptr [rsp + 160], rdx      # 8-byte Spill
	add	byte ptr [rsp - 24], 255        # 1-byte Folded Spill
	mov	r15, qword ptr [rsp - 120]      # 8-byte Reload
	adc	r15, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rcx, 0
	mov	qword ptr [rsp + 16], rcx       # 8-byte Spill
	setb	byte ptr [rsp - 40]             # 1-byte Folded Spill
	add	byte ptr [rsp + 72], 255        # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	movabs	rsi, 7853257225132122198
	mulx	rdx, rsi, rsi
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	adc	rsi, qword ptr [rsp + 88]       # 8-byte Folded Reload
	setb	byte ptr [rsp + 64]             # 1-byte Folded Spill
	add	byte ptr [rsp + 80], 255        # 1-byte Folded Spill
	adc	rsi, qword ptr [rsp - 32]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mov	r13, qword ptr [rdx + 32]
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rdx, rcx, r13
	mov	qword ptr [rsp - 16], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rbx, rbp, r13
	mov	qword ptr [rsp + 208], rbp      # 8-byte Spill
	setb	byte ptr [rsp + 56]             # 1-byte Folded Spill
	mov	rdx, r8
	add	rdx, rbp
	mov	r8, rbx
	adc	r8, rcx
	movzx	ebp, byte ptr [rsp - 121]       # 1-byte Folded Reload
	mov	edx, ebp
	add	dl, 255
	adc	r8, r11
	add	byte ptr [rsp + 112], 255       # 1-byte Folded Spill
	adc	r15, r14
	mov	qword ptr [rsp - 120], r15      # 8-byte Spill
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
	adc	rcx, 0
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	add	byte ptr [rsp + 96], 255        # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	movabs	r11, 8918917783347572387
	mulx	rdx, r11, r11
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	adc	r11, qword ptr [rsp + 120]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 96]             # 1-byte Folded Spill
	add	byte ptr [rsp - 56], 255        # 1-byte Folded Spill
	adc	rsi, qword ptr [rsp + 104]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 152]            # 1-byte Folded Spill
	mov	rdx, rax
	add	rdx, r9
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	movabs	r14, -161717841442111489
	mulx	r14, rdx, r14
	mov	qword ptr [rsp + 80], r14       # 8-byte Spill
	adc	r9, rax
	adc	rdx, rax
	setb	byte ptr [rsp + 168]            # 1-byte Folded Spill
	add	byte ptr [rsp - 48], 255        # 1-byte Folded Spill
	adc	rsi, r11
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	add	byte ptr [rsp + 144], 255       # 1-byte Folded Spill
	adc	rsi, qword ptr [rsp - 64]       # 8-byte Folded Reload
	setb	byte ptr [rsp + 16]             # 1-byte Folded Spill
	add	bpl, 255
	adc	r10, r12
	adc	rsi, rdx
	setb	byte ptr [rsp + 112]            # 1-byte Folded Spill
	add	rbx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 192]      # 8-byte Reload
	mov	qword ptr [rsp - 24], r13       # 8-byte Spill
	mulx	rdx, rax, r13
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	rdx, r9, r13
	adc	r9, qword ptr [rsp + 24]        # 8-byte Folded Reload
	adc	rdx, rax
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	setb	byte ptr [rsp + 120]            # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	add	rdx, qword ptr [rsp + 208]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	adc	rbx, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	r9, rsi
	mov	qword ptr [rsp - 56], r9        # 8-byte Spill
	mov	rax, -1
	mulx	rbp, r12, rax
	mov	qword ptr [rsp - 64], rbp       # 8-byte Spill
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	mov	rax, rbp
	add	rax, r12
	adc	rax, 0
	mov	qword ptr [rsp + 104], rax      # 8-byte Spill
	add	rbp, r12
	mov	qword ptr [rsp + 160], r12      # 8-byte Spill
	mov	rax, r9
	adc	rax, rbp
	xor	r15d, r15d
	add	byte ptr [rsp - 8], 255         # 1-byte Folded Spill
	mov	r13, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rdx, r13
	mov	rsi, qword ptr [rsp + 32]       # 8-byte Reload
	mulx	r11, r9, rsi
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	rsi, r14, rsi
	adc	r14, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	rsi, r9
	adc	r11, 0
	add	byte ptr [rsp + 64], 255        # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	movabs	r9, 620258357900100
	mulx	r10, r9, r9
	adc	r9, qword ptr [rsp + 72]        # 8-byte Folded Reload
	adc	r10, 0
	add	byte ptr [rsp + 56], 255        # 1-byte Folded Spill
	adc	r9, qword ptr [rsp - 120]       # 8-byte Folded Reload
	adc	r10, rcx
	movzx	ecx, byte ptr [rsp - 40]        # 1-byte Folded Reload
	mov	r15b, cl
	setb	cl
	add	byte ptr [rsp - 122], 255       # 1-byte Folded Spill
	movzx	ebx, cl
	adc	rbx, r15
	add	r12, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	rbp, r8
	setb	r8b
	mov	byte ptr [rsp + 144], r8b       # 1-byte Spill
	mov	rcx, rax
	adc	rcx, 0
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	add	byte ptr [rsp + 152], 255       # 1-byte Folded Spill
	adc	r9, r14
	adc	r10, rsi
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	movabs	rcx, 8918917783347572387
	mulx	rcx, r15, rcx
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	setb	byte ptr [rsp + 56]             # 1-byte Folded Spill
	add	byte ptr [rsp + 168], 255       # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 112]      # 8-byte Reload
	mov	rcx, qword ptr [rcx + 40]
	mov	qword ptr [rsp + 32], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rdx, rsi, rcx
	mov	qword ptr [rsp + 64], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	r14, rdx, rcx
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	adc	r15, qword ptr [rsp + 80]       # 8-byte Folded Reload
	mov	qword ptr [rsp + 152], r15      # 8-byte Spill
	setb	byte ptr [rsp + 80]             # 1-byte Folded Spill
	mov	rcx, rbp
	add	rcx, rdx
	mov	rdx, r14
	adc	rdx, rsi
	mov	ecx, r8d
	add	cl, 255
	adc	rdx, rax
	mov	qword ptr [rsp + 128], rdx      # 8-byte Spill
	add	byte ptr [rsp + 136], 255       # 1-byte Folded Spill
	mov	rdx, r13
	mov	rsi, qword ptr [rsp + 176]      # 8-byte Reload
	mulx	r15, rax, rsi
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	r8, rcx, rsi
	mov	rdx, qword ptr [rsp + 200]      # 8-byte Reload
	mulx	rsi, r13, rsi
	adc	r13, qword ptr [rsp + 184]      # 8-byte Folded Reload
	adc	rsi, rcx
	adc	r8, rax
	adc	r15, 0
	mov	qword ptr [rsp + 72], r15       # 8-byte Spill
	add	byte ptr [rsp + 96], 255        # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	movabs	rax, 620258357900100
	mulx	r15, r12, rax
	movabs	rax, 7853257225132122198
	mulx	rcx, rax, rax
	adc	rax, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rcx, r12
	setb	dl
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	rax, r9
	adc	rcx, r10
	mov	r10, rcx
	movzx	r12d, dl
	adc	r12, r15
	add	byte ptr [rsp + 56], 255        # 1-byte Folded Spill
	adc	r11, 0
	setb	dl
	lea	r9, [r11 + rbx]
	xor	ecx, ecx
	add	r12, r9
	setb	cl
	add	r11, rbx
	movzx	edx, dl
	adc	rcx, rdx
	mov	qword ptr [rsp + 56], rcx       # 8-byte Spill
	add	byte ptr [rsp + 16], 255        # 1-byte Folded Spill
	adc	rax, r13
	adc	r10, rsi
	mov	qword ptr [rsp + 168], r10      # 8-byte Spill
	adc	r12, r8
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	add	byte ptr [rsp + 112], 255       # 1-byte Folded Spill
	adc	rax, qword ptr [rsp + 152]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 152]            # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 64]       # 8-byte Reload
	mov	rdx, rcx
	mov	rsi, qword ptr [rsp + 160]      # 8-byte Reload
	add	rdx, rsi
	adc	rsi, rcx
	mov	rsi, rcx
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	movabs	r8, -161717841442111489
	mulx	rcx, rdx, r8
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	adc	rdx, rsi
	setb	byte ptr [rsp + 96]             # 1-byte Folded Spill
	add	byte ptr [rsp - 48], 255        # 1-byte Folded Spill
	adc	rax, qword ptr [rsp + 24]       # 8-byte Folded Reload
	setb	byte ptr [rsp + 160]            # 1-byte Folded Spill
	add	byte ptr [rsp + 144], 255       # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 56]       # 8-byte Reload
	adc	qword ptr [rsp + 104], rcx      # 8-byte Folded Spill
	adc	rax, rdx
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	add	r14, qword ptr [rsp + 64]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	rdx, rcx, qword ptr [rsp + 32]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	adc	rcx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 64]             # 1-byte Folded Spill
	add	rbp, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	rcx, rax
	mov	rax, rcx
	mov	qword ptr [rsp + 104], rcx      # 8-byte Spill
	mov	rdx, rbp
	mov	r10, -1
	mulx	rdx, r11, r10
	mov	qword ptr [rsp + 144], rdx      # 8-byte Spill
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	mov	rcx, rdx
	add	rcx, r11
	adc	rcx, 0
	mov	qword ptr [rsp + 112], rcx      # 8-byte Spill
	mov	rcx, rdx
	add	rcx, r11
	adc	rax, rcx
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, r11
	add	rax, rbp
	adc	rcx, qword ptr [rsp + 128]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mov	rax, qword ptr [rax + 48]
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rdx, rax, rax
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	lea	rdx, [rcx + rax]
	movabs	rax, 620258357900100
	mulx	r14, rax, rax
	movabs	rsi, 7853257225132122198
	mulx	r15, rsi, rsi
	movabs	r9, 8918917783347572387
	mulx	r13, r9, r9
	mulx	rbx, r8, r8
	mulx	r10, rcx, r10
	mov	qword ptr [rsp - 112], r10      # 8-byte Spill
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	setb	byte ptr [rsp + 16]             # 1-byte Folded Spill
	mov	rdx, r10
	add	rdx, rcx
	mov	rdx, r10
	adc	rdx, rcx
	adc	r8, r10
	mov	qword ptr [rsp - 8], r8         # 8-byte Spill
	adc	rbx, r9
	mov	qword ptr [rsp + 128], rbx      # 8-byte Spill
	adc	r13, rsi
	mov	qword ptr [rsp + 136], r13      # 8-byte Spill
	adc	r15, rax
	mov	qword ptr [rsp + 176], r15      # 8-byte Spill
	adc	r14, 0
	mov	qword ptr [rsp + 184], r14      # 8-byte Spill
	add	byte ptr [rsp + 120], 255       # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rsi, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rcx, r14, rsi
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	rax, r15, rsi
	mov	r9, qword ptr [rsp + 200]       # 8-byte Reload
	mov	rdx, r9
	mulx	rsi, rbx, rsi
	adc	rbx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rsi, r15
	adc	rax, r14
	adc	rcx, 0
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	add	byte ptr [rsp + 80], 255        # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	movabs	rcx, 620258357900100
	mulx	r13, r10, rcx
	movabs	rcx, 7853257225132122198
	mulx	r15, r14, rcx
	adc	r14, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r15, r10
	setb	dl
	add	byte ptr [rsp + 152], 255       # 1-byte Folded Spill
	adc	r14, qword ptr [rsp + 168]      # 8-byte Folded Reload
	adc	r15, r12
	movzx	ecx, dl
	adc	rcx, r13
	add	byte ptr [rsp - 122], 255       # 1-byte Folded Spill
	mov	r8, qword ptr [rsp + 72]        # 8-byte Reload
	adc	r8, 0
	setb	dl
	mov	r12, qword ptr [rsp + 56]       # 8-byte Reload
	lea	r10, [r8 + r12]
	xor	r13d, r13d
	add	rcx, r10
	setb	r13b
	add	byte ptr [rsp + 160], 255       # 1-byte Folded Spill
	adc	r14, rbx
	adc	r15, rsi
	adc	rcx, rax
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	movzx	eax, byte ptr [rsp + 16]        # 1-byte Folded Reload
	add	al, 255
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	adc	rax, 0
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	add	rax, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	adc	rax, 0
	mov	qword ptr [rsp], rax            # 8-byte Spill
	add	r8, r12
	movzx	eax, dl
	adc	r13, rax
	mov	qword ptr [rsp + 168], r13      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 144]      # 8-byte Reload
	mov	rax, rdx
	add	rax, r11
	adc	r11, rdx
	mov	r8, rdx
	mov	rdx, rbp
	movabs	r12, 620258357900100
	mulx	rdx, rax, r12
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	rdx, rbp
	movabs	rsi, 7853257225132122198
	mulx	rbx, rsi, rsi
	movabs	r10, 8918917783347572387
	mulx	r13, r10, r10
	movabs	r11, -161717841442111489
	mulx	rdx, r11, r11
	adc	r11, r8
	mov	qword ptr [rsp + 56], r11       # 8-byte Spill
	adc	rdx, r10
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	adc	r13, rsi
	mov	qword ptr [rsp + 80], r13       # 8-byte Spill
	adc	rbx, rax
	mov	qword ptr [rsp - 40], rbx       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	mulx	rbp, r8, rax
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	r13, r10, rax
	mov	rdx, r9
	mulx	rbx, r11, rax
	mov	rdx, qword ptr [rsp + 192]      # 8-byte Reload
	mulx	rax, rsi, rax
	setb	byte ptr [rsp + 32]             # 1-byte Folded Spill
	add	byte ptr [rsp + 64], 255        # 1-byte Folded Spill
	adc	rsi, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	rax, r11
	adc	rbx, r10
	adc	r13, r8
	adc	rbp, 0
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r8, r9, r12
	mov	qword ptr [rsp - 64], r8        # 8-byte Spill
	movabs	r8, 7853257225132122198
	mulx	r8, r12, r8
	movabs	r10, 8918917783347572387
	mulx	r10, r11, r10
	add	byte ptr [rsp + 96], 255        # 1-byte Folded Spill
	adc	r11, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r10, r12
	adc	r8, r9
	setb	dl
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	r11, r14
	adc	r10, r15
	adc	r8, rcx
	movzx	r15d, dl
	adc	r15, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	byte ptr [rsp - 122], 255       # 1-byte Folded Spill
	mov	r12, qword ptr [rsp - 24]       # 8-byte Reload
	adc	r12, 0
	setb	cl
	add	byte ptr [rsp - 48], 255        # 1-byte Folded Spill
	adc	r11, rsi
	adc	r10, rax
	adc	r8, rbx
	mov	rsi, qword ptr [rsp + 168]      # 8-byte Reload
	lea	r9, [r12 + rsi]
	lea	rax, [r15 + r9]
	adc	rax, r13
	setb	byte ptr [rsp - 104]            # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	add	rdx, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rdx, r13, qword ptr [rsp + 24]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 32], r13       # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rbx, qword ptr [rsp - 56]       # 8-byte Reload
	mov	r14, rbx
	adc	r14, r13
	movzx	r13d, byte ptr [rsp + 16]       # 1-byte Folded Reload
	mov	edx, r13d
	add	dl, 255
	adc	r14, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], r14       # 8-byte Spill
	xor	edx, edx
	add	r15, r9
	setb	dl
	add	r12, rsi
	movzx	ecx, cl
	adc	rdx, rcx
	add	r13b, 255
	mov	rcx, qword ptr [rsp + 104]      # 8-byte Reload
	adc	qword ptr [rsp + 112], rcx      # 8-byte Folded Spill
	adc	r11, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 80]        # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 40]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	movzx	r9d, byte ptr [rsp + 32]        # 1-byte Folded Reload
	adc	r9, qword ptr [rsp + 120]       # 8-byte Folded Reload
	add	byte ptr [rsp - 104], 255       # 1-byte Folded Spill
	adc	rbp, 0
	setb	al
	lea	rcx, [rdx + rbp]
	xor	r14d, r14d
	add	r9, rcx
	setb	r14b
	add	rbp, rdx
	movzx	eax, al
	adc	r14, rax
	mov	qword ptr [rsp - 104], r14      # 8-byte Spill
	add	rbx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	mov	r14, rbx
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mov	rbx, qword ptr [rsp + 24]       # 8-byte Reload
	mulx	r15, rax, rbx
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	r12, rcx, rbx
	mov	rdx, qword ptr [rsp + 200]      # 8-byte Reload
	mulx	rax, rsi, rbx
	mov	r13, rbx
	mov	rdx, qword ptr [rsp + 192]      # 8-byte Reload
	mulx	rbp, rbx, rbx
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	r13, rdx, r13
	adc	rdx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r13, rbx
	adc	rbp, rsi
	adc	rax, rcx
	adc	r12, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	r15, 0
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	add	rcx, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	rsi, rdx
	adc	rsi, r11
	adc	r13, r10
	adc	rbp, r8
	adc	rax, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r12, r9
	adc	r15, 0
	setb	r11b
	add	rcx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp - 72]       # 8-byte Reload
	adc	rcx, 0
	setb	dl
	xor	r10d, r10d
	add	rsi, qword ptr [rsp]            # 8-byte Folded Reload
	mov	rbx, rsi
	setb	r10b
	xor	r9d, r9d
	add	r13, qword ptr [rsp - 8]        # 8-byte Folded Reload
	setb	r9b
	xor	esi, esi
	add	rbp, qword ptr [rsp + 128]      # 8-byte Folded Reload
	setb	sil
	mov	r8, rsi
	mov	qword ptr [rsp + 48], rdi       # 8-byte Spill
	xor	edi, edi
	add	rax, qword ptr [rsp + 136]      # 8-byte Folded Reload
	setb	dil
	xor	esi, esi
	add	r12, qword ptr [rsp + 176]      # 8-byte Folded Reload
	setb	sil
	add	rcx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	r14, rcx
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	movzx	edx, dl
	adc	rbx, rdx
	mov	rcx, rbx
	mov	qword ptr [rsp - 112], rbx      # 8-byte Spill
	adc	r10, r13
	adc	r9, rbp
	mov	rbx, qword ptr [rsp - 104]      # 8-byte Reload
	lea	rdx, [r15 + rbx]
	adc	r8, rax
	mov	qword ptr [rsp - 96], r8        # 8-byte Spill
	adc	rdi, r12
	adc	rsi, qword ptr [rsp + 184]      # 8-byte Folded Reload
	xor	r13d, r13d
	add	rsi, rdx
	setb	r13b
	add	r15, rbx
	movzx	eax, r11b
	adc	r13, rax
	xor	r11d, r11d
	mov	rbx, r14
	add	rbx, 1
	mov	eax, 0
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	r14, rcx
	sub	r14, rax
	mov	eax, 0
	sbb	rax, rax
	add	r14, 1
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	r15, r10
	sub	r15, rax
	mov	eax, 0
	sbb	rax, rax
	add	r15, 1
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	rdx, r9
	sub	rdx, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	r12, 161717841442111489
	add	r12, rdx
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	rdx, r8
	sub	rdx, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	rbp, -8918917783347572387
	add	rbp, rdx
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	rdx, rdi
	sub	rdx, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	rcx, -7853257225132122198
	add	rcx, rdx
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	r8, rsi
	sub	r8, rax
	mov	eax, 0
	sbb	rax, rax
	movabs	rdx, -620258357900100
	add	rdx, r8
	adc	al, -1
	neg	al
	movzx	eax, al
	cmp	r13, rax
	mov	eax, 0
	sbb	rax, rax
	neg	al
	sbb	r11, r11
	mov	r13, r11
	#APP
	#NO_APP
	mov	rax, qword ptr [rsp - 72]       # 8-byte Reload
	and	rax, r13
	not	r11
	#APP
	#NO_APP
	and	rbx, r11
	or	rbx, rax
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	and	rax, r13
	and	r14, r11
	or	r14, rax
	and	r10, r13
	and	r15, r11
	or	r15, r10
	and	r9, r13
	and	r12, r11
	or	r12, r9
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	and	rax, r13
	and	rbp, r11
	or	rbp, rax
	and	rdi, r13
	and	rcx, r11
	or	rcx, rdi
	and	r13, rsi
	and	r11, rdx
	or	r11, r13
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mov	qword ptr [rax], rbx
	mov	qword ptr [rax + 8], r14
	mov	qword ptr [rax + 16], r15
	mov	qword ptr [rax + 24], r12
	mov	qword ptr [rax + 32], rbp
	mov	qword ptr [rax + 40], rcx
	mov	qword ptr [rax + 48], r11
	add	rsp, 216
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
	.size	fiat_p434_mul_clang, .Lfunc_end0-fiat_p434_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
