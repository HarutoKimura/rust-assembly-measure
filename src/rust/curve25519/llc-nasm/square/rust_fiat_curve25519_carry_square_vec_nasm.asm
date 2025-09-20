section .text
GLOBAL rust_fiat_curve25519_carry_square_vec_nasm
rust_fiat_curve25519_carry_square_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
mov r10,[rsi + 32]
lea rax,[r10 + 8*r10]
lea rdx,[r10 + 2*rax]
imul r11, r10, 38
mov rax,[rsi + 24]
lea rcx,[rax + 8*rax]
lea r8,[rax + 2*rcx]
imul rbx, rax, 38
mov rcx,[rsi + 16]
mulx rdx,r9,r10
mov [rsp - 48],r9
mov [rsp - 40],rdx
mov rdx,rax
mulx rdx,r9,r11
mov [rsp - 32],r9
mov [rsp - 24],rdx
mov rdx,r8
mulx rdx,r8,rax
mov [rsp - 16],r8
mov [rsp - 8],rdx
mov rdx,rcx
mulx r8,r9,r11
mulx r14,r15,rbx
mulx rdx,rbx,rcx
mov [rsp - 64],rbx
mov [rsp - 56],rdx
mov rdx,[rsi + 8]
mulx rbx,rbp,r11
add rbp,r15
adc rbx,r14
lea r12,[r10 + r10]
lea r13,[rax + rax]
lea r15,[rcx + rcx]
mov rax,[rsi]
mulx rsi,rcx,r13
mov [rsp - 120],rcx
mulx rcx,r11,r15
lea r10,[rdx + rdx]
mov [rsp - 128],r10
mulx r10,r14,rdx
mov rdx,rax
mulx rdx,r12,r12
mov [rsp - 112],r12
mov [rsp - 104],rdx
mov rdx,rax
mulx rdx,r13,r13
mov [rsp - 96],rdx
mov rdx,rax
mulx rdx,r15,r15
mov [rsp - 88],r15
mov [rsp - 80],rdx
mov rdx,rax
mulx rdx,r15,[rsp - 128]
mov [rsp - 72],r15
mov [rsp - 128],rdx
mov rdx,rax
mulx rax,rdx,rax
add rbp,rdx
adc rbx,rax
shld rbx,rbp,13
mov al,51
bzhi rdx,rbp,rax
mov r15,[rsp - 120]
add r15,[rsp - 64]
adc rsi,[rsp - 56]
add r15,[rsp - 112]
adc rsi,[rsp - 104]
add r11,[rsp - 48]
adc rcx,[rsp - 40]
add r11,r13
adc rcx,[rsp - 96]
add r14,[rsp - 32]
adc r10,[rsp - 24]
add r14,[rsp - 88]
adc r10,[rsp - 80]
add r9,[rsp - 16]
adc r8,[rsp - 8]
add r9,[rsp - 72]
adc r8,[rsp - 128]
add r9,rbx
adc r8,0
shld r8,r9,13
bzhi r9,r9,rax
add r8,r14
adc r10,0
shld r10,r8,13
bzhi r8,r8,rax
add r10,r11
adc rcx,0
shld rcx,r10,13
bzhi r10,r10,rax
add rcx,r15
adc rsi,0
shld rsi,rcx,13
lea r11,[rsi + 8*rsi]
lea rsi,[rsi + 2*r11]
add rsi,rdx
bzhi rdx,rsi,rax
shr rsi,51
add rsi,r9
bzhi rcx,rcx,rax
bzhi rax,rsi,rax
shr rsi,51
add rsi,r8
mov [rdi],rdx
mov [rdi + 8],rax
mov [rdi + 16],rsi
mov [rdi + 24],r10
mov [rdi + 32],rcx
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret