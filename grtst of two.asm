.model small
.stack 10h
.data
a1 dw 0h
a2 dw 0h
str1 db "A1 is greater$"
str2 db "A2 is greater$"
str3 db "Both are equal$"
.code 
mov ax, @data
mov ds, ax

mov a1, 09h
mov ax, a1
mov a2, 05h
mov bx, a2

cmp ax, bx
jg A1GreaterThanA2
jl A2GreaterThanA1
je BothEqual

A1GreaterThanA2:
lea dx, str1
mov ah, 09h
int 21h
jmp terminate

A2GreaterThanA1:
lea dx, str2
mov ah, 09h
int 21h
jmp terminate

BothEqual:
lea dx, str3
mov ah, 09h
int 21h

terminate:
mov ah, 4ch
int 21h
end
