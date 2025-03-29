INCLUDE Irvine32.inc

.data
star BYTE "*",0
space BYTE " ",0
columns DWORD 5     

.code
main PROC
    mov ecx, 1     
    
row_loop:
    cmp ecx, columns
    jg done
    
    ; Print leading spaces
    mov ebx, columns
    sub ebx, ecx    ; spaces = columns - current_row
    mov edx, 0      ; space counter
    
space_loop:
    cmp edx, ebx
    jge print_stars
    push edx        
    mov edx, OFFSET space
    call WriteString
    pop edx
    inc edx
    jmp space_loop

print_stars:
    mov esi, 0      ; star counter
    
star_loop:
    cmp esi, ecx
    jge next_line
    push esi        
    mov edx, OFFSET star
    call WriteString
    pop esi
    inc esi
    jmp star_loop

next_line:
    call Crlf       
    inc ecx         
    jmp row_loop

done:
    exit
main ENDP
END main
