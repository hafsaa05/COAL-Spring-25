INCLUDE Irvine32.inc

.data
    arr DWORD 100, 150, 200, 250  
    result DWORD ?                

.code
main PROC
    mov esi, OFFSET arr        ; Point to first element
    mov eax, [esi]             
    add esi, 4                 ; Point to second element

    sub eax, [esi]             
    add esi, 4                 ; Point to third element

    sub eax, [esi]             
    add esi, 4                 ; Point to fourth element

    sub eax, [esi]            

    mov result, eax            

    call ExitProcess
main ENDP

END main
