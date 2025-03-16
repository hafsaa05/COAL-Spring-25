INCLUDE Irvine32.inc

.data
    empID DWORD 5 DUP(?)
    empName BYTE 5 DUP(30 DUP(?))
    empDOB DWORD 5 DUP(?)
    empSalary DWORD 5 DUP(?)
    totalAnnualSalary DWORD 0

    msgID BYTE "Enter ID for employee: ", 0
    msgName BYTE "Enter employee's name: ", 0
    msgDOB BYTE "Enter birth year of employee: ", 0
    msgSalary BYTE "Enter employee's yearly salary: ", 0
    msgTotal BYTE "Total salary of all employees: ", 0

.code
main PROC
    mov ecx, 5
    xor esi, esi

inputLoop:
    mov edx, OFFSET msgID
    call WriteString
    call ReadInt
    mov empID[esi * 4], eax

    mov edx, OFFSET msgName
    call WriteString
    lea edx, empName[esi * 30]
    call ReadString

    mov edx, OFFSET msgDOB
    call WriteString
    call ReadInt
    mov empDOB[esi * 4], eax

    mov edx, OFFSET msgSalary
    call WriteString
    call ReadInt
    mov empSalary[esi * 4], eax
    add totalAnnualSalary, eax

    inc esi
    loop inputLoop

    mov edx, OFFSET msgTotal
    call WriteString
    mov eax, totalAnnualSalary
    call WriteInt

    exit
main ENDP
END main
