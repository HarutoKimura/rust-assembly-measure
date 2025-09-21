section .text
GLOBAL fiat_c_p448_solinas_carry_mul_vec_nasm
fiat_c_p448_solinas_carry_mul_vec_nasm:
push rbp
push r15
push r14
push r13
push r12
push rbx
sub rsp,736
mov r14,rdx
mov [rsp - 72],rsi
mov r8,[rsi + 56]
mov r10,[rdx + 56]
mov [rsp - 80],r10
mov rdx,r10
mulx rax,rcx,r8
mov [rsp + 24],rcx
mov [rsp + 152],rax
mov r9,[r14 + 48]
mov rdx,r9
mulx rax,rcx,r8
mov [rsp + 544],rcx
mov [rsp + 560],rax
mov rdx,[r14 + 40]
mov r13,rdx
mulx rax,rcx,r8
mov [rsp + 552],rcx
mov [rsp + 568],rax
mov r12,[rsi + 48]
mov rdx,r12
mulx rcx,rax,r10
mov [rsp - 8],rcx
mov [rsp - 128],rax
mulx rax,rcx,r9
mov [rsp + 360],rcx
mov [rsp + 368],rax
mov rbp,r9
mov [rsp - 88],r9
mov r15,[rsi + 40]
mov rdx,r15
mulx rax,rcx,r10
mov [rsp + 528],rcx
mov [rsp + 536],rax
mov r10,[r14 + 32]
mov rdx,r10
mov [rsp + 16],r8
mulx rax,rcx,r8
mov [rsp - 32],rcx
mov [rsp - 24],rax
mov rax,[r14 + 24]
mov rdx,rax
mulx rdx,rsi,r8
mov [rsp + 728],rsi
mov [rsp + 144],rdx
mov rbx,[r14 + 16]
mov rdx,rbx
mov [rsp + 56],rbx
mulx rdx,rsi,r8
mov [rsp + 128],rsi
mov [rsp - 16],rdx
mov rdx,[r14 + 8]
mov [rsp + 40],rdx
mulx rdx,rsi,r8
mov [rsp - 48],rsi
mov [rsp - 40],rdx
mov rdx,r12
mulx r9,rcx,r13
mov rdx,r10
mulx rdx,rsi,r12
mov [rsp + 720],rsi
mov [rsp + 136],rdx
mov rdx,rax
mov r8,rax
mov [rsp + 32],rax
mulx rdx,rsi,r12
mov [rsp + 712],rsi
mov [rsp + 120],rdx
mov rdx,rbx
mulx rdx,rsi,r12
mov [rsp - 56],rsi
mov [rsp + 520],rdx
mov rdx,r15
mulx rbp,rsi,rbp
add rsi,rcx
adc rbp,r9
add rsi,[rsp - 32]
adc rbp,[rsp - 24]
mov rbx,r15
mulx r9,rax,r13
mov [rsp + 448],rax
mov [rsp - 120],r10
mov rdx,r10
mulx rcx,rax,r15
mov [rsp + 104],rcx
mov [rsp - 32],rax
mov rdx,r8
mulx rcx,rax,r15
mov [rsp + 64],rcx
mov [rsp + 96],rax
mov r8,[rsp - 72]
mov rax,[r8 + 32]
mov rdx,rax
mov r15,[rsp - 80]
mulx rcx,rdx,r15
add rsi,rdx
mov [rsp - 104],rsi
adc rbp,rcx
mov [rsp - 96],rbp
mov rdx,rax
mov r11,[rsp - 88]
mulx rcx,rdx,r11
mov [rsp + 664],rdx
mov [rsp + 696],rcx
mov rdx,rax
mulx rcx,rdx,r13
mov rbp,r13
mov [rsp - 112],r13
mov [rsp + 112],rdx
mov [rsp - 24],rcx
mov rdx,rax
mulx rcx,rdx,r10
mov [rsp + 88],rdx
mov [rsp - 64],rcx
mov rcx,[r8 + 24]
mov rdx,rcx
mov r13,r15
mulx rdx,rsi,r15
mov [rsp + 680],rsi
mov [rsp + 704],rdx
mov rdx,rcx
mulx rdx,rsi,r11
mov [rsp + 488],rsi
mov [rsp + 504],rdx
mov rdx,rcx
mulx rdx,rsi,rbp
mov [rsp + 72],rsi
mov [rsp + 80],rdx
mov r15,[r14]
mov rbp,[r8 + 16]
mov rdx,rbp
mulx rdx,rsi,r13
mov r14,r13
mov [rsp + 496],rsi
mov [rsp + 512],rdx
mov rdx,rbp
mulx rdx,rsi,r11
mov [rsp + 328],rsi
mov [rsp + 336],rdx
mov r13,[r8 + 8]
mov rdx,r13
mulx rdx,rsi,r14
mov [rsp + 344],rsi
mov [rsp + 352],rdx
mov rdx,r15
mulx rdx,rsi,[rsp + 16]
mov [rsp + 248],rsi
mov [rsp + 256],rdx
mov rsi,[rsp + 40]
mov rdx,rsi
mulx rdx,r8,r12
mov [rsp + 224],r8
mov [rsp + 232],rdx
mov rdx,r15
mulx rdx,r11,r12
mov [rsp + 656],r11
mov [rsp + 672],rdx
mov r8,[rsp + 56]
mov rdx,r8
mulx r12,r11,rbx
mov rdx,rsi
mulx rdx,r14,rbx
mov [rsp + 608],r14
mov [rsp + 632],rdx
mov rdx,r15
mulx rdx,r14,rbx
mov [rsp + 472],r14
mov [rsp + 480],rdx
mov rdx,rax
mov rbx,[rsp + 32]
mulx rdx,r10,rbx
mov [rsp + 200],r10
mov [rsp + 216],rdx
mov rdx,rax
mulx rdx,r14,r8
mov r10,r8
mov [rsp + 624],r14
mov [rsp + 648],rdx
mov rdx,rax
mulx rdx,r14,rsi
mov [rsp + 424],r14
mov [rsp + 440],rdx
mov r8,rsi
mov r14,r15
mov rdx,r15
mulx rax,rdx,rax
mov [rsp + 312],rdx
mov [rsp + 320],rax
mov rdx,rcx
mov r15,[rsp - 120]
mulx rax,rdx,r15
mov [rsp + 192],rdx
mov [rsp + 208],rax
mov rdx,rcx
mulx rax,rdx,rbx
mov [rsp + 616],rdx
mov [rsp + 640],rax
mov rdx,rcx
mov rax,r10
mulx rdx,rsi,r10
mov [rsp + 416],rsi
mov [rsp + 432],rdx
mov rdx,rcx
mulx rdx,rsi,r8
mov [rsp + 296],rsi
mov [rsp + 304],rdx
mov rdx,r14
mov [rsp + 48],r14
mulx rcx,rdx,rcx
mov [rsp],rdx
mov [rsp + 8],rcx
mov rdx,rbp
mov r10,[rsp - 112]
mulx rcx,rdx,r10
mov [rsp + 176],rdx
mov [rsp + 184],rcx
mov rdx,rbp
mulx rcx,rdx,r15
mov [rsp + 592],rdx
mov [rsp + 600],rcx
mov rdx,rbp
mulx rcx,rdx,rbx
mov [rsp + 400],rdx
mov [rsp + 408],rcx
mov rdx,rbp
mulx rcx,rdx,rax
mov [rsp + 280],rdx
mov [rsp + 288],rcx
mov rsi,rax
mov rdx,rbp
mulx rcx,rax,r8
mov rdx,r14
mulx rdx,rbp,rbp
mov [rsp + 688],rbp
mov [rsp + 16],rdx
mov rdx,r13
mov r15,[rsp - 88]
mulx rdx,r14,r15
mov [rsp + 160],r14
mov [rsp + 168],rdx
mov rdx,r13
mulx rdx,r14,r10
mov [rsp + 576],r14
mov [rsp + 584],rdx
mov rdx,r13
mov rbx,[rsp - 120]
mulx rdx,r14,rbx
mov [rsp + 384],r14
mov [rsp + 392],rdx
mov rdx,r13
mov r10,[rsp + 32]
mulx rdx,r14,r10
mov [rsp + 264],r14
mov [rsp + 272],rdx
mov rdx,r13
mulx rdx,rbp,rsi
add rax,[rsp - 104]
adc rcx,[rsp - 96]
add rax,rbp
adc rcx,rdx
add rax,[rsp]
adc rcx,[rsp + 8]
mov rdx,[rsp - 72]
mov rsi,[rdx]
mov rdx,r13
mulx rdx,r14,r8
mov [rsp],r14
mov [rsp + 8],rdx
mov rdx,[rsp + 48]
mulx rdx,r14,r13
mov [rsp + 456],r14
mov [rsp + 464],rdx
mov rdx,rsi
mulx r13,rbp,[rsp - 80]
mulx rdx,r14,r15
mov [rsp - 88],r14
mov [rsp - 80],rdx
mov rdx,rsi
mulx rdx,r14,[rsp - 112]
mov [rsp + 376],r14
mov [rsp - 112],rdx
mov rdx,rsi
mulx rdx,r8,rbx
mov [rsp + 240],r8
mov [rsp - 120],rdx
mov rdx,rsi
mulx rdx,r15,r10
add rax,r15
adc rcx,rdx
shld rcx,rax,8
mov dl,56
bzhi rax,rax,rdx
mov [rsp - 72],rax
mov dl,56
add r11,[rsp + 224]
adc r12,[rsp + 232]
add r11,[rsp + 200]
adc r12,[rsp + 216]
add r11,[rsp - 104]
adc r12,[rsp - 96]
add r11,[rsp + 192]
adc r12,[rsp + 208]
add r11,[rsp + 176]
adc r12,[rsp + 184]
add r11,[rsp + 160]
adc r12,[rsp + 168]
add r11,[rsp + 248]
adc r12,[rsp + 256]
add r11,rbp
adc r12,r13
mov r13,[rsp + 152]
mov rax,[rsp + 24]
shld r13,rax,1
mov rax,[rsp + 544]
add [rsp - 128],rax
mov rax,[rsp + 560]
adc [rsp - 8],rax
mov r10,[rsp + 360]
add r10,[rsp + 552]
mov r8,[rsp + 368]
adc r8,[rsp + 568]
add r10,[rsp + 528]
adc r8,[rsp + 536]
shld r12,r11,8
bzhi rax,r11,rdx
mov [rsp - 96],rax
mov r11,r8
shld r11,r10,1
lea rax,[r10 + r10]
add rax,[rsp + 96]
adc r11,[rsp + 64]
add rax,[rsp - 56]
mov rbp,[rsp + 520]
adc r11,rbp
add rax,[rsp - 48]
adc r11,[rsp - 40]
add rax,[rsp + 88]
adc r11,[rsp - 64]
add rax,[rsp + 72]
adc r11,[rsp + 80]
add rax,[rsp + 296]
adc r11,[rsp + 304]
mov r15,[rsp + 328]
add rax,r15
mov rbx,[rsp + 336]
adc r11,rbx
add rax,[rsp + 280]
adc r11,[rsp + 288]
mov r14,[rsp + 344]
add rax,r14
mov rdx,[rsp + 352]
adc r11,rdx
add rax,[rsp + 264]
adc r11,[rsp + 272]
add rax,[rsp + 312]
adc r11,[rsp + 320]
add rax,[rsp + 240]
adc r11,[rsp - 120]
add rax,rcx
adc r11,0
add rax,r12
adc r11,0
shld r11,rax,8
mov cl,56
bzhi rax,rax,rcx
mov [rsp - 104],rax
add r10,[rsp + 96]
adc r8,[rsp + 64]
add r10,[rsp - 56]
adc r8,rbp
add r10,[rsp - 48]
adc r8,[rsp - 40]
add r10,[rsp + 88]
adc r8,[rsp - 64]
add r10,[rsp + 72]
adc r8,[rsp + 80]
add r10,r15
adc r8,rbx
add r10,r14
adc r8,rdx
mov rbx,r8
mov rdx,rsi
mulx rax,rcx,[rsp + 56]
mov [rsp - 48],rcx
mov [rsp - 40],rax
mulx rcx,rax,[rsp + 40]
mov [rsp - 64],rcx
mov [rsp - 56],rax
mulx rdx,rsi,[rsp + 48]
add r10,rsi
adc rbx,rdx
add r10,r12
adc rbx,0
mov r8,[rsp - 8]
mov rsi,r8
mov rax,[rsp - 128]
shld rsi,rax,1
lea r14,[rax + rax]
add r14,[rsp - 32]
adc rsi,[rsp + 104]
mov rbp,[rsp + 712]
add r14,rbp
adc rsi,[rsp + 120]
add r14,[rsp + 128]
adc rsi,[rsp - 16]
add r14,[rsp + 112]
adc rsi,[rsp - 24]
add r14,[rsp + 424]
adc rsi,[rsp + 440]
mov rcx,[rsp + 488]
add r14,rcx
mov rax,[rsp + 504]
adc rsi,rax
add r14,[rsp + 416]
adc rsi,[rsp + 432]
mov r12,[rsp + 496]
add r14,r12
mov r15,[rsp + 512]
adc rsi,r15
add r14,[rsp + 400]
adc rsi,[rsp + 408]
add r14,[rsp + 384]
adc rsi,[rsp + 392]
add r14,[rsp + 472]
adc rsi,[rsp + 480]
add r14,[rsp + 376]
adc rsi,[rsp - 112]
add r14,r11
adc rsi,0
shld rbx,r10,8
mov dl,56
bzhi rdx,r10,rdx
mov r10b,56
mov r11,[rsp - 128]
add r11,[rsp - 32]
adc r8,[rsp + 104]
add r11,rbp
adc r8,[rsp + 120]
add r11,[rsp + 128]
adc r8,[rsp - 16]
add r11,[rsp + 112]
adc r8,[rsp - 24]
add r11,rcx
adc r8,rax
add r11,r12
adc r8,r15
add r11,[rsp + 456]
adc r8,[rsp + 464]
add r11,[rsp - 56]
adc r8,[rsp - 64]
add r11,rbx
mov [rsp - 128],r11
adc r8,0
mov [rsp - 8],r8
shld rsi,r14,8
bzhi rax,r14,r10
mov [rsp - 16],rax
mov rax,[rsp + 24]
lea r10,[rax + rax]
mov rbx,[rsp + 448]
add r10,rbx
adc r13,r9
mov rbp,[rsp + 720]
add r10,rbp
adc r13,[rsp + 136]
mov r12,[rsp + 728]
add r10,r12
adc r13,[rsp + 144]
add r10,[rsp + 608]
adc r13,[rsp + 632]
mov r8,[rsp + 664]
add r10,r8
mov rcx,[rsp + 696]
adc r13,rcx
add r10,[rsp + 624]
adc r13,[rsp + 648]
mov r11,[rsp + 680]
add r10,r11
mov rax,[rsp + 704]
adc r13,rax
add r10,[rsp + 616]
adc r13,[rsp + 640]
add r10,[rsp + 592]
adc r13,[rsp + 600]
add r10,[rsp + 576]
adc r13,[rsp + 584]
add r10,[rsp + 656]
adc r13,[rsp + 672]
add r10,[rsp - 88]
adc r13,[rsp - 80]
add r10,rsi
adc r13,0
mov rsi,[rsp - 8]
mov r14,[rsp - 128]
shld rsi,r14,8
mov r15b,56
bzhi r14,r14,r15
mov [rsp - 128],r14
add rbx,[rsp + 24]
adc r9,[rsp + 152]
add rbx,rbp
adc r9,[rsp + 136]
add rbx,r12
adc r9,[rsp + 144]
add rbx,r8
adc r9,rcx
add rbx,r11
adc r9,rax
add rbx,[rsp]
adc r9,[rsp + 8]
add rbx,[rsp + 688]
adc r9,[rsp + 16]
add rbx,[rsp - 48]
adc r9,[rsp - 40]
add rbx,rsi
adc r9,0
shld r13,r10,8
add r13,[rsp - 96]
shld r9,rbx,8
add r9,[rsp - 72]
mov al,56
bzhi rcx,r9,rax
shr r9,56
add r9,[rsp - 104]
bzhi rsi,r13,rax
shr r13,56
add rdx,r13
add r9,r13
bzhi r11,r9,rax
shr r9,56
add r9,[rsp - 16]
bzhi r8,r10,rax
bzhi r10,rbx,rax
bzhi rbx,rdx,rax
shr rdx,56
add rdx,[rsp - 128]
mov [rdi],rbx
mov [rdi + 8],rdx
mov [rdi + 16],r10
mov [rdi + 24],rcx
mov [rdi + 32],r11
mov [rdi + 40],r9
mov [rdi + 48],r8
mov [rdi + 56],rsi
add rsp,736
pop rbx
pop r12
pop r13
pop r14
pop r15
pop rbp
ret