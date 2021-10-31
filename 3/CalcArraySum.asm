.code
; (const int* x, int n) -> int
CalcArraySum_ proc
    xor eax, eax
    cmp edx, 0
    jle InvalidCount
 @@: add eax, [rcx]
    add rcx, 4
    dec edx
    jnz @B
InvalidCount:
    ret
CalcArraySum_ endp
end