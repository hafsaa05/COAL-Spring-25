INCLUDE Irvine32.inc

.data
var BYTE 5
x   BYTE ?
msg BYTE "Value of x: ", 0

.code
main PROC

movzx eax, var
mov edx, eax
add edx, 1

mov ecx, 10

cmp eax, ecx
jge else_condition

cmp ecx, edx
jl else_condition

mov x, 0
jmp end_program

else_condition:
mov x, 1

end_program:
mov edx, OFFSET msg
call WriteString

movzx eax, x
call WriteInt

call Crlf
exit
main ENDP

END main
