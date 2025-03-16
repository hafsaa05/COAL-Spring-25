include irvine32.inc
.code
main proc
    mov ecx, 10
    xor eax, eax
    mov ebx, 1
    call WriteInt
L1:
    xchg eax, ebx
    add eax, ebx
    call WriteInt
    loop L1
    exit
main endp
end main
