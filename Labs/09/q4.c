INCLUDE Irvine32.inc

.data
    prompt      BYTE "Enter a number: ", 0
    isPrimeMsg  BYTE " is prime", 0
    notPrimeMsg BYTE " is not prime", 0
    largestMsg  BYTE "Largest Prime: ", 0

    n1 DWORD ?
    n2 DWORD ?
    n3 DWORD ?
    n4 DWORD ?

.code

CheckPrime PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    cmp eax, 2
    jl notPrime

    mov ecx, 2

checkLoop:
    mov edx, ecx
    imul edx, ecx
    cmp edx, [ebp + 8]
    jg isPrime

    mov eax, [ebp + 8]
    xor edx, edx
    div ecx
    cmp edx, 0
    je notPrime

    inc ecx
    jmp checkLoop

isPrime:
    mov eax, 1
    jmp endCheck

notPrime:
    mov eax, 0

endCheck:
    pop ebp
    ret 4
CheckPrime ENDP

LargestPrime PROC
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    cmp eax, [ebp + 12]
    jge skipB
    mov eax, [ebp + 12]

skipB:
    cmp eax, [ebp + 16]
    jge skipC
    mov eax, [ebp + 16]

skipC:
    cmp eax, [ebp + 20]
    jge skipD
    mov eax, [ebp + 20]

skipD:
    pop ebp
    ret 16
LargestPrime ENDP

main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov n1, eax
    push eax
    call CheckPrime
    cmp eax, 0
    je notPrime1
    mov eax, n1
    call WriteDec
    mov edx, OFFSET isPrimeMsg
    call WriteString
    call Crlf
    jmp cont1
notPrime1:
    mov eax, n1
    call WriteDec
    mov edx, OFFSET notPrimeMsg
    call WriteString
    call Crlf
    jmp done
cont1:

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov n2, eax
    push eax
    call CheckPrime
    cmp eax, 0
    je notPrime2
    mov eax, n2
    call WriteDec
    mov edx, OFFSET isPrimeMsg
    call WriteString
    call Crlf
    jmp cont2
notPrime2:
    mov eax, n2
    call WriteDec
    mov edx, OFFSET notPrimeMsg
    call WriteString
    call Crlf
    jmp done
cont2:

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov n3, eax
    push eax
    call CheckPrime
    cmp eax, 0
    je notPrime3
    mov eax, n3
    call WriteDec
    mov edx, OFFSET isPrimeMsg
    call WriteString
    call Crlf
    jmp cont3
notPrime3:
    mov eax, n3
    call WriteDec
    mov edx, OFFSET notPrimeMsg
    call WriteString
    call Crlf
    jmp done
cont3:

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov n4, eax
    push eax
    call CheckPrime
    cmp eax, 0
    je notPrime4
    mov eax, n4
    call WriteDec
    mov edx, OFFSET isPrimeMsg
    call WriteString
    call Crlf
    jmp allPrime
notPrime4:
    mov eax, n4
    call WriteDec
    mov edx, OFFSET notPrimeMsg
    call WriteString
    call Crlf
    jmp done

allPrime:
    push n4
    push n3
    push n2
    push n1
    call LargestPrime
    mov edx, OFFSET largestMsg
    call WriteString
    call WriteDec
    call Crlf

done:
    exit
main ENDP
END main
