INCLUDE Irvine32.inc

.data
    promptMsg    BYTE "Enter a character: ", 0
    resultMsg    BYTE "'", 0
    isAlphaMsg   BYTE "' is an alphabet character", 0
    notAlphaMsg  BYTE "' is not an alphabet character", 0

.code
main PROC
    mov edx, OFFSET promptMsg
    call WriteString

    call ReadChar
    mov bl, al

    mov edx, OFFSET resultMsg
    call WriteString

    mov al, bl
    call WriteChar

    mov edx, OFFSET resultMsg + 1
    call WriteString

    cmp bl, 'A'
    jb CheckLowerCase
    cmp bl, 'Z'
    jbe ValidAlpha

CheckLowerCase:
    cmp bl, 'a'
    jb InvalidAlpha
    cmp bl, 'z'
    ja InvalidAlpha

ValidAlpha:
    mov edx, OFFSET isAlphaMsg
    call WriteString
    call Crlf
    jmp EndProgram

InvalidAlpha:
    mov edx, OFFSET notAlphaMsg
    call WriteString
    call Crlf

EndProgram:
    exit
main ENDP

END main
