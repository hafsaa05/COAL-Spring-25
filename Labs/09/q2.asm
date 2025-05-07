INCLUDE Irvine32.inc

.data
    arr DWORD 10, 2, 5, 8, 16, 26, 7, 22, 15, 14,
         11, 13, 1, 19, 25, 6, 9, 18, 12, 20
    arrSize DWORD 20
    prompt1 BYTE "Max number: ", 0
    prompt2 BYTE "Min number: ", 0

.code
main PROC
    push OFFSET arr     
    push arrSize           
    call MinMaxArray
    exit
main ENDP

MinMaxArray PROC
    push ebp
    mov ebp, esp

    mov ecx, [ebp+8]        ; arrSize
    mov esi, [ebp+12]       ; address of array
    mov eax, [esi]          ; max = arr[0]
    mov ebx, [esi]          ; min = arr[0]
    add esi, 4              
    dec ecx                 

findMinMax:
    mov edx, [esi]
    cmp edx, eax
    jg storeMax
    cmp edx, ebx
    jl storeMin
    jmp next

storeMax:
    mov eax, edx            
    jmp next

storeMin:
    mov ebx, edx            

next:
    add esi, 4              
    loop findMinMax

    ; Print max
    mov edx, OFFSET prompt1
    call WriteString
    call WriteDec

    call Crlf

    ; Print min
    mov edx, OFFSET prompt2
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf

    pop ebp
    ret
MinMaxArray ENDP

END main

