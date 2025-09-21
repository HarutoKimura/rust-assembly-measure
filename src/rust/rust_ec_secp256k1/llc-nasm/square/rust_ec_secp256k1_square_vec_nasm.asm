section .text
GLOBAL rust_ec_secp256k1_square_vec_nasm
rust_ec_secp256k1_square_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
mov r9,[rsi]
mov r8,[rsi + 8]
mov rcx,[rsi + 16]
mov rdx,[rsi + 24]
mov [rsp - 40],rdx
mov rax,[rsi + 32]
mulx r10,r15,r9
mov rdx,rcx
mulx r14,rbx,r8
mov r11,r8
mov rdx,rax
mulx rsi,r12,rax
mov r8,rax
mov rdx,4503599627370493
and rdx,r12
mov rax,68719492368
mulx rdx,r13,rax
add rbx,r15
adc r14,r10
shld r14,rbx,1
add rbx,rbx
add rbx,r13
adc r14,rdx
shld rsi,r12,12
shld r14,rbx,12
mov [rsp - 32],rcx
mov rdx,rcx
mulx rcx,r13,rcx
mov rdx,rsi
mulx r10,r15,rax
mov rax,r8
mov rdx,r8
mulx rsi,rbp,r9
mov r12,[rsp - 40]
mov rdx,r12
mulx rdx,r8,r11
mov [rsp - 16],r11
add r8,rbp
adc rdx,rsi
shld rdx,r8,1
add r8,r8
add r15,r13
adc r10,rcx
add r15,r14
adc r10,0
add r15,r8
adc r10,rdx
shld r10,r15,12
mov r14,r15
shr r14,48
and r14d,15
mov rdx,r9
mulx rcx,r8,r9
mov [rsp - 48],rcx
mov rdx,rax
mov rcx,rax
mulx r13,rbp,r11
mov rax,r12
mov rdx,r12
mov r11,[rsp - 32]
mulx rsi,r12,r11
add r12,rbp
adc rsi,r13
shld rsi,r12,1
add r12,r12
add r12,r10
adc rsi,0
shld rsi,r12,12
shl r12,4
mov rdx,72057594037927920
and rdx,r12
or rdx,r14
mov r10,4294968273
mulx rbp,r10,r10
add r10,r8
adc rbp,[rsp - 48]
shld rbp,r10,12
mov rdx,rax
mulx r8,r12,rax
mov rdx,r11
mulx r14,r13,rcx
mov al,52
bzhi rax,r10,rax
mov dl,52
mov [rsp - 48],rax
shld r14,r13,1
add r13,r13
add r13,r12
adc r14,r8
add r13,rsi
adc r14,0
bzhi rdx,r13,rdx
mov rax,68719492368
mulx rsi,r8,rax
lea rdx,[r9 + r9]
mov [rsp - 24],rdx
shr r9,63
mov rax,r9
mov r11,[rsp - 16]
imul rax, r11
mulx r12,r10,r11
mov rdx,r11
add r12,rax
add r10,r8
adc r12,rsi
add r10,rbp
adc r12,0
shld r14,r13,12
shld r12,r10,12
mov r13b,52
bzhi rax,r10,r13
mov [rsp - 8],rax
mulx rax,r11,rdx
mov rdx,[rsp - 40]
mulx rsi,r8,rcx
shld rsi,r8,1
add r8,r8
add r8,r14
adc rsi,0
bzhi rdx,r8,r13
mov rbp,68719492368
mulx r14,r13,rbp
mov rcx,[rsp - 32]
imul r9, rcx
mov rdx,[rsp - 24]
mulx rcx,r10,rcx
add rcx,r9
add r10,r11
adc rcx,rax
add r10,r13
adc rcx,r14
add r10,r12
adc rcx,0
shld rsi,r8,12
mov rdx,rsi
mulx rdx,rax,rbp
mov rsi,4503599627370494
and rsi,rbx
shld rcx,r10,12
mov r9b,52
bzhi r8,r10,r9
add rsi,rax
adc rdx,0
mov rax,rdi
add rsi,rcx
adc rdx,0
bzhi rcx,rsi,r9
shld rdx,rsi,12
mov sil,48
bzhi rsi,r15,rsi
add rsi,rdx
mov rdx,[rsp - 48]
mov [rdi],rdx
mov rdx,[rsp - 8]
mov [rdi + 8],rdx
mov [rdi + 16],r8
mov [rdi + 24],rcx
mov [rdi + 32],rsi
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret