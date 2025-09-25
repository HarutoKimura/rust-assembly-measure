	.text
	.intel_syntax noprefix
	.file	"p384_square_wrapper.c"
	.globl	fiat_p384_square_clang          # -- Begin function fiat_p384_square_clang
	.p2align	4, 0x90
	.type	fiat_p384_square_clang,@function
fiat_p384_square_clang:                 # @fiat_p384_square_clang
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
	sub	rsp, 144
	.cfi_def_cfa_offset 200
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rdx, qword ptr [rsi]
	mov	r9, qword ptr [rsi + 8]
	mov	rbx, qword ptr [rsi + 16]
	mov	qword ptr [rsp - 88], rbx       # 8-byte Spill
	mov	r11, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 104], r11      # 8-byte Spill
	mov	r8, qword ptr [rsi + 32]
	mov	qword ptr [rsp - 80], r8        # 8-byte Spill
	mov	rax, qword ptr [rsi + 40]
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mulx	rcx, r10, rax
	mov	qword ptr [rsp + 128], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 136], r10      # 8-byte Spill
	mulx	r8, rbp, r8
	mov	qword ptr [rsp - 32], r8        # 8-byte Spill
	mov	qword ptr [rsp + 48], rbp       # 8-byte Spill
	mulx	r11, rsi, r11
	mov	qword ptr [rsp + 40], r11       # 8-byte Spill
	mov	qword ptr [rsp - 40], rsi       # 8-byte Spill
	mulx	rbx, rax, rbx
	mov	qword ptr [rsp - 112], rbx      # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mulx	r12, r14, r9
	mov	qword ptr [rsp - 72], r12       # 8-byte Spill
	mov	qword ptr [rsp - 120], r14      # 8-byte Spill
	mulx	r15, rdx, rdx
	add	r15, r14
	adc	rax, r12
	adc	rsi, rbx
	adc	rbp, r11
	adc	r10, r8
	adc	rcx, 0
	mov	r14, rcx
	mov	rcx, rdx
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	shl	rdx, 32
	add	rdx, rcx
	mov	rcx, -1
	mulx	r11, r12, rcx
	mov	rcx, -2
	mulx	rcx, r13, rcx
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	movabs	r8, -4294967296
	mulx	rbx, rcx, r8
	xor	r8d, r8d
	add	rcx, r15
	mov	r15d, 4294967295
	mulx	rdx, r15, r15
	mov	qword ptr [rsp - 8], r15        # 8-byte Spill
	setb	r8b
	add	rcx, rdx
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	adc	r8, 0
	add	rbx, r13
	mov	rdx, qword ptr [rsp - 128]      # 8-byte Reload
	adc	rdx, r12
	mov	r13, r12
	adc	r13, r11
	adc	r12, r11
	adc	r14, r11
	mov	qword ptr [rsp], r14            # 8-byte Spill
	setb	byte ptr [rsp + 24]             # 1-byte Folded Spill
	xor	ecx, ecx
	add	rbx, rax
	mov	qword ptr [rsp + 56], rbx       # 8-byte Spill
	setb	cl
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	xor	eax, eax
	add	rdx, rsi
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	setb	al
	xor	ecx, ecx
	add	r13, rbp
	setb	cl
	mov	qword ptr [rsp + 72], rcx       # 8-byte Spill
	xor	ecx, ecx
	add	r12, r10
	setb	cl
	mov	qword ptr [rsp + 80], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	r15, r10, r9
	mov	qword ptr [rsp + 112], r10      # 8-byte Spill
	mov	qword ptr [rsp + 120], r15      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r14, rbx, r9
	mov	qword ptr [rsp + 96], r14       # 8-byte Spill
	mov	qword ptr [rsp + 104], rbx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r11, rcx, r9
	mov	qword ptr [rsp + 88], r11       # 8-byte Spill
	mov	qword ptr [rsp + 32], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	rbp, rsi, r9
	mov	qword ptr [rsp + 8], rsi        # 8-byte Spill
	mov	qword ptr [rsp + 16], rbp       # 8-byte Spill
	mov	rdx, r9
	mulx	rdx, r9, r9
	add	r9, qword ptr [rsp - 72]        # 8-byte Folded Reload
	adc	rdx, rsi
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, rcx
	adc	rdx, rbp
	adc	rbx, r11
	mov	qword ptr [rsp - 16], rbx       # 8-byte Spill
	adc	r10, r14
	mov	qword ptr [rsp - 72], r10       # 8-byte Spill
	adc	r15, 0
	mov	rcx, qword ptr [rsp - 8]        # 8-byte Reload
	add	rcx, qword ptr [rsp - 64]       # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp - 56]       # 8-byte Reload
	adc	rbx, 0
	mov	rbp, qword ptr [rsp + 56]       # 8-byte Reload
	adc	rbp, r8
	mov	r14, qword ptr [rsp + 64]       # 8-byte Reload
	adc	r14, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	rax, r13
	mov	r11, qword ptr [rsp + 72]       # 8-byte Reload
	adc	r11, r12
	mov	rsi, qword ptr [rsp + 80]       # 8-byte Reload
	adc	rsi, qword ptr [rsp]            # 8-byte Folded Reload
	movzx	ecx, byte ptr [rsp + 24]        # 1-byte Folded Reload
	adc	rcx, r15
	setb	byte ptr [rsp - 128]            # 1-byte Folded Spill
	add	rbx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r9, 0
	setb	r8b
	xor	r10d, r10d
	add	r14, qword ptr [rsp - 24]       # 8-byte Folded Reload
	setb	r10b
	xor	r13d, r13d
	add	rax, rdx
	setb	r13b
	xor	r12d, r12d
	add	r11, qword ptr [rsp - 16]       # 8-byte Folded Reload
	setb	r12b
	xor	r15d, r15d
	add	rsi, qword ptr [rsp - 72]       # 8-byte Folded Reload
	setb	r15b
	mov	rdx, rbx
	mov	qword ptr [rsp - 56], rbx       # 8-byte Spill
	shl	rdx, 32
	add	r9, rbp
	movzx	r8d, r8b
	adc	r14, r8
	adc	r10, rax
	adc	r13, r11
	adc	r12, rsi
	lea	rdx, [rbx + rdx]
	mov	rax, -1
	mulx	rsi, rax, rax
	mov	r8, -2
	mulx	r8, rbp, r8
	adc	r15, rcx
	movabs	rcx, -4294967296
	mulx	rbx, r11, rcx
	setb	byte ptr [rsp - 120]            # 1-byte Folded Spill
	xor	ecx, ecx
	add	r11, r9
	mov	r9d, 4294967295
	mulx	r9, rdx, r9
	setb	cl
	add	r11, r9
	adc	rcx, 0
	add	rbx, rbp
	adc	r8, rax
	mov	rbp, rax
	adc	rbp, rsi
	adc	rax, rsi
	adc	r15, rsi
	setb	byte ptr [rsp - 72]             # 1-byte Folded Spill
	xor	esi, esi
	add	rbx, r14
	setb	sil
	mov	r9, rsi
	xor	esi, esi
	add	r8, r10
	setb	sil
	xor	r10d, r10d
	add	rbp, r13
	setb	r10b
	xor	r13d, r13d
	add	rax, r12
	setb	r13b
	add	rdx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r11, 0
	mov	qword ptr [rsp - 64], r11       # 8-byte Spill
	adc	rbx, rcx
	mov	qword ptr [rsp - 8], rbx        # 8-byte Spill
	adc	r9, r8
	mov	qword ptr [rsp - 16], r9        # 8-byte Spill
	adc	rsi, rbp
	mov	qword ptr [rsp - 24], rsi       # 8-byte Spill
	adc	r10, rax
	adc	r13, r15
	movzx	eax, byte ptr [rsp - 72]        # 1-byte Folded Reload
	adc	rax, 0
	add	byte ptr [rsp - 120], 255       # 1-byte Folded Spill
	movzx	ebx, byte ptr [rsp - 128]       # 1-byte Folded Reload
	adc	rbx, rax
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mov	r14, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	rax, r8, r14
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	qword ptr [rsp - 56], r8        # 8-byte Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r12, rcx, r14
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 24], r12       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rsi, r9, r14
	mov	qword ptr [rsp - 120], r9       # 8-byte Spill
	mov	qword ptr [rsp], rsi            # 8-byte Spill
	mov	r11, qword ptr [rsp - 112]      # 8-byte Reload
	add	r11, qword ptr [rsp + 8]        # 8-byte Folded Reload
	mov	rdx, r14
	mulx	r15, rbp, r14
	adc	rbp, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	r15, r9
	adc	rcx, rsi
	mov	rdx, r8
	adc	rdx, r12
	adc	rbx, rax
	setb	byte ptr [rsp - 88]             # 1-byte Folded Spill
	mov	r14, qword ptr [rsp - 64]       # 8-byte Reload
	add	r14, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r11, 0
	mov	r9, r11
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	xor	r12d, r12d
	add	rbp, qword ptr [rsp - 16]       # 8-byte Folded Reload
	setb	r12b
	xor	eax, eax
	add	r15, qword ptr [rsp - 24]       # 8-byte Folded Reload
	setb	al
	xor	r11d, r11d
	add	rcx, r10
	setb	r11b
	xor	r8d, r8d
	add	rdx, r13
	setb	r8b
	mov	rsi, r14
	mov	qword ptr [rsp - 64], r14       # 8-byte Spill
	shl	rsi, 32
	add	r9, qword ptr [rsp - 8]         # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], r9       # 8-byte Spill
	movzx	r9d, byte ptr [rsp - 48]        # 1-byte Folded Reload
	adc	rbp, r9
	adc	r12, r15
	adc	rax, rcx
	adc	r11, rdx
	adc	r8, rbx
	lea	rdx, [r14 + rsi]
	mov	rcx, -1
	mulx	r9, rsi, rcx
	mov	rcx, -2
	mulx	r15, r10, rcx
	movabs	rcx, -4294967296
	mulx	r13, r14, rcx
	setb	byte ptr [rsp + 16]             # 1-byte Folded Spill
	xor	ecx, ecx
	add	r14, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	ebx, 4294967295
	mulx	rbx, rdx, rbx
	setb	cl
	add	r14, rbx
	adc	rcx, 0
	add	r13, r10
	adc	r15, rsi
	mov	rbx, rsi
	adc	rbx, r9
	adc	rsi, r9
	adc	r8, r9
	setb	byte ptr [rsp - 112]            # 1-byte Folded Spill
	xor	r10d, r10d
	add	r13, rbp
	setb	r10b
	xor	r9d, r9d
	add	r15, r12
	setb	r9b
	xor	r12d, r12d
	add	rbx, rax
	setb	r12b
	mov	rbp, r12
	xor	eax, eax
	add	rsi, r11
	setb	al
	add	rdx, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r14, 0
	mov	r12, r14
	adc	r13, rcx
	mov	qword ptr [rsp - 48], r13       # 8-byte Spill
	adc	r10, r15
	adc	r9, rbx
	mov	qword ptr [rsp + 8], r9         # 8-byte Spill
	adc	rbp, rsi
	mov	r9, rbp
	adc	rax, r8
	mov	r13, rax
	movzx	eax, byte ptr [rsp - 112]       # 1-byte Folded Reload
	adc	rax, 0
	add	byte ptr [rsp + 16], 255        # 1-byte Folded Spill
	movzx	ebx, byte ptr [rsp - 88]        # 1-byte Folded Reload
	adc	rbx, rax
	mov	rax, qword ptr [rsp + 40]       # 8-byte Reload
	add	rax, qword ptr [rsp + 32]       # 8-byte Folded Reload
	mov	r8, qword ptr [rsp - 120]       # 8-byte Reload
	adc	r8, qword ptr [rsp + 88]        # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mov	rcx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rsi, r15, rcx
	mov	qword ptr [rsp - 64], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 112], r15      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r14, r11, rcx
	mov	qword ptr [rsp + 40], r11       # 8-byte Spill
	mov	qword ptr [rsp - 88], r14       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rcx, rcx
	adc	rcx, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rdx, r11
	adc	r15, r14
	adc	rbx, rsi
	setb	byte ptr [rsp - 104]            # 1-byte Folded Spill
	add	r12, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rax, 0
	setb	sil
	xor	r11d, r11d
	add	r8, r10
	mov	r10, r8
	setb	r11b
	xor	ebp, ebp
	add	rcx, qword ptr [rsp + 8]        # 8-byte Folded Reload
	setb	bpl
	xor	r8d, r8d
	add	rdx, r9
	setb	r8b
	xor	r14d, r14d
	add	r15, r13
	setb	r14b
	mov	r9, r12
	mov	qword ptr [rsp - 40], r12       # 8-byte Spill
	shl	r9, 32
	add	rax, qword ptr [rsp - 48]       # 8-byte Folded Reload
	movzx	esi, sil
	adc	r10, rsi
	mov	qword ptr [rsp - 120], r10      # 8-byte Spill
	adc	r11, rcx
	adc	rbp, rdx
	adc	r8, r15
	adc	r14, rbx
	lea	rdx, [r12 + r9]
	mov	rcx, -1
	mulx	r9, rbx, rcx
	mov	rcx, -2
	mulx	r12, rsi, rcx
	movabs	rcx, -4294967296
	mulx	r13, r15, rcx
	setb	byte ptr [rsp + 32]             # 1-byte Folded Spill
	xor	ecx, ecx
	add	r15, rax
	mov	r10d, 4294967295
	mulx	rdx, r10, r10
	setb	cl
	add	r15, rdx
	mov	rdx, r15
	adc	rcx, 0
	add	r13, rsi
	adc	r12, rbx
	mov	rsi, rbx
	adc	rsi, r9
	adc	rbx, r9
	adc	r14, r9
	setb	al
	xor	r9d, r9d
	add	r13, qword ptr [rsp - 120]      # 8-byte Folded Reload
	setb	r9b
	xor	r15d, r15d
	add	r12, r11
	setb	r15b
	xor	r11d, r11d
	add	rsi, rbp
	setb	r11b
	xor	ebp, ebp
	add	rbx, r8
	setb	bpl
	add	r10, qword ptr [rsp - 40]       # 8-byte Folded Reload
	mov	r8, rdx
	adc	r8, 0
	adc	r13, rcx
	mov	qword ptr [rsp - 40], r13       # 8-byte Spill
	adc	r9, r12
	adc	r15, rsi
	adc	r11, rbx
	mov	r13, r11
	adc	rbp, r14
	movzx	eax, al
	adc	rax, 0
	add	byte ptr [rsp + 32], 255        # 1-byte Folded Spill
	movzx	r11d, byte ptr [rsp - 104]      # 1-byte Folded Reload
	adc	r11, rax
	mov	r12, qword ptr [rsp - 32]       # 8-byte Reload
	add	r12, qword ptr [rsp + 104]      # 8-byte Folded Reload
	mov	r10, qword ptr [rsp - 128]      # 8-byte Reload
	adc	r10, qword ptr [rsp + 96]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r14, rcx, rax
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 104], r14      # 8-byte Spill
	mov	rbx, qword ptr [rsp + 40]       # 8-byte Reload
	adc	rbx, qword ptr [rsp + 24]       # 8-byte Folded Reload
	mov	rdx, rax
	mulx	rdx, rsi, rax
	adc	rsi, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	rdx, rcx
	adc	r11, r14
	setb	byte ptr [rsp - 80]             # 1-byte Folded Spill
	add	r8, qword ptr [rsp + 48]        # 8-byte Folded Reload
	mov	rcx, r8
	adc	r12, 0
	setb	byte ptr [rsp - 128]            # 1-byte Folded Spill
	xor	r8d, r8d
	add	r10, r9
	setb	r8b
	xor	r9d, r9d
	add	rbx, r15
	setb	r9b
	xor	eax, eax
	add	rsi, r13
	setb	al
	xor	r14d, r14d
	add	rdx, rbp
	setb	r14b
	mov	r15, rcx
	mov	qword ptr [rsp + 48], rcx       # 8-byte Spill
	mov	r13, rcx
	shl	r13, 32
	add	r12, qword ptr [rsp - 40]       # 8-byte Folded Reload
	movzx	ecx, byte ptr [rsp - 128]       # 1-byte Folded Reload
	adc	r10, rcx
	mov	qword ptr [rsp - 128], r10      # 8-byte Spill
	adc	r8, rbx
	adc	r9, rsi
	adc	rax, rdx
	lea	rdx, [r15 + r13]
	mov	rcx, -1
	mulx	rbx, rcx, rcx
	mov	rsi, -2
	mulx	rsi, r10, rsi
	mov	qword ptr [rsp - 32], r10       # 8-byte Spill
	movabs	r10, -4294967296
	mulx	r15, rbp, r10
	adc	r14, r11
	mov	r10d, 4294967295
	mulx	r13, rdx, r10
	setb	byte ptr [rsp - 88]             # 1-byte Folded Spill
	xor	r11d, r11d
	mov	r10, rbp
	add	r10, r12
	setb	r11b
	add	r10, r13
	adc	r11, 0
	add	r15, qword ptr [rsp - 32]       # 8-byte Folded Reload
	mov	r12, r15
	adc	rsi, rcx
	mov	rbp, rcx
	adc	rbp, rbx
	adc	rcx, rbx
	adc	r14, rbx
	setb	byte ptr [rsp - 32]             # 1-byte Folded Spill
	xor	r15d, r15d
	add	r12, qword ptr [rsp - 128]      # 8-byte Folded Reload
	setb	r15b
	xor	ebx, ebx
	add	rsi, r8
	setb	bl
	xor	r8d, r8d
	add	rbp, r9
	setb	r8b
	xor	r13d, r13d
	add	rcx, rax
	setb	r13b
	add	rdx, qword ptr [rsp + 48]       # 8-byte Folded Reload
	adc	r10, 0
	adc	r12, r11
	mov	qword ptr [rsp - 128], r12      # 8-byte Spill
	adc	r15, rsi
	adc	rbx, rbp
	adc	r8, rcx
	adc	r13, r14
	movzx	eax, byte ptr [rsp - 32]        # 1-byte Folded Reload
	adc	rax, 0
	add	byte ptr [rsp - 88], 255        # 1-byte Folded Spill
	movzx	ecx, byte ptr [rsp - 80]        # 1-byte Folded Reload
	adc	rcx, rax
	mov	r11, qword ptr [rsp + 128]      # 8-byte Reload
	add	r11, qword ptr [rsp + 112]      # 8-byte Folded Reload
	mov	rsi, qword ptr [rsp - 56]       # 8-byte Reload
	adc	rsi, qword ptr [rsp + 120]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp - 112]      # 8-byte Reload
	adc	r14, qword ptr [rsp - 72]       # 8-byte Folded Reload
	mov	r12, qword ptr [rsp - 120]      # 8-byte Reload
	adc	r12, qword ptr [rsp - 64]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rdx, rax, rdx
	adc	rax, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	setb	byte ptr [rsp - 80]             # 1-byte Folded Spill
	add	r10, qword ptr [rsp + 136]      # 8-byte Folded Reload
	adc	r11, 0
	setb	dl
	xor	r9d, r9d
	add	rsi, r15
	mov	r15, rsi
	setb	r9b
	xor	ebp, ebp
	add	r14, rbx
	mov	rcx, r14
	setb	bpl
	xor	r14d, r14d
	add	r12, r8
	setb	r14b
	xor	ebx, ebx
	add	rax, r13
	setb	bl
	mov	rsi, r10
	mov	qword ptr [rsp - 112], r10      # 8-byte Spill
	shl	rsi, 32
	add	r11, qword ptr [rsp - 128]      # 8-byte Folded Reload
	movzx	edx, dl
	adc	r15, rdx
	mov	qword ptr [rsp - 56], r15       # 8-byte Spill
	adc	r9, rcx
	adc	rbp, r12
	adc	r14, rax
	lea	rdx, [r10 + rsi]
	mov	rax, -1
	mulx	rcx, r12, rax
	mov	rax, -2
	mulx	r13, r15, rax
	movabs	rax, -4294967296
	mulx	r8, rsi, rax
	adc	rbx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	eax, 4294967295
	mulx	rdx, r10, rax
	setb	byte ptr [rsp - 104]            # 1-byte Folded Spill
	xor	eax, eax
	add	rsi, r11
	setb	al
	add	rsi, rdx
	adc	rax, 0
	add	r8, r15
	adc	r13, r12
	mov	r15, r12
	adc	r15, rcx
	adc	r12, rcx
	adc	rbx, rcx
	setb	r11b
	xor	edx, edx
	add	r8, qword ptr [rsp - 56]        # 8-byte Folded Reload
	setb	dl
	xor	ecx, ecx
	add	r13, r9
	setb	cl
	xor	r9d, r9d
	add	r15, rbp
	setb	r9b
	mov	qword ptr [rsp - 96], rdi       # 8-byte Spill
	xor	edi, edi
	add	r12, r14
	setb	dil
	add	r10, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	rsi, 0
	adc	r8, rax
	adc	rdx, r13
	adc	rcx, r15
	mov	rbp, rcx
	adc	r9, r12
	movzx	eax, r11b
	adc	rdi, rbx
	adc	rax, 0
	movzx	r13d, byte ptr [rsp - 80]       # 1-byte Folded Reload
	add	byte ptr [rsp - 104], 255       # 1-byte Folded Spill
	adc	r13, rax
	xor	ecx, ecx
	movabs	r11, -4294967295
	add	r11, rsi
	mov	eax, 0
	adc	al, -1
	neg	al
	movzx	eax, al
	movabs	r10, -4294967296
	or	rax, r10
	mov	rbx, r8
	sub	rbx, rax
	mov	eax, 0
	sbb	rax, rax
	neg	al
	movzx	eax, al
	mov	r14, rdx
	sub	r14, rax
	mov	eax, 0
	sbb	rax, rax
	add	r14, 2
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	r15, rbp
	mov	r10, rbp
	sub	r15, rax
	mov	eax, 0
	sbb	rax, rax
	add	r15, 1
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	r12, r9
	sub	r12, rax
	mov	eax, 0
	sbb	rax, rax
	add	r12, 1
	adc	al, -1
	neg	al
	movzx	eax, al
	mov	rbp, rdi
	sub	rbp, rax
	mov	eax, 0
	sbb	rax, rax
	add	rbp, 1
	adc	al, -1
	neg	al
	movzx	eax, al
	cmp	r13, rax
	mov	eax, 0
	sbb	rax, rax
	neg	al
	sbb	rcx, rcx
	mov	rax, rcx
	#APP
	#NO_APP
	and	rsi, rax
	not	rcx
	#APP
	#NO_APP
	and	r11, rcx
	or	r11, rsi
	and	r8, rax
	and	rbx, rcx
	or	rbx, r8
	and	rdx, rax
	and	r14, rcx
	or	r14, rdx
	mov	rdx, r10
	and	rdx, rax
	and	r15, rcx
	or	r15, rdx
	and	r9, rax
	and	r12, rcx
	or	r12, r9
	and	rax, rdi
	and	rcx, rbp
	or	rcx, rax
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mov	qword ptr [rax], r11
	mov	qword ptr [rax + 8], rbx
	mov	qword ptr [rax + 16], r14
	mov	qword ptr [rax + 24], r15
	mov	qword ptr [rax + 32], r12
	mov	qword ptr [rax + 40], rcx
	add	rsp, 144
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
	.size	fiat_p384_square_clang, .Lfunc_end0-fiat_p384_square_clang
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
