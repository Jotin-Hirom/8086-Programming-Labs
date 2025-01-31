.model small
.stack 100h
.data
array db 10, 25, 3, 56, 12, 43, 78, 34, 23, 90 ; Array of 10 numbers
sum dw 0 ; Variable to store the sum of the elements
result db 'Sum is: $'

.code
start:
    ; Set up the data segment
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Initialize registers
    mov cx, 10        ; Counter for 10 numbers
    lea si, array     ; Load address of array into SI
    xor ax, ax        ; Clear AX (will be used for the sum)

    ; Loop through the array and calculate the sum
calc_sum:
    add al, [si]      ; Add the next number to AL
    adc ah, 0         ; Add the carry to AH
    inc si            ; Move to the next element
    loop calc_sum     ; Repeat until CX is zero

    ; Store the sum in the variable
    mov sum, ax

    ; Convert the sum to a string and store it in result buffer
    call convert_sum_to_string

    ; Display the result
    lea dx, result
    mov ah, 09h       ; DOS function to display string
    int 21h           ; Call DOS interrupt

    ; End of program
    mov ah, 4Ch       ; DOS terminate program function
    int 21h           ; Call DOS interrupt to terminate

; Subroutine to convert sum to string
convert_sum_to_string proc
    ; This procedure assumes sum is in AX and result buffer is available

    ; Convert the sum to ASCII characters
    lea di, result + 8 ; Point to the end of the result buffer (after 'Sum is: ')
    mov bx, 10

convert_loop:
    xor dx, dx        ; Clear DX
    div bx            ; Divide AX by 10
    add dl, '0'       ; Convert remainder to ASCII
    dec di            ; Move backward in the buffer
    mov [di], dl      ; Store the character
    cmp ax, 0         ; Check if quotient is 0
    jne convert_loop  ; If not, repeat the loop

    ret
convert_sum_to_string endp

end start
