section .text
GLOBAL curve25519_dalek_square_vec_nasm
curve25519_dalek_square_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
mov r13,[rsi + 32]
mov r12,[rsi + 24]
mov rcx,[rsi + 16]
mov r10,[rsi]
mov rax,[rsi + 8]
lea rdx,[r12 + 8*r12]
lea r8,[r12 + 2*rdx]
lea rdx,[r13 + 8*r13]
lea r9,[r13 + 2*rdx]
mov rdx,r10
mulx rbx,r14,r10
mov rdx,rax
mulx r15,rbp,r9
mov rdx,rcx
mulx rsi,r11,r8
add r11,rbp
mov rdx,r8
mulx rdx,rbp,r12
mov [rsp - 16],rbp
mov [rsp - 8],rdx
mov rdx,r10
mulx rdx,rbp,rax
mov [rsp - 40],rbp
mov [rsp - 32],rdx
adc rsi,r15
shld rsi,r11,1
add r11,r11
add r11,r14
adc rsi,rbx
mov rdx,rcx
mulx rbx,r15,r9
mov rdx,rax
mulx rdx,r14,rax
mov [rsp - 56],r14
mov [rsp - 48],rdx
mov rdx,r10
mulx rdx,r14,rcx
mov [rsp - 72],r14
mov [rsp - 64],rdx
mov rdx,r8
mulx r8,r14,r13
mov rdx,r9
mulx rdx,r9,r13
mov [rsp - 88],r9
mov [rsp - 80],rdx
mov rdx,r10
mulx rdx,r9,r12
mov [rsp - 104],r9
mov [rsp - 96],rdx
mov rdx,rax
mulx r9,rbp,rcx
mov rdx,rcx
mulx rdx,rcx,rcx
mov [rsp - 112],rdx
mov rdx,r10
mulx r10,r13,r13
mov rdx,rax
mulx rdx,r12,r12
mov al,51
bzhi rax,r11,rax
mov [rsp - 24],rax
add r12,r13
adc rdx,r10
shld rdx,r12,1
add r12,r12
add r12,rcx
adc rdx,[rsp - 112]
add rbp,[rsp - 104]
adc r9,[rsp - 96]
shld r9,rbp,1
add rbp,rbp
add rbp,[rsp - 88]
adc r9,[rsp - 80]
add r14,[rsp - 72]
adc r8,[rsp - 64]
shld r8,r14,1
add r14,r14
add r14,[rsp - 56]
adc r8,[rsp - 48]
add r15,[rsp - 40]
adc rbx,[rsp - 32]
shld rbx,r15,1
add r15,r15
add r15,[rsp - 16]
adc rbx,[rsp - 8]
shld rsi,r11,13
add rsi,r15
adc rbx,0
shld rbx,rsi,13
add rbx,r14
adc r8,0
shld r8,rbx,13
add r8,rbp
adc r9,0
mov rax,rdi
shld r9,r8,13
add r9,r12
adc rdx,0
shld rdx,r9,13
lea rcx,[rdx + 8*rdx]
lea rcx,[rdx + 2*rcx]
add rcx,[rsp - 24]
mov r10b,51
bzhi rdx,rcx,r10
bzhi rsi,rsi,r10
shr rcx,51
add rcx,rsi
bzhi rsi,r9,r10
bzhi rdi,r8,r10
bzhi r8,rbx,r10
mov [rax],rdx
mov [rax + 8],rcx
mov [rax + 16],r8
mov [rax + 24],rdi
mov [rax + 32],rsi
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret