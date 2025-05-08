INCLUDE Irvine32.inc

.data
originalStr BYTE "Hello World!", 0
reversedMsg BYTE "Reversed string: ", 0

.code
main PROC
    mov edx, OFFSET originalStr
    call WriteString
    call Crlf

    push OFFSET originalStr
    call Str_Reverse

    mov edx, OFFSET reversedMsg
    call WriteString
    mov edx, OFFSET originalStr
    call WriteString
    call Crlf

    exit
main ENDP

Str_Reverse PROC
    push ebp
    mov ebp, esp
    pushad

    mov esi, [ebp + 8]
    mov edi, esi

find_end:
    cmp BYTE PTR [edi], 0
    je  found_end
    inc edi
    jmp find_end

found_end:
    dec edi

swap_loop:
    cmp esi, edi
    jae done

    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al

    inc esi
    dec edi
    jmp swap_loop

done:
    popad
    pop ebp
    ret 4
Str_Reverse ENDP

END main
