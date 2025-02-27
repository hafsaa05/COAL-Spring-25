INCLUDE Irvine32.inc

.data
varB BYTE +10      
varW WORD -150     
varD DWORD 600      

.code
main:
    MOVZX EAX, varB
    MOVZX EBX, varW
    MOV ECX, VarD

    call DumpRegs
    exit                       

main ENDP
END main

