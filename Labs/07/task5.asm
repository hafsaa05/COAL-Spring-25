INCLUDE Irvine32.inc

.data
n DWORD ?
prompt BYTE "Enter a number: ", 0
resultMsg BYTE "The sum is: ", 0
res DWORD ?

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    
    call ReadInt
    mov n, eax
    
    call sum
    
    mov edx, OFFSET resultMsg
    call WriteString
    mov eax, res
    call WriteDec
    call Crlf
    
    exit
main ENDP

sum PROC
    mov eax, 0      
    mov ecx, 1      
    
L1:
    cmp ecx, n      
    jg done        
    add eax, ecx    
    inc ecx         
    jmp L1          
    
done:
    mov res, eax    
    ret             
sum ENDP

END main
