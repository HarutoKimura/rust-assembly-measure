section .text
GLOBAL openssl_p448_mul_vec_nasm
openssl_p448_mul_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
sub rsp,208
mov r8,rdx
mov rcx,[rdx + 8]
mov [rsp + 168],rcx
mov r9,[rsi + 48]
mov rax,[rdx + 16]
mov [rsp + 184],rax
mov rdx,[rdx + 48]
mov [rsp - 80],rdx
lea rax,[rdx + rax]
mov rbx,[rsi + 56]
mov r14,[r8 + 40]
lea rdx,[r14 + rcx]
mov r11,rdx
mov [rsp + 48],rdx
mulx rcx,rdx,rbx
mov [rsp - 16],rdx
mov [rsp - 8],rcx
mov r10,rbx
mov [rsp + 24],rbx
mov rcx,rax
mov [rsp + 40],rax
mov rdx,rax
mulx rax,rdx,r9
mov [rsp - 128],rdx
mov [rsp - 120],rax
mov [rsp + 16],r9
mov rax,[r8 + 24]
mov [rsp + 200],rax
mov r12,[r8 + 56]
lea rax,[r12 + rax]
mov rdx,[rsi + 40]
mov rbp,rdx
mov [rsp + 8],rdx
mulx rdx,rbx,rax
mov [rsp - 32],rbx
mov [rsp - 24],rdx
mov rbx,rax
mov [rsp + 96],rax
mov rax,[rsi + 32]
mov [rsp - 88],rax
mov rdx,[r8 + 32]
mov [rsp - 96],rdx
mulx r15,rdx,rax
mov [rsp + 160],rdx
mov rax,[rsi + 24]
lea r10,[r10 + rax]
mov [rsp + 80],r10
mov r13,rax
mov [rsp + 128],rax
lea rdx,[r11 + r14]
mov [rsp],r14
mulx rax,rdx,r10
mov [rsp - 40],rdx
mov [rsp + 72],rax
mov rax,[rsi + 16]
lea r10,[r9 + rax]
mov [rsp + 32],r10
mov r9,rax
mov [rsp + 120],rax
mov r11,[rsp - 80]
lea rdx,[rcx + r11]
mov [rsp - 112],rdx
mulx rax,rcx,r10
mov [rsp - 72],rcx
mov [rsp - 64],rax
mov rcx,[rsi + 8]
lea r10,[rbx + r12]
mov [rsp - 104],r10
lea rdx,[rcx + rbp]
mov [rsp + 144],rdx
mov [rsp + 88],rcx
mulx rax,rdx,r10
mov [rsp - 56],rdx
mov [rsp - 48],rax
mov rax,[rsi]
mov r10,[r8]
mov rdx,[rsp - 88]
lea rsi,[rdx + rax]
mov [rsp + 136],rsi
mov r8,rax
mov [rsp + 152],rax
mov rax,[rsp - 96]
lea rdx,[rax + r10]
mov [rsp + 104],rdx
mov [rsp + 112],r10
mulx rax,rbx,rsi
mov rdx,r14
mulx rsi,r14,r13
mov rdx,r11
mulx r13,rbp,r9
mov rdx,rcx
mulx r11,rcx,r12
mov r9,r12
mov [rsp + 176],r12
mov rdx,r10
mulx rdx,r8,r8
add r8,rbp
adc rdx,r13
add r8,r14
adc rdx,rsi
add r8,rcx
adc rdx,r11
add rbx,[rsp - 72]
adc rax,[rsp - 64]
add rbx,[rsp - 40]
adc rax,[rsp + 72]
add rbx,[rsp - 56]
adc rax,[rsp - 48]
sub rbx,r8
mov rsi,rbx
mov [rsp + 72],rbx
sbb rax,rdx
mov rcx,[rsp + 160]
add rcx,[rsp - 128]
adc r15,[rsp - 120]
add rcx,[rsp - 32]
adc r15,[rsp - 24]
add rcx,[rsp - 16]
adc r15,[rsp - 8]
add rcx,r8
mov [rsp + 160],rcx
adc r15,rdx
mov rdx,[rsp + 24]
mulx rdx,r8,[rsp + 40]
mov [rsp - 32],r8
mov [rsp - 128],rdx
mov rdx,[rsp + 96]
mulx rdx,r8,[rsp + 16]
mov [rsp - 24],r8
mov [rsp - 16],rdx
mov rdx,[rsp + 8]
mulx rdx,r8,[rsp - 96]
mov [rsp - 120],r8
mov [rsp - 8],rdx
mov rdx,[rsp]
mulx r13,r8,[rsp - 88]
mov r10,r15
shld r15,rcx,8
mov rdx,[rsp + 80]
mulx rcx,rdx,[rsp - 112]
mov [rsp + 64],rdx
mov [rsp - 64],rcx
mov rdx,[rsp - 104]
mulx rcx,rdx,[rsp + 32]
mov [rsp - 72],rdx
mov [rsp - 48],rcx
mov rdx,[rsp + 144]
mulx rcx,rdx,[rsp + 104]
mov [rsp - 56],rdx
mov [rsp - 40],rcx
mov rdx,[rsp + 48]
mulx rbx,rcx,[rsp + 136]
shr r10,56
mov [rsp - 112],r10
mov r10,rax
shld rax,rsi,8
mov rdx,[rsp + 128]
mulx r12,r14,[rsp - 80]
mov rdx,r9
mulx rbp,rsi,[rsp + 120]
mov rdx,[rsp + 88]
mulx rdx,r9,[rsp + 112]
mov [rsp + 56],rdx
mov rdx,[rsp + 168]
mulx rdx,r11,[rsp + 152]
shr r10,56
add r11,r14
adc rdx,r12
add r11,rsi
adc rdx,rbp
add r11,r9
adc rdx,[rsp + 56]
add rcx,[rsp + 64]
adc rbx,[rsp - 64]
add rcx,[rsp - 72]
adc rbx,[rsp - 48]
add rcx,[rsp - 56]
adc rbx,[rsp - 40]
sub rcx,r11
sbb rbx,rdx
add rcx,rax
adc rbx,r10
add r8,[rsp - 32]
adc r13,[rsp - 128]
add r8,[rsp - 24]
adc r13,[rsp - 16]
add r8,[rsp - 120]
adc r13,[rsp - 8]
add r8,r11
adc r13,rdx
add r8,r15
adc r13,[rsp - 112]
mov rsi,r13
shld r13,r8,8
mov al,56
bzhi rax,r8,rax
mov dl,56
mov [rsp - 8],rax
mov r14,rbx
shld rbx,rcx,8
bzhi rax,rcx,rdx
mov [rsp - 16],rax
mov rdx,[rsp + 96]
mulx rax,rcx,[rsp + 24]
mov [rsp - 24],rcx
mov [rsp - 120],rax
mov rdx,[rsp + 16]
mulx rax,rcx,[rsp - 96]
mov [rsp - 48],rcx
mov [rsp - 40],rax
mov rdx,[rsp + 8]
mulx rax,rcx,[rsp]
mov [rsp - 32],rcx
mov [rsp - 128],rax
mov rdx,[rsp - 80]
mulx r15,r8,[rsp - 88]
shr rsi,56
mov [rsp - 112],rsi
mov rdx,[rsp - 104]
mulx rax,rcx,[rsp + 80]
mov [rsp - 64],rcx
mov [rsp - 104],rax
mov rdx,[rsp + 32]
mulx rax,rcx,[rsp + 104]
mov [rsp + 56],rcx
mov [rsp + 64],rax
mov rdx,[rsp + 144]
mulx rax,rcx,[rsp + 48]
mov [rsp - 72],rcx
mov [rsp - 56],rax
mov rdx,[rsp + 40]
mulx r9,rcx,[rsp + 136]
mov rdx,[rsp + 176]
mulx rax,r11,[rsp + 128]
mov rdx,[rsp + 120]
mulx r12,rsi,[rsp + 112]
mov rdx,[rsp + 88]
mulx rdx,r10,[rsp + 168]
mov [rsp + 192],rdx
mov rdx,[rsp + 184]
mulx rdx,rbp,[rsp + 152]
shr r14,56
add rbp,rsi
adc rdx,r12
add rbp,r11
adc rdx,rax
add rbp,r10
adc rdx,[rsp + 192]
add rcx,[rsp + 56]
adc r9,[rsp + 64]
add rcx,[rsp - 64]
adc r9,[rsp - 104]
add rcx,[rsp - 72]
adc r9,[rsp - 56]
sub rcx,rbp
sbb r9,rdx
add rcx,rbx
adc r9,r14
add r8,[rsp - 48]
adc r15,[rsp - 40]
add r8,[rsp - 24]
adc r15,[rsp - 120]
add r8,[rsp - 32]
adc r15,[rsp - 128]
add r8,rbp
adc r15,rdx
add r8,r13
adc r15,[rsp - 112]
mov rsi,r15
shld r15,r8,8
mov al,56
bzhi rdx,r8,rax
mov [rsp - 104],rdx
mov r11,r9
shld r9,rcx,8
bzhi rax,rcx,rax
mov [rsp - 112],rax
mov rdx,[rsp + 24]
mulx rax,rcx,[rsp - 96]
mov [rsp - 128],rcx
mov [rsp - 120],rax
mov rdx,[rsp]
mulx rax,rcx,[rsp + 16]
mov [rsp],rcx
mov [rsp + 24],rax
mov rdx,[rsp + 8]
mulx rax,rcx,[rsp - 80]
mov [rsp + 16],rcx
mov [rsp - 96],rax
mov rdx,[rsp + 176]
mulx r10,rbx,[rsp - 88]
shr rsi,56
mov [rsp - 80],rsi
mov rdx,[rsp + 80]
mulx rax,rsi,[rsp + 104]
mov [rsp + 8],rax
mov rdx,[rsp + 48]
mulx rax,rcx,[rsp + 32]
mov [rsp + 32],rcx
mov [rsp + 48],rax
mov rdx,[rsp + 144]
mulx rax,rcx,[rsp + 40]
mov [rsp + 40],rcx
mov [rsp - 88],rax
mov rdx,[rsp + 96]
mulx rcx,r12,[rsp + 136]
mov rdx,[rsp + 128]
mulx r13,rax,[rsp + 112]
mov rdx,[rsp + 120]
mulx r8,rbp,[rsp + 168]
shr r11,56
add rbp,rax
adc r8,r13
mov rdx,[rsp + 88]
mulx rax,r13,[rsp + 184]
mov rdx,[rsp + 200]
mulx rdx,r14,[rsp + 152]
add rbp,r14
adc r8,rdx
add rbp,r13
adc r8,rax
add r12,rsi
adc rcx,[rsp + 8]
add r12,[rsp + 32]
adc rcx,[rsp + 48]
add r12,[rsp + 40]
adc rcx,[rsp - 88]
sub r12,rbp
sbb rcx,r8
add r12,r9
adc rcx,r11
add rbx,[rsp - 128]
adc r10,[rsp - 120]
add rbx,[rsp]
adc r10,[rsp + 24]
add rbx,[rsp + 16]
adc r10,[rsp - 96]
add rbx,rbp
adc r10,r8
mov rax,[rsp - 104]
mov [rdi + 16],rax
add rbx,r15
adc r10,[rsp - 80]
mov rax,[rsp - 112]
mov [rdi + 48],rax
mov rax,r10
shld r10,rbx,8
mov r9b,56
bzhi rsi,rbx,r9
mov rdx,rcx
shld rcx,r12,8
mov [rdi + 24],rsi
bzhi rsi,r12,r9
shr rax,56
shr rdx,56
bzhi r8,[rsp + 72],r9
add r8,r10
adc rax,0
mov [rdi + 56],rsi
add r8,rcx
adc rax,rdx
bzhi rsi,[rsp + 160],r9
add rsi,rcx
adc rdx,0
bzhi rcx,r8,r9
mov [rdi + 32],rcx
bzhi rcx,rsi,r9
mov [rdi],rcx
shld rax,r8,8
shld rdx,rsi,8
add rax,[rsp - 16]
add rdx,[rsp - 8]
mov [rdi + 40],rax
mov [rdi + 8],rdx
add rsp,208
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret