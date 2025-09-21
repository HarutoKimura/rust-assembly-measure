section .text
GLOBAL fiat_c_poly1305_carry_square_vec_nasm
fiat_c_poly1305_carry_square_vec_nasm:
push r15
push r14
push r13
push r12
push rbx
mov r8,[rsi + 16]
lea rdx,[r8 + 4*r8]
lea r10,[r8 + r8]
mov rax,[rsi]
mulx r9,r11,r8
mov rcx,[rsi + 8]
lea rsi,[rcx + rcx]
shl r8,2
lea r8,[r8 + 4*r8]
mov rdx,rcx
mulx rbx,r14,r8
mov rdx,rsi
mulx r15,r12,rcx
mov rdx,rax
mulx rcx,r8,r10
mulx rsi,r10,rsi
mulx r13,rdx,rax
add rdx,r14
adc r13,rbx
shld r13,rdx,20
mov al,44
bzhi rdx,rdx,rax
add r8,r12
adc rcx,r15
add r10,r11
adc rsi,r9
add r10,r13
adc rsi,0
shld rsi,r10,21
mov r9b,43
bzhi r10,r10,r9
add rsi,r8
adc rcx,0
shld rcx,rsi,21
bzhi rsi,rsi,r9
lea rcx,[rcx + 4*rcx]
add rcx,rdx
bzhi rax,rcx,rax
shr rcx,44
add rcx,r10
bzhi rdx,rcx,r9
shr rcx,43
add rcx,rsi
mov [rdi],rax
mov [rdi + 8],rdx
mov [rdi + 16],rcx
pop rbx
pop r12
pop r13
pop r14
pop r15
ret