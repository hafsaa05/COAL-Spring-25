INCLUDE Irvine32.inc

.data
arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
arrSize = 11
prompt1 BYTE "Enter a number: ", 0
prompt2 BYTE "Number Found!", 0
prompt3 BYTE "Number not found!", 0

.code
main PROC
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov ebx, eax

    mov esi, OFFSET arr
    mov ecx, arrSize

L1:
    cmp ecx, 0
    je not_found

    mov ax, [esi]
    cmp ax, bx
    je found

    add esi, TYPE arr
    loop L1

not_found:
    mov edx, OFFSET prompt3
    call WriteString
    call Crlf
    jmp end_program

found:
    mov edx, OFFSET prompt2
    call WriteString
    call Crlf

end_program:
    exit
main ENDP
END main
