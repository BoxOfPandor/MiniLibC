;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strcspn.asm
;

section .text
    global strcspn

strcspn:
    push rbp
    mov rbp, rsp
    xor rcx, rcx        ; Initialize counter

count_loop:
    movzx rax, byte [rdi + rcx]    ; Load char from string
    test al, al                    ; Check for end of string
    jz end                         ; If end, return count

    push rcx                       ; Save counter
    mov rdx, rsi                   ; Load reject string address

check_reject:
    movzx r8, byte [rdx]          ; Load char from reject
    test r8b, r8b                 ; Check for end of reject
    jz next_char                  ; If end, char is not in reject

    cmp al, r8b                   ; Compare chars
    je found                      ; If match found

    inc rdx                       ; Move to next char in reject
    jmp check_reject

next_char:
    pop rcx
    inc rcx                       ; Increment counter
    jmp count_loop

found:
    pop rcx                       ; Return current count

end:
    mov rax, rcx                 ; Return count
    pop rbp
    ret