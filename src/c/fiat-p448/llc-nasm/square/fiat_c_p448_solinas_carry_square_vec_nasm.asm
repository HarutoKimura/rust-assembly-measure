section .text
GLOBAL fiat_c_p448_solinas_carry_square_vec_nasm
fiat_c_p448_solinas_carry_square_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
sub rsp,336
mov rdx,[rsi + 56]
lea r9,[rdx + rdx]
mov rcx,[rsi + 48]
lea r11,[rcx + rcx]
mov rax,[rsi + 40]
mulx rdx,r8,rdx
mov [rsp - 56],r8
mov [rsp - 48],rdx
mov rdx,rcx
mulx rdx,r8,r9
mov [rsp - 72],r8
mov [rsp - 64],rdx
mov rdx,rcx
mulx rcx,rdx,rcx
mov [rsp - 104],rdx
mov [rsp - 96],rcx
mov rdx,rax
mov r10,r9
mulx rcx,rdx,r9
mov [rsp - 128],rdx
mov [rsp - 120],rcx
mov rdx,rax
mulx rcx,r8,r11
mulx rdx,r9,rax
mov [rsp + 320],r9
mov [rsp + 328],rdx
mov rdx,[rsi + 32]
mulx r15,rbp,r10
mov r14,r10
add rbp,r8
adc r15,rcx
lea r12,[rax + rax]
mov r8,r11
mov [rsp - 112],r11
mulx r11,rax,r11
mov [rsp + 312],rax
mulx rax,rcx,r12
mov [rsp + 208],rcx
mov [rsp + 216],rax
mulx rax,rcx,rdx
mov [rsp + 104],rcx
mov [rsp + 112],rax
lea rbx,[rdx + rdx]
mov rdx,[rsi + 24]
mulx rax,rcx,r10
mov [rsp + 296],rcx
mov [rsp + 304],rax
mulx rax,rcx,r8
mov [rsp + 192],rcx
mov [rsp + 200],rax
mulx r10,r13,r12
mulx rax,rcx,rbx
mov [rsp + 16],rcx
mov [rsp + 24],rax
mov r8,[rsi + 16]
mov rax,[rsi]
mov [rsp - 40],rax
mov rcx,[rsi + 8]
lea rsi,[rdx + rdx]
mulx rdx,r9,rdx
mov [rsp + 272],r9
mov [rsp + 288],rdx
mov rdx,r8
mov [rsp - 88],r14
mulx rdx,r9,r14
mov [rsp + 160],r9
mov [rsp + 176],rdx
mov rdx,r8
mov rax,[rsp - 112]
mulx r9,rdx,rax
mov [rsp + 96],r9
mov [rsp - 80],rdx
mov rdx,r8
mulx rdx,r9,r12
mov [rsp],r9
mov [rsp + 8],rdx
mov rdx,r8
mulx rdx,r9,rbx
mov [rsp + 248],r9
mov [rsp + 256],rdx
mov rdx,r8
mulx rdx,r9,rsi
mov [rsp + 168],r9
mov [rsp + 184],rdx
lea r9,[r8 + r8]
mov [rsp + 120],r9
mov rdx,r8
mulx rdx,r8,r8
mov [rsp + 64],r8
mov [rsp + 80],rdx
mov rdx,rcx
mulx rdx,r8,r14
mov [rsp + 72],r8
mov [rsp + 88],rdx
mov rdx,rcx
mulx rdx,r8,rax
mov [rsp - 16],r8
mov [rsp - 8],rdx
mov rdx,rcx
mulx rdx,r8,r12
mov [rsp + 232],r8
mov [rsp + 240],rdx
mov rdx,rcx
mulx rdx,r8,rbx
mov [rsp + 144],r8
mov [rsp + 152],rdx
mov rdx,rcx
mulx rdx,r8,rsi
mov [rsp + 48],r8
mov [rsp + 56],rdx
mov rdx,rcx
mulx r14,r8,r9
mulx rdx,r9,rcx
mov [rsp + 264],r9
mov [rsp + 280],rdx
mov rax,[rsp - 40]
mov rdx,rax
mulx rdx,r9,[rsp - 88]
mov [rsp - 32],r9
mov [rsp - 24],rdx
mov rdx,rax
mulx rdx,r9,[rsp - 112]
mov [rsp + 224],r9
mov [rsp - 88],rdx
mov rdx,rax
mulx rdx,r9,r12
mov [rsp + 128],r9
mov [rsp + 136],rdx
mov rdx,rax
mulx rdx,r9,rbx
mov [rsp + 32],r9
mov [rsp + 40],rdx
mov rdx,rax
mulx rdx,rsi,rsi
add r8,rbp
adc r14,r15
add r8,rsi
adc r14,rdx
shld r14,r8,8
mov dl,56
bzhi rdx,r8,rdx
mov bl,56
mov [rsp - 112],rdx
add rbp,[rsp + 16]
adc r15,[rsp + 24]
add rbp,[rsp]
adc r15,[rsp + 8]
add rbp,[rsp - 16]
adc r15,[rsp - 8]
add rbp,[rsp - 32]
adc r15,[rsp - 24]
mov r8,[rsp - 48]
mov rdx,[rsp - 56]
shld r8,rdx,1
mov r12,[rsp - 64]
mov rdx,[rsp - 72]
shld r12,rdx,1
mov r9,[rsp - 128]
add r9,[rsp - 104]
mov [rsp - 128],r9
mov rsi,[rsp - 120]
adc rsi,[rsp - 96]
mov [rsp - 120],rsi
shld r15,rbp,8
shld rsi,r9,1
bzhi rdx,rbp,rbx
mov [rsp - 96],rdx
add r13,[rsp + 104]
adc r10,[rsp + 112]
lea rdx,[r9 + r9]
add rdx,r13
adc rsi,r10
add rdx,[rsp - 80]
mov rbp,[rsp + 96]
adc rsi,rbp
add rdx,[rsp + 64]
adc rsi,[rsp + 80]
mov r9,[rsp + 72]
add rdx,r9
mov rbx,[rsp + 88]
adc rsi,rbx
add rdx,[rsp + 48]
adc rsi,[rsp + 56]
add rdx,[rsp + 32]
adc rsi,[rsp + 40]
add rdx,r14
adc rsi,0
add rdx,r15
adc rsi,0
shld rsi,rdx,8
mov r14b,56
bzhi rdx,rdx,r14
mov [rsp - 104],rdx
add r13,[rsp - 128]
adc r10,[rsp - 120]
add r13,[rsp - 80]
adc r10,rbp
add r13,r9
adc r10,rbx
lea rbx,[rcx + rcx]
mov rdx,rax
mulx rcx,rdx,[rsp + 120]
mov [rsp - 128],rdx
mov [rsp - 120],rcx
mov rdx,rax
mulx rbx,r14,rbx
mulx rax,rdx,rax
add r13,rdx
adc r10,rax
add r13,r15
adc r10,0
mov rcx,[rsp + 192]
add rcx,[rsp + 208]
mov rbp,[rsp + 200]
adc rbp,[rsp + 216]
add rcx,[rsp + 160]
adc rbp,[rsp + 176]
mov r15,[rsp - 72]
lea rdx,[r15 + r15]
add rdx,rcx
adc r12,rbp
add rdx,[rsp + 168]
adc r12,[rsp + 184]
add rdx,[rsp + 144]
adc r12,[rsp + 152]
add rdx,[rsp + 128]
adc r12,[rsp + 136]
add rdx,rsi
adc r12,0
shld r10,r13,8
mov r9b,56
bzhi rax,r13,r9
add rcx,r15
adc rbp,[rsp - 64]
add rcx,r14
adc rbp,rbx
add rcx,r10
adc rbp,0
shld r12,rdx,8
bzhi rdx,rdx,r9
mov r14,[rsp + 312]
add r14,[rsp + 320]
adc r11,[rsp + 328]
add r14,[rsp + 296]
adc r11,[rsp + 304]
mov rbx,[rsp - 56]
lea rsi,[rbx + rbx]
add rsi,r14
adc r8,r11
add rsi,[rsp + 272]
adc r8,[rsp + 288]
add rsi,[rsp + 248]
adc r8,[rsp + 256]
add rsi,[rsp + 232]
adc r8,[rsp + 240]
add rsi,[rsp + 224]
adc r8,[rsp - 88]
add rsi,r12
adc r8,0
shld rbp,rcx,8
mov r15b,56
bzhi r10,rcx,r15
add r14,rbx
adc r11,[rsp - 48]
add r14,[rsp + 264]
adc r11,[rsp + 280]
add r14,[rsp - 128]
adc r11,[rsp - 120]
add r14,rbp
adc r11,0
shld r8,rsi,8
add r8,[rsp - 96]
shld r11,r14,8
add r11,[rsp - 112]
bzhi rcx,r11,r15
shr r11,56
add r11,[rsp - 104]
bzhi r9,r8,r15
shr r8,56
add rax,r8
add r11,r8
bzhi r8,r11,r15
shr r11,56
add r11,rdx
bzhi rdx,rsi,r15
bzhi rsi,r14,r15
bzhi rbx,rax,r15
shr rax,56
add rax,r10
mov [rdi],rbx
mov [rdi + 8],rax
mov [rdi + 16],rsi
mov [rdi + 24],rcx
mov [rdi + 32],r8
mov [rdi + 40],r11
mov [rdi + 48],rdx
mov [rdi + 56],r9
add rsp,336
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret