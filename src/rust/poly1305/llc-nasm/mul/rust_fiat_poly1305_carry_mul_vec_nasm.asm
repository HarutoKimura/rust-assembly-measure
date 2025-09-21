section .text
GLOBAL rust_fiat_poly1305_carry_mul_vec_nasm
rust_fiat_poly1305_carry_mul_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
mov rax,rdx
mov r8,[rsi + 16]
mov r15,[rdx + 16]
lea rdx,[r15 + 4*r15]
mulx rcx,rdx,r8
mov [rsp - 16],rdx
mov [rsp - 8],rcx
mov r13,[rax + 8]
lea r10,[r13 + r13]
lea rdx,[r10 + 4*r10]
mulx r14,r11,r8
mov rax,[rax]
mov rcx,[rsi + 8]
lea rdx,[r15 + r15]
lea r9,[rdx + 4*rdx]
mov rdx,rcx
mulx rbx,r9,r9
mov rdx,rax
mulx rdx,rbp,r8
mov [rsp - 24],rdx
mov rdx,rcx
mulx r8,r10,r10
add r9,r11
mov rsi,[rsi]
adc rbx,r14
mov rdx,rax
mulx rcx,r14,rcx
mov rdx,rsi
mulx r11,r15,r15
mulx r13,r12,r13
mulx rax,rdx,rax
add r9,rdx
adc rbx,rax
shld rbx,r9,20
mov al,44
bzhi rdx,r9,rax
add r10,rbp
adc r8,[rsp - 24]
add r10,r15
adc r8,r11
add r14,[rsp - 16]
adc rcx,[rsp - 8]
add r14,r12
adc rcx,r13
add r14,rbx
adc rcx,0
shld rcx,r14,21
mov sil,43
bzhi r9,r14,rsi
add rcx,r10
adc r8,0
shld r8,rcx,21
lea r8,[r8 + 4*r8]
add r8,rdx
bzhi rax,r8,rax
shr r8,44
add r8,r9
bzhi rcx,rcx,rsi
bzhi rdx,r8,rsi
shr r8,43
add r8,rcx
mov [rdi],rax
mov [rdi + 8],rdx
mov [rdi + 16],r8
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret