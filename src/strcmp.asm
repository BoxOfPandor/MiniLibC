;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strcmp.s
;

section .text
    global strcmp

strcmp:
    push rbp
    mov rbp, rsp

    test rdi, rdi
    jz .null_check
    test rsi, rsi
    jz .null_check

    xor rax, rax
    xor rcx, rcx
    jmp .loop

.null_check:
    mov rax, -1
    jmp .exit

.loop:
    mov al, byte [rdi + rcx]
    mov dl, byte [rsi + rcx]

    cmp al, dl
    jne .diff

    test al, al
    jz .done

    inc rcx
    jmp .loop

.diff:
    movzx rax, al
    movzx rdx, dl
    sub rax, rdx
    jmp .exit

.done:
    xor rax, rax

.exit:
    mov rsp, rbp
    pop rbp
    ret