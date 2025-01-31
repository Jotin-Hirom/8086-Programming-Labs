.model small
.stack 100h
.data
array db 10, 25, 3, 56, 12, 43, 78, 34, 23, 90 ; Array of 10 numbers
largest db 0 ; Variable to store the largest number

.code
start:
    ; Set up the data segment
    mov ax, @data
    mov ds, ax

    ; Initialize registers
    mov cx, 10        ; Counter for 10 numbers
    lea si, array     ; Load address of array into SI
    mov al, [si]      ; Load the first element into AL
    mov largest, al   ; Assume the first number is the largest
    inc si            ; Move to the next element
    dec cx            ; Decrease counter by 1 (as we already checked the first element)

    ; Loop through the array
find_largest:
    mov al, [si]      ; Load the next number into AL
    cmp al, largest   ; Compare with the current largest number
    jle skip          ; If AL <= largest, skip the update
    mov [largest], al ; Update the largest number (fix: use square brackets)

skip:
    inc si            ; Move to the next element
    loop find_largest ; Repeat until CX is zero

    mov dl, largest
    add dl, '0'
    mov ah, 02h
    int 21h 
    ; End of program
    mov ah, 4Ch       ; DOS terminate program function
    int 21h           ; Call DOS interrupt to terminate

end start