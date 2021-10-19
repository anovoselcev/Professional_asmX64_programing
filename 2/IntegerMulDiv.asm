.code
; (a, b) -> (a * b, a / b, a % b)

IntegerMulDiv_ proc

    mov eax, edx
    or  eax, eax
    jz  InvalidDivisor

    imul eax, ecx
    mov  [r8], eax

    mov  r10d, edx
    mov  eax, ecx
    cdq
    idiv r10d

    mov  [r9], eax
    mov  rax, [rsp + 40]
    mov  [rax], edx
    mov  eax, 1

    InvalidDivisor:
        ret

IntegerMulDiv_ endp
end