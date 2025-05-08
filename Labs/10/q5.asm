INCLUDE Irvine32.inc

.data
array DWORD 10 DUP(?)
multiplier DWORD 2
arrayMsg BYTE "Array elements: ", 0
space BYTE " ", 0

.code
main PROC
    push OFFSET array
    push LENGTHOF array
    push multiplier
    call FillArray

    mov edx, OFFSET arrayMsg
    call WriteString

    mov esi, OFFSET array
    mov ecx, LENGTHOF array
PrintArray:
    lodsd
    call WriteDec
    mov edx, OFFSET space
    call WriteString
    loop PrintArray

    call Crlf
    exit
main ENDP

FillArray PROC
    push ebp
    mov ebp, esp
    push edi
    push ecx
    push ebx

    cld
    mov edi, [ebp+16]
    mov ecx, [ebp+12]
    mov ebx, [ebp+8]
    mov eax, 1

LoopStart:
    stosd
    imul eax, ebx
    loop LoopStart

    pop ebx
    pop ecx
    pop edi
    pop ebp
    ret 12
FillArray ENDP

END main
