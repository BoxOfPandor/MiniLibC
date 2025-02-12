;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strchr.s
;

section .text
    global strchr

strchr:
    xor rax, rax
    mov rcx, rdi
    mov al, sil

.loop:
    mov dl, [rcx]
    cmp dl, al
    je .found
    cmp dl, 0
    je .not_found
    inc rcx
    jmp .loop

.found:
    mov rax, rcx
    ret

.not_found:
    xor rax, rax
    ret
