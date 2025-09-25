	.text
	.intel_syntax noprefix
	.file	"p384_mul_wrapper.c"
	.globl	fiat_p384_mul_clang             # -- Begin function fiat_p384_mul_clang
	.p2align	4, 0x90
	.type	fiat_p384_mul_clang,@function
fiat_p384_mul_clang:                    # @fiat_p384_mul_clang
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
	sub	rsp, 32
	.cfi_def_cfa_offset 88
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r11, rdx
	mov	qword ptr [rsp - 88], rsi       # 8-byte Spill
	mov	r12, qword ptr [rsi]
	mov	rdx, qword ptr [rdx + 40]
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mulx	r13, r9, r12
	mov	rdx, qword ptr [r11 + 32]
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mulx	rax, r10, r12
	mov	rdx, qword ptr [r11 + 24]
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mulx	r8, r14, r12
	mov	rdx, qword ptr [r11 + 16]
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mulx	rbx, r15, r12
	mov	rsi, qword ptr [r11]
	mov	qword ptr [rsp - 16], rsi       # 8-byte Spill
	mov	rdx, qword ptr [r11 + 8]
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mulx	rcx, r11, r12
	mov	rdx, rsi
	mulx	rsi, r12, r12
	mov	qword ptr [rsp - 112], r12      # 8-byte Spill
	add	rsi, r11
	adc	rcx, r15
	adc	rbx, r14
	adc	r8, r10
	adc	rax, r9
	mov	r15, r13
	adc	r15, 0
	mov	rdx, r12
	shl	rdx, 32
	add	rdx, r12
	mov	r9, -1
	mulx	r14, r11, r9
	mov	r9, -2
	mulx	r9, r12, r9
	movabs	r10, -4294967296
	mulx	rbp, r13, r10
	xor	r10d, r10d
	add	r13, rsi
	mov	esi, 4294967295
	mulx	rdx, rsi, rsi
	mov	qword ptr [rsp - 96], rsi       # 8-byte Spill
	setb	r10b
	add	r13, rdx
	mov	qword ptr [rsp - 80], r13       # 8-byte Spill
	adc	r10, 0
	mov	rdx, rbp
	add	rdx, r12
	adc	r9, r11
	mov	rsi, r11
	adc	rsi, r14
	adc	r11, r14
	adc	r15, r14
	mov	qword ptr [rsp - 128], r15      # 8-byte Spill
	setb	byte ptr [rsp - 120]            # 1-byte Folded Spill
	xor	ebp, ebp
	add	rdx, rcx
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	setb	bpl
	xor	ecx, ecx
	add	r9, rbx
	mov	qword ptr [rsp - 40], r9        # 8-byte Spill
	setb	cl
	xor	ebx, ebx
	add	rsi, r8
	setb	bl
	xor	r12d, r12d
	add	r11, rax
	setb	r12b
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rax, qword ptr [rax + 8]
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rdx, r8, rax
	mov	qword ptr [rsp + 8], r8         # 8-byte Spill
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	rdx, r8, rax
	mov	qword ptr [rsp - 8], r8         # 8-byte Spill
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	mulx	r15, rdx, rax
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r9, r8, rax
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	r14, r13, rax
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rax, rdx, rax
	add	rax, r13
	adc	r14, r8
	mov	qword ptr [rsp - 32], r14       # 8-byte Spill
	adc	r9, qword ptr [rsp - 104]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], r9       # 8-byte Spill
	adc	r15, qword ptr [rsp - 8]        # 8-byte Folded Reload
	mov	r8, qword ptr [rsp]             # 8-byte Reload
	adc	r8, qword ptr [rsp + 8]         # 8-byte Folded Reload
	mov	r9, qword ptr [rsp + 16]        # 8-byte Reload
	adc	r9, 0
	mov	r14, qword ptr [rsp - 96]       # 8-byte Reload
	add	r14, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	r13, qword ptr [rsp - 80]       # 8-byte Reload
	adc	r13, 0
	mov	r14, qword ptr [rsp + 24]       # 8-byte Reload
	adc	r14, r10
	adc	rbp, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rcx, rsi
	adc	rbx, r11
	adc	r12, qword ptr [rsp - 128]      # 8-byte Folded Reload
	movzx	esi, byte ptr [rsp - 120]       # 1-byte Folded Reload
	adc	rsi, r9
	mov	qword ptr [rsp - 120], rsi      # 8-byte Spill
	setb	byte ptr [rsp - 112]            # 1-byte Folded Spill
	add	r13, rdx
	adc	rax, 0
	setb	dl
	xor	r9d, r9d
	add	rbp, qword ptr [rsp - 32]       # 8-byte Folded Reload
	setb	r9b
	xor	r10d, r10d
	add	rcx, qword ptr [rsp - 104]      # 8-byte Folded Reload
	setb	r10b
	xor	r11d, r11d
	add	rbx, r15
	setb	r11b
	xor	esi, esi
	add	r12, r8
	setb	sil
	mov	r8, r13
	shl	r8, 32
	add	rax, r14
	movzx	edx, dl
	adc	rbp, rdx
	adc	r9, rcx
	adc	r10, rbx
	adc	r11, r12
	lea	rdx, [r13 + r8]
	mov	rcx, -1
	mulx	rbx, r8, rcx
	mov	rcx, -2
	mulx	rcx, r14, rcx
	mov	qword ptr [rsp - 96], r14       # 8-byte Spill
	movabs	r15, -4294967296
	mulx	r14, r12, r15
	adc	rsi, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	r15d, 4294967295
	mulx	rdx, r15, r15
	mov	qword ptr [rsp - 120], r15      # 8-byte Spill
	setb	byte ptr [rsp - 128]            # 1-byte Folded Spill
	xor	r15d, r15d
	add	r12, rax
	setb	r15b
	add	r12, rdx
	adc	r15, 0
	mov	rax, r14
	add	rax, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	rcx, r8
	mov	r14, r8
	adc	r14, rbx
	adc	r8, rbx
	adc	rsi, rbx
	setb	byte ptr [rsp - 104]            # 1-byte Folded Spill
	xor	edx, edx
	add	rax, rbp
	setb	dl
	xor	ebp, ebp
	add	rcx, r9
	setb	bpl
	xor	ebx, ebx
	add	r14, r10
	setb	bl
	xor	r9d, r9d
	add	r8, r11
	setb	r9b
	add	qword ptr [rsp - 120], r13      # 8-byte Folded Spill
	adc	r12, 0
	adc	rax, r15
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	adc	rdx, rcx
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	adc	rbp, r14
	adc	rbx, r8
	adc	r9, rsi
	mov	qword ptr [rsp - 80], r9        # 8-byte Spill
	movzx	ecx, byte ptr [rsp - 104]       # 1-byte Folded Reload
	adc	rcx, 0
	add	byte ptr [rsp - 128], 255       # 1-byte Folded Spill
	movzx	r8d, byte ptr [rsp - 112]       # 1-byte Folded Reload
	adc	r8, rcx
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rsi, qword ptr [rax + 16]
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	r9, rax, rsi
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r14, rax, rsi
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	mulx	r13, r10, rsi
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r15, r11, rsi
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rcx, rax, rsi
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rsi, rdx, rsi
	add	rsi, rax
	adc	rcx, r11
	adc	r15, r10
	adc	r13, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	r9, r8
	mov	qword ptr [rsp - 128], r9       # 8-byte Spill
	setb	byte ptr [rsp - 112]            # 1-byte Folded Spill
	add	rdx, r12
	mov	r12, rdx
	adc	rsi, 0
	setb	dl
	xor	r10d, r10d
	add	rcx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	setb	r10b
	xor	r11d, r11d
	add	r15, rbp
	setb	r11b
	xor	ebp, ebp
	add	r13, rbx
	setb	bpl
	xor	eax, eax
	add	r14, qword ptr [rsp - 80]       # 8-byte Folded Reload
	setb	al
	mov	r8, r12
	mov	qword ptr [rsp - 104], r12      # 8-byte Spill
	shl	r8, 32
	add	rsi, qword ptr [rsp - 120]      # 8-byte Folded Reload
	movzx	edx, dl
	adc	rcx, rdx
	adc	r10, r15
	adc	r11, r13
	adc	rbp, r14
	lea	rdx, [r12 + r8]
	mov	r8, -1
	mulx	r9, r8, r8
	mov	rbx, -2
	mulx	r14, rbx, rbx
	movabs	r15, -4294967296
	mulx	r13, r12, r15
	adc	rax, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mov	r15d, 4294967295
	mulx	r15, rdx, r15
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	setb	byte ptr [rsp - 128]            # 1-byte Folded Spill
	xor	edx, edx
	add	r12, rsi
	setb	dl
	add	r12, r15
	adc	rdx, 0
	add	r13, rbx
	adc	r14, r8
	mov	r15, r8
	adc	r15, r9
	adc	r8, r9
	adc	rax, r9
	setb	sil
	xor	r9d, r9d
	add	r13, rcx
	setb	r9b
	xor	ecx, ecx
	add	r14, r10
	setb	cl
	mov	r10, rcx
	xor	ecx, ecx
	add	r15, r11
	setb	cl
	xor	ebx, ebx
	add	r8, rbp
	setb	bl
	mov	r11, qword ptr [rsp - 120]      # 8-byte Reload
	add	r11, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r12, 0
	adc	r13, rdx
	mov	qword ptr [rsp - 120], r13      # 8-byte Spill
	adc	r9, r14
	mov	qword ptr [rsp - 96], r9        # 8-byte Spill
	adc	r10, r15
	mov	qword ptr [rsp - 80], r10       # 8-byte Spill
	adc	rcx, r8
	mov	qword ptr [rsp - 104], rcx      # 8-byte Spill
	adc	rbx, rax
	movzx	eax, sil
	adc	rax, 0
	add	byte ptr [rsp - 128], 255       # 1-byte Folded Spill
	movzx	r8d, byte ptr [rsp - 112]       # 1-byte Folded Reload
	adc	r8, rax
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rax, qword ptr [rax + 24]
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	r13, rcx, rax
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r15, rcx, rax
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	mulx	r14, r10, rax
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	rsi, r11, rax
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rcx, r9, rax
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rbp, rax, rax
	add	rbp, r9
	adc	rcx, r11
	adc	rsi, r10
	adc	r14, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	r13, r8
	mov	qword ptr [rsp - 128], r13      # 8-byte Spill
	setb	byte ptr [rsp - 112]            # 1-byte Folded Spill
	mov	r9, rax
	add	r9, r12
	adc	rbp, 0
	setb	dl
	xor	r10d, r10d
	add	rcx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	setb	r10b
	xor	r11d, r11d
	add	rsi, qword ptr [rsp - 80]       # 8-byte Folded Reload
	setb	r11b
	xor	r13d, r13d
	add	r14, qword ptr [rsp - 104]      # 8-byte Folded Reload
	setb	r13b
	xor	eax, eax
	add	r15, rbx
	setb	al
	mov	r8, r9
	mov	qword ptr [rsp - 32], r9        # 8-byte Spill
	shl	r8, 32
	add	rbp, qword ptr [rsp - 120]      # 8-byte Folded Reload
	movzx	edx, dl
	adc	rcx, rdx
	adc	r10, rsi
	adc	r11, r14
	adc	r13, r15
	lea	rdx, [r9 + r8]
	mov	rsi, -1
	mulx	r8, rsi, rsi
	mov	r9, -2
	mulx	r14, r9, r9
	movabs	rbx, -4294967296
	mulx	r15, r12, rbx
	adc	rax, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mov	ebx, 4294967295
	mulx	rbx, rdx, rbx
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	setb	byte ptr [rsp - 128]            # 1-byte Folded Spill
	xor	edx, edx
	add	r12, rbp
	setb	dl
	add	r12, rbx
	adc	rdx, 0
	mov	rbx, r15
	add	rbx, r9
	adc	r14, rsi
	mov	r15, rsi
	adc	r15, r8
	adc	rsi, r8
	adc	rax, r8
	setb	byte ptr [rsp - 40]             # 1-byte Folded Spill
	xor	ebp, ebp
	add	rbx, rcx
	mov	rcx, rbx
	setb	bpl
	xor	r8d, r8d
	add	r14, r10
	setb	r8b
	xor	r9d, r9d
	add	r15, r11
	setb	r9b
	xor	ebx, ebx
	add	rsi, r13
	setb	bl
	mov	r10, qword ptr [rsp - 120]      # 8-byte Reload
	add	r10, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r12, 0
	adc	rcx, rdx
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	adc	rbp, r14
	mov	qword ptr [rsp - 96], rbp       # 8-byte Spill
	adc	r8, r15
	mov	qword ptr [rsp - 80], r8        # 8-byte Spill
	adc	r9, rsi
	mov	qword ptr [rsp - 104], r9       # 8-byte Spill
	adc	rbx, rax
	movzx	eax, byte ptr [rsp - 40]        # 1-byte Folded Reload
	adc	rax, 0
	add	byte ptr [rsp - 128], 255       # 1-byte Folded Spill
	movzx	esi, byte ptr [rsp - 112]       # 1-byte Folded Reload
	adc	rsi, rax
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rax, qword ptr [rax + 32]
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	r9, rcx, rax
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r13, rcx, rax
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	mulx	r15, r10, rax
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r14, r11, rax
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rcx, r8, rax
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rbp, rax, rax
	add	rbp, r8
	adc	rcx, r11
	adc	r14, r10
	adc	r15, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	r9, rsi
	mov	qword ptr [rsp - 128], r9       # 8-byte Spill
	setb	byte ptr [rsp - 112]            # 1-byte Folded Spill
	add	rax, r12
	mov	r12, rax
	adc	rbp, 0
	setb	dl
	xor	r10d, r10d
	add	rcx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	setb	r10b
	xor	esi, esi
	add	r14, qword ptr [rsp - 80]       # 8-byte Folded Reload
	setb	sil
	xor	r11d, r11d
	add	r15, qword ptr [rsp - 104]      # 8-byte Folded Reload
	setb	r11b
	xor	eax, eax
	add	r13, rbx
	setb	al
	mov	r8, r12
	mov	qword ptr [rsp - 32], r12       # 8-byte Spill
	shl	r8, 32
	add	rbp, qword ptr [rsp - 120]      # 8-byte Folded Reload
	movzx	edx, dl
	adc	rcx, rdx
	adc	r10, r14
	adc	rsi, r15
	adc	r11, r13
	lea	rdx, [r12 + r8]
	mov	r8, -1
	mulx	r9, r8, r8
	mov	rbx, -2
	mulx	r15, rbx, rbx
	mov	qword ptr [rsp - 120], rbx      # 8-byte Spill
	movabs	r14, -4294967296
	mulx	rbx, r12, r14
	adc	rax, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mov	r14d, 4294967295
	mulx	r13, rdx, r14
	setb	byte ptr [rsp - 128]            # 1-byte Folded Spill
	xor	r14d, r14d
	add	r12, rbp
	setb	r14b
	add	r12, r13
	adc	r14, 0
	mov	r13, rbx
	add	r13, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r15, r8
	mov	rbx, r8
	adc	rbx, r9
	adc	r8, r9
	adc	rax, r9
	setb	byte ptr [rsp - 40]             # 1-byte Folded Spill
	xor	ebp, ebp
	add	r13, rcx
	mov	rcx, r13
	setb	bpl
	xor	r9d, r9d
	add	r15, r10
	setb	r9b
	mov	r10, r9
	xor	r9d, r9d
	add	rbx, rsi
	setb	r9b
	xor	r13d, r13d
	add	r8, r11
	setb	r13b
	add	rdx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r12, 0
	adc	rcx, r14
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	adc	rbp, r15
	mov	qword ptr [rsp - 96], rbp       # 8-byte Spill
	adc	r10, rbx
	mov	qword ptr [rsp - 80], r10       # 8-byte Spill
	adc	r9, r8
	mov	qword ptr [rsp - 104], r9       # 8-byte Spill
	adc	r13, rax
	movzx	eax, byte ptr [rsp - 40]        # 1-byte Folded Reload
	adc	rax, 0
	add	byte ptr [rsp - 128], 255       # 1-byte Folded Spill
	movzx	ecx, byte ptr [rsp - 112]       # 1-byte Folded Reload
	adc	rcx, rax
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	r8, qword ptr [rax + 40]
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	r9, rax, r8
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	rax, rdx, r8
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	mulx	r10, r15, r8
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r14, r11, r8
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rsi, rbx, r8
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rbp, rdx, r8
	add	rbp, rbx
	adc	rsi, r11
	adc	r14, r15
	adc	r10, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r9, rcx
	mov	qword ptr [rsp - 88], r9        # 8-byte Spill
	setb	byte ptr [rsp - 72]             # 1-byte Folded Spill
	mov	rcx, rdx
	add	rcx, r12
	adc	rbp, 0
	setb	dl
	xor	r11d, r11d
	add	rsi, qword ptr [rsp - 96]       # 8-byte Folded Reload
	setb	r11b
	xor	r8d, r8d
	add	r14, qword ptr [rsp - 80]       # 8-byte Folded Reload
	setb	r8b
	xor	r15d, r15d
	add	r10, qword ptr [rsp - 104]      # 8-byte Folded Reload
	setb	r15b
	xor	ebx, ebx
	add	rax, r13
	setb	bl
	mov	r9, rcx
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	shl	r9, 32
	add	rbp, qword ptr [rsp - 120]      # 8-byte Folded Reload
	movzx	edx, dl
	adc	rsi, rdx
	adc	r11, r14
	adc	r8, r10
	adc	r15, rax
	lea	rdx, [rcx + r9]
	mov	rax, -1
	mulx	rcx, r12, rax
	mov	rax, -2
	mulx	r13, r14, rax
	movabs	rax, -4294967296
	mulx	r10, r9, rax
	adc	rbx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	eax, 4294967295
	mulx	rdx, rax, rax
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	xor	eax, eax
	add	r9, rbp
	setb	al
	add	r9, rdx
	adc	rax, 0
	add	r10, r14
	adc	r13, r12
	mov	r14, r12
	adc	r14, rcx
	adc	r12, rcx
	adc	rbx, rcx
	setb	bpl
	xor	edx, edx
	add	r10, rsi
	setb	dl
	xor	esi, esi
	add	r13, r11
	setb	sil
	xor	ecx, ecx
	add	r14, r8
	setb	cl
	mov	r8, rcx
	mov	qword ptr [rsp - 88], rdi       # 8-byte Spill
	xor	edi, edi
	add	r12, r15
	setb	dil
	mov	rcx, qword ptr [rsp - 64]       # 8-byte Reload
	add	rcx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r9, 0
	adc	r10, rax
	mov	r15, r10
	adc	rdx, r13
	adc	rsi, r14
	adc	r8, r12
	movzx	eax, bpl
	adc	rdi, rbx
	adc	rax, 0
	movzx	r13d, byte ptr [rsp - 72]       # 1-byte Folded Reload
	add	byte ptr [rsp - 48], 255        # 1-byte Folded Spill
	adc	r13, rax
	xor	r10d, r10d
	movabs	rax, -4294967295
	add	rax, r9
	mov	ecx, 0
	adc	cl, -1
	neg	cl
	movzx	ecx, cl
	movabs	r11, -4294967296
	or	rcx, r11
	mov	rbx, r15
	mov	r11, r15
	sub	rbx, rcx
	mov	ecx, 0
	sbb	rcx, rcx
	neg	cl
	movzx	ecx, cl
	mov	r14, rdx
	sub	r14, rcx
	mov	ecx, 0
	sbb	rcx, rcx
	add	r14, 2
	adc	cl, -1
	neg	cl
	movzx	ecx, cl
	mov	r15, rsi
	sub	r15, rcx
	mov	ecx, 0
	sbb	rcx, rcx
	add	r15, 1
	adc	cl, -1
	neg	cl
	movzx	ecx, cl
	mov	r12, r8
	sub	r12, rcx
	mov	ecx, 0
	sbb	rcx, rcx
	add	r12, 1
	adc	cl, -1
	neg	cl
	movzx	ecx, cl
	mov	rbp, rdi
	sub	rbp, rcx
	mov	ecx, 0
	sbb	rcx, rcx
	add	rbp, 1
	adc	cl, -1
	neg	cl
	movzx	ecx, cl
	cmp	r13, rcx
	mov	ecx, 0
	sbb	rcx, rcx
	neg	cl
	sbb	r10, r10
	mov	rcx, r10
	#APP
	#NO_APP
	and	r9, rcx
	not	r10
	#APP
	#NO_APP
	and	rax, r10
	or	rax, r9
	mov	r9, r11
	and	r9, rcx
	and	rbx, r10
	or	rbx, r9
	and	rdx, rcx
	and	r14, r10
	or	r14, rdx
	and	rsi, rcx
	and	r15, r10
	or	r15, rsi
	and	r8, rcx
	and	r12, r10
	or	r12, r8
	and	rcx, rdi
	and	r10, rbp
	or	r10, rcx
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	qword ptr [rcx], rax
	mov	qword ptr [rcx + 8], rbx
	mov	qword ptr [rcx + 16], r14
	mov	qword ptr [rcx + 24], r15
	mov	qword ptr [rcx + 32], r12
	mov	qword ptr [rcx + 40], r10
	add	rsp, 32
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
	.size	fiat_p384_mul_clang, .Lfunc_end0-fiat_p384_mul_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
