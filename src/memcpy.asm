;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; memcpy.asm
;

section .text
    global memcpy

memcpy:
    push rbp
    mov rbp, rsp

    mov rcx, rdx        ; Third argument (length)
    mov rax, rdi        ; Save destination pointer for return

    cld                 ; Clear direction flag (forward)
    rep movsb           ; Repeat move byte operation

    pop rbp
    ret
