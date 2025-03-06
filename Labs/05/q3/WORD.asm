INCLUDE Irvine32.inc

.data
    arr WORD 61, 43, 11, 52, 25   
    sorted WORD 5 DUP(?)          

.code
main PROC
    mov ax, 11  
    mov [sorted + 0], ax 

    mov ax, 25
    mov [sorted + 2], ax  

    mov ax, 43
    mov [sorted + 4], ax 

    mov ax, 52
    mov [sorted + 6], ax 

    mov ax, 61  
    mov [sorted + 8], ax 

    call ExitProcess
main ENDP

END main
