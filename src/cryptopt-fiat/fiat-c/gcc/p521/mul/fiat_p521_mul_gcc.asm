	.file	"p521_mul_wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	fiat_p521_mul_gcc
	.type	fiat_p521_mul_gcc, @function
fiat_p521_mul_gcc:
.LFB16:
	.cfi_startproc
	endbr64
	xor	eax, eax
	jmp	fiat_p521_mul@PLT
	.cfi_endproc
.LFE16:
	.size	fiat_p521_mul_gcc, .-fiat_p521_mul_gcc
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
