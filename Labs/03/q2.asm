INCLUDE Irvine32.inc

.data
val3 SDWORD -2147483648

.code
main PROC
    call DumpRegs
    exit
main ENDP

END main
