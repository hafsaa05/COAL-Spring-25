INCLUDE Irvine32.inc

.data
    arr         WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
    arrSize     DWORD 11
    original_msg BYTE "Original array: ", 0
    sorted_msg   BYTE "Sorted array:   ", 0
    space        BYTE " ", 0
    swapped      DWORD 0                  

.code
main PROC
    
    mov edx, OFFSET original_msg
    call WriteString
    call DisplayArray

    mov esi, OFFSET arr       
    mov ecx, arrSize
    dec ecx                    
    jz Done                   

OuterLoop:
    mov swapped, 0             
    mov ebx, 0                 

InnerLoop:
    mov ax, [esi + ebx*2]           
    mov dx, [esi + ebx*2 + 2]       

    cmp ax, dx
    jle NoSwap                    

    mov [esi + ebx*2], dx
    mov [esi + ebx*2 + 2], ax
    mov swapped, 1

NoSwap:
    inc ebx
    cmp ebx, ecx
    jl InnerLoop                  

    cmp swapped, 0
    je Done                       

    dec ecx
    jnz OuterLoop                 

Done:
    mov edx, OFFSET sorted_msg
    call WriteString
    call DisplayArray

    INVOKE ExitProcess, 0
main ENDP

DisplayArray PROC
    mov esi, OFFSET arr
    mov ecx, arrSize
    mov ebx, 0

PrintLoop:
    movzx eax, WORD PTR [esi + ebx*2]  
    call WriteInt                       
    mov edx, OFFSET space
    call WriteString                    
    inc ebx
    loop PrintLoop

    call Crlf
    ret
DisplayArray ENDP

END main
