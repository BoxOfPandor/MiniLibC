;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strstr.asm
;

section .text
    global strstr

strstr:
    push rbp
    mov rbp, rsp
    push rdi        ; Save haystack
    push rsi        ; Save needle

outer_loop:
    mov al, [rsi]   ; First char of needle
    test al, al     ; If needle is empty
    jz found        ; Return haystack

    mov al, [rdi]   ; Current char of haystack
    test al, al     ; If end of haystack
    jz not_found    ; Return NULL

    mov rdx, rdi    ; Save current position
    mov rcx, rsi    ; Start of needle

inner_loop:
    mov al, [rcx]   ; Get char from needle
    test al, al     ; If end of needle
    jz found        ; Match found

    cmp al, [rdx]   ; Compare chars
    jne next_char   ; If different, try next position

    inc rdx         ; Next chars
    inc rcx
    jmp inner_loop

next_char:
    inc rdi         ; Move to next char in haystack
    jmp outer_loop

not_found:
    xor rax, rax    ; Return NULL
    jmp end

found:
    mov rax, rdi    ; Return current position

end:
    pop rsi
    pop rdi
    pop rbp
    ret