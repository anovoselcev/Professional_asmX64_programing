extern g_val:dword
.code
; (((a and b) or c) xor d) + g
IntegerLogical_ proc
    and ecx, edx
    or ecx, r8d
    xor ecx, r9d
    add ecx, [g_val]

    mov eax, ecx
    ret
IntegerLogical_ endp
end