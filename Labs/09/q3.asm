INCLUDE Irvine32.inc

.data
    prompt1 BYTE "Enter a number: ", 0

.code
main PROC
    mov edx, OFFSET prompt1
    call WriteString

    call ReadDec

    call LocalSquare
    exit
main ENDP

LocalSquare PROC
    LOCAL temp:DWORD
    
    enter 4, 0

    mov [ebp-4], eax       ; ebp-4 is temp
    imul eax, eax

    call WriteDec

    leave
    ret
LocalSquare ENDP

END main
