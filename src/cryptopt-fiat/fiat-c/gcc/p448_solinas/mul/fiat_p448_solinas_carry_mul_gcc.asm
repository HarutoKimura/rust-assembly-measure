	.file	"p448_solinas_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p448_solinas_carry_mul_gcc
	.type	fiat_p448_solinas_carry_mul_gcc, @function
fiat_p448_solinas_carry_mul_gcc:
.LFB14:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	and	rsp, -32
	sub	rsp, 328
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	QWORD PTR -96[rsp], rdi
	mov	rdi, rdx
	mov	rax, QWORD PTR 56[rsi]
	mov	rdx, QWORD PTR 56[rdx]
	mov	r14, QWORD PTR 24[rdi]
	mov	rcx, QWORD PTR 32[rdi]
	mulx	r12, r11, rax
	mov	QWORD PTR 280[rsp], rdx
	mov	rdx, rax
	mov	r8, QWORD PTR 40[rdi]
	mulx	r10, r9, r14
	mov	r13, QWORD PTR 40[rsi]
	mov	rbx, QWORD PTR 16[rdi]
	mov	QWORD PTR 264[rsp], r8
	mov	r15, QWORD PTR 48[rdi]
	mov	QWORD PTR 312[rsp], rbx
	mov	QWORD PTR -64[rsp], r12
	mov	r12, QWORD PTR 48[rsi]
	mov	QWORD PTR 224[rsp], r10
	mov	r10, QWORD PTR 8[rdi]
	mov	rdx, r12
	mov	QWORD PTR -72[rsp], r11
	mov	QWORD PTR 304[rsp], r10
	mulx	r11, r10, rcx
	mov	rdx, r8
	mov	QWORD PTR 216[rsp], r9
	mulx	r9, r8, r13
	mov	rdx, r13
	mov	QWORD PTR 200[rsp], r10
	mov	QWORD PTR 208[rsp], r11
	mulx	r11, r10, rcx
	mov	QWORD PTR 184[rsp], r8
	mov	QWORD PTR 192[rsp], r9
	mulx	r9, r8, r14
	mov	rdx, r15
	mov	QWORD PTR 168[rsp], r10
	mov	rbx, QWORD PTR 32[rsi]
	mov	QWORD PTR 248[rsp], r15
	mov	r15, QWORD PTR 24[rsi]
	mov	QWORD PTR 160[rsp], r9
	mulx	r10, r9, rbx
	mov	rdx, QWORD PTR 264[rsp]
	mov	QWORD PTR 152[rsp], r8
	mov	QWORD PTR 176[rsp], r11
	mov	QWORD PTR 136[rsp], r9
	mov	QWORD PTR 144[rsp], r10
	mulx	r10, r9, rbx
	mov	rdx, rcx
	mov	QWORD PTR 120[rsp], r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR 280[rsp]
	mov	QWORD PTR 128[rsp], r10
	mulx	r11, r10, r15
	mov	rdx, r15
	mov	r15, QWORD PTR 248[rsp]
	mov	QWORD PTR 232[rsp], rdx
	mov	QWORD PTR 112[rsp], r9
	mov	QWORD PTR 104[rsp], r8
	mov	QWORD PTR 88[rsp], r10
	mulx	r10, r9, r15
	mov	QWORD PTR 96[rsp], r11
	mov	QWORD PTR 72[rsp], r9
	mulx	r9, r8, QWORD PTR 264[rsp]
	mov	rdx, QWORD PTR 16[rsi]
	mov	QWORD PTR 80[rsp], r10
	mov	QWORD PTR 240[rsp], rdx
	mov	QWORD PTR 56[rsp], r8
	mov	r8, QWORD PTR 280[rsp]
	mov	QWORD PTR 64[rsp], r9
	mulx	r11, r10, r8
	mov	QWORD PTR 40[rsp], r10
	mulx	r10, r9, r15
	mov	rdx, r8
	mov	QWORD PTR 48[rsp], r11
	mov	r11, r15
	mov	r15, QWORD PTR 8[rsi]
	mov	QWORD PTR 24[rsp], r9
	mulx	r9, r8, r15
	mov	rdx, rcx
	mov	QWORD PTR 32[rsp], r10
	mov	QWORD PTR 256[rsp], r15
	mov	rsi, QWORD PTR [rsi]
	mov	r15, QWORD PTR [rdi]
	mov	QWORD PTR 296[rsp], rsi
	mulx	rdi, rsi, rax
	mov	rdx, QWORD PTR 264[rsp]
	mov	QWORD PTR 8[rsp], r8
	mov	QWORD PTR 16[rsp], r9
	mulx	r9, r8, r12
	mov	rdx, r11
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, r13
	mov	rdx, QWORD PTR 280[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, rbx
	mov	rdx, QWORD PTR 232[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, r15
	mov	rdx, QWORD PTR 240[rsp]
	mulx	r11, r10, QWORD PTR 304[rsp]
	mov	rdx, QWORD PTR 256[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, QWORD PTR 312[rsp]
	mov	rdx, QWORD PTR 296[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, r14
	mov	rdx, rax
	add	r8, r10
	adc	r9, r11
	add	r8, rsi
	adc	r9, rdi
	mov	QWORD PTR -8[rsp], r8
	mov	QWORD PTR [rsp], r9
	mulx	r9, r8, r15
	mov	rdx, QWORD PTR 304[rsp]
	mulx	r11, r10, r12
	mov	rdx, QWORD PTR 312[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, r13
	mov	rdx, r14
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, rbx
	mov	rdx, QWORD PTR 232[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, rcx
	mov	rdx, QWORD PTR 240[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, QWORD PTR 264[rsp]
	mov	rdx, QWORD PTR 256[rsp]
	add	r10, r8
	adc	r11, r9
	mulx	r9, r8, QWORD PTR 248[rsp]
	mov	rdx, QWORD PTR 280[rsp]
	add	r8, r10
	adc	r9, r11
	mulx	r11, r10, QWORD PTR 296[rsp]
	mov	rdx, QWORD PTR 248[rsp]
	add	r8, r10
	adc	r9, r11
	mov	r10, r9
	mov	r9, r8
	add	r9, rsi
	adc	r10, rdi
	mov	QWORD PTR -24[rsp], r9
	mulx	r9, r8, rax
	mov	QWORD PTR -16[rsp], r10
	mov	rdx, QWORD PTR 280[rsp]
	mulx	rdi, rsi, r12
	mov	rdx, QWORD PTR 312[rsp]
	mov	r10, r8
	mov	r11, r9
	mulx	r9, r8, rax
	mov	rdx, r14
	add	r10, rsi
	adc	r11, rdi
	mulx	rdi, rsi, r12
	mov	rdx, QWORD PTR 264[rsp]
	mov	QWORD PTR -40[rsp], r10
	mov	QWORD PTR -32[rsp], r11
	add	r8, rsi
	adc	r9, rdi
	mov	QWORD PTR -56[rsp], r8
	mov	QWORD PTR -48[rsp], r9
	mulx	r9, r8, rax
	mov	rdx, QWORD PTR 248[rsp]
	mulx	rdi, rsi, r12
	mov	rdx, QWORD PTR 280[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, r13
	mov	rdx, QWORD PTR 304[rsp]
	add	rsi, r8
	adc	rdi, r9
	mulx	r9, r8, rax
	mov	rdx, QWORD PTR 312[rsp]
	mov	rax, QWORD PTR -24[rsp]
	mov	QWORD PTR -88[rsp], rsi
	mulx	r11, r10, r12
	mov	rdx, QWORD PTR -16[rsp]
	mov	QWORD PTR -80[rsp], rdi
	add	r10, r8
	adc	r11, r9
	shrd	rax, rdx, 56
	mov	rdx, rdi
	xor	r9d, r9d
	mov	r8, rax
	mov	rax, rsi
	shld	rdx, rsi, 1
	add	rax, rsi
	add	rax, r10
	adc	rdx, r11
	add	rax, QWORD PTR 152[rsp]
	adc	rdx, QWORD PTR 160[rsp]
	add	rax, QWORD PTR 104[rsp]
	adc	rdx, QWORD PTR 112[rsp]
	add	rax, QWORD PTR 56[rsp]
	adc	rdx, QWORD PTR 64[rsp]
	add	rax, QWORD PTR 24[rsp]
	adc	rdx, QWORD PTR 32[rsp]
	add	rax, QWORD PTR 8[rsp]
	adc	rdx, QWORD PTR 16[rsp]
	mov	QWORD PTR 288[rsp], rdx
	mov	rdx, rbx
	mulx	rdi, rsi, r15
	mov	QWORD PTR 280[rsp], rax
	add	rsi, QWORD PTR 280[rsp]
	mov	rdx, QWORD PTR 304[rsp]
	adc	rdi, QWORD PTR 288[rsp]
	mulx	rdx, rax, QWORD PTR 232[rsp]
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 280[rsp], rax
	mov	QWORD PTR 288[rsp], rdx
	mov	rdx, QWORD PTR 312[rsp]
	mulx	rdi, rsi, QWORD PTR 240[rsp]
	mov	rdx, QWORD PTR 256[rsp]
	add	rsi, QWORD PTR 280[rsp]
	adc	rdi, QWORD PTR 288[rsp]
	mulx	rdx, rax, r14
	add	rax, rsi
	adc	rdx, rdi
	mov	QWORD PTR 280[rsp], rax
	mov	rax, QWORD PTR 280[rsp]
	mov	QWORD PTR 288[rsp], rdx
	mov	rdx, QWORD PTR 296[rsp]
	mulx	rdi, rsi, rcx
	mov	rdx, QWORD PTR 288[rsp]
	add	rax, rsi
	mov	rsi, QWORD PTR -8[rsp]
	adc	rdx, rdi
	mov	rdi, QWORD PTR [rsp]
	shrd	rsi, rdi, 56
	xor	edi, edi
	mov	QWORD PTR 280[rsp], rsi
	mov	rsi, QWORD PTR 280[rsp]
	add	rax, rsi
	mov	rsi, QWORD PTR 152[rsp]
	adc	rdx, rdi
	add	rax, r8
	mov	rdi, QWORD PTR 160[rsp]
	adc	rdx, r9
	add	rsi, r10
	mov	QWORD PTR 280[rsp], rax
	adc	rdi, r11
	mov	QWORD PTR 288[rsp], rdx
	mov	rax, rsi
	add	rax, QWORD PTR 104[rsp]
	mov	rdx, rdi
	adc	rdx, QWORD PTR 112[rsp]
	add	rax, QWORD PTR 56[rsp]
	mov	r10, QWORD PTR 8[rsp]
	adc	rdx, QWORD PTR 64[rsp]
	mov	r11, QWORD PTR 16[rsp]
	add	rax, QWORD PTR 24[rsp]
	adc	rdx, QWORD PTR 32[rsp]
	add	r10, rax
	adc	r11, rdx
	mov	rdx, QWORD PTR 296[rsp]
	mov	rax, r10
	mulx	rdi, rsi, r15
	mov	rdx, r11
	add	rax, rsi
	adc	rdx, rdi
	add	rax, QWORD PTR -88[rsp]
	adc	rdx, QWORD PTR -80[rsp]
	mov	rsi, rax
	mov	rdi, rdx
	mov	rax, QWORD PTR -40[rsp]
	mov	rdx, QWORD PTR -32[rsp]
	add	rsi, r8
	adc	rdi, r9
	shld	rdx, rax, 1
	add	rax, rax
	add	rax, QWORD PTR -56[rsp]
	adc	rdx, QWORD PTR -48[rsp]
	add	rax, QWORD PTR 168[rsp]
	mov	QWORD PTR 152[rsp], rsi
	adc	rdx, QWORD PTR 176[rsp]
	add	rax, QWORD PTR 120[rsp]
	mov	QWORD PTR 160[rsp], rdi
	adc	rdx, QWORD PTR 128[rsp]
	add	rax, QWORD PTR 72[rsp]
	adc	rdx, QWORD PTR 80[rsp]
	add	rax, QWORD PTR 40[rsp]
	adc	rdx, QWORD PTR 48[rsp]
	mov	r8, rax
	mov	r9, rdx
	mov	rdx, r13
	mulx	rdi, rsi, r15
	mov	rdx, QWORD PTR 304[rsp]
	add	r8, rsi
	adc	r9, rdi
	mulx	rdi, rsi, rbx
	mov	rdx, QWORD PTR 312[rsp]
	mulx	rdx, rax, QWORD PTR 232[rsp]
	add	rsi, r8
	mov	r8, QWORD PTR 280[rsp]
	adc	rdi, r9
	add	rax, rsi
	adc	rdx, rdi
	mov	r9, rdx
	mov	rdx, QWORD PTR 240[rsp]
	mulx	rdi, rsi, r14
	mov	rdx, QWORD PTR 256[rsp]
	add	rsi, rax
	mulx	rdx, rax, rcx
	adc	rdi, r9
	add	rax, rsi
	adc	rdx, rdi
	mov	r9, rdx
	mov	rdx, QWORD PTR 296[rsp]
	mulx	rdi, rsi, QWORD PTR 264[rsp]
	mov	rdx, r9
	mov	r9, QWORD PTR 288[rsp]
	add	rax, rsi
	adc	rdx, rdi
	shrd	r8, r9, 56
	xor	r11d, r11d
	mov	r10, r8
	add	r10, rax
	adc	r11, rdx
	mov	rdx, QWORD PTR 256[rsp]
	mov	QWORD PTR 104[rsp], r10
	mov	QWORD PTR 112[rsp], r11
	mov	r10, QWORD PTR 168[rsp]
	mulx	rdx, rax, r15
	add	r10, QWORD PTR -56[rsp]
	mov	r11, QWORD PTR 176[rsp]
	adc	r11, QWORD PTR -48[rsp]
	mov	rsi, r10
	add	rsi, QWORD PTR 120[rsp]
	mov	rdi, r11
	adc	rdi, QWORD PTR 128[rsp]
	add	rsi, QWORD PTR 72[rsp]
	adc	rdi, QWORD PTR 80[rsp]
	add	rsi, QWORD PTR 40[rsp]
	adc	rdi, QWORD PTR 48[rsp]
	add	rax, rsi
	adc	rdx, rdi
	mov	r10, rdx
	mov	rdx, QWORD PTR 296[rsp]
	mulx	rdi, rsi, QWORD PTR 304[rsp]
	mov	rdx, r10
	add	rax, rsi
	adc	rdx, rdi
	add	rax, QWORD PTR -40[rsp]
	adc	rdx, QWORD PTR -32[rsp]
	xor	edi, edi
	mov	r10, QWORD PTR 152[rsp]
	mov	r11, QWORD PTR 160[rsp]
	shrd	r10, r11, 56
	add	rax, r10
	adc	rdx, rdi
	mov	r8, rax
	mov	rax, QWORD PTR 216[rsp]
	add	rax, QWORD PTR 200[rsp]
	mov	r9, rdx
	mov	rdx, QWORD PTR 224[rsp]
	adc	rdx, QWORD PTR 208[rsp]
	add	rax, QWORD PTR 184[rsp]
	adc	rdx, QWORD PTR 192[rsp]
	add	rax, QWORD PTR 136[rsp]
	adc	rdx, QWORD PTR 144[rsp]
	add	rax, QWORD PTR 88[rsp]
	adc	rdx, QWORD PTR 96[rsp]
	mov	r11, rdx
	mov	rdx, r12
	mov	r12, QWORD PTR -64[rsp]
	mulx	rdi, rsi, r15
	mov	rdx, QWORD PTR 304[rsp]
	add	rsi, rax
	mulx	rdx, rax, r13
	adc	rdi, r11
	mov	r11, QWORD PTR -72[rsp]
	add	rax, rsi
	adc	rdx, rdi
	mov	r13, rdx
	mov	rdx, QWORD PTR 312[rsp]
	mulx	rsi, rbx, rbx
	mov	rdx, QWORD PTR 232[rsp]
	add	rbx, rax
	mulx	rdx, rax, r14
	adc	rsi, r13
	mov	r13, QWORD PTR 104[rsp]
	add	rax, rbx
	adc	rdx, rsi
	mov	r14, rdx
	mov	rdx, QWORD PTR 240[rsp]
	mulx	rbx, rcx, rcx
	mov	rdx, QWORD PTR 256[rsp]
	add	rcx, rax
	mulx	rdx, rax, QWORD PTR 264[rsp]
	adc	rbx, r14
	add	rax, rcx
	adc	rdx, rbx
	mov	r14, rdx
	mov	rdx, QWORD PTR 296[rsp]
	mulx	rbx, rcx, QWORD PTR 248[rsp]
	mov	rdx, r12
	add	rcx, rax
	mov	rax, r11
	adc	rbx, r14
	mov	r14, QWORD PTR 112[rsp]
	add	rax, r11
	shld	rdx, r11, 1
	add	rcx, rax
	adc	rbx, rdx
	shrd	r13, r14, 56
	xor	edx, edx
	movabs	r14, 72057594037927935
	mov	rax, r13
	add	rax, rcx
	mov	rcx, r11
	adc	rdx, rbx
	mov	QWORD PTR 264[rsp], rax
	mov	rbx, r12
	mov	r12, r8
	mov	QWORD PTR 272[rsp], rdx
	add	rcx, QWORD PTR 216[rsp]
	mov	rdx, QWORD PTR 240[rsp]
	adc	rbx, QWORD PTR 224[rsp]
	add	rcx, QWORD PTR 200[rsp]
	adc	rbx, QWORD PTR 208[rsp]
	mulx	rdi, rsi, r15
	add	rcx, QWORD PTR 184[rsp]
	mov	rdx, QWORD PTR 256[rsp]
	adc	rbx, QWORD PTR 192[rsp]
	add	rcx, QWORD PTR 136[rsp]
	adc	rbx, QWORD PTR 144[rsp]
	add	rcx, QWORD PTR 88[rsp]
	adc	rbx, QWORD PTR 96[rsp]
	mov	r11, QWORD PTR -24[rsp]
	add	rsi, rcx
	mov	rax, QWORD PTR 264[rsp]
	adc	rdi, rbx
	mulx	rbx, rcx, QWORD PTR 304[rsp]
	mov	rdx, QWORD PTR 296[rsp]
	add	rcx, rsi
	adc	rbx, rdi
	mulx	rdi, rsi, QWORD PTR 312[rsp]
	mov	rdx, QWORD PTR 272[rsp]
	add	rcx, rsi
	adc	rbx, rdi
	shrd	r12, r9, 56
	xor	edi, edi
	add	rcx, r12
	adc	rbx, rdi
	shrd	rax, rdx, 56
	and	r11, r14
	mov	rdx, QWORD PTR -8[rsp]
	mov	QWORD PTR 312[rsp], rcx
	add	r11, rax
	shrd	rcx, rbx, 56
	mov	rdi, QWORD PTR 152[rsp]
	mov	QWORD PTR 320[rsp], rbx
	and	rdx, r14
	mov	rsi, rcx
	mov	rbx, r11
	add	rsi, rdx
	shr	rbx, 56
	and	rdi, r14
	and	r8, r14
	mov	rdx, QWORD PTR 280[rsp]
	add	rdi, rbx
	mov	r12, rsi
	and	rsi, r14
	mov	rcx, QWORD PTR 312[rsp]
	shr	r12, 56
	mov	rax, rdi
	shr	rdi, 56
	and	rdx, r14
	and	rax, r14
	add	r8, rdi
	and	r11, r14
	add	rdx, r12
	and	rcx, r14
	vmovq	xmm1, rax
	add	rdx, rbx
	vmovq	xmm2, rcx
	mov	rbx, QWORD PTR -96[rsp]
	vpinsrq	xmm1, xmm1, r8, 1
	vpinsrq	xmm0, xmm2, rsi, 1
	mov	rax, rdx
	shr	rdx, 56
	vinserti128	ymm0, ymm1, xmm0, 0x1
	and	rax, r14
	vmovdqu	YMMWORD PTR [rbx], ymm0
	vmovq	xmm1, rax
	mov	r10, QWORD PTR 104[rsp]
	mov	rax, QWORD PTR 264[rsp]
	and	r10, r14
	and	rax, r14
	add	r10, rdx
	vmovq	xmm3, rax
	vpinsrq	xmm0, xmm3, r11, 1
	vpinsrq	xmm1, xmm1, r10, 1
	vinserti128	ymm0, ymm1, xmm0, 0x1
	vmovdqu	YMMWORD PTR 32[rbx], ymm0
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
.LFE14:
	.size	fiat_p448_solinas_carry_mul_gcc, .-fiat_p448_solinas_carry_mul_gcc
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
