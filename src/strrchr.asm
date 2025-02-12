;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strrchr.s
;

section .text
    global strrchr

strrchr:
    xor rax, rax
    mov rcx, rdi
    mov r8, 0
    mov al, sil

.loop:
    mov dl, [rcx]
    cmp dl, al
    jne .continue
    mov r8, rcx

.continue:
    cmp dl, 0
    je .done
    inc rcx
    jmp .loop

.done:
    mov rax, r8
    ret
