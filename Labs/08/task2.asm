INCLUDE Irvine32.inc

.data
intArr SWORD 0, 0, 0, 150, 120, 35, -12, 66, 4, 0            
msg1 BYTE "Non-zero number found!", 0
msg2 BYTE "Non-zero number not found!", 0

.code
main PROC
    mov esi, OFFSET intArr
    mov ecx, 10

L1:
    cmp ecx, 0
    je not_found ; If end of array, jump to not_found

    mov ax, [esi]
    cmp ax, 0
    jne found

    add esi, 2
    loop L1

not_found:
    mov edx, OFFSET msg2
    call WriteString
    jmp end_program

found:
    mov edx, OFFSET msg1
    call WriteString
    call Crlf
    movsx eax, ax
    call WriteInt

end_program:
    call Crlf
    exit
main ENDP

END main
