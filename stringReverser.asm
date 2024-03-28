section .data
    inputString db 'Hello, World!',0    ; Null-terminated string
    reversedString resb 14              ; Reserve buffer for reversed string, including null terminator
    msg db 'Reversed String: ', 0

section .text
    global _start

_start:
    ; Calculate the length of the string excluding the null terminator
    mov rdi, inputString       ; RDI points to the input string
    mov rcx, 0                 ; RCX will count the length
count_length:
    mov al, [rdi + rcx]        ; Load the next byte of the string into AL
    test al, al                ; Check if it's the null terminator
    jz reverse_string          ; If it is, we've found the length
    inc rcx                    ; Increase length counter
    jmp count_length           ; Check next character

reverse_string:
    dec rcx                    ; Adjust count for zero-based indexing
    mov rsi, rcx               ; RSI will point to the end of the string
    xor rdi, rdi               ; RDI will point to the beginning of the string

reverse_loop:
    mov al, [inputString + rsi]   ; Load from the end
    mov bl, [inputString + rdi]   ; Load from the beginning
    mov [reversedString + rdi], al ; Store at the beginning
    mov [reversedString + rsi], bl ; Store at the end
    dec rsi                    ; Move towards the beginning
    inc rdi                    ; Move towards the end
    cmp rdi, rsi               ; Check if pointers have met or crossed
    jge done_reversing         ; If they have, we're done

    jmp reverse_loop

done_reversing:
    ; Output the reversed string
    ; Assuming a syscall or similar method for output

    ; Exit the program
    mov eax, 1                 ; Syscall number for exit
    xor ebx, ebx               ; Status 0
    int 0x80
