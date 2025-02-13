INCLUDE Irvine32.inc

.data
val1 SWORD ?
val2 SBYTE -11

.code
main PROC
    call DumpRegs
    exit
main ENDP

END main
