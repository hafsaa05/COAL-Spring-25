INCLUDE Irvine32.inc  

.data  
    values DWORD 12, 7, 20, 3, 10, 5  
    total DWORD 6  
    result_msg BYTE "Sorted Array:", 0  

.code  
main PROC  
    mov ecx, total  
    dec ecx  

sort_pass:  
    mov esi, 0  
    mov bl, 0    ; swap_flag = 0  

    forward_pass:  
        mov eax, [values + esi * 4]  
        mov edx, [values + esi * 4 + 4]  
        cmp eax, edx  
        jbe no_change  

        mov [values + esi * 4], edx  
        mov [values + esi * 4 + 4], eax  
        mov bl, 1    ; swap_flag = 1 (swap occurred)  

    no_change:  
        inc esi  
        cmp esi, ecx  
        jl forward_pass  

    cmp bl, 0  
    je sorted  

    dec ecx  
    mov esi, ecx  

    reverse_pass:  
        mov eax, [values + esi * 4]  
        mov edx, [values + esi * 4 - 4]  
        cmp eax, edx  
        jae skip_swap  

        mov [values + esi * 4], edx  
        mov [values + esi * 4 - 4], eax  

    skip_swap:  
        dec esi  
        jg reverse_pass  

    jmp sort_pass  

sorted:  
    mov edx, OFFSET result_msg  
    call WriteString  
    call CrLf  

    mov edi, 0  

display_loop:  
    mov eax, [values + edi * 4]  
    call WriteInt  
    call Crlf  
    inc edi  
    cmp edi, total  
    jl display_loop  

    exit  
main ENDP  
END main  
