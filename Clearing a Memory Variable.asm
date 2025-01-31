.MODEL SMALL
.STACK 10h
.DATA
    max DW 12h
.CODE
main:
    MOV ax, @DATA
    MOV ds, ax
    XOR ax, ax
    MOV [max], ax   ; Correct way to modify a variable in .DATA section

    MOV ax, 4C00h
    INT 21h
END main
