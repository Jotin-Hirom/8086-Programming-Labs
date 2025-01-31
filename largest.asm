.model small
.stack 10h
.data
a1 dw 0h
a2 dw 0h
a3 dw 0h
str1 db "A1 is greater$"
str2 db "A2 is greater$"
str3 db "A3 is greater$"
str4 db "A1,A2 is greater$"
str5 db "A2,A3 is greater$"
str6 db "A1,A3 is greater$"
str7 db "all are equal$"
.code
mov ax,@data
mov ds,ax

mov a1,08h
mov ax,a1
mov a2,03h
mov bx,a2
mov a3,05h
mov cx,a3

cmp ax,bx
jl A2greaterthanA1
jg A1greaterthanA2
je A1equalA2

A2greaterthanA1:
cmp bx,cx
jg A2greater
jl A3greater
je A2A3greater

A1greaterthanA2:
cmp ax,cx
jg A1greater
jl A3greater
je A1A3greater

A1equalA2:
cmp ax,cx
jg A1A2greater
jl A3greater
je Allequal

A2A3greater:
lea dx,str5
mov ah,09h
int 21h
jmp terminate

A1A3greater:
lea dx,str6
mov ah,09h
int 21h
jmp terminate

A1greater:
lea dx,str1
mov ah,09h
int 21h
jmp terminate

A2greater:
lea dx,str2
mov ah,09h
int 21h
jmp terminate

A3greater:
lea dx,str3
mov ah,09h
int 21h
jmp terminate

A1A2greater:
lea dx,str4  
mov ah,09h
int 21h
jmp terminate

Allequal:
lea dx,str7  
mov ah,09h
int 21h
jmp terminate

terminate:
mov ah,4ch
int 21h
end