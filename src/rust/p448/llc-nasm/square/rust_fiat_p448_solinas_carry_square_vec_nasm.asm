section .text
GLOBAL rust_fiat_p448_solinas_carry_square_vec_nasm
rust_fiat_p448_solinas_carry_square_vec_nasm:
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
lea r15,[rcx + rcx]
mov rax,[rsi + 40]
mulx rdx,r8,rdx
mov [rsp - 16],r8
mov [rsp - 8],rdx
mov rdx,rcx
mulx rdx,r8,r9
mov [rsp - 32],r8
mov [rsp - 24],rdx
mov rdx,rcx
mulx rcx,rdx,rcx
mov [rsp - 96],rdx
mov [rsp - 88],rcx
mov rdx,rax
mov r10,r9
mulx rbp,r12,r9
mulx rcx,r8,r15
mulx rdx,r9,rax
mov [rsp + 320],r9
mov [rsp + 328],rdx
mov rdx,[rsi + 32]
mulx rbx,r13,r10
mov r9,r10
add r13,r8
adc rbx,rcx
mov [rsp],rbx
lea r10,[rax + rax]
mulx r11,rax,r15
mov [rsp + 296],rax
mulx rax,rcx,r10
mov [rsp + 208],rcx
mov [rsp + 216],rax
mulx rax,rcx,rdx
mov [rsp + 64],rcx
mov [rsp + 80],rax
lea rbx,[rdx + rdx]
mov rdx,[rsi + 24]
mulx rax,rcx,r9
mov [rsp + 304],rcx
mov [rsp + 312],rax
mulx rax,rcx,r15
mov [rsp + 192],rcx
mov [rsp + 200],rax
mulx rcx,rax,r10
mov [rsp + 56],rcx
mov [rsp - 40],rax
mulx rax,rcx,rbx
mov [rsp - 104],rcx
mov [rsp - 128],rax
mov r8,[rsi + 16]
mov rax,[rsi]
mov rcx,[rsi + 8]
lea r14,[rdx + rdx]
mulx rdx,rsi,rdx
mov [rsp + 264],rsi
mov [rsp + 272],rdx
mov rdx,r8
mov [rsp - 120],r9
mulx rdx,rsi,r9
mov [rsp + 176],rsi
mov [rsp + 184],rdx
mov rdx,r8
mulx rdx,rsi,r15
mov [rsp - 80],r15
mov [rsp - 56],rsi
mov [rsp - 48],rdx
mov rdx,r8
mulx rdx,rsi,r10
mov [rsp + 40],rsi
mov [rsp + 48],rdx
mov rdx,r8
mulx rdx,rsi,rbx
mov [rsp + 248],rsi
mov [rsp + 256],rdx
mov rdx,r8
mov r9,r14
mulx rdx,rsi,r14
mov [rsp + 160],rsi
mov [rsp + 168],rdx
lea r14,[r8 + r8]
mov [rsp - 112],r14
mov rdx,r8
mulx rdx,rsi,r8
mov [rsp + 112],rsi
mov [rsp + 120],rdx
mov rdx,rcx
mulx rdx,rsi,[rsp - 120]
mov [rsp - 72],rsi
mov [rsp - 64],rdx
mov rdx,rcx
mulx rdx,rsi,r15
mov [rsp + 24],rsi
mov [rsp + 32],rdx
mov rdx,rcx
mulx rdx,rsi,r10
mov [rsp + 232],rsi
mov [rsp + 240],rdx
mov rdx,rcx
mulx rdx,rsi,rbx
mov [rsp + 144],rsi
mov [rsp + 152],rdx
mov rdx,rcx
mulx rdx,rsi,r9
mov [rsp + 96],rsi
mov [rsp + 104],rdx
mov rdx,rcx
mulx rsi,r8,r14
mulx rdx,r15,rcx
mov [rsp + 280],r15
mov [rsp + 288],rdx
mov rdx,rax
mulx rdx,r15,[rsp - 120]
mov [rsp + 8],r15
mov [rsp + 16],rdx
mov rdx,rax
mulx rdx,r15,[rsp - 80]
mov [rsp + 224],r15
mov [rsp - 80],rdx
mov rdx,rax
mulx rdx,r10,r10
mov [rsp + 128],r10
mov [rsp + 136],rdx
mov rdx,rax
mulx rdx,r10,rbx
mov [rsp + 72],r10
mov [rsp + 88],rdx
mov rdx,rax
mulx rdx,r9,r9
add r8,r13
mov r14,[rsp]
adc rsi,r14
add r8,r9
adc rsi,rdx
shld rsi,r8,8
mov dl,56
bzhi rdx,r8,rdx
mov [rsp - 120],rdx
add r13,[rsp - 104]
adc r14,[rsp - 128]
add r13,[rsp + 40]
adc r14,[rsp + 48]
add r13,[rsp + 24]
adc r14,[rsp + 32]
add r13,[rsp + 8]
adc r14,[rsp + 16]
mov r8,[rsp - 8]
mov rdx,[rsp - 16]
shld r8,rdx,1
mov r10,[rsp - 24]
mov rdx,[rsp - 32]
shld r10,rdx,1
add r12,[rsp - 96]
adc rbp,[rsp - 88]
add rcx,rcx
mov rdx,rax
mulx rdx,r9,[rsp - 112]
mov [rsp - 96],r9
mov [rsp - 88],rdx
mov rdx,rax
mulx rcx,rdx,rcx
mov [rsp - 112],rdx
mov [rsp - 104],rcx
mov rdx,rax
mulx rax,rcx,rax
mov [rsp - 128],rax
mov r9,[rsp + 64]
mov rdx,r9
add rdx,r12
mov r15,[rsp + 80]
mov rax,r15
adc rax,rbp
add rdx,[rsp - 40]
mov rbx,[rsp + 56]
adc rax,rbx
add rdx,[rsp - 56]
adc rax,[rsp - 48]
add rdx,[rsp - 72]
adc rax,[rsp - 64]
add rdx,rcx
adc rax,[rsp - 128]
shld r14,r13,8
mov cl,56
bzhi rcx,r13,rcx
mov [rsp - 128],rcx
add r12,r12
adc rbp,rbp
add r12,r9
adc rbp,r15
add r12,[rsp - 40]
adc rbp,rbx
add r12,[rsp - 56]
adc rbp,[rsp - 48]
add r12,[rsp + 112]
adc rbp,[rsp + 120]
add r12,[rsp - 72]
adc rbp,[rsp - 64]
add r12,[rsp + 96]
adc rbp,[rsp + 104]
add r12,[rsp + 72]
adc rbp,[rsp + 88]
add r12,rsi
adc rbp,0
add r12,r14
adc rbp,0
shld rbp,r12,8
mov cl,56
bzhi r13,r12,rcx
add r14,rdx
adc rax,0
mov rbx,[rsp + 192]
add rbx,[rsp + 208]
mov r15,[rsp + 200]
adc r15,[rsp + 216]
mov r9,[rsp - 32]
lea rdx,[r9 + r9]
add rdx,rbx
adc r10,r15
mov rcx,[rsp + 176]
add rdx,rcx
mov r12,[rsp + 184]
adc r10,r12
add rdx,[rsp + 160]
adc r10,[rsp + 168]
add rdx,[rsp + 144]
adc r10,[rsp + 152]
add rdx,[rsp + 128]
adc r10,[rsp + 136]
add rdx,rbp
adc r10,0
shld rax,r14,8
mov bpl,56
bzhi rsi,r14,rbp
add rbx,r9
adc r15,[rsp - 24]
add rbx,rcx
adc r15,r12
add rbx,[rsp - 112]
adc r15,[rsp - 104]
add rbx,rax
mov rax,rbx
adc r15,0
shld r10,rdx,8
bzhi r12,rdx,rbp
mov dl,56
mov rbx,[rsp + 296]
add rbx,[rsp + 320]
adc r11,[rsp + 328]
mov r9,[rsp - 16]
lea rcx,[r9 + r9]
add rcx,rbx
adc r8,r11
mov rbp,[rsp + 304]
add rcx,rbp
mov r14,[rsp + 312]
adc r8,r14
add rcx,[rsp + 264]
adc r8,[rsp + 272]
add rcx,[rsp + 248]
adc r8,[rsp + 256]
add rcx,[rsp + 232]
adc r8,[rsp + 240]
add rcx,[rsp + 224]
adc r8,[rsp - 80]
add rcx,r10
adc r8,0
shld r15,rax,8
bzhi rdx,rax,rdx
add rbx,r9
adc r11,[rsp - 8]
add rbx,rbp
adc r11,r14
add rbx,[rsp + 280]
adc r11,[rsp + 288]
add rbx,[rsp - 96]
adc r11,[rsp - 88]
add rbx,r15
adc r11,0
shld r8,rcx,8
add r8,[rsp - 128]
shld r11,rbx,8
add r11,[rsp - 120]
mov r14b,56
bzhi r9,r11,r14
shr r11,56
add r11,r13
bzhi r10,r8,r14
shr r8,56
add rsi,r8
add r11,r8
bzhi r8,r11,r14
shr r11,56
add r11,r12
bzhi rax,rcx,r14
bzhi rcx,rbx,r14
bzhi rbx,rsi,r14
shr rsi,56
add rsi,rdx
mov [rdi],rbx
mov [rdi + 8],rsi
mov [rdi + 16],rcx
mov [rdi + 24],r9
mov [rdi + 32],r8
mov [rdi + 40],r11
mov [rdi + 48],rax
mov [rdi + 56],r10
add rsp,336
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret