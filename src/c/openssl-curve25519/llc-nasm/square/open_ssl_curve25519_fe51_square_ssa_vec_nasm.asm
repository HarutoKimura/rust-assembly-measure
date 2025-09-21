section .text
GLOBAL open_ssl_curve25519_fe51_square_vec_nasm
open_ssl_curve25519_fe51_square_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
mov rcx,[rsi]
mov r8,[rsi + 8]
mov rax,[rsi + 16]
mov r9,[rsi + 24]
mov rsi,[rsi + 32]
mov rdx,rcx
mulx rdx,r10,rcx
mov [rsp - 80],r10
mov [rsp - 72],rdx
add rcx,rcx
mov rdx,rcx
mulx r11,r13,r8
mov rdx,rax
mulx r10,rbx,rcx
mov rdx,r9
mulx rdx,r14,rcx
mov [rsp - 56],r14
mov [rsp - 40],rdx
mov rdx,rsi
mulx rcx,rdx,rcx
mov [rsp - 16],rdx
mov [rsp - 8],rcx
lea rcx,[rsi + 8*rsi]
lea rcx,[rsi + 2*rcx]
mov rdx,rcx
mulx rdx,rsi,rsi
mov [rsp - 64],rsi
mov [rsp - 48],rdx
mov rdx,r8
mulx r15,rbp,r8
add rbp,rbx
adc r15,r10
add r8,r8
mov rdx,r8
mulx r14,r10,rax
mov rdx,r9
mulx rdx,rsi,r8
mov [rsp - 32],rsi
mov [rsp - 24],rdx
mov rdx,rcx
mulx rdx,rsi,r8
mov [rsp - 96],rsi
mov [rsp - 88],rdx
lea rdx,[r9 + 8*r9]
lea rsi,[r9 + 2*rdx]
mov rdx,rsi
mulx rbx,r12,r9
add r12,r13
adc rbx,r11
add r9,r9
mov rdx,rcx
mulx r11,r13,r9
add r13,rbp
adc r11,r15
mov rdx,rax
mulx r9,r8,rax
add rax,rax
mov rdx,rsi
mulx rsi,rbp,rax
add rbp,[rsp - 80]
adc rsi,[rsp - 72]
add rbp,[rsp - 96]
adc rsi,[rsp - 88]
mov rdx,rcx
mulx rax,rdx,rax
add rdx,r12
adc rax,rbx
shld r11,r13,13
add r10,[rsp - 56]
adc r14,[rsp - 40]
add r10,[rsp - 64]
adc r14,[rsp - 48]
add r10,r11
adc r14,0
mov cl,51
bzhi r11,r13,rcx
shld rsi,rbp,13
add rsi,rdx
adc rax,0
shld r14,r10,13
bzhi rdx,rbp,rcx
add r8,[rsp - 32]
adc r9,[rsp - 24]
add r8,[rsp - 16]
adc r9,[rsp - 8]
add r8,r14
adc r9,0
shld rax,rsi,13
add rax,r11
shld r9,r8,13
lea r11,[r9 + 8*r9]
lea r9,[r9 + 2*r11]
bzhi r10,r10,rcx
add r9,rdx
bzhi rdx,rax,rcx
shr rax,51
add rax,r10
bzhi rsi,rsi,rcx
bzhi r8,r8,rcx
bzhi rcx,r9,rcx
shr r9,51
add r9,rsi
mov [rdi],rcx
mov [rdi + 8],r9
mov [rdi + 16],rdx
mov [rdi + 24],rax
mov [rdi + 32],r8
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret