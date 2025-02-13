;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strcmp.s
;

section .text
    global strncmp

strncmp:
    push rbp
    mov rbp, rsp
    xor rax, rax
    xor rcx, rcx

    test rdx, rdx
    jz .done

.loop:
    cmp rcx, rdx
    je .done

    mov al, byte [rdi + rcx]
    mov r8b, byte [rsi + rcx]

    cmp al, r8b
    jne .diff

    test al, al
    jz .done

    inc rcx
    jmp .loop

.diff:
    movzx rax, al
    movzx r8, r8b
    sub rax, r8
    jmp .exit

.done:
    xor rax, rax

.exit:
    mov rsp, rbp
    pop rbp
    ret