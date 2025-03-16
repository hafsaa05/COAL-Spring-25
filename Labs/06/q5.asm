INCLUDE Irvine32.inc

.data
    values DWORD 5, 15, 25, 35, 45, 55, 65, 75  
    msg BYTE "Reversed Values: ", 0  

.code
main PROC
    mov ecx, LENGTHOF values / 2  
    mov eax, OFFSET values        
    mov ebx, eax                  
    add ebx, (LENGTHOF values - 1) * TYPE values  

swapLoop:
    mov edx, [eax]                
    mov esi, [ebx]                
    mov [eax], esi                
    mov [ebx], edx                

    add eax, TYPE values          
    sub ebx, TYPE values          
    loop swapLoop  

    mov ecx, LENGTHOF values  
    mov edx, OFFSET msg  
    call WriteString  
    call CrLf  

printLoop:
    mov ebx, OFFSET values  

printNext:
    mov eax, [ebx]  
    call WriteDec  
    mov al, ' '  
    call WriteChar  
    add ebx, TYPE values  
    loop printNext  

    exit  
main ENDP  
END main
