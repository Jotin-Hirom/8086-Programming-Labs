.model small

.data
POS_MSG db "The Number Is Positive$"
NEG_MSG db "The Number Is Negative$"
Zero_MSG db "The Number Is Zero$"

.stack 10h

.code
mov ax, @data
mov ds, ax

mov ax, -10

cmp ax, 0
JE DISPLAY_ZERO
JS DISPLAY_NEG

mov dx, OFFSET POS_MSG
jmp DISPLAY

DISPLAY_NEG:
    mov dx, OFFSET NEG_MSG
    jmp DISPLAY

DISPLAY_ZERO:
    mov dx, OFFSET ZERO_MSG
    
DISPLAY:
    mov ah, 9
    int 21h

    mov ah, 04ch
    int 21h
end