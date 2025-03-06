INCLUDE Irvine32.inc

.data
    array1 BYTE 10, 20, 30, 40   ; Original array
    array2 BYTE 4 DUP(?)         ; Destination array

.code
main PROC
    mov esi, OFFSET array1        
    add esi, 3                    ; Point to last element of array1

    mov edi, OFFSET array2         ; Point to first element of array2

    mov al, [esi]                 
    mov [edi], al                 
    dec esi                        
    inc edi                        

    mov al, [esi]                 
    mov [edi], al                 
    dec esi
    inc edi

    mov al, [esi]                 
    mov [edi], al                 
    dec esi
    inc edi

    mov al, [esi]                 
    mov [edi], al                 

    call ExitProcess
main ENDP

END main
