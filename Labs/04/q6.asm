INCLUDE Irvine32.inc

.data
SecondsInDay EQU 60 * 60 * 24       

.code
main:
    MOV EAX, SecondsInDay      

    call DumpRegs

    exit

main ENDP
END main
