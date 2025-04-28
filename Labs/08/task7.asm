INCLUDE Irvine32.inc

.data
    num DWORD 0
    mon BYTE "Monday", 0
    tue BYTE "Tuesday", 0
    wed BYTE "Wednesday", 0
    thu BYTE "Thursday", 0
    fri BYTE "Friday", 0
    sat BYTE "Saturday", 0
    sun BYTE "Sunday", 0
    prompt BYTE "Enter a number (1 and 7): ", 0

.code
main PROC

    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov ebx, eax

    cmp ebx, 1
    je m
    cmp ebx, 2
    je t
    cmp ebx, 3
    je w
    cmp ebx, 4
    je th
    cmp ebx, 5
    je f
    cmp ebx, 6
    je s
    cmp ebx, 7
    je su

    jmp end_program

m:
    mov edx, OFFSET mon
    call WriteString
    jmp end_program

t:
    mov edx, OFFSET tue
    call WriteString
    jmp end_program

w:
    mov edx, OFFSET wed
    call WriteString
    jmp end_program

th:
    mov edx, OFFSET thu
    call WriteString
    jmp end_program

f:
    mov edx, OFFSET fri
    call WriteString
    jmp end_program

s:
    mov edx, OFFSET sat
    call WriteString
    jmp end_program

su:
    mov edx, OFFSET sun
    call WriteString
    jmp end_program

end_program:
    exit
main ENDP

END main
