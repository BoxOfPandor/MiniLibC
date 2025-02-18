;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strchr.s
;

section .text
    global strchr

strchr:
    ; Initialize rax to 0 and set rcx to the starting address of the string (rdi)
    xor rax, rax
    mov rcx, rdi
    ; Move the character to search for into al
    mov al, sil

.loop:
    ; Load the current character from the string into dl
    mov dl, [rcx]
    ; Compare the current character with the target character
    cmp dl, al
    ; If they are equal, jump to .found
    je .found
    ; If the current character is null, jump to .not_found
    cmp dl, 0
    je .not_found
    ; Move to the next character in the string
    inc rcx
    ; Repeat the loop
    jmp .loop

.found:
    ; Set rax to the address of the found character
    mov rax, rcx
    ret

.not_found:
    ; Return 0 if the character is not found
    xor rax, rax
    ret
