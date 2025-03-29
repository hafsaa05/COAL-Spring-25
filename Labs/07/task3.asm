INCLUDE Irvine32.inc
.data
arr1 DWORD 12, 14, 16, 18, 20
arr2 DWORD 22, 24, 26, 28, 30
sum1 DWORD ?
sum2 DWORD ?
res DWORD ?

.code

proc1 PROC
    mov esi, OFFSET arr1
    mov ecx, 5
    mov eax, 0
loop1:
    add eax, [esi]
    add esi, 4
    loop loop1
    mov sum1, eax
    ret
proc1 ENDP

proc2 PROC
    mov esi, OFFSET arr2
    mov ecx, 5
    mov eax, 0
loop2:
    add eax, [esi]
    add esi, 4
    loop loop2
    mov sum2, eax
    ret
proc2 ENDP

proc3 PROC
    mov eax, sum1
    add eax, sum2
    mov res, eax
    ret
proc3 ENDP

main PROC
    call proc1
    call proc2
    call proc3
    mov eax, res
    call WriteDec
    call crlf
    ret
main ENDP

END main
