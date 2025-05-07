INCLUDE Irvine32.inc

.data
arr DWORD 3, 9, 5, 1, 8
arrSize DWORD 5
msgSorted BYTE "Sorted array: ", 0

.code
main PROC
    push arrSize           
    push OFFSET arr        
    call BubbleSort        
    
    mov edx, OFFSET msgSorted
    call WriteString
    call Crlf

    mov ecx, arrSize
    mov esi, OFFSET arr
printLoop:
    mov eax, [esi]
    call WriteDec
    call Crlf
    add esi, 4
    loop printLoop

    exit
main ENDP

BubbleSort PROC
    push ebp
    mov ebp, esp

    mov esi, [ebp + 8]     
    mov ecx, [ebp + 12]    

    dec ecx                ; outer loop: n-1 passes
outerLoop:
    push ecx
    mov edi, esi
    mov ecx, [ebp + 12]
    dec ecx                ; inner loop: n - pass - 1 comparisons
innerLoop:
    mov eax, [edi]
    mov ebx, [edi + 4]
    cmp eax, ebx
    jle skipSwap
    ; Swap
    mov [edi], ebx
    mov [edi + 4], eax
skipSwap:
    add edi, 4
    loop innerLoop
    pop ecx
    loop outerLoop

    pop ebp
    ret 8                  ; clean up parameters (2 DWORDs)
BubbleSort ENDP

END main
