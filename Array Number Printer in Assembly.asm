.model small
.stack 10h

.data
str1 db "$$$$$$$$$$$$$$$$ "
arr1 dw 13,21,34,56,78,-1
str2 dw 0000h
.code 
mov ax,@data
mov ds,ax

lea bx,arr1
xor di,di
nextNumber:
mov ax,[bx+di]
cmp ax,-1
mov str2,bx
je terminate
call displayN
inc di
inc di
call printNewLine
mov bx,str2
jmp nextNumber






displayA proc
mov dl,'a'
mov ah,02h
int 21h
ret
displayA endp



printNewLine proc              ; procedure to display new line
mov dl,10
mov ah,02h
int 21h
ret
printNewLine endp

displayN  proc  
; in ax we have the number
; so have to perform repeated division
                               ; general stanadard: quotient will be in ax and remainder in dx
                               ; before the div make sure dx value is 0 so use xor
xor cx,cx

nextDiv: 
xor dx,dx                      ; reset to 0
mov bx,10                      ; want to divide again and again by 10 so number stored in bx
div bx                         ; ax/bx so quotient in ax and remainder in dx
add dl,48                      ; convert remainder to ascii code
push dx
inc cx                         ; keeps track of how many cx operations we have done, but before this set cx to 0
                               ; from here we need to proceed if quotient is not zero
cmp ax,0                       ; checking if quotient is not zero
je popQ                        ; if these are equal then we are ready pushing into the stack now have to popQ
jmp nextDiv                    ; if not equal then have to perform div again and push digit into stack


popQ:                          ; intermediate string pointed to by bx register
                               ; how many pop operations to be done ? whatever is the content of cx
lea dx,str1                    ; base address of str1 in bx
xor si,si                      ; initialising si with 0, afterwards it has to be incremented as the index
popNext:
pop dx
mov [bx+si], dl
inc si
loop popNext                   ; default counter is in cx

mov dl,'$'                     ; after popping have to explicitly specify that the end of string is $
mov [bx+si],dl                 ; just like in C we ended the string with a null character


mov dx,bx                      ; effective address of string is held by bx so transfer it to dx
mov ah,09h                     ; display string pointed by dx but here the string is being pointed to by bx
int 21h
ret  
displayN endp


terminate:
mov ah,04ch
int 21h
end