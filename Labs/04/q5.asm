INCLUDE Irvine32.inc

.data
Val1 DWORD 25h       
Val2 BYTE 36o        
Val3 WORD 20d        

.code
main:
    ; 1. EAX = 89 + 75Fh - 46o - 28 + 1101b
    MOV EBX, 89        
    ADD EBX, 75Fh       
    SUB EBX, 46o        
    SUB EBX, 28         
    ADD EBX, 1101b      
    MOV EAX, EBX        

    ; 2. EAX = Val1 + Val2 - 654h + Val3
    MOV EDX, Val1       
    ADD EDX, Val2       
    MOVZX EBX, WORD PTR Val3  
    SUB EDX, 654h       
    ADD EDX, EBX        
    MOV EAX, EDX       

    call DumpRegs

    exit

main ENDP
END main
