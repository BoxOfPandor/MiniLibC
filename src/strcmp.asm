;
; EPITECH PROJECT, 2024
; B-ASM-400-LIL-4-1-asmminilibc-thibault.pouch
; File description:
; strcmp.s
;

section .text
    global strcmp

strcmp:
    push rbp                ; Save base pointer
    mov rbp, rsp            ; Set base pointer to stack pointer

    test rdi, rdi           ; Check if first string is null
    jz .null_check
    test rsi, rsi           ; Check if second string is null
    jz .null_check

    xor rax, rax            ; Clear rax register
    xor rcx, rcx            ; Clear rcx register
    jmp .loop               ; Jump to loop

.null_check:
    mov rax, -1             ; Set return value to -1 if any string is null
    jmp .exit               ; Jump to exit

.loop:
    mov al, byte [rdi + rcx] ; Load byte from first string
    mov dl, byte [rsi + rcx] ; Load byte from second string

    cmp al, dl              ; Compare bytes
    jne .diff               ; Jump if different

    test al, al             ; Check if end of string
    jz .done                ; Jump if end of string

    inc rcx                 ; Increment index
    jmp .loop               ; Repeat loop

.diff:
    movzx rax, al           ; Zero-extend al to rax
    movzx rdx, dl           ; Zero-extend dl to rdx
    sub rax, rdx            ; Subtract bytes
    jmp .exit               ; Jump to exit

.done:
    xor rax, rax            ; Set return value to 0

.exit:
    mov rsp, rbp            ; Restore stack pointer
    pop rbp                 ; Restore base pointer
    ret                     ; Return from function