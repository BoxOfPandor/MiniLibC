;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; memset.asm
;

section .text
    global memset

memset:
    push rbp            ; Save base pointer
    mov rbp, rsp

    mov rax, rsi       ; Second argument (value) to set
    mov rcx, rdx       ; Third argument (length)
    mov rdi, rdi       ; First argument (destination pointer)

    cld               ; Clear direction flag (forward)
    rep stosb         ; Repeat store byte operation

    mov rax, rdi      ; Return pointer to destination
    sub rax, rdx      ; Adjust pointer back to start

    pop rbp
    ret
