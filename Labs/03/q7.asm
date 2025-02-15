INCLUDE Irvine32.inc

.data
    wArray WORD 45, 56, 78   

.code
main PROC
    call DumpRegs   
    exit
main ENDP

END main
