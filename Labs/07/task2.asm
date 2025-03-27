INCLUDE Irvine32.inc
.data
num DWORD 1 
sum DWORD 0  

.code
main PROC
    mov ecx, 3        

L1:
    push num        
    add num, 2       
    loop L1           

    mov eax, 0         
    mov ecx, 3         

L2:
    pop ebx           
    add eax, ebx      
    loop L2           

    mov sum, eax      
    mov eax, sum       

    call WriteInt      
    call Crlf        

    exit
main ENDP
END main
