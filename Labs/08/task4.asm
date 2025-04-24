INCLUDE Irvine32.inc

.data
var BYTE 0
msg1 BYTE "Hello", 0
msg2 BYTE "World", 0

.code
main PROC
_while:
    cmp var, 10
    jge end_program

    cmp var, 5
    jge print_world

    mov edx, OFFSET msg1
    call WriteString
    call Crlf

    inc var
    jmp _while

print_world:
    mov edx, OFFSET msg2
    call WriteString
    call Crlf

    inc var
    jmp _while

end_program:
    call Crlf
    exit
main ENDP

END main
