.code
; (int8 a, int16 b, int32 c, int64 d, int8 e, int16 f, int32 g, int64 h)
IntegerMulExtend proc
    ; a * b * c * d
    movsx rax, cl
    movsx rdx, dx
    imul  rax, rdx
    movsxd rcx, r8d
    imul rcx, r9
    imul rax, rcx

    ;e * f * g * h
    movsx rcx, byte ptr [rsp + 40]
    movsx rdx, word ptr [rsp + 48]
    imul rcx, rdx
    movsxd rdx, dword ptr [rsp + 56]
    imul rdx, qword ptr [rsp + 64]
    imul rcx, rdx

    imul rax, rcx
    ret
IntegerMulExtend endp

; (uint8 a, uint16 b, uint32 c, uint64 d, uint8 e, uint16 f, uint32 g, uint64 h)
UnsignedIntegerDivExtend proc
    ; a + b + c + d
    movzx rax, cl
    movzx rdx, dx
    add rax, rdx
    mov r8d, r8d
    add r8, r9
    add rax, r8
    xor rdx, rdx

    ; e + f + g + h
    movzx r8, byte ptr [rsp + 40]
    movzx r9, word ptr [rsp + 48]
    add r8, r9
    mov r10d, [rsp + 56]
    add r10, [rsp + 64]
    add r8, r10
    jnz DivOk
    xor eax, eax
    jmp Done

    ; (a + b + c + d) / (e + f + g + h)
    DivOk:
    div r8
    mov rcx, [rsp + 72]
    mov [rcx], rax
    mov rcx, [rsp + 80]
    mov [rcx], rdx
    mov eax, 1
    Done:
    ret
UnsignedIntegerDivExtend endp

end
