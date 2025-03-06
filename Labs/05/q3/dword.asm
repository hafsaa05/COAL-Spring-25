INCLUDE Irvine32.inc

.data
    arr dd 61, 43, 11, 52, 25   
    sorted dd 5 DUP(?)          

.code
main PROC
    mov eax, 11  
    mov [sorted + 0], eax 

    mov eax, 25
    mov [sorted + 4], eax  

    mov eax, 43
    mov [sorted + 8], eax 

    mov eax, 52
    mov [sorted + 12], eax 

    mov eax, 61  
    mov [sorted + 16], eax 

    call ExitProcess
main ENDP

END main
