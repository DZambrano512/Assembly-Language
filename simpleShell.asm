section .data
    prompt db 'simple-shell> ', 0
    inputBuffer resb 256                  ; Reserve buffer for input command
    command db '/bin/sh', 0               ; Default command to execute
    args db 'sh', 0                       ; Argument for the command

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4                            ; syscall: sys_write
    mov ebx, 1                            ; file descriptor: stdout
    mov ecx, prompt                       ; message to print
    mov edx, 13                           ; message length
    int 0x80                              ; call kernel

    ; Read user input
    mov eax, 3                            ; syscall: sys_read
    mov ebx, 0                            ; file descriptor: stdin
    mov ecx, inputBuffer                  ; buffer to store input
    mov edx, 256                          ; buffer size
    int 0x80                              ; call kernel

    ; For a real shell, parsing and handling of the input would go here

    ; Execute a command (simplified to always execute /bin/sh here)
    mov eax, 11                           ; syscall: sys_execve
    lea ebx, [command]                    ; command to execute
    lea ecx, [args]                       ; arguments for the command
    int 0x80                              ; call kernel

    ; Exit
    mov eax, 1                            ; syscall: sys_exit
    xor ebx, ebx                          ; exit status 0
    int 0x80
