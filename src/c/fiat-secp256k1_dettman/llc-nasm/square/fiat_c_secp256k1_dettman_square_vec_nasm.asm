section .text
GLOBAL fiat_c_secp256k1_dettman_square_vec_nasm
fiat_c_secp256k1_dettman_square_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
mov r8,[rsi + 24]
mov rax,[rsi + 16]
mov r10,[rsi]
mov rcx,[rsi + 8]
mov [rsp - 8],rcx
lea rbx,[rcx + rcx]
lea r11,[r10 + r10]
mov r9,[rsi + 32]
mov rdx,r9
mulx rdx,rsi,r9
mov [rsp - 32],rdx
mov rdx,r11
mov [rsp - 16],r11
mulx r15,r12,r8
mov rdx,rbx
mulx rbp,r13,rax
add r13,r12
adc rbp,r15
mov rcx,68719492368
mov rdx,rsi
mulx rsi,rdx,rcx
add rdx,r13
adc rsi,rbp
shld rsi,rdx,12
mov r15,4503599627370495
dec r15
and r15,rdx
mov rdx,r11
mulx r13,rbp,r9
mov rdx,rbx
mulx r12,rcx,r8
mov rdx,rax
mulx r11,r14,rax
add r14,rcx
adc r11,r12
add r14,rbp
adc r11,r13
mov rcx,281475040739328
mov rdx,[rsp - 32]
mulx rcx,r13,rcx
add r13,r14
adc rcx,r11
lea r11,[rax + rax]
add r13,rsi
adc rcx,0
shld rcx,r13,12
mov rdx,r9
mulx rsi,rbx,rbx
mov rdx,r11
mulx rbp,rdx,r8
add rdx,rbx
adc rbp,rsi
add rdx,rcx
adc rbp,0
shld rbp,rdx,12
shl rdx,4
mov rsi,72057594037927920
and rsi,rdx
mov rcx,r13
shr rcx,48
mov rdx,r10
mulx rbx,r14,r10
and ecx,15
or rsi,rcx
mov rcx,4294968273
mov rdx,rsi
mulx rsi,rcx,rcx
mov dl,48
bzhi rdx,r13,rdx
mov [rsp - 32],rdx
add rcx,r14
adc rsi,rbx
shld rsi,rcx,12
mov rdx,r9
mulx r14,r12,r11
mov rdx,r8
mulx r13,rbx,r8
mov r11b,52
bzhi rcx,rcx,r11
mov [rsp - 24],rcx
add rbx,r12
adc r13,r14
add rbx,rbp
adc r13,0
mov r10,[rsp - 16]
mov rdx,r10
mov rcx,[rsp - 8]
mulx r14,r12,rcx
shld r13,rbx,12
bzhi rdx,rbx,r11
mov rbx,68719492368
mulx rbp,rbx,rbx
add rbx,r12
adc rbp,r14
add rbx,rsi
lea rsi,[r8 + r8]
adc rbp,0
shld rbp,rbx,12
mov rdx,r9
mulx r8,rsi,rsi
bzhi r9,rbx,r11
add rsi,r13
adc r8,0
mov rdx,r10
mulx rax,rbx,rax
mov rdx,rcx
mulx r12,r14,rcx
add r14,rbx
adc r12,rax
mov rdx,rsi
mov rax,68719492368
mulx rsi,rax,rax
add rax,r14
adc rsi,r12
add rax,rbp
mov rdx,r8
mov rcx,281475040739328
mulx r8,rdx,rcx
adc rsi,0
shld rsi,rax,12
add rsi,r15
bzhi rax,rax,r11
add rdx,rsi
adc r8,0
shld r8,rdx,12
add r8,[rsp - 32]
bzhi rdx,rdx,r11
mov rcx,[rsp - 24]
mov [rdi],rcx
mov [rdi + 8],r9
mov [rdi + 16],rax
mov [rdi + 24],rdx
mov [rdi + 32],r8
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret