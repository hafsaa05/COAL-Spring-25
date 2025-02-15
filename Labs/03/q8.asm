INCLUDE Irvine32.inc

.data
    dArray DWORD 50 DUP(?)  

.code
main PROC
    call DumpRegs   
    exit
main ENDP

END main
