; (a, b, c*, d*) -> (b << a, b >> a)
.code
IntegegerShift_ proc
    xor eax, eax
    cmp edx, 31
    ja InvalidCount

    xchg ecx, edx
    mov  eax, edx
    shl  eax, cl
    mov  [r8], eax

    shr  edx, cl
    mov  [r9], edx

    mov eax, 1

InvalidCount:
    ret

IntegegerShift_ endp
    end

