INCLUDE Irvine32.inc

.data
A DWORD 0FF10h
B DWORD 0E10Bh

.code
main:
    MOV EAX, A
    MOV EBX, B
    XCHG EAX, EBX
    call DumpRegs
    exit

main ENDP
END main
