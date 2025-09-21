section .text
GLOBAL fiat_c_curve25519_carry_mul_vec_nasm
fiat_c_curve25519_carry_mul_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
sub rsp,136
mov rax,rdx
mov r14,[rsi + 32]
mov rdx,[rdx + 32]
mov [rsp - 112],rdx
lea rcx,[rdx + 8*rdx]
lea rcx,[rdx + 2*rcx]
mov rdx,rcx
mulx rdx,r8,r14
mov [rsp + 120],r8
mov [rsp + 128],rdx
mov r8,[rax + 24]
mov [rsp - 120],r8
lea rdx,[r8 + 8*r8]
lea r9,[r8 + 2*rdx]
mov rdx,r9
mulx rdx,r8,r14
mov [rsp + 96],r8
mov [rsp + 112],rdx
mov r8,[rax + 16]
mov [rsp - 128],r8
lea rdx,[r8 + 8*r8]
lea r10,[r8 + 2*rdx]
mov rdx,r10
mulx rdx,r8,r14
mov [rsp + 88],r8
mov [rsp + 104],rdx
mov r8,[rax + 8]
lea rdx,[r8 + 8*r8]
lea rdx,[r8 + 2*rdx]
mov r15,r8
mulx rdx,rbp,r14
mov [rsp - 104],rdx
mov r8,[rsi + 24]
mov rdx,r8
mulx rdx,r11,rcx
mov [rsp + 40],r11
mov [rsp + 64],rdx
mov rdx,r8
mulx r12,r13,r9
mulx rdx,rbx,r10
add rbx,rbp
mov r11,rdx
adc r11,[rsp - 104]
mov r10,[rsi + 16]
mov rdx,r10
mulx rdx,rbp,rcx
mov [rsp - 24],rbp
mov [rsp - 16],rdx
mov rdx,r10
mulx rdx,r9,r9
add rbx,r9
adc r11,rdx
mov r9,[rsi + 8]
mov rdx,r9
mulx rcx,rdx,rcx
add rbx,rdx
adc r11,rcx
mov [rsp - 80],r11
mov rax,[rax]
mov rcx,[rsi]
mov rdx,rax
mulx rdx,rsi,r14
mov [rsp + 80],rsi
mov [rsp - 104],rdx
mov rdx,r8
mov r11,r15
mulx rdx,rsi,r15
mov [rsp + 56],rsi
mov [rsp + 72],rdx
mov rdx,rax
mulx rdx,rsi,r8
mov [rsp + 16],rsi
mov [rsp + 24],rdx
mov rdx,r10
mov r15,[rsp - 128]
mulx r8,rdx,r15
mov [rsp - 96],rdx
mov rdx,r10
mulx rbp,r14,r11
mov rsi,r11
mov rdx,rax
mulx rdx,r10,r10
mov [rsp - 40],r10
mov [rsp - 32],rdx
mov rdx,r9
mov r10,[rsp - 120]
mulx rdx,r11,r10
mov [rsp + 32],r11
mov [rsp + 48],rdx
mov rdx,r9
mulx rdx,r11,r15
mov [rsp],r11
mov [rsp + 8],rdx
mov rdx,r9
mulx rdx,r11,rsi
mov [rsp - 56],r11
mov [rsp - 48],rdx
mov rdx,rax
mulx rdx,r9,r9
mov [rsp - 88],r9
mov [rsp - 72],rdx
mov rdx,rcx
mulx rdx,r11,[rsp - 112]
mov [rsp - 112],rdx
mov rdx,rcx
mulx rdx,r9,r10
mov [rsp - 8],r9
mov [rsp - 120],rdx
mov rdx,rcx
mulx rdx,r9,r15
mov [rsp - 64],r9
mov [rsp - 128],rdx
mov rdx,rcx
mulx r9,r10,rsi
mulx rax,rcx,rax
add rbx,rcx
mov rcx,[rsp - 80]
adc rcx,rax
shld rcx,rbx,13
mov rdx,rcx
mov al,51
bzhi rcx,rbx,rax
mov r15,[rsp + 40]
add r15,[rsp + 96]
mov rbx,[rsp + 64]
adc rbx,[rsp + 112]
add r13,[rsp + 88]
adc r12,[rsp + 104]
add r13,[rsp - 24]
adc r12,[rsp - 16]
add r13,[rsp - 88]
adc r12,[rsp - 72]
add r13,r10
adc r12,r9
add r13,rdx
adc r12,0
shld r12,r13,13
bzhi rdx,r13,rax
mov r10,r15
add r10,[rsp - 56]
mov r9,rbx
adc r9,[rsp - 48]
add r10,[rsp - 40]
adc r9,[rsp - 32]
add r10,[rsp - 64]
adc r9,[rsp - 128]
add r10,r12
adc r9,0
shld r9,r10,13
bzhi r10,r10,rax
add r14,[rsp + 120]
adc rbp,[rsp + 128]
add r14,[rsp]
adc rbp,[rsp + 8]
add r14,[rsp + 16]
adc rbp,[rsp + 24]
add r14,[rsp - 8]
adc rbp,[rsp - 120]
add r14,r9
adc rbp,0
shld rbp,r14,13
bzhi r9,r14,rax
mov rsi,[rsp - 96]
add rsi,[rsp + 56]
adc r8,[rsp + 72]
add rsi,[rsp + 32]
adc r8,[rsp + 48]
add rsi,[rsp + 80]
adc r8,[rsp - 104]
add rsi,r11
adc r8,[rsp - 112]
add rsi,rbp
adc r8,0
shld r8,rsi,13
lea r11,[r8 + 8*r8]
lea r8,[r8 + 2*r11]
add r8,rcx
bzhi rcx,r8,rax
shr r8,51
add r8,rdx
bzhi rdx,rsi,rax
bzhi rax,r8,rax
shr r8,51
add r8,r10
mov [rdi],rcx
mov [rdi + 8],rax
mov [rdi + 16],r8
mov [rdi + 24],r9
mov [rdi + 32],rdx
add rsp,136
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret