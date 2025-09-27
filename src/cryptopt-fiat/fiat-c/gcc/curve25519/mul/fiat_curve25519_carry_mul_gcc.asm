	.file	"curve25519_64_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_curve25519_carry_mul_gcc
	.type	fiat_curve25519_carry_mul_gcc, @function
fiat_curve25519_carry_mul_gcc:
.LFB15:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	r8, rdx
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -48[rsp], rdi
	mov	rdi, rsi
	mov	rbx, QWORD PTR 32[rdx]
	mov	r12, QWORD PTR 24[rdx]
	mov	rdx, QWORD PTR 16[rdx]
	mov	r13, QWORD PTR 32[rsi]
	lea	rax, [rbx+rbx*8]
	mov	r15, QWORD PTR 24[rdi]
	mov	r11, QWORD PTR [rdi]
	mov	QWORD PTR -40[rsp], rbx
	lea	rbx, [rbx+rax*2]
	lea	rax, [r12+r12*8]
	mov	r14, QWORD PTR 8[rdi]
	mov	QWORD PTR -32[rsp], rdx
	lea	rcx, [r12+rax*2]
	lea	rax, [rdx+rdx*8]
	mov	QWORD PTR -24[rsp], r11
	lea	rsi, [rdx+rax*2]
	mov	rax, QWORD PTR 8[r8]
	mov	rdx, QWORD PTR 16[rdi]
	mov	QWORD PTR -16[rsp], r14
	mov	r14, QWORD PTR [r8]
	lea	rdi, [rax+rax*8]
	mov	QWORD PTR -8[rsp], rdx
	lea	r10, [rax+rdi*2]
	mov	rdx, r10
	mulx	r11, r10, r13
	mov	rdx, rsi
	mulx	r9, r8, r15
	mov	rdx, QWORD PTR -8[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rcx
	mov	rdx, QWORD PTR -16[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR -24[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r14
	mov	rdx, rsi
	mulx	rdi, rsi, r13
	mov	rdx, rcx
	add	r8, r10
	adc	r9, r11
	mov	r10, r8
	mov	r11, r9
	mulx	r9, r8, r15
	mov	rdx, QWORD PTR -8[rsp]
	mov	QWORD PTR -64[rsp], r10
	mov	QWORD PTR -56[rsp], r11
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR -16[rsp]
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, r14
	mov	rdx, QWORD PTR -24[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, rax
	mov	rdx, rcx
	add	rsi, r8
	adc	rdi, r9
	shrd	r10, r11, 51
	xor	r9d, r9d
	add	rsi, r10
	adc	rdi, r9
	mov	r10, rsi
	mov	r11, rdi
	mulx	rdi, rsi, r13
	mov	rdx, rbx
	mulx	r9, r8, r15
	mov	rdx, QWORD PTR -8[rsp]
	mov	QWORD PTR -80[rsp], r10
	mov	QWORD PTR -72[rsp], r11
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, r14
	mov	rdx, QWORD PTR -16[rsp]
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, rax
	mov	rdx, QWORD PTR -32[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, QWORD PTR -24[rsp]
	mov	rdx, rbx
	add	rsi, r8
	adc	rdi, r9
	mov	r9, r10
	shrd	r9, r11, 51
	mov	r10, r9
	xor	r9d, r9d
	add	rsi, r10
	mov	r10, rsi
	mulx	rsi, rbx, r13
	mov	rdx, r15
	adc	rdi, r9
	mulx	r9, r8, r14
	mov	rdx, QWORD PTR -8[rsp]
	mov	r11, rdi
	add	r8, rbx
	mulx	rbx, rcx, rax
	mov	rdx, QWORD PTR -32[rsp]
	adc	r9, rsi
	mulx	rdi, rsi, QWORD PTR -16[rsp]
	mov	rdx, QWORD PTR -24[rsp]
	add	rcx, r8
	mov	r8, r10
	adc	rbx, r9
	add	rsi, rcx
	adc	rdi, rbx
	mulx	rbx, rcx, r12
	mov	rdx, r13
	mulx	r14, r13, r14
	mov	rdx, r15
	add	rsi, rcx
	adc	rdi, rbx
	shrd	r8, r11, 51
	xor	ebx, ebx
	mov	rcx, r8
	add	rcx, rsi
	adc	rbx, rdi
	mulx	rdi, rsi, rax
	mov	rdx, QWORD PTR -32[rsp]
	mulx	rdx, rax, QWORD PTR -8[rsp]
	add	r13, rsi
	mov	rsi, rcx
	adc	r14, rdi
	movabs	rdi, 2251799813685247
	add	r13, rax
	adc	r14, rdx
	mov	rdx, QWORD PTR -16[rsp]
	mulx	rdx, rax, r12
	add	r13, rax
	adc	r14, rdx
	mov	rdx, QWORD PTR -24[rsp]
	mulx	rdx, rax, QWORD PTR -40[rsp]
	add	r13, rax
	adc	r14, rdx
	shrd	rsi, rbx, 51
	xor	edx, edx
	mov	rbx, QWORD PTR -48[rsp]
	mov	rax, rsi
	mov	rsi, QWORD PTR -64[rsp]
	add	rax, r13
	adc	rdx, r14
	mov	r14, rax
	and	rsi, rdi
	and	r10, rdi
	shrd	rax, rdx, 51
	and	rcx, rdi
	lea	rdx, [rax+rax*8]
	lea	rdx, [rax+rdx*2]
	mov	rax, r14
	add	rdx, rsi
	mov	rsi, QWORD PTR -80[rsp]
	and	rax, rdi
	mov	r8, rdx
	and	rdx, rdi
	mov	QWORD PTR 32[rbx], rax
	shr	r8, 51
	and	rsi, rdi
	vmovq	xmm3, rdx
	add	rsi, r8
	mov	r8, rsi
	shr	rsi, 51
	add	r10, rsi
	and	r8, rdi
	vmovq	xmm2, r10
	vpinsrq	xmm0, xmm3, r8, 1
	vpinsrq	xmm1, xmm2, rcx, 1
	vinserti128	ymm0, ymm0, xmm1, 0x1
	vmovdqu	YMMWORD PTR [rbx], ymm0
	vzeroupper
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	fiat_curve25519_carry_mul_gcc, .-fiat_curve25519_carry_mul_gcc
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
