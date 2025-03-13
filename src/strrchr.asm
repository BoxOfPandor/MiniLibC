;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strrchr.s
;

section .text
    global strrchr
    global rindex

rindex:
strrchr:
    ; Initialize registers
    xor rax, rax
    mov rcx, rdi
    mov r8, 0
    mov al, sil

.loop:
    ; Compare each byte of the string with the target character
    mov dl, [rcx]
    cmp dl, al
    jne .continue
    ; If match, store the address in r8
    mov r8, rcx

.continue:
    ; Check for end of string
    cmp dl, 0
    je .done
    ; Move to the next character
    inc rcx
    jmp .loop

.done:
    ; Return the last occurrence or NULL if not found
    mov rax, r8
    ret
