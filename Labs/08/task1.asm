INCLUDE Irvine32.inc

.data
arr DWORD 4 DUP(?)             
msgPrompt BYTE "Enter four numbers (integers): ", 0
msgEqual BYTE "Equal!", 0
msgNotEqual BYTE "Not equal!", 0

.code
main PROC
    mov edx, OFFSET msgPrompt
    call WriteString
    call crlf

    mov ecx, 4
    mov esi, OFFSET arr
input_loop:
    call ReadInt
    mov [esi], eax
    add esi, 4
    loop input_loop

    ; Compare all 4 values
    mov esi, OFFSET arr
    mov eax, [esi]          ; eax = arr[0]
    mov ebx, [esi+4]        ; ebx = arr[1]
    cmp eax, ebx
    jne not_equal

    mov ebx, [esi+8]        ; ebx = arr[2]
    cmp eax, ebx
    jne not_equal

    mov ebx, [esi+12]       ; ebx = arr[3]
    cmp eax, ebx
    jne not_equal

    ; All values are equal
    mov edx, OFFSET msgEqual
    call WriteString
    jmp end_program

not_equal:
    mov edx, OFFSET msgNotEqual
    call WriteString

end_program:
    call Crlf
    exit
main ENDP

END main
