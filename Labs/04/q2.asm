INCLUDE Irvine32.inc

.code
main:
    mov al, 'H'   
    mov bl, 'A'   
    mov cl, 'F'   

    call DumpRegs 

    exit          
main ENDP

END main
