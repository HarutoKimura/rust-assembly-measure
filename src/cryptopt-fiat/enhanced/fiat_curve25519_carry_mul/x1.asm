SECTION .text
GLOBAL fiat_curve25519_carry_mul_enhanced
; -----------------------------------------------------------------------------
; fiat_curve25519_carry_mul(out=rdi, a=rsi[5*51], b=rdx[5*51])
; Scalar 5x51-bit multiply, OpenSSL-style schedule with improvements:
; - All 19× computed via LEA (no IMUL on hot path or elsewhere)
; - No SHRD/SHLD in reduction; uses SHR/SHL/OR
; - Full unroll, tight Comba ordering
; -----------------------------------------------------------------------------
; Inputs:  rdi = out[5], rsi = a[5], rdx = b[5]
; Clobbers: rax, rbx, rcx, r8..r15, rbp, rdx (as scratch)
; -----------------------------------------------------------------------------
fiat_curve25519_carry_mul_enhanced:
    ; help the front-end a bit on SKL
    ; (NASM/YASM: ALIGN 32; GAS: .p2align 5,0x90)
    ALIGN 32

    push    rbp
    push    rbx
    push    r12
    push    r13
    push    r14
    push    r15
    sub     rsp, 8*5

    mov     rax,  [rsi+8*0]      ; f0
    mov     r11,  [rdx+8*0]      ; g0..g4
    mov     r12,  [rdx+8*1]
    mov     r13,  [rdx+8*2]
    mov     rbp,  [rdx+8*3]
    mov     r14,  [rdx+8*4]

    mov     [rsp+8*4], rdi       ; spill out
    mov     rdi, rax
    mul     r11                  ; f0*g0
    mov     [rsp+8*0], r11       ; spill g0
    mov     rbx, rax             ; h0 in rbx:rcx
    mov     rax, rdi
    mov     rcx, rdx
    mul     r12                  ; f0*g1
    mov     [rsp+8*1], r12       ; spill g1
    mov     r8,  rax             ; h1 in r8:r9
    mov     rax, rdi
    lea     r15, [r14 + 8*r14]   ; 9*g4
    mov     r9,  rdx
    mul     r13                  ; f0*g2
    mov     [rsp+8*2], r13       ; spill g2
    mov     r10, rax             ; h2 in r10:r11
    mov     rax, rdi
    lea     rdi, [r14 + 2*r15]   ; g4*19 via LEA
    mov     r11, rdx
    mul     rbp                  ; f0*g3
    mov     r12, rax             ; h3 in r12:r13
    mov     rax, [rsi+8*0]       ; f0
    mov     r13, rdx
    mul     r14                  ; f0*g4
    mov     r14, rax             ; h4 in r14:r15
    mov     rax, [rsi+8*1]       ; f1
    mov     r15, rdx

    mul     rdi                  ; f1*g4*19
    add     rbx, rax
    mov     rax, [rsi+8*2]       ; f2
    adc     rcx, rdx
    mul     rdi                  ; f2*g4*19
    add     r8,  rax
    mov     rax, [rsi+8*3]       ; f3
    adc     r9,  rdx
    mul     rdi                  ; f3*g4*19
    add     r10, rax
    mov     rax, [rsi+8*4]       ; f4
    adc     r11, rdx
    mul     rdi                  ; f4*g4*19

    ; rdi = g3*19  (LEA, no IMUL)
    lea     rdi, [rbp + 8*rbp]   ; 9*g3
    lea     rdi, [rdi + 2*rbp]   ; 19*g3

    add     r12, rax
    mov     rax, [rsi+8*1]       ; f1
    adc     r13, rdx
    mul     rbp                  ; f1*g3
    mov     rbp, [rsp+8*2]       ; g2
    add     r14, rax
    mov     rax, [rsi+8*2]       ; f2
    adc     r15, rdx

    mul     rdi                  ; f2*g3*19
    add     rbx, rax
    mov     rax, [rsi+8*3]       ; f3
    adc     rcx, rdx
    mul     rdi                  ; f3*g3*19
    add     r8,  rax
    mov     rax, [rsi+8*4]       ; f4
    adc     r9,  rdx
    mul     rdi                  ; f4*g3*19

    ; rdi = g2*19  (LEA, no IMUL)
    lea     rdi, [rbp + 8*rbp]   ; 9*g2
    lea     rdi, [rdi + 2*rbp]   ; 19*g2

    add     r10, rax
    mov     rax, [rsi+8*1]       ; f1
    adc     r11, rdx
    mul     rbp                  ; f1*g2
    add     r12, rax
    mov     rax, [rsi+8*2]       ; f2
    adc     r13, rdx
    mul     rbp                  ; f2*g2
    mov     rbp, [rsp+8*1]       ; g1
    add     r14, rax
    mov     rax, [rsi+8*3]       ; f3
    adc     r15, rdx

    mul     rdi                  ; f3*g2*19
    add     rbx, rax
    mov     rax, [rsi+8*4]       ; f4
    adc     rcx, rdx
    mul     rdi                  ; f4*g2*19
    add     r8,  rax
    mov     rax, [rsi+8*1]       ; f1
    adc     r9,  rdx
    mul     rbp                  ; f1*g1

    ; rdi = g1*19  (LEA, no IMUL)
    lea     rdi, [rbp + 8*rbp]   ; 9*g1
    lea     rdi, [rdi + 2*rbp]   ; 19*g1

    add     r10, rax
    mov     rax, [rsi+8*2]       ; f2
    adc     r11, rdx
    mul     rbp                  ; f2*g1
    add     r12, rax
    mov     rax, [rsi+8*3]       ; f3
    adc     r13, rdx
    mul     rbp                  ; f3*g1
    mov     rbp, [rsp+8*0]       ; g0
    add     r14, rax
    mov     rax, [rsi+8*4]       ; f4
    adc     r15, rdx

    mul     rdi                  ; f4*g1*19
    add     rbx, rax
    mov     rax, [rsi+8*1]       ; f1
    adc     rcx, rdx
    mul     rbp                  ; f1*g0
    add     r8,  rax
    mov     rax, [rsi+8*2]       ; f2
    adc     r9,  rdx
    mul     rbp                  ; f2*g0
    add     r10, rax
    mov     rax, [rsi+8*3]       ; f3
    adc     r11, rdx
    mul     rbp                  ; f3*g0
    add     r12, rax
    mov     rax, [rsi+8*4]       ; f4
    adc     r13, rdx
    mul     rbp                  ; f4*g0
    add     r14, rax
    adc     r15, rdx

    ; ---------------- reduction (2^255-19), base 2^51 ----------------
    ; mask = 0x7ffffffffffff
    mov     rbp, 0x7ffffffffffff

    mov     rdx, r10
    shr     r10, 51
    shl     r11, 13
    and     rbp, rdx            ; g2 = h2 & mask
    or      r11, r10            ; h2>>51
    add     r12, r11
    adc     r13, 0

    mov     rax, rbx
    shr     rbx, 51
    shl     rcx, 13
    and     rbp, rax            ; g0
    or      rcx, rbx            ; h0>>51
    add     r8,  rcx            ; h1 += h0>>51
    adc     r9,  0

    mov     rbx, r12
    shr     r12, 51
    shl     r13, 13
    and     rbp, rbx            ; g3
    or      r13, r12            ; h3>>51
    add     r14, r13            ; h4 += h3>>51
    adc     r15, 0

    mov     rcx, r8
    shr     r8,  51
    shl     r9,  13
    and     rbp, rcx            ; g1
    or      r9,  r8
    add     rdx, r9             ; g2 += h1>>51

    mov     r10, r14
    shr     r14, 51
    shl     r15, 13
    and     rbp, r10            ; g4
    or      r15, r14            ; carry from h4

    ; fold 19*carry into g0 (LEA×19)
    lea     r14, [r15 + 8*r15]
    lea     r15, [r15 + 2*r14]
    add     rax, r15            ; g0 += 19*carry

    mov     r8,  rdx
    and     rdx, rbp            ; g2 &= mask
    shr     r8,  51
    add     rbx, r8             ; g3 += g2>>51

    mov     r9,  rax
    and     rax, rbp            ; g0 &= mask
    shr     r9,  51
    add     rcx, r9             ; g1 += g0>>51

    ; store
    mov     rdi, [rsp+8*4]
    mov     [rdi+8*0], rax
    mov     [rdi+8*1], rcx
    mov     [rdi+8*2], rdx
    mov     [rdi+8*3], rbx
    mov     [rdi+8*4], r10

    add     rsp, 8*5
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     rbx
    pop     rbp
    ret
