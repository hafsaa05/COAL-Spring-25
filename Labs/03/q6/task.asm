INCLUDE Irvine32.inc

.data
a BYTE 00010001b       
b BYTE 00010000b      
Cc BYTE 00110000b       
d BYTE 01000000b       
.code
main PROC
    
    mov al, a    

    add al, b      

    mov bl, a   
    sub bl, b      

    
    sub al, bl

   
    add al, Cc
    add al, d

  
    movzx ebx, al

  
    call WriteDec

    
    call DumpRegs

    exit
main ENDP

END main
