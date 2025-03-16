INCLUDE Irvine32.inc

.data
    source BYTE "Hafsa", 0
    target BYTE 6 DUP(?)

.code
main PROC         
    mov ecx, LENGTHOF source    
    mov edi, 0                  

copyLoop:
    mov al, source[edi]         
    mov target[edi], al         
    inc edi                     
    loop copyLoop                

    mov ecx, LENGTHOF target    
    mov edi, 0                  

displayLoop:
    mov al, target[edi]         
    call WriteChar              
    inc edi                     
    loop displayLoop            

    exit
main ENDP
END main
