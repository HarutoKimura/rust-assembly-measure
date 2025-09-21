section .text
GLOBAL fiat_c_secp256k1_dettman_mul_vec_nasm
fiat_c_secp256k1_dettman_mul_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
push rax
mov r8,rdx
mov rax,[rsi + 32]
mov [rsp - 72],rax
mov rdx,[rdx + 32]
mov [rsp - 104],rdx
mulx rcx,r13,rax
mov [rsp - 112],rcx
mov rdx,[r8 + 24]
mov [rsp - 88],rdx
mov rbx,[rsi]
mov rcx,[rsi + 8]
mov [rsp - 48],rcx
mulx r15,rax,rbx
mov [rsp],rbx
mov rdx,[r8 + 16]
mov [rsp - 96],rdx
mulx rcx,rbp,rcx
mov [rsp - 120],rcx
mov r14,[rsi + 16]
mov rdx,[r8 + 8]
mov [rsp - 56],rdx
mulx rdx,r10,r14
mov [rsp - 128],rdx
mov [rsp - 64],r14
mov r12,[r8]
mov r9,[rsi + 24]
mov rdx,r12
mov [rsp - 8],r12
mulx r8,r11,r9
mov [rsp - 80],r9
mov rcx,68719492368
mov rdx,r13
mulx rsi,rcx,rcx
add rcx,rax
adc rsi,r15
add rcx,rbp
adc rsi,[rsp - 120]
add rcx,r10
adc rsi,[rsp - 128]
add rcx,r11
adc rsi,r8
mov rdx,rbx
mulx rax,r8,[rsp - 104]
mov r11,[rsp - 48]
mov rdx,r11
mov rbp,[rsp - 88]
mulx rbx,r10,rbp
mov rdx,r14
mulx rdx,r14,[rsp - 96]
mov [rsp - 40],r14
mov [rsp - 24],rdx
mov rdx,r9
mov r9,[rsp - 56]
mulx rdx,r14,r9
mov [rsp - 32],r14
mov [rsp - 128],rdx
mov rdx,r12
mov r12,[rsp - 72]
mulx rdx,r14,r12
mov [rsp - 16],r14
mov [rsp - 120],rdx
shld rsi,rcx,12
mov r14,281475040739328
mov rdx,[rsp - 112]
mulx r15,r13,r14
mov dl,52
bzhi rcx,rcx,rdx
mov [rsp - 112],rcx
add r13,r8
adc r15,rax
add r13,r10
adc r15,rbx
add r13,[rsp - 40]
adc r15,[rsp - 24]
add r13,[rsp - 32]
adc r15,[rsp - 128]
add r13,[rsp - 16]
adc r15,[rsp - 120]
add r13,rsi
adc r15,0
shld r15,r13,12
mov rdx,r11
mov r11,[rsp - 104]
mulx rsi,r8,r11
mov r10,[rsp - 64]
mov rdx,r10
mulx rax,rcx,rbp
add rcx,r8
adc rax,rsi
mov rbx,[rsp - 80]
mov rdx,rbx
mov r14,[rsp - 96]
mulx rsi,r8,r14
mov rdx,r9
mulx rdx,r9,r12
add rcx,r9
adc rax,rdx
add rcx,r8
adc rax,rsi
add rcx,r15
adc rax,0
shld rax,rcx,12
shl rcx,4
mov rsi,72057594037927920
and rsi,rcx
mov cl,48
bzhi rcx,r13,rcx
mov [rsp - 120],rcx
shr r13,48
mov rbp,[rsp - 8]
mov rdx,rbp
mov r15,[rsp]
mulx rcx,r8,r15
and r13d,15
or rsi,r13
mov r9,4294968273
mov rdx,rsi
mulx rsi,r9,r9
add r9,r8
adc rsi,rcx
shld rsi,r9,12
mov rdx,r10
mulx r8,r10,r11
mov rdx,rbx
mulx r11,rbx,[rsp - 88]
mov rdx,r14
mulx rcx,r14,r12
mov dl,52
bzhi rdx,r9,rdx
mov [rsp - 128],rdx
add r14,r10
adc rcx,r8
add r14,rbx
adc rcx,r11
add r14,rax
adc rcx,0
shld rcx,r14,12
mov r13,[rsp - 56]
mov rdx,r13
mulx rax,r8,r15
mov r12,r15
mov rdx,rbp
mov rbx,[rsp - 48]
mulx r10,r9,rbx
add r9,r8
adc r10,rax
mov al,52
bzhi rdx,r14,rax
mov r14,68719492368
mulx r15,rax,r14
add rax,r9
adc r15,r10
add rax,rsi
adc r15,0
shld r15,rax,12
mov rdx,[rsp - 80]
mulx r8,r9,[rsp - 104]
mov rdx,[rsp - 88]
mulx r11,rsi,[rsp - 72]
mov dl,52
bzhi rax,rax,rdx
add rsi,r9
adc r11,r8
add rsi,rcx
adc r11,0
mov rdx,[rsp - 96]
mulx r8,r9,r12
mov rdx,r13
mulx rcx,r10,rbx
add r10,r9
adc rcx,r8
mov rdx,rbp
mulx rdx,r8,[rsp - 64]
add r10,r8
adc rcx,rdx
mov rdx,rsi
mulx rdx,rsi,r14
add r10,rsi
adc rcx,rdx
add r10,r15
adc rcx,0
shld rcx,r10,12
add rcx,[rsp - 112]
mov r9b,52
bzhi rsi,r10,r9
mov rdx,r11
mov r8,281475040739328
mulx r8,rdx,r8
add rdx,rcx
adc r8,0
shld r8,rdx,12
add r8,[rsp - 120]
bzhi rcx,rdx,r9
mov rdx,[rsp - 128]
mov [rdi],rdx
mov [rdi + 8],rax
mov [rdi + 16],rsi
mov [rdi + 24],rcx
mov [rdi + 32],r8
add rsp,8
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret