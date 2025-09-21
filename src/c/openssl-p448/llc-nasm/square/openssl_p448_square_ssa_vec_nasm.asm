section .text
GLOBAL openssl_p448_square_vec_nasm
openssl_p448_square_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
sub rsp,16
mov rax,[rsi + 32]
mov r10,[rsi]
mov [rsp - 128],r10
mov r9,[rsi + 8]
mov [rsp - 56],r9
lea r14,[rax + r10]
mov [rsp - 120],r14
mov r8,rax
mov [rsp - 104],rax
mov rdx,[rsi + 24]
mov [rsp - 96],rdx
mov r11,[rsi + 56]
mov [rsp - 64],r11
lea rcx,[r11 + rdx]
mov [rsp - 112],rcx
mulx rax,r10,r10
mov rdx,rcx
mulx rbx,rcx,r14
mov rdx,r11
mulx r11,r15,r8
mov rdx,[rsi + 16]
mov [rsp - 72],rdx
mulx r12,r13,r9
add r13,r10
adc r12,rax
mov rax,[rsi + 40]
mov r8,[rsi + 48]
lea r10,[rax + r9]
mov rsi,rax
lea rbp,[r8 + rdx]
mov rdx,rbp
mulx rax,rdx,r10
mov [rsp - 32],r10
sub rcx,r13
sbb rbx,r12
add rcx,rdx
adc rbx,rax
mov rdx,r8
mulx r14,rax,rsi
mov r9,rsi
mov [rsp - 24],rsi
add rax,r15
adc r14,r11
add rax,r13
adc r14,r12
mov rdx,72057594037927935
dec rdx
lea rsi,[rax + rax]
and rsi,rdx
mov [rsp],rsi
lea rsi,[rcx + rcx]
and rsi,rdx
mov [rsp + 8],rsi
mov rsi,rbx
shld rbx,rcx,9
shr rsi,55
shrd rax,r14,55
lea rcx,[r10 + r10]
mov rdx,[rsp - 112]
mulx r10,r11,rcx
lea rcx,[r9 + r9]
mov rdx,[rsp - 64]
mulx r15,r12,rcx
mov [rsp - 40],rbp
mov rdx,rbp
mulx r13,rcx,rbp
shr r14,55
add rcx,r11
adc r13,r10
add rcx,rbx
adc r13,rsi
mov [rsp - 48],r8
mov rdx,r8
mulx r9,rbp,r8
mov rdx,[rsp - 128]
mulx r10,r11,rdx
mov rdx,[rsp - 120]
mulx rsi,rbx,rdx
sub rbx,r11
sbb rsi,r10
add rbx,rbp
adc rsi,r9
add rbx,r12
adc rsi,r15
add rbx,rax
adc rsi,r14
add rbx,rcx
adc rsi,r13
mov rdx,[rsp - 104]
mulx r14,r15,rdx
mov rdx,[rsp - 72]
mulx rax,r9,rdx
mov r8,[rsp - 56]
lea r12,[r8 + r8]
mov rbp,[rsp - 96]
mov rdx,rbp
mulx r12,rdx,r12
add rdx,r9
adc r12,rax
add r15,r11
adc r14,r10
sub r15,rdx
sbb r14,r12
add r15,rcx
adc r14,r13
mov rax,r14
shld r14,r15,8
mov r11,rsi
shld rsi,rbx,8
mov rcx,[rsp - 40]
add rcx,rcx
mov rdx,[rsp - 112]
mulx rcx,r10,rcx
mov r9b,56
bzhi rdx,r15,r9
mov [rsp - 8],rdx
bzhi rdx,rbx,r9
mov [rsp - 16],rdx
mov rdx,[rsp - 72]
lea r9,[rdx + rdx]
mov rdx,rbp
mulx rdx,r9,r9
mov [rsp - 88],r9
mov [rsp - 80],rdx
mov rdx,[rsp - 48]
lea r9,[rdx + rdx]
mov rdx,[rsp - 64]
mulx r9,r12,r9
shr rax,56
shr r11,56
mov rbx,[rsp - 128]
add rbx,rbx
mov [rsp - 128],rbx
mov rdx,r8
mulx rbp,r15,rbx
mov r8,[rsp - 120]
add r8,r8
mov [rsp - 120],r8
mov rdx,[rsp - 32]
mulx rbx,r13,r8
mov r8,[rsp - 104]
add r8,r8
sub r13,r15
sbb rbx,rbp
add r13,r12
adc rbx,r9
add r13,r10
adc rbx,rcx
add r13,rsi
adc rbx,r11
mov rdx,[rsp - 24]
mulx rsi,rdx,r8
mov r12,r8
add rdx,r15
adc rsi,rbp
sub rdx,[rsp - 88]
sbb rsi,[rsp - 80]
add rdx,r10
adc rsi,rcx
add rdx,r14
adc rsi,rax
mov r14,rsi
shld rsi,rdx,8
mov cl,56
bzhi rax,rdx,rcx
mov [rsp - 104],rax
mov r10,rbx
shld rbx,r13,8
bzhi rax,r13,rcx
mov [rsp - 80],rax
shr r14,56
mov rdx,[rsp - 112]
mulx r11,rax,rdx
mov [rsp - 88],rax
mov rdx,[rsp - 96]
mulx rax,rcx,rdx
mov [rsp - 96],rcx
mov [rsp - 112],rax
mov rdx,[rsp - 64]
mulx r13,r9,rdx
mov rdx,[rsp - 72]
mulx rcx,r8,[rsp - 128]
mov rdx,[rsp - 40]
mulx r15,rax,[rsp - 120]
mov rdx,[rsp - 48]
mulx rdx,r12,r12
mov [rsp - 128],r12
mov [rsp - 120],rdx
mov rdx,[rsp - 56]
mulx r12,rbp,rdx
shr r10,56
add rbp,r8
adc r12,rcx
mov rdx,[rsp - 32]
mulx rcx,r8,rdx
sub r8,rbp
sbb rcx,r12
add r8,rax
adc rcx,r15
add r8,r9
adc rcx,r13
mov rax,[rsp - 88]
add r8,rax
adc rcx,r11
add r8,rbx
adc rcx,r10
mov rdx,[rsp - 24]
mulx rdx,r10,rdx
add r10,rbp
adc rdx,r12
add r10,[rsp - 128]
adc rdx,[rsp - 120]
sub r10,[rsp - 96]
sbb rdx,[rsp - 112]
add r10,rax
adc rdx,r11
mov rax,[rsp - 104]
mov [rdi + 8],rax
add r10,rsi
adc rdx,r14
mov rax,[rsp - 80]
mov [rdi + 40],rax
mov sil,56
bzhi rax,r10,rsi
mov [rdi + 16],rax
bzhi rax,r8,rsi
mov r9b,56
mov [rdi + 48],rax
mov rax,rdx
shld rdx,r10,8
mov rsi,rcx
shld rcx,r8,8
shr rax,56
shr rsi,56
add rdx,[rsp]
adc rax,0
add rcx,[rsp + 8]
adc rsi,0
bzhi r8,rdx,r9
mov [rdi + 24],r8
shld rax,rdx,8
bzhi rdx,rcx,r9
mov [rdi + 56],rdx
add rax,[rsp - 16]
shld rsi,rcx,8
add rax,rsi
mov [rdi + 32],rax
add rsi,[rsp - 8]
mov [rdi],rsi
add rsp,16
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret