INCLUDE Irvine32.inc
.data
arr WORD 1,2,3,4,5,6,7,8,9,10
res WORD 10 DUP(?)

.code
main PROC
    mov esi, OFFSET arr    
    mov edi, OFFSET res

    mov ecx, 10

L1:
    mov ax, [esi]
    mov [edi], ax
    add esi, 2
    add edi, 2
    loop L1

    mov esi, OFFSET res
    mov ecx, 10

display:
    mov ax, [esi]
    movzx eax, ax
    call WriteDec
    call Crlf
    add esi, 2
    loop display

    exit
main ENDP
END main
