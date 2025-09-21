section .text
GLOBAL bls12_mul_vec_nasm
bls12_mul_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
sub rsp,240
mov qword [rsp - 88],r8
mov r10,qword [rdx]
mov rsi,rdx
mov qword [rsp + 16],rdx
mov r12,qword [r8]
mov r13,qword [r8 + 8]
mov r9,qword [r8 + 16]
mov rdx,r9
mov qword [rsp + 24],r9
mov r8,r10
mov qword [rsp - 8],r10
mulx rdx,r10,r10
mov qword [rsp - 120],rdx
mov rdx,r13
mov qword [rsp + 32],r13
mulx rax,r11,r8
mov rdx,r12
mov qword [rsp + 144],r12
mulx rcx,r15,r8
mov r8,-8506173809081122819
mov rdx,r15
imul rdx, r8
mov qword [rsp - 104],rdx
mov rbx,5532603552561700244
mov r8,r15
imul r8, rbx
mov r14,436827220531937283
mov rbx,r15
mov qword [rsp - 80],r15
imul rbx, r14
mov rsi,qword [rsi + 8]
mov qword [rsp + 136],rsi
mov rsi,2210141511517208575
mulx rsi,rsi,rsi
mov r14,-5044313057631688021
mulx rbp,rbp,r14
add rbp,rbx
adc rsi,r8
xor edx,edx
test r15,r15
setne dl
add rcx,r11
adc rax,r10
setb r11b
lea rbx,[rcx + rdx]
xor r10d,r10d
add rbp,rbx
setb r10b
add rcx,rdx
adc r10,rax
mov rdx,r9
mov r9,qword [rsp + 136]
mulx rax,rcx,r9
mov qword [rsp - 112],rax
mov rdx,r13
mulx r13,rbx,r9
mov rdx,r12
mulx rax,r15,r9
setb r14b
add rax,rbx
adc r13,rcx
setb byte [rsp - 72]
add r11b,255
mov rcx,qword [rsp - 88]
mov rdx,qword [rcx + 32]
mov qword [rsp - 96],rdx
mov r9,qword [rsp - 8]
mulx rdx,r11,r9
mov qword [rsp + 128],rdx
mov rdx,qword [rcx + 24]
mov qword [rsp],rdx
mulx rcx,rdx,r9
adc rdx,qword [rsp - 120]
adc rcx,r11
setb byte [rsp - 122]
xor ebx,ebx
mov r11,r10
add r11,rsi
setb bl
add r14b,255
adc rbx,rdx
setb byte [rsp - 120]
mov rdx,3064711249896130499
mov r14,qword [rsp - 80]
imul r14, rdx
cmp rsi,r8
mov r8,7435674573564081700
mov rdx,qword [rsp - 104]
mulx r12,r12,r8
adc r12,r14
xor r9d,r9d
add rbx,r12
setb r9b
mov rdx,rbp
add rdx,r15
adc r10,rsi
add rbp,r15
adc r11,rax
adc rbx,r13
setb r13b
mov r11,rbp
mov rdx,-8506173809081122819
imul r11, rdx
mov qword [rsp - 64],r11
mov rdx,r11
mov rsi,2210141511517208575
mulx r15,r15,rsi
mov r8,-5044313057631688021
mulx rdx,rdx,r8
add rax,r10
mov r11,rbp
mov r8,5532603552561700244
imul r11, r8
mov rsi,rbp
mov r8,436827220531937283
imul rsi, r8
add rsi,rdx
adc r15,r11
xor edx,edx
test rbp,rbp
mov qword [rsp - 16],rbp
setne dl
lea r10,[rax + rdx]
xor r8d,r8d
add rsi,r10
setb r8b
add rax,rdx
adc r8,rbx
setb al
add byte [rsp - 72],255
mov rdx,qword [rsp - 96]
mov rbx,qword [rsp + 136]
mulx rdx,r10,rbx
mov qword [rsp + 120],rdx
mov rdx,qword [rsp]
mulx rdx,rbx,rbx
adc rbx,qword [rsp - 112]
adc rdx,r10
mov qword [rsp + 112],rdx
setb byte [rsp + 192]
add byte [rsp - 120],255
adc r9,rcx
setb byte [rsp + 88]
mov rcx,2995800253092329851
mov r10,qword [rsp - 80]
imul r10, rcx
mov qword [rsp - 32],r10
cmp r12,r14
mov rcx,7239337960414712511
mov rdx,qword [rsp - 104]
mulx rcx,rcx,rcx
adc rcx,r10
mov qword [rsp - 40],rcx
xor r10d,r10d
add r9,rcx
setb r10b
add r13b,255
adc r9,rbx
setb byte [rsp - 24]
xor r12d,r12d
mov r13,r8
mov qword [rsp + 8],r15
add r13,r15
setb r12b
add al,255
adc r12,r9
setb byte [rsp - 48]
mov rax,3064711249896130499
imul rbp, rax
mov qword [rsp + 72],rbp
cmp r15,r11
mov r9,qword [rsp + 16]
mov r15,qword [r9 + 16]
mov rdx,qword [rsp - 64]
mov rax,7435674573564081700
mulx rax,rax,rax
adc rax,rbp
mov qword [rsp - 56],rax
xor r11d,r11d
add r12,rax
mov rdx,qword [rsp + 24]
mov qword [rsp + 152],r15
mulx rcx,rax,r15
mov qword [rsp + 40],rcx
mov rdx,qword [rsp + 32]
mulx rbp,rbx,r15
mov r14,qword [rsp + 144]
mov rdx,r14
mulx rcx,rdx,r15
setb r11b
mov r15,rsi
add r15,rdx
adc r8,qword [rsp + 8]
add rcx,rbx
adc rbp,rax
setb bl
mov r15,rsi
add r15,rdx
mov qword [rsp - 72],r15
lea r8,[r8 + rcx]
adc rcx,r13
adc rbp,r12
setb byte [rsp + 56]
mov rdx,r15
mov rax,-8506173809081122819
imul rdx, rax
mov qword [rsp - 120],rdx
mov rax,2210141511517208575
mulx r12,r12,rax
mov rax,-5044313057631688021
mulx rax,rax,rax
mov rsi,r15
mov rcx,5532603552561700244
imul rsi, rcx
mov rdx,r15
mov rcx,436827220531937283
imul rdx, rcx
add rdx,rax
mov r13,rdx
adc r12,rsi
xor ecx,ecx
test r15,r15
setne cl
lea rdx,[r8 + rcx]
xor eax,eax
add r13,rdx
mov qword [rsp - 112],r13
setb al
add r8,rcx
mov r9,qword [r9 + 24]
mov qword [rsp + 8],r9
mov rdx,qword [rsp + 24]
mulx rdx,rcx,r9
mov qword [rsp + 104],rdx
mov rdx,qword [rsp + 32]
mulx r15,r8,r9
mov rdx,r14
mulx r13,rdx,r9
mov qword [rsp + 48],rdx
adc rax,rbp
setb r14b
add r13,r8
adc r15,rcx
mov qword [rsp + 160],r15
setb byte [rsp + 96]
add bl,255
mov rdx,qword [rsp - 96]
mov r8,qword [rsp + 152]
mulx rdx,rcx,r8
mov qword [rsp + 208],rdx
mov rdx,qword [rsp]
mulx rdx,r8,r8
adc r8,qword [rsp + 40]
adc rdx,rcx
mov qword [rsp + 184],rdx
setb byte [rsp + 200]
movzx ebp,byte [rsp - 122]
mov ecx,ebp
add cl,255
mov r9,qword [rsp + 128]
mov rcx,r9
adc rcx,0
mov rcx,qword [rsp - 88]
mov rdx,qword [rcx + 40]
mov qword [rsp + 40],rdx
mulx rcx,rdx,qword [rsp - 8]
setb bl
add bpl,255
adc rdx,r9
movzx r9d,bl
adc r9,rcx
mov qword [rsp + 80],r9
add byte [rsp + 88],255
adc r10,rdx
setb byte [rsp + 176]
mov rcx,326064518108171314
mov r9,qword [rsp - 80]
imul r9, rcx
mov qword [rsp - 80],r9
mov rcx,qword [rsp - 40]
cmp rcx,qword [rsp - 32]
mov rcx,5412103778470702295
mov rdx,qword [rsp - 104]
mulx rcx,rcx,rcx
adc rcx,r9
mov qword [rsp + 168],rcx
xor ebp,ebp
add r10,rcx
setb bpl
add byte [rsp - 24],255
adc r10,qword [rsp + 112]
setb byte [rsp - 40]
add byte [rsp - 48],255
adc r11,r10
setb byte [rsp - 24]
mov r9,qword [rsp - 16]
mov rcx,2995800253092329851
imul r9, rcx
mov qword [rsp - 48],r9
mov rcx,qword [rsp - 56]
cmp rcx,qword [rsp + 72]
mov rdx,qword [rsp - 64]
mov rcx,7239337960414712511
mulx rcx,rcx,rcx
adc rcx,r9
mov qword [rsp + 64],rcx
xor r15d,r15d
add r11,rcx
setb r15b
add byte [rsp + 56],255
adc r11,r8
setb byte [rsp - 32]
xor ecx,ecx
mov r10,rax
add r10,r12
setb cl
add r14b,255
adc rcx,r11
setb byte [rsp - 56]
mov r8,qword [rsp - 72]
mov rdx,3064711249896130499
imul r8, rdx
mov qword [rsp + 56],r8
cmp r12,rsi
mov rdx,qword [rsp - 120]
mov rsi,7435674573564081700
mulx rbx,rbx,rsi
adc rbx,r8
mov r14,qword [rsp - 112]
mov r9,r14
mov r11,qword [rsp + 48]
add r9,r11
adc rax,r12
mov r12,r9
mov rdx,-8506173809081122819
imul r12, rdx
mov qword [rsp - 8],r12
mov rdx,r12
mov rsi,2210141511517208575
mulx r8,r8,rsi
mov rsi,-5044313057631688021
mulx rdx,rdx,rsi
mov r12,r9
mov rsi,5532603552561700244
imul r12, rsi
mov qword [rsp + 88],r12
mov rsi,436827220531937283
imul r9, rsi
add r9,rdx
adc r8,r12
xor r12d,r12d
add rcx,rbx
setb r12b
add r14,r11
mov qword [rsp - 112],r14
adc r10,r13
adc rcx,qword [rsp + 160]
lea rax,[rax + r13]
setb r11b
xor edx,edx
test r14,r14
setne dl
lea rsi,[rax + rdx]
xor r10d,r10d
add r9,rsi
mov qword [rsp - 88],r9
setb r10b
add rax,rdx
adc r10,rcx
mov rdx,qword [rsp - 96]
mov rax,qword [rsp + 8]
mulx rdx,rcx,rax
mov qword [rsp + 128],rdx
mov rdx,qword [rsp]
mulx rdx,rax,rax
setb byte [rsp + 48]
add byte [rsp + 96],255
adc rax,qword [rsp + 104]
adc rdx,rcx
mov qword [rsp + 112],rdx
setb byte [rsp - 122]
movzx r13d,byte [rsp + 192]
mov ecx,r13d
add cl,255
mov r9,qword [rsp + 120]
mov rcx,r9
adc rcx,0
mov rdx,qword [rsp + 40]
mulx rdx,rcx,qword [rsp + 136]
setb sil
add r13b,255
adc rcx,r9
movzx esi,sil
adc rsi,rdx
mov r13,rsi
mov qword [rsp + 104],rsi
add byte [rsp + 176],255
adc rbp,qword [rsp + 80]
setb sil
mov rdx,qword [rsp + 168]
cmp rdx,qword [rsp - 80]
mov r9,1873798617647539866
mov rdx,qword [rsp - 104]
mulx rdx,rdx,r9
adc rdx,0
add rdx,rbp
movzx esi,sil
adc rsi,r13
add byte [rsp - 40],255
adc rdx,rcx
adc rsi,0
mov qword [rsp + 96],rsi
add byte [rsp - 24],255
adc r15,rdx
setb byte [rsp + 72]
mov rcx,326064518108171314
mov rsi,qword [rsp - 16]
imul rsi, rcx
mov qword [rsp - 16],rsi
mov rcx,qword [rsp + 64]
cmp rcx,qword [rsp - 48]
mov rdx,qword [rsp - 64]
mov rcx,5412103778470702295
mulx rdx,rdx,rcx
adc rdx,rsi
mov qword [rsp + 168],rdx
xor ecx,ecx
add r15,rdx
setb cl
mov qword [rsp + 160],rcx
add byte [rsp - 32],255
adc r15,qword [rsp + 184]
setb byte [rsp - 40]
add byte [rsp - 56],255
adc r12,r15
setb byte [rsp - 24]
mov rsi,qword [rsp - 72]
mov rcx,2995800253092329851
imul rsi, rcx
mov qword [rsp - 48],rsi
cmp rbx,qword [rsp + 56]
mov rdx,qword [rsp - 120]
mov rcx,7239337960414712511
mulx rcx,rcx,rcx
adc rcx,rsi
mov qword [rsp - 56],rcx
xor r15d,r15d
add r12,rcx
setb r15b
add r11b,255
adc r12,rax
setb byte [rsp - 32]
xor eax,eax
mov r14,r10
add r14,r8
setb al
add byte [rsp + 48],255
adc rax,r12
mov rcx,qword [rsp + 16]
mov r12,qword [rcx + 32]
mov rdx,qword [rsp - 8]
mov rcx,7435674573564081700
mulx r9,r9,rcx
setb byte [rsp + 64]
mov r11,qword [rsp - 112]
mov rcx,3064711249896130499
imul r11, rcx
mov qword [rsp + 56],r11
mov rdx,qword [rsp + 144]
mulx r13,rsi,r12
cmp r8,qword [rsp + 88]
adc r9,r11
mov rbp,r9
mov qword [rsp + 216],r9
mov rcx,qword [rsp - 88]
mov r11,rcx
add r11,rsi
adc r10,r8
mov r9,r11
mov rdx,-8506173809081122819
imul r9, rdx
mov qword [rsp - 80],r9
mov rdx,r9
mov r8,2210141511517208575
mulx rbx,rbx,r8
mov r8,-5044313057631688021
mulx rdx,rdx,r8
mov r9,r11
mov r8,5532603552561700244
imul r9, r8
mov qword [rsp + 80],r9
mov r8,436827220531937283
imul r11, r8
add r11,rdx
mov qword [rsp - 104],r11
adc rbx,r9
mov qword [rsp + 48],rbx
xor r11d,r11d
add rax,rbp
mov rbx,qword [rsp + 24]
mov rdx,rbx
mulx rdx,r8,r12
mov qword [rsp + 120],rdx
mov rbp,qword [rsp + 32]
mov rdx,rbp
mulx rdx,r9,r12
setb r11b
add r9,r13
adc rdx,r8
setb r13b
add rcx,rsi
mov qword [rsp - 88],rcx
lea rsi,[r10 + r9]
adc r9,r14
adc rdx,rax
setb byte [rsp - 121]
xor eax,eax
test rcx,rcx
setne al
lea r9,[rsi + rax]
xor r8d,r8d
mov rcx,qword [rsp - 104]
add rcx,r9
setb r8b
add rsi,rax
adc r8,rdx
mov rax,qword [rsp + 16]
mov r9,qword [rax + 40]
mov qword [rsp + 16],r9
mov rdx,rbx
mulx rdx,rax,r9
mov qword [rsp + 184],rdx
mov rdx,rbp
mulx r10,rsi,r9
mov rdx,qword [rsp + 144]
mulx rdx,rbp,r9
setb byte [rsp - 104]
add rdx,rsi
mov qword [rsp + 224],rdx
adc r10,rax
mov qword [rsp + 232],r10
mov rdx,qword [rsp - 96]
mov qword [rsp + 136],r12
mulx rdx,rax,r12
mov qword [rsp + 144],rdx
mov rdx,qword [rsp]
mulx rdx,r12,r12
setb byte [rsp + 88]
add r13b,255
adc r12,qword [rsp + 120]
adc rdx,rax
mov qword [rsp + 192],rdx
setb byte [rsp + 120]
movzx r10d,byte [rsp + 200]
mov eax,r10d
add al,255
mov r9,qword [rsp + 208]
mov rax,r9
adc rax,0
mov rdx,qword [rsp + 40]
mulx rdx,rax,qword [rsp + 152]
setb sil
add r10b,255
adc rax,r9
movzx esi,sil
adc rsi,rdx
mov r9,rsi
mov qword [rsp + 176],rsi
mov rdx,qword [rsp - 64]
mov rsi,1873798617647539866
mulx rdx,rdx,rsi
add byte [rsp + 72],255
mov r10,qword [rsp + 96]
mov rbx,qword [rsp + 160]
adc rbx,r10
setb sil
mov r14,qword [rsp + 168]
cmp r14,qword [rsp - 16]
adc rdx,0
cmp r10,qword [rsp + 104]
mov r10,r9
adc r10,0
add rdx,rbx
movzx esi,sil
adc r10,rsi
add byte [rsp - 40],255
adc rdx,rax
adc r10,0
add byte [rsp - 24],255
adc r15,rdx
setb byte [rsp - 40]
mov rax,326064518108171314
mov rsi,qword [rsp - 72]
imul rsi, rax
mov qword [rsp - 72],rsi
mov rax,qword [rsp - 56]
cmp rax,qword [rsp - 48]
mov rdx,qword [rsp - 120]
mov rax,5412103778470702295
mulx rax,rax,rax
adc rax,rsi
mov qword [rsp - 56],rax
xor r14d,r14d
add r15,rax
setb r14b
add byte [rsp - 32],255
adc r15,qword [rsp + 112]
setb byte [rsp + 96]
add byte [rsp + 64],255
adc r11,r15
setb byte [rsp + 112]
mov r9,qword [rsp - 112]
mov rdx,2995800253092329851
imul r9, rdx
mov qword [rsp - 24],r9
mov rdx,qword [rsp + 216]
cmp rdx,qword [rsp + 56]
mov rdx,qword [rsp - 8]
mov rsi,7239337960414712511
mulx rdx,rdx,rsi
adc rdx,r9
mov qword [rsp - 48],rdx
xor r13d,r13d
add r11,rdx
setb r13b
add byte [rsp - 121],255
adc r11,r12
setb byte [rsp + 104]
xor r9d,r9d
mov r15,r8
mov rsi,qword [rsp + 48]
add r15,rsi
setb r9b
add byte [rsp - 104],255
adc r9,r11
setb byte [rsp - 32]
mov r11,qword [rsp - 88]
mov rdx,3064711249896130499
imul r11, rdx
mov qword [rsp + 72],r11
cmp rsi,qword [rsp + 80]
mov rbx,rsi
mov rdx,qword [rsp - 80]
mov rsi,7435674573564081700
mulx rax,rax,rsi
adc rax,r11
mov qword [rsp + 64],rax
mov r11,rcx
mov r12,rbp
add r11,rbp
adc r8,rbx
mov rdx,-8506173809081122819
imul rdx, r11
mov qword [rsp + 32],rdx
mov rsi,2210141511517208575
mulx rbp,rbp,rsi
mov rsi,-5044313057631688021
mulx rdx,rdx,rsi
mov rsi,5532603552561700244
imul rsi, r11
mov qword [rsp + 152],rsi
mov rbx,436827220531937283
imul r11, rbx
add r11,rdx
adc rbp,rsi
mov qword [rsp + 24],rbp
xor ebx,ebx
add r9,rax
setb bl
mov rax,rcx
add rax,r12
mov qword [rsp - 104],rax
mov rdx,qword [rsp + 224]
adc r15,rdx
adc r9,qword [rsp + 232]
lea rdx,[r8 + rdx]
setb byte [rsp + 80]
xor esi,esi
test rax,rax
setne sil
lea r8,[rdx + rsi]
xor r15d,r15d
add r11,r8
mov qword [rsp - 16],r11
setb r15b
add rdx,rsi
adc r15,r9
mov qword [rsp - 64],r15
mov rdx,qword [rsp - 96]
mov r8,qword [rsp + 16]
mulx rdx,rsi,r8
mov qword [rsp + 208],rdx
mov rdx,qword [rsp]
mulx rdx,r11,r8
setb byte [rsp - 96]
add byte [rsp + 88],255
adc r11,qword [rsp + 184]
adc rdx,rsi
mov qword [rsp + 200],rdx
setb byte [rsp]
movzx r15d,byte [rsp - 122]
mov edx,r15d
add dl,255
mov r9,qword [rsp + 128]
mov rdx,r9
adc rdx,0
mov rcx,qword [rsp + 40]
mov rdx,rcx
mulx rdx,rsi,qword [rsp + 8]
setb r8b
add r15b,255
adc rsi,r9
movzx ebp,r8b
adc rbp,rdx
mov rdx,qword [rsp - 120]
mov r8,1873798617647539866
mulx rdx,rdx,r8
add byte [rsp - 40],255
adc r14,r10
setb r9b
mov rax,qword [rsp - 56]
cmp rax,qword [rsp - 72]
adc rdx,0
cmp r10,qword [rsp + 176]
mov r8,rbp
adc r8,0
add rdx,r14
movzx eax,r9b
adc r8,rax
add byte [rsp + 96],255
adc rdx,rsi
adc r8,0
add byte [rsp + 112],255
adc r13,rdx
setb byte [rsp - 122]
mov rax,326064518108171314
mov rsi,qword [rsp - 112]
imul rsi, rax
mov qword [rsp - 112],rsi
mov rax,qword [rsp - 48]
cmp rax,qword [rsp - 24]
mov rdx,qword [rsp - 8]
mov rax,5412103778470702295
mulx r14,r14,rax
adc r14,rsi
xor r9d,r9d
add r13,r14
setb r9b
add byte [rsp + 104],255
adc r13,qword [rsp + 192]
setb byte [rsp + 128]
add byte [rsp - 32],255
adc rbx,r13
setb byte [rsp - 120]
mov r13,qword [rsp - 88]
mov rax,2995800253092329851
imul r13, rax
mov rax,qword [rsp + 64]
cmp rax,qword [rsp + 72]
mov r15,qword [rsp - 80]
mov rdx,r15
mov rax,7239337960414712511
mulx r12,r12,rax
adc r12,r13
xor r10d,r10d
add rbx,r12
setb r10b
add byte [rsp + 80],255
adc rbx,r11
setb byte [rsp + 8]
xor eax,eax
mov rdx,qword [rsp + 24]
add qword [rsp - 64],rdx
setb al
add byte [rsp - 96],255
adc rax,rbx
mov qword [rsp - 96],rax
setb byte [rsp - 72]
movzx r11d,byte [rsp + 120]
mov edx,r11d
add dl,255
mov rax,qword [rsp + 144]
mov rdx,rax
adc rdx,0
mov rdx,rcx
mulx rdx,rbx,qword [rsp + 136]
setb sil
add r11b,255
adc rbx,rax
movzx r11d,sil
adc r11,rdx
add byte [rsp - 122],255
adc r9,r8
setb sil
cmp r14,qword [rsp - 112]
mov rdx,qword [rsp - 8]
mov r14,1873798617647539866
mulx rdx,rdx,r14
adc rdx,0
cmp r8,rbp
mov r14,r11
adc r14,0
add rdx,r9
movzx esi,sil
adc r14,rsi
add byte [rsp + 128],255
adc rdx,rbx
adc r14,0
add byte [rsp - 120],255
adc r10,rdx
setb bl
mov rdx,326064518108171314
mov rax,qword [rsp - 88]
imul rax, rdx
mov qword [rsp - 88],rax
cmp r12,r13
mov rdx,r15
mov rsi,5412103778470702295
mulx r13,r13,rsi
adc r13,rax
xor r12d,r12d
add r10,r13
setb r12b
add byte [rsp + 8],255
adc r10,qword [rsp + 200]
setb bpl
mov r8,3064711249896130499
mov rcx,qword [rsp - 104]
imul r8, rcx
mov qword [rsp - 120],r8
mov rax,qword [rsp + 152]
cmp qword [rsp + 24],rax
mov rdx,qword [rsp + 32]
mov rsi,7435674573564081700
mulx r15,r15,rsi
adc r15,r8
xor r8d,r8d
add qword [rsp - 96],r15
setb r8b
add byte [rsp - 72],255
adc r8,r10
setb byte [rsp - 112]
movzx eax,byte [rsp]
mov edx,eax
add dl,255
mov r10,qword [rsp + 208]
mov rdx,r10
adc rdx,0
mov rdx,qword [rsp + 40]
mulx rdx,rsi,qword [rsp + 16]
setb r9b
add al,255
adc rsi,r10
movzx r9d,r9b
adc r9,rdx
add bl,255
adc r12,r14
setb r10b
cmp r13,qword [rsp - 88]
mov rdx,qword [rsp - 80]
mov rbx,1873798617647539866
mulx rbx,rbx,rbx
adc rbx,0
cmp r14,r11
mov r11,r9
adc r11,0
add rbx,r12
movzx edx,r10b
adc r11,rdx
add bpl,255
adc rbx,rsi
adc r11,0
mov rsi,2995800253092329851
imul rsi, rcx
cmp r15,qword [rsp - 120]
mov rdx,qword [rsp + 32]
mov r13,7239337960414712511
mulx rax,rax,r13
adc rax,rsi
mov r14,rsi
xor esi,esi
add r8,rax
setb sil
add byte [rsp - 112],255
adc rsi,rbx
setb r10b
mov rbx,326064518108171314
imul rcx, rbx
cmp rax,r14
mov rax,rdx
mov r13,5412103778470702295
mulx rdx,rdx,r13
adc rdx,rcx
xor ebx,ebx
add rsi,rdx
setb bl
add r10b,255
adc rbx,r11
setb r10b
xor r14d,r14d
cmp r11,r9
setb r14b
cmp rdx,rcx
mov rdx,rax
mov rbp,1873798617647539866
mulx rcx,rcx,rbp
adc rcx,0
add rcx,rbx
movzx r10d,r10b
adc r10,r14
xor r11d,r11d
mov rbx,qword [rsp - 64]
mov rdx,2210141511517208575
sub rbx,rdx
mov r14d,0
sbb r14,r14
mov rdx,qword [rsp - 16]
mov r9,-5044313057631688021
sub rdx,r9
mov r9,rbx
sbb r9,0
cmp rbx,r9
sbb r14,0
mov rax,qword [rsp - 96]
mov r15,rax
mov rbx,7435674573564081700
sub r15,rbx
mov r12d,0
sbb r12,r12
lea rbx,[r14 + r15]
cmp r15,rbx
sbb r12,0
mov r14,r8
mov r15,7239337960414712511
sub r14,r15
mov r15d,0
sbb r15,r15
add r12,r14
cmp r14,r12
sbb r15,0
mov r14,rsi
sub r14,r13
mov r13d,0
sbb r13,r13
add r15,r14
cmp r14,r15
sbb r13,0
mov r14,rcx
sub r14,rbp
sbb r11,r11
add r13,r14
cmp r14,r13
sbb r11,0
add r11,r10
cmp r10,r11
cmovb r9,qword [rsp - 64]
cmovae rax,rbx
cmovae r8,r12
cmovae rsi,r15
cmovb rdx,qword [rsp - 16]
mov qword [rdi],rdx
mov qword [rdi + 8],r9
mov qword [rdi + 16],rax
mov qword [rdi + 24],r8
mov qword [rdi + 32],rsi
cmovae rcx,r13
mov qword [rdi + 40],rcx
add rsp,240
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret