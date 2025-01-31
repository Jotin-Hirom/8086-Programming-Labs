.model small

.stack 10h


.data

X1 dw 0000h
X2 dw 0000h
str1 db "X1 is greater than X2$"
str2 db "X2 is greater than X2$"
str3 db "X2 is greater to X2$"


.code


mov ax, @data
mov ds, ax

mov X1, 0010h
mov X2, 0008h

mov ax, X1
mov bx, X2

cmp ax, bx
jb X2_is_greater
je both_equal

lea dx, str1
mov ah

