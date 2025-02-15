INCLUDE Irvine32.inc

.data
    repeatedString BYTE 500 DUP("TEST")

.code
main PROC
    call DumpRegs   
    exit
main ENDP

END main
