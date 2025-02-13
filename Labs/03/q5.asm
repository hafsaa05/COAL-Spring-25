INCLUDE Irvine32.inc

.data
a DWORD 11h       
b DWORD 10h       
Cc DWORD 30h       
d DWORD 40h       
.code
main PROC
    
    mov eax, a     

    add eax, b     

    mov ebx, a   
    sub ebx, b      

    
    sub eax, ebx

   
    add eax, Cc
    add eax, d

  
    mov ebx, eax

  
    call WriteDec

    
    call DumpRegs

    exit
main ENDP

END main
