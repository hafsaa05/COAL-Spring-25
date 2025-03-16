INCLUDE Irvine32.inc

.code
main PROC
    mov ecx, 4    
    mov ebx, 1    
L1:
    mov eax, 1    
    mov edx, ebx  
L2:
    call WriteInt 
    dec edx       
    jnz L2        
    call Crlf     
    inc ebx        
    loop L1       
    exit
main ENDP
END main
