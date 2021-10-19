.code
; a + b + c -d
IntegerAddSub_ proc
    
    mov eax, ecx
    add eax, edx
    add eax, r8d
    sub eax, r9d
    ret
IntegerAddSub_ endp
 end