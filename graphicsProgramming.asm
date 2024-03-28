section .data
    ; Define the center and radius of the circle
    centerX dw 160   ; Center of the screen in VGA mode 13h
    centerY dw 100
    radius dw 50
    color db 14      ; Bright yellow from the VGA palette

section .text
    global _start

_start:
    ; Initialize VGA mode 13h
    mov ax, 0x0013
    int 0x10

    ; Prepare for drawing the circle
    mov bx, [centerX]
    mov cx, [centerY]
    mov dx, [radius]
    mov al, [color]

    ; Calculate and draw the circle using the Midpoint Circle Algorithm
    ; Pseudocode for the algorithm
    ; int x = radius, y = 0
    ; // Printing the initial point on the axes after translation
    ; printPixel(x + centerX, y + centerY, color)
    ; // When radius is zero, only a single point will be printed
    ; if (radius > 0)
    ; {
    ;     printPixel(-x + centerX, -y + centerY, color)
    ;     printPixel(y + centerX, x + centerY, color)
    ;     printPixel(-y + centerX, -x + centerY, color)
    ; }
    ; // Initialising the value of P
    ; int P = 1 - radius
    ; while (x > y)
    ; {
    ;     y++
    ;     // Mid-point is inside or on the perimeter
    ;     if (P <= 0)
    ;         P = P + 2*y + 1
    ;     // Mid-point is outside the perimeter
    ;     else
    ;     {
    ;         x--
    ;         P = P + 2*y - 2*x + 1
    ;     }
    ;     // All the perimeter points have already been printed
    ;     if (x < y)
    ;         break
    ;     // Printing the generated point and its reflection
    ;     // in the other octants after translation
    ;     printPixel(x + centerX, y + centerY, color)
    ;     printPixel(-x + centerX, y + centerY, color)
    ;     printPixel(x + centerX, -y + centerY, color)
    ;     printPixel(-x + centerX, -y + centerY, color)
    ;     // If the generated point is on the line x = y then 
    ;     // the perimeter points have already been printed
    ;     if (x != y)
    ;     {
    ;         printPixel(y + centerX, x + centerY, color)
    ;         printPixel(-y + centerX, x + centerY, color)
    ;         printPixel(y + centerX, -x + centerY, color)
    ;         printPixel(-y + centerX, -x + centerY, color)
    ;     }
    ; }

    ; Placeholder for implementing the Midpoint Circle Algorithm and drawing pixels

    ; Wait for a key press to exit or add a loop for interactivity

    ; Return to text mode and exit
    mov ax, 0x0003
    int 0x10
    mov ax, 0x4C00
    int 0x21
