.code
; (llong* y, cint* x, int a, short b, int n) -> y[i] = a * x[i] + b
CalcArrayValues_ proc frame
; Prolog
    push rsi
    .pushreg rsi
    push rdi
    .pushreg rdi
    .endprolog

    xor rax, rax
    mov r11d, [rsp + 56]; r11d = n
    cmp r11d, 0
    jle InvalidCount

    mov rsi, rdx
    mov rdi, rcx

    movsxd r8, r8d
    movsx r9, r9w
    xor edx, edx; i = 0

    @@: movsxd rcx, dword ptr [rsi + rdx * 4]
    imul rcx, r8
    add rcx, r9
    mov qword ptr [rdi + rdx * 8], rcx
    add rax, rcx
    inc edx
    cmp edx, r11d
    jl @B
InvalidCount:
; Epilog
    pop rdi
    pop rsi
    ret
CalcArrayValues_ endp
end