INCLUDE Irvine32.inc
.data
num DWORD 2    
.code
main PROC
    mov eax, 1       
    mov ecx, 3       

L1:
    push num         
    add num, 2       
    loop L1          

    mov ecx, 3       

L2:
    pop ebx          
    mul ebx           
    loop L2           

    call WriteDec    
    call Crlf        

    exit
main ENDP
END main
