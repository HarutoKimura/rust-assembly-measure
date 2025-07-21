.global _start
.global secret
.global output

.section .bss
.align 8
secret:  .space 32   # 4 * 8 bytes
output:  .space 32   # 4 * 8 bytes

.section .text
_start:
    # Set up stack
    mov $0x7ffffffff000, %rsp
    
    # Call function: output=rdi, secret=rsi, secret=rdx
    lea output(%rip), %rdi
    lea secret(%rip), %rsi
    lea secret(%rip), %rdx
    
    call rust_fiat_curve25519_carry_mul_CryptOpt
    
    # Exit cleanly - just stop execution
    # Don't call exit or use syscalls
    .byte 0xf4  # hlt instruction
