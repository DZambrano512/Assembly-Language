section .data
    msg db 'Enter the number of Fibonacci numbers to generate:', 0xA
    len equ $ - msg
    format db '%d', 0x0 ; format for scanf

section .bss
    num resb 4

section .text
    global _start

_start:
    ; Print the message asking for input
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; Read the number of Fibonacci numbers to generate
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 4
    int 0x80

    ; Prepare for generating Fibonacci numbers
    mov eax, [num] ; Number of Fibonacci numbers to generate
    mov ebx, 0     ; First Fibonacci number
    mov ecx, 1     ; Second Fibonacci number

generate_fib:
    ; Output the current Fibonacci number in ebx
    ; Code for outputting ebx's value goes here

    ; Calculate the next Fibonacci number
    add ebx, ecx
    ; Swap registers ebx and ecx
    push ebx
    mov ebx, ecx
    pop ecx

    dec eax ; Decrement the counter
    jnz generate_fib ; Continue if not zero

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
