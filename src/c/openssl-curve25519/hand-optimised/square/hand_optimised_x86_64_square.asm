.text
.globl	open_ssl_curve25519_hand_optmised_fe51_square
.type	open_ssl_curve25519_hand_optmised_fe51_square,\@function,2
.align	32
open_ssl_curve25519_hand_optmised_fe51_square:
.cfi_startproc
	push	%rbp
.cfi_push	%rbp
	push	%rbx
.cfi_push	%rbx
	push	%r12
.cfi_push	%r12
	push	%r13
.cfi_push	%r13
	push	%r14
.cfi_push	%r14
	push	%r15
.cfi_push	%r15
	lea	-8*5(%rsp),%rsp
.cfi_adjust_cfa_offset	40
.Lfe51_sqr_body:

	mov	8*0(%rsi),%rax		# g[0]
	mov	8*2(%rsi),%r15		# g[2]
	mov	8*4(%rsi),%rbp		# g[4]

	mov	%rdi,8*4(%rsp)		# offload 1st argument
	lea	(%rax,%rax),%r14
	mulq	%rax			# g[0]*g[0]
	mov	%rax,%rbx
	mov	8*1(%rsi),%rax		# g[1]
	mov	%rdx,%rcx
	mulq	%r14			# 2*g[0]*g[1]
	mov	%rax,%r8
	mov	%r15,%rax
	mov	%r15,8*0(%rsp)		# offload g[2]
	mov	%rdx,%r9
	mulq	%r14			# 2*g[0]*g[2]
	mov	%rax,%r10
	mov	8*3(%rsi),%rax
	mov	%rdx,%r11
	imulq	\$19,%rbp,%rdi		# g[4]*19
	mulq	%r14			# 2*g[0]*g[3]
	mov	%rax,%r12
	mov	%rbp,%rax
	mov	%rdx,%r13
	mulq	%r14			# 2*g[0]*g[4]
	mov	%rax,%r14
	mov	%rbp,%rax
	mov	%rdx,%r15

	mulq	%rdi			# g[4]*g[4]*19
	add	%rax,%r12
	mov	8*1(%rsi),%rax		# g[1]
	adc	%rdx,%r13

	mov	8*3(%rsi),%rsi		# g[3]
	lea	(%rax,%rax),%rbp
	mulq	%rax			# g[1]*g[1]
	add	%rax,%r10
	mov	8*0(%rsp),%rax		# g[2]
	adc	%rdx,%r11
	mulq	%rbp			# 2*g[1]*g[2]
	add	%rax,%r12
	mov	%rbp,%rax
	adc	%rdx,%r13
	mulq	%rsi			# 2*g[1]*g[3]
	add	%rax,%r14
	mov	%rbp,%rax
	adc	%rdx,%r15
	imulq	\$19,%rsi,%rbp		# g[3]*19
	mulq	%rdi			# 2*g[1]*g[4]*19
	add	%rax,%rbx
	lea	(%rsi,%rsi),%rax
	adc	%rdx,%rcx

	mulq	%rdi			# 2*g[3]*g[4]*19
	add	%rax,%r10
	mov	%rsi,%rax
	adc	%rdx,%r11
	mulq	%rbp			# g[3]*g[3]*19
	add	%rax,%r8
	mov	8*0(%rsp),%rax		# g[2]
	adc	%rdx,%r9

	lea	(%rax,%rax),%rsi
	mulq	%rax			# g[2]*g[2]
	add	%rax,%r14
	mov	%rbp,%rax
	adc	%rdx,%r15
	mulq	%rsi			# 2*g[2]*g[3]*19
	add	%rax,%rbx
	mov	%rsi,%rax
	adc	%rdx,%rcx
	mulq	%rdi			# 2*g[2]*g[4]*19
	add	%rax,%r8
	adc	%rdx,%r9

	mov	8*4(%rsp),%rdi		# restore 1st argument
	jmp	.Lreduce51

.align	32
.Lreduce51:
	mov	\$0x7ffffffffffff,%rbp

	mov	%r10,%rdx
	shr	\$51,%r10
	shl	\$13,%r11
	and	%rbp,%rdx		# %rdx = g2 = h2 & mask
	or	%r10,%r11		# h2>>51
	add	%r11,%r12
	adc	\$0,%r13		# h3 += h2>>51

	mov	%rbx,%rax
	shr	\$51,%rbx
	shl	\$13,%rcx
	and	%rbp,%rax		# %rax = g0 = h0 & mask
	or	%rbx,%rcx		# h0>>51
	add	%rcx,%r8		# h1 += h0>>51
	adc	\$0,%r9

	mov	%r12,%rbx
	shr	\$51,%r12
	shl	\$13,%r13
	and	%rbp,%rbx		# %rbx = g3 = h3 & mask
	or	%r12,%r13		# h3>>51
	add	%r13,%r14		# h4 += h3>>51
	adc	\$0,%r15

	mov	%r8,%rcx
	shr	\$51,%r8
	shl	\$13,%r9
	and	%rbp,%rcx		# %rcx = g1 = h1 & mask
	or	%r8,%r9
	add	%r9,%rdx		# g2 += h1>>51

	mov	%r14,%r10
	shr	\$51,%r14
	shl	\$13,%r15
	and	%rbp,%r10		# %r10 = g4 = h0 & mask
	or	%r14,%r15		# h0>>51

	lea	(%r15,%r15,8),%r14
	lea	(%r15,%r14,2),%r15
	add	%r15,%rax		# g0 += (h0>>51)*19

	mov	%rdx,%r8
	and	%rbp,%rdx		# g2 &= mask
	shr	\$51,%r8
	add	%r8,%rbx		# g3 += g2>>51

	mov	%rax,%r9
	and	%rbp,%rax		# g0 &= mask
	shr	\$51,%r9
	add	%r9,%rcx		# g1 += g0>>51

	mov	%rax,8*0(%rdi)		# save the result
	mov	%rcx,8*1(%rdi)
	mov	%rdx,8*2(%rdi)
	mov	%rbx,8*3(%rdi)
	mov	%r10,8*4(%rdi)

	mov	8*5(%rsp),%r15
.cfi_restore	%r15
	mov	8*6(%rsp),%r14
.cfi_restore	%r14
	mov	8*7(%rsp),%r13
.cfi_restore	%r13
	mov	8*8(%rsp),%r12
.cfi_restore	%r12
	mov	8*9(%rsp),%rbx
.cfi_restore	%rbx
	mov	8*10(%rsp),%rbp
.cfi_restore	%rbp
	lea	8*11(%rsp),%rsp
.cfi_adjust_cfa_offset	88
.Lfe51_sqr_epilogue:
	ret