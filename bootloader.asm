[org 0x7c00]
BITS 16

; Initialize the DS register
xor ax, ax
mov ds, ax

; Display a message indicating bootloader start
mov ah, 0x0E
mov al, 'S'
int 0x10
; Continue to spell "Starting..."

; Prepare to read the kernel from the disk
mov ah, 0x02    ; BIOS read sectors function
mov al, [KernelSectors] ; Number of sectors to read
mov ch, 0       ; Cylinder number
mov cl, 3       ; Starting sector (2 for the bootloader, 3 for the kernel)
mov dh, 0       ; Head number
mov dl, 0x80    ; Drive number (0x80 for HDD)
mov bx, KernelLoadAddress ; Buffer address in memory to load the kernel
int 0x13        ; BIOS disk interrupt

; Check for read error
jc read_error

; Transfer control to the kernel
jmp KernelLoadAddress

read_error:
; Handle disk read error (display message, halt, etc.)

hang:
jmp hang

KernelLoadAddress dw 0x1000 ; Example load address for the kernel
KernelSectors    db 4       ; Example number of sectors the kernel occupies

times 510-($-$$) db 0
dw 0xAA55 ; Boot sector magic number
