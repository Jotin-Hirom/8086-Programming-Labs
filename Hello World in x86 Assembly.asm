.model small
.stack 10h
.data
str1 db "hello world$$$$"
.code
mov ax,@data
mov ds,ax
lea dx,str1
call displayString
jmp terminate

displayString proc
mov ah,09h
int 21h
ret
displayString endp

terminate:
mov ah,4ch
int 21h
end