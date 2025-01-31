.model small
.stack 100h
.data
array db 10, 25, 3, 56, 12, 43, 78, 34, 23, 90 ; Array of 10 numbers
smallest db 0 ; Variable to store the smallest number

.code
start:
    ; Set up the data segment
    mov ax, @data
    mov ds, ax

    ; Initialize registers
    mov cx, 10        ; Counter for 10 numbers
    lea si, array     ; Load address of array into SI
    mov al, [si]      ; Load the first element into AL
    mov smallest, al  ; Assume the first number is the smallest
    inc si            ; Move to the next element
    dec cx            ; Decrease counter by 1 (as we already checked the first element)

    ; Loop through the array
find_smallest:
    mov al, [si]      ; Load the next number into AL
    cmp al, smallest  ; Compare with the current smallest number
    jge skip          ; If AL >= smallest, skip the update
    mov smallest, al  ; Otherwise, update the smallest number

skip:
    inc si            ; Move to the next element
    loop find_smallest ; Repeat until CX is zero

    mov dl, smallest
    add dl, '0'
    mov ah, 02h
    int 21h 

    ; End of program
    mov ah, 4Ch       ; DOS terminate program function
    int 21h           ; Call DOS interrupt to terminate

end start
