INCLUDE Irvine32.inc

.data
val1 BYTE 10h
val2 WORD 8OOOh
Val3 DWORD 0FFFFh
val4 WORD 7FFFh

.code
main:
    ;i. Write an instruction that increments val2.
    MOV EAX, val2
    INC EAX

    ;ii. Write an instruction that subtracts val3 from EAX.
    SUB EAX, Val3
    
    ;iii. Write instructions that subtract val4 from val2.
    MOV ECX, Val2
    SUB ECX, Val4

    call DumpRegs
    exit

main ENDP
END main
