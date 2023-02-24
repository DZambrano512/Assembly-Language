;Daniel Zambrano
; 2/23/23
; Include Irvine32 library
INCLUDE Irvine32.inc

.data

weight DWORD 0
prompts BYTE "Enter your weight in pounds: ",0
prompts1 BYTE "You are in the ",0
prompts2 BYTE " weight class.",0

; UFC weight classes
strawweight BYTE "Strawweight",0
flyweight BYTE "Flyweight",0
bantamweight BYTE "Bantamweight",0
featherweight BYTE "Featherweight",0
lightweight BYTE "Lightweight",0
welterweight BYTE "Welterweight",0
middleweight BYTE "Middleweight",0
lightheavyweight BYTE "Light Heavyweight",0
heavyweight BYTE "Heavyweight",0

.code

main proc
; Display initial prompt
mov edx, OFFSET prompts
call WriteString
call ReadInt
mov weight, eax ; store weight in weight variable

; Determine UFC weight class
cmp eax, 106
jl L1
cmp eax, 115
jl L2
cmp eax, 125
jl L3
cmp eax, 135
jl L4
cmp eax, 145
jl L5
cmp eax, 155
jl L6
cmp eax, 170
jl L7
cmp eax, 185
jl L8
cmp eax, 205
jl L9
jmp L10

L1:
mov edx, OFFSET strawweight
jmp L11

L2:
mov edx, OFFSET flyweight
jmp L11

L3:
mov edx, OFFSET bantamweight
jmp L11

L4:
mov edx, OFFSET featherweight
jmp L11

L5:
mov edx, OFFSET lightweight
jmp L11

L6:
mov edx, OFFSET welterweight
jmp L11

L7:
mov edx, OFFSET middleweight
jmp L11

L8:
mov edx, OFFSET lightheavyweight
jmp L11

L9:
mov edx, OFFSET heavyweight
jmp L11

L10:
mov edx, OFFSET heavyweight ; if weight is over 265 pounds, default to heavyweight
jmp L11

L11:
call WriteString
call crlf

mov edx, OFFSET prompts1
call WriteString
mov eax, weight ; display weight again
call WriteDec
call crlf

mov edx, OFFSET prompts2
call WriteString
call crlf

exit
main ENDP
END main
