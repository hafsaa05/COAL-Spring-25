INCLUDE Irvine32.inc

.data
arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
arrSize = 11
prompt1 BYTE "Array after sorting:", 0

.code
main PROC
    mov esi, OFFSET arr
    mov ecx, arrSize

outer_loop:
    mov ecx, arrSize
    dec ecx

    mov esi, OFFSET arr

inner_loop:
    cmp ecx, 0
    je outer_continue

    mov ax, [esi]
    mov bx, [esi+2]
    cmp ax, bx
    jbe no_swap

    ; swap [esi] and [esi+2]
    mov [esi], bx
    mov [esi+2], ax

no_swap:
    add esi, TYPE arr
    loop inner_loop

outer_continue:
    dec arrSize
    cmp arrSize, 1
    jg outer_loop

    ; Print sorted array
    mov edx, OFFSET prompt1
    call WriteString
    call Crlf

    mov ecx, 11
    mov esi, OFFSET arr

print_loop:
    mov ax, [esi]
    call WriteDec
    call Crlf
    add esi, TYPE arr
    loop print_loop

    exit
main ENDP
END main
