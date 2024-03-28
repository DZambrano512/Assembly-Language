section .data
array db 34, 21, 45, 32, 12    ; An unsorted array of integers
len equ $ - array              ; Calculate the length of the array

section .text
    global _start

_start:
    mov ecx, len               ; ECX will count down the length of the array

outer_loop:
    mov esi, ecx               ; Inner loop counter
    dec esi                    ; Adjust for zero-based indexing

inner_loop:
    mov al, [array + esi - 1]  ; Load the current element
    cmp al, [array + esi]      ; Compare with the next element
    jle no_swap                ; Jump if current element is less or equal to the next

    ; Swap elements if they are in the wrong order
    xchg al, [array + esi]
    mov [array + esi - 1], al

no_swap:
    dec esi                    ; Move to the next element
    jnz inner_loop             ; Continue if not at the end of the array

    dec ecx                    ; Decrement outer loop counter
    jnz outer_loop             ; Repeat if more passes are needed

    ; Output the sorted array
    ; A placeholder for output logic, specific to the environment

    ; Exit the program
    mov eax, 1                 ; Syscall number for exit
    xor ebx, ebx               ; Status 0
    int 0x80
