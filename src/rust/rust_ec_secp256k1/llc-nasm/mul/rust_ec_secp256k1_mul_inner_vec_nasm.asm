section .text
GLOBAL rust_ec_secp256k1_mul_inner_vec_nasm
rust_ec_secp256k1_mul_inner_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
mov r9,[rsi]
mov [rsp - 80],r9
mov rax,[rsi + 8]
mov [rsp - 48],rax
mov r8,[rsi + 16]
mov [rsp - 56],r8
mov rcx,[rsi + 24]
mov rsi,[rsi + 32]
mov [rsp - 8],rsi
mov rbx,[rdx]
mov [rsp - 40],rbx
mov r15,[rdx + 8]
mov [rsp - 64],r15
mov r14,[rdx + 16]
mov [rsp - 104],r14
mov r12,[rdx + 24]
mov r11,[rdx + 32]
mov rdx,r12
mov [rsp - 16],r12
mulx rdx,r9,r9
mov [rsp - 112],r9
mov [rsp - 72],rdx
mov rdx,r14
mulx r14,r13,rax
mov rdx,r15
mulx rbp,rax,r8
mov rdx,rbx
mulx r15,r9,rcx
mov r8,rcx
mov [rsp - 32],rcx
mov [rsp - 24],r11
mov rdx,r11
mulx r10,rcx,rsi
mov dl,52
bzhi rdx,rcx,rdx
add r9,rax
adc r15,rbp
add r9,r13
adc r15,r14
add r9,[rsp - 112]
adc r15,[rsp - 72]
mov rax,68719492368
mulx rax,rdx,rax
add r9,rdx
mov [rsp - 72],r9
adc r15,rax
shld r10,rcx,12
shld r15,r9,12
mov rdx,r11
mov rbx,[rsp - 80]
mulx rax,rcx,rbx
mov [rsp - 88],rcx
mov [rsp - 112],rax
mov rdx,r12
mov r11,[rsp - 48]
mulx rcx,rax,r11
mov [rsp - 96],rcx
mov rdx,[rsp - 104]
mov r14,[rsp - 56]
mulx rcx,rsi,r14
mov rdx,[rsp - 64]
mulx r8,r9,r8
mov rbp,[rsp - 40]
mov rdx,rbp
mulx r13,r12,[rsp - 8]
add r12,r9
adc r13,r8
add r12,rsi
adc r13,rcx
add r12,rax
adc r13,[rsp - 96]
add r12,[rsp - 88]
adc r13,[rsp - 112]
mov rdx,r10
mov rax,68719492368
mulx rax,rcx,rax
add r12,rcx
adc r13,rax
add r12,r15
adc r13,0
shld r13,r12,12
mov r10,r12
shr r10,48
mov rdx,rbp
mulx rax,rcx,rbx
mov [rsp - 88],rcx
mov [rsp - 112],rax
mov rdx,[rsp - 24]
mulx rcx,rax,r11
mov [rsp - 96],rcx
mov r11,[rsp - 16]
mov rdx,r11
mulx rsi,r8,r14
mov rdx,[rsp - 104]
mulx r9,r14,[rsp - 32]
mov rcx,[rsp - 64]
mov rdx,rcx
mov rbx,[rsp - 8]
mulx r15,rbp,rbx
and r10d,15
add rbp,r14
adc r15,r9
add rbp,r8
adc r15,rsi
add rbp,rax
adc r15,[rsp - 96]
add rbp,r13
adc r15,0
shld r15,rbp,12
shl rbp,4
mov rdx,72057594037927920
and rdx,rbp
or rdx,r10
mov rax,4294968273
mulx r14,rax,rax
add rax,[rsp - 88]
adc r14,[rsp - 112]
shld r14,rax,12
mov rdx,rcx
mulx rcx,rdx,[rsp - 80]
mov [rsp - 96],rdx
mov [rsp - 88],rcx
mov rdx,[rsp - 40]
mulx r10,rbp,[rsp - 48]
mov rdx,[rsp - 24]
mulx r8,r9,[rsp - 56]
mov rdx,r11
mulx rcx,rsi,[rsp - 32]
mov rdx,[rsp - 104]
mulx r13,r11,rbx
mov dl,52
bzhi rax,rax,rdx
mov [rsp - 112],rax
add r11,rsi
adc r13,rcx
add r11,r9
adc r13,r8
add r11,r15
adc r13,0
bzhi rdx,r11,rdx
add rbp,[rsp - 96]
adc r10,[rsp - 88]
mov rax,68719492368
mulx rax,rcx,rax
add rbp,rcx
adc r10,rax
add rbp,r14
adc r10,0
shld r13,r11,12
shld r10,rbp,12
mov rdx,[rsp - 104]
mulx rax,rcx,[rsp - 80]
mov [rsp - 80],rcx
mov [rsp - 104],rax
mov rdx,[rsp - 64]
mulx r15,rcx,[rsp - 48]
mov rdx,[rsp - 40]
mulx r8,r9,[rsp - 56]
mov rdx,[rsp - 24]
mulx r11,r14,[rsp - 32]
mov rdx,[rsp - 16]
mulx rax,rsi,rbx
mov dl,52
bzhi rbp,rbp,rdx
add rsi,r14
adc rax,r11
add rsi,r13
adc rax,0
bzhi rdx,rsi,rdx
add r9,rcx
adc r8,r15
add r9,[rsp - 80]
adc r8,[rsp - 104]
mov r11,68719492368
mulx rcx,rdx,r11
add r9,rdx
adc r8,rcx
add r9,r10
adc r8,0
shld rax,rsi,12
shld r8,r9,12
mov sil,52
bzhi rcx,r9,rsi
mov rdx,rax
mulx rdx,rax,r11
bzhi rsi,[rsp - 72],rsi
mov r9b,52
add rsi,rax
adc rdx,0
mov rax,rdi
add rsi,r8
adc rdx,0
bzhi rdi,rsi,r9
shld rdx,rsi,12
mov sil,48
bzhi rsi,r12,rsi
add rsi,rdx
mov rdx,[rsp - 112]
mov [rax],rdx
mov [rax + 8],rbp
mov [rax + 16],rcx
mov [rax + 24],rdi
mov [rax + 32],rsi
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret