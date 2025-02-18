;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strpbrk.asm
;

section .text
    global strpbrk

strpbrk:
    push rbp
    mov rbp, rsp

outer_loop:
    movzx rax, byte [rdi]    ; Load char from string
    test al, al              ; Check for end of string
    jz not_found            ; If end, return NULL

    push rdi                ; Save current position
    mov rdx, rsi            ; Load accept string address

inner_loop:
    movzx rcx, byte [rdx]   ; Load char from accept
    test cl, cl             ; Check for end of accept
    jz next_char           ; If end, check next char in string

    cmp al, cl             ; Compare chars
    je found              ; If match found

    inc rdx                ; Move to next char in accept
    jmp inner_loop

next_char:
    pop rdi
    inc rdi                ; Move to next char in string
    jmp outer_loop

not_found:
    xor rax, rax          ; Return NULL
    jmp end

found:
    pop rdi
    mov rax, rdi          ; Return pointer to matching char

end:
    pop rbp
    ret