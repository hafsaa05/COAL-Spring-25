INCLUDE Irvine32.inc

.data
    arr BYTE 61, 43, 11, 52, 25   
    sorted BYTE 5 DUP(?)          

.code
main PROC
    mov al, 11  
    mov [sorted + 0], al 

    mov al, 25
    mov [sorted + 1], al 

    mov al, 43
    mov [sorted + 2], al 

    mov al, 52
    mov [sorted + 3], al 

    mov al, 61  
    mov [sorted + 4], al 

    call ExitProcess
main ENDP

END main
