INCLUDE Irvine32.inc

.data
    arrayB BYTE 60, 70, 80
    arrayW WORD 150, 250, 350
    arrayD DWORD 600, 1200, 1800

.code
main PROC
    mov esi, OFFSET arrayB
    mov al, [esi]
    add al, [esi + 2 * TYPE arrayB]
    mov bl, al    

    mov esi, OFFSET arrayW
    mov ax, [esi]
    add ax, [esi + 2 * TYPE arrayW]
    mov bx, ax    

    mov esi, OFFSET arrayD
    mov eax, [esi]
    add eax, [esi + 2 * TYPE arrayD]
    mov ebx, eax  

    call DumpRegs
    call ExitProcess
main ENDP

END main
