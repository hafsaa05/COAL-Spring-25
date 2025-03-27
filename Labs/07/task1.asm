
INCLUDE Irvine32.inc
.data

arr WORD 1,2,3,4,5,6,7,8,9,10
res WORD 10 DUP(?)

.code
main PROC

    mov esi, OFFSET arr    
    mov edi, OFFSET res    

    mov ecx, 10            

L1:
    mov ax, [esi]          
    push ax                
    add esi, 2             
    loop L1

    mov ecx, 10            

L2:
    pop ax                 
    mov [edi], ax          
    add edi, 2             
    loop L2

    mov ecx, 10
    mov esi, OFFSET res

display:
    mov eax, 0             
    mov ax, [esi]          
    call WriteInt          
    call Crlf              
    add esi, 2             
    loop display

    call Crlf
    call WaitMsg           
    exit
main ENDP
END main
