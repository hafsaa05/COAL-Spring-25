INCLUDE Irvine32.inc

IsCompare PROTO

.data
    Str1 BYTE "Hello", 0
    Str2 BYTE "Hello", 0
    resultMsg BYTE "Strings are equal", 0
    notEqualMsg BYTE "Strings are not equal", 0

.code

main PROC
    push OFFSET Str2        
    push OFFSET Str1        
    call IsCompare         
    cmp eax, 0              
    je Equal
    mov edx, OFFSET notEqualMsg
    call WriteString
    call Crlf
    jmp Done

Equal:
    mov edx, OFFSET resultMsg
    call WriteString
    call Crlf

Done:
    exit
main ENDP

IsCompare PROC
    push ebp
    mov ebp, esp
    push edi
    push esi
    push ecx

    mov esi, [ebp+8]         
    mov edi, [ebp+12]        

CompareLoop:
    mov al, [esi]            
    mov bl, [edi]            
    cmp al, bl               
    jne NotEqual             
    test al, al              
    jz EqualStrings          
    inc esi                  
    inc edi                  
    jmp CompareLoop

NotEqual:
    mov eax, 1               
    jmp Cleanup

EqualStrings:
    mov eax, 0               

Cleanup:
    pop ecx
    pop esi
    pop edi
    pop ebp
    ret 8
IsCompare ENDP

END main

