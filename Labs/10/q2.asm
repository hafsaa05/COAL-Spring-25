INCLUDE Irvine32.inc

Scan_String PROTO

.data
    Str1 BYTE "127&j~3#^&*#*#45^", 0
    foundMsg BYTE "Character found at index: ", 0
    notFoundMsg BYTE "Character not found", 0
    index DWORD ?

.code

main PROC
    push '#'                 
    push OFFSET Str1         
    call Scan_String         
    mov index, eax

    cmp eax, -1
    je NotFound

    mov edx, OFFSET foundMsg
    call WriteString
    call WriteDec
    call Crlf
    jmp Done

NotFound:
    mov edx, OFFSET notFoundMsg
    call WriteString
    call Crlf

Done:
    exit
main ENDP

Scan_String PROC
    push ebp
    mov ebp, esp
    push edi
    push ecx

    mov edi, [ebp+8]             
    mov al, [ebp+12]             
    mov ecx, 17                  
    cld
    repne scasb
    jz Found

    mov eax, -1
    jmp Cleanup

Found:
    sub edi, [ebp+8]
    dec edi
    mov eax, edi

Cleanup:
    pop ecx
    pop edi
    pop ebp
    ret 8
Scan_String ENDP

END main
