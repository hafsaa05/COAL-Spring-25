INCLUDE Irvine32.inc

.data
    var1 DWORD 5
    var2 DWORD 6
    var3 DWORD 7

.code
main PROC
    push var3        
    push var2
    push var1        
    call ThreeProd
    exit
main ENDP

ThreeProd PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]     ; var1
    mov ebx, [ebp+12]    ; var2
    mov ecx, [ebp+16]    ; var3

    imul eax, ebx        
    imul eax, ecx        

    call WriteDec        
    call Crlf            

    pop ebp
    ret
ThreeProd ENDP

END main


