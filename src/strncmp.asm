;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strcmp.s
;

section .text
    global strncmp

strncmp:
    push rbp                ; Save base pointer
    mov rbp, rsp            ; Set base pointer to stack pointer
    xor rax, rax            ; Clear rax (used for return value)
    xor rcx, rcx            ; Clear rcx (used as index)

    test rdx, rdx           ; Check if n (rdx) is zero
    jz .done                ; If n is zero, jump to done

.loop:
    cmp rcx, rdx            ; Compare index (rcx) with n (rdx)
    je .done                ; If index equals n, jump to done

    mov al, byte [rdi + rcx] ; Load byte from string1 (rdi) at index rcx
    mov r8b, byte [rsi + rcx] ; Load byte from string2 (rsi) at index rcx

    cmp al, r8b             ; Compare the two bytes
    jne .diff               ; If they are different, jump to diff

    test al, al             ; Check if end of string (null terminator)
    jz .done                ; If end of string, jump to done

    inc rcx                 ; Increment index
    jmp .loop               ; Repeat loop

.diff:
    movzx rax, al           ; Zero-extend byte from string1 to rax
    movzx r8, r8b           ; Zero-extend byte from string2 to r8
    sub rax, r8             ; Subtract bytes to get difference
    jmp .exit               ; Jump to exit

.done:
    xor rax, rax            ; Set rax to zero (strings are equal or n is zero)

.exit:
    mov rsp, rbp            ; Restore stack pointer
    pop rbp                 ; Restore base pointer
    ret                     ; Return