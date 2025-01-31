.model medium

.data
str1 db "positive$"
str2 db "negative$"
str3 db "zero$"


.stack 10h

.code
mov ax,@data
mov ds,ax

mov n, 3h
mov ax n
sub ax,0
jz L1
js L3
jmp L2


L1:
lea dx, str1
mov ah,09h
int 21h
jmp terminate

L2:
lea dx,str2
mov ah,09h
int 21h
jmp terminate

L3:
lea dx,str3
mov ah,09h
int 21h
jmp terminate

terminate :
mov ah,04ch
int 21h
end



