;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; memmove.asm
;

section .text
    global memmove

memmove:
    push rbp
    mov rbp, rsp

    mov rax, rdi        ; Save destination pointer for return
    mov rcx, rdx        ; Length

    cmp rdi, rsi        ; Compare dest and src
    jae .reverse        ; If dest >= src, copy backwards

    cld                 ; Clear direction flag (forward)
    rep movsb           ; Copy bytes forward
    jmp .done

.reverse:
    lea rdi, [rdi + rcx - 1]  ; Point to last byte of dest
    lea rsi, [rsi + rcx - 1]  ; Point to last byte of src
    std                        ; Set direction flag (backward)
    rep movsb                 ; Copy bytes backward

.done:
    cld                 ; Clear direction flag (restore)
    pop rbp
    ret
