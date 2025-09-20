section .text
GLOBAL curve25519_dalek_mul_vec_nasm
curve25519_dalek_mul_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
push rax
mov r10,rdx
mov rdx,[rdx]
mov [rsp - 80],rdx
mov rcx,[r10 + 8]
mov [rsp - 72],rcx
lea rax,[rcx + 8*rcx]
lea rax,[rcx + 2*rax]
mov r8,[r10 + 16]
mov [rsp - 48],r8
lea rcx,[r8 + 8*r8]
lea r12,[r8 + 2*rcx]
mov r13,[rsi]
mulx rcx,r8,r13
mov rbx,[rsi + 32]
mov rdx,rbx
mulx r9,rax,rax
add rax,r8
adc r9,rcx
mov rdx,[rsi + 24]
mov r15,rdx
mulx r8,rcx,r12
mov rdx,[r10 + 24]
mov [rsp - 8],rdx
add rcx,rax
lea rax,[rdx + 8*rdx]
lea rbp,[rdx + 2*rax]
adc r8,r9
mov rdx,[rsi + 16]
mov [rsp - 56],rdx
mulx r11,rax,rbp
add rax,rcx
adc r11,r8
mov rdx,[r10 + 32]
mov [rsp],rdx
lea rcx,[rdx + 8*rdx]
lea rcx,[rdx + 2*rcx]
mov [rsp - 16],rcx
mov rdx,[rsi + 8]
mov [rsp - 64],rdx
mulx r14,rsi,rcx
add rsi,rax
mov r10,rsi
mov [rsp - 96],rsi
mov r8,[rsp - 80]
mulx rax,rcx,r8
mov [rsp - 128],rcx
mov [rsp - 88],rax
mov [rsp - 24],r13
mov rdx,r13
mov r9,[rsp - 72]
mulx rax,rcx,r9
mov rdx,rbx
mulx r12,rsi,r12
adc r14,r11
shld r14,r10,13
add rsi,rcx
adc r12,rax
mov r10,r15
mov rdx,r15
mulx rax,rcx,rbp
add rsi,rcx
adc r12,rax
mov rdx,[rsp - 56]
mov r15,[rsp - 16]
mulx rax,rcx,r15
add rsi,rcx
adc r12,rax
add rsi,[rsp - 128]
adc r12,[rsp - 88]
mulx rax,rcx,r8
mov [rsp - 120],rcx
mov [rsp - 104],rax
mov r11,[rsp - 64]
mov rdx,r11
mulx rax,rcx,r9
mov [rsp - 112],rcx
mov [rsp - 128],rax
mov r8,r9
mov rdx,r13
mov r13,[rsp - 48]
mulx r9,rcx,r13
mov rdx,rbx
mulx rax,rbp,rbp
add rsi,r14
adc r12,0
shld r12,rsi,13
mov dl,51
bzhi rdx,[rsp - 96],rdx
mov [rsp - 88],rdx
add rbp,rcx
adc rax,r9
mov rdx,r10
mov [rsp - 32],r10
mulx rcx,r9,r15
add rbp,r9
adc rax,rcx
add rbp,[rsp - 120]
adc rax,[rsp - 104]
add rbp,[rsp - 112]
adc rax,[rsp - 128]
add rbp,r12
mov r9,[rsp - 80]
mulx rcx,rdx,r9
mov [rsp - 40],rdx
mov [rsp - 112],rcx
mov r12,[rsp - 56]
mov rdx,r12
mulx rcx,rdx,r8
mov [rsp - 120],rdx
mov [rsp - 104],rcx
mov rdx,r11
mulx rcx,r11,r13
mov [rsp - 96],rcx
mov r8,[rsp - 24]
mov rdx,r8
mov rcx,[rsp - 8]
mulx r13,r10,rcx
mov rdx,rbx
mulx r15,r14,r15
adc rax,0
shld rax,rbp,13
mov dl,51
bzhi rdx,rsi,rdx
mov [rsp - 128],rdx
add r14,r10
adc r15,r13
add r14,[rsp - 40]
adc r15,[rsp - 112]
add r14,[rsp - 120]
adc r15,[rsp - 104]
add r14,r11
adc r15,[rsp - 96]
add r14,rax
mov rdx,rbx
mulx rax,r9,r9
mov rdx,[rsp - 32]
mulx r10,r11,[rsp - 72]
mov rdx,r12
mulx rbx,r12,[rsp - 48]
mov rdx,[rsp - 64]
mulx r13,rsi,rcx
mov rdx,r8
mulx r8,rdx,[rsp]
adc r15,0
shld r15,r14,13
mov cl,51
bzhi rcx,rbp,rcx
add rdx,r9
adc r8,rax
add rdx,r11
adc r8,r10
add rdx,r12
adc r8,rbx
add rdx,rsi
adc r8,r13
mov rax,rdi
add rdx,r15
adc r8,0
shld r8,rdx,13
lea rsi,[r8 + 8*r8]
lea rsi,[r8 + 2*rsi]
add rsi,[rsp - 88]
mov r8b,51
bzhi rdi,r14,r8
bzhi rdx,rdx,r8
bzhi r8,rsi,r8
shr rsi,51
add rsi,[rsp - 128]
mov [rax],r8
mov [rax + 8],rsi
mov [rax + 16],rcx
mov [rax + 24],rdi
mov [rax + 32],rdx
add rsp,8
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret