;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strcasecmp.asm
;

section .text
    global strcasecmp

strcasecmp:
    push rbp
    mov rbp, rsp
    xor rcx, rcx    ; Initialize counter

compare_loop:
    movzx rax, byte [rdi + rcx]    ; Load char from first string
    movzx rdx, byte [rsi + rcx]    ; Load char from second string

    ; Convert to lowercase if uppercase
    cmp rax, 'A'
    jl skip_first
    cmp rax, 'Z'
    jg skip_first
    add rax, 32
skip_first:
    cmp rdx, 'A'
    jl skip_second
    cmp rdx, 'Z'
    jg skip_second
    add rdx, 32
skip_second:

    ; Compare characters
    sub rax, rdx
    jnz end         ; If not equal, we're done

    ; Check if we've reached end of string
    cmp byte [rdi + rcx], 0
    je end
    cmp byte [rsi + rcx], 0
    je end

    inc rcx
    jmp compare_loop

end:
    pop rbp
    ret