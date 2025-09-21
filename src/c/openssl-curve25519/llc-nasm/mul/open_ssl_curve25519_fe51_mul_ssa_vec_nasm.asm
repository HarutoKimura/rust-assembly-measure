section .text
GLOBAL open_ssl_curve25519_fe51_mul_vec_nasm
open_ssl_curve25519_fe51_mul_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
mov r10,rdx
mov r12,[rdx]
mov r8,[rdx + 8]
mov rax,[rsi]
mov r11,rsi
mov [rsp - 40],rsi
mov rdx,r12
mov [rsp - 48],r12
mulx rcx,rbx,rax
mov rdx,r8
mov [rsp - 32],r8
mulx r14,r15,rax
mov rdx,[r10 + 16]
mov r13,rdx
mov [rsp - 64],rdx
mulx rdx,rsi,rax
mov [rsp - 16],rdx
mov r9,[r10 + 24]
mov rdx,r9
mulx rdx,rbp,rax
mov [rsp - 8],rbp
mov [rsp - 72],rdx
mov rdx,[r10 + 32]
lea r10,[rdx + 8*rdx]
lea r10,[rdx + 2*r10]
mov [rsp - 56],r10
mulx rax,rdx,rax
mov [rsp - 24],rdx
mov [rsp - 80],rax
mov rdx,[r11 + 8]
mulx r11,rbp,r10
add rbp,rbx
adc r11,rcx
mulx rbx,r10,r12
add r10,r15
adc rbx,r14
mulx r14,rax,r8
add rax,rsi
adc r14,[rsp - 16]
mulx r15,rcx,r13
add rcx,[rsp - 8]
adc r15,[rsp - 72]
mulx r12,rsi,r9
add rsi,[rsp - 24]
adc r12,[rsp - 80]
lea rdx,[r9 + 8*r9]
lea r9,[r9 + 2*rdx]
mov [rsp - 72],r9
mov r8,[rsp - 40]
mov rdx,[r8 + 16]
mulx r13,r9,r9
add r9,rbp
adc r13,r11
mulx r11,rbp,[rsp - 56]
add rbp,r10
adc r11,rbx
mulx rbx,r10,[rsp - 48]
add r10,rax
adc rbx,r14
mov [rsp - 80],rbx
mulx r14,rax,[rsp - 32]
add rax,rcx
adc r14,r15
mov rbx,[rsp - 64]
mulx r15,rcx,rbx
add rcx,rsi
adc r15,r12
lea rdx,[rbx + 8*rbx]
lea rsi,[rbx + 2*rdx]
mov [rsp - 64],rsi
mov rdx,[r8 + 24]
mulx r12,r8,rsi
add r8,r9
adc r12,r13
mulx r13,r9,[rsp - 72]
add r9,rbp
adc r13,r11
mulx rbp,rbx,[rsp - 56]
add rbx,r10
adc rbp,[rsp - 80]
mulx rsi,r10,[rsp - 48]
add r10,rax
adc rsi,r14
mov [rsp - 80],rsi
mov rsi,[rsp - 32]
mulx r14,rax,rsi
add rax,rcx
adc r14,r15
lea rcx,[rsi + 8*rsi]
lea rcx,[rsi + 2*rcx]
mov rdx,[rsp - 40]
mov rdx,[rdx + 32]
mulx rsi,r11,rcx
add r11,r8
adc rsi,r12
mulx rcx,r15,[rsp - 64]
add r15,r9
adc rcx,r13
mulx r9,r12,[rsp - 72]
add r12,rbx
adc r9,rbp
mulx r8,rbx,[rsp - 56]
add rbx,r10
adc r8,[rsp - 80]
mulx rdx,r10,[rsp - 48]
add r10,rax
adc rdx,r14
shld r9,r12,13
add r9,rbx
adc r8,0
mov al,51
shld rsi,r11,13
bzhi rbx,r12,rax
add rsi,r15
adc rcx,0
bzhi r11,r11,rax
shld r8,r9,13
add r8,r10
adc rdx,0
shld rcx,rsi,13
add rcx,rbx
shld rdx,r8,13
lea r10,[rdx + 8*rdx]
lea rdx,[rdx + 2*r10]
bzhi r9,r9,rax
add rdx,r11
bzhi r10,rcx,rax
shr rcx,51
add rcx,r9
bzhi rsi,rsi,rax
bzhi r8,r8,rax
bzhi rax,rdx,rax
shr rdx,51
add rdx,rsi
mov [rdi],rax
mov [rdi + 8],rdx
mov [rdi + 16],r10
mov [rdi + 24],rcx
mov [rdi + 32],r8
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret