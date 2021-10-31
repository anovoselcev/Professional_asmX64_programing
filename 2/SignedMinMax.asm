.code
; min(a, b, c)
SignedMinA_ proc
    mov eax, ecx
    cmp eax, edx; compare a and b
    jle @F; if a <= b
    mov eax, edx; eax = b
@@: cmp eax, r8d; min(a, b) and c
    jle @F; if min(a, b) <= c 
    mov eax, r8d
@@: ret
SignedMinA_ endp

; max(a, b, c)
SignedMaxA_ proc
    mov eax, ecx
    cmp eax, edx
    jle @F
    mov eax, edx
@@: cmp eax, r8d
    jge @F
    mov eax, r8d
@@: ret
SignedMaxA_ endp

; min(a, b, c)
SignedMinB_ proc
    cmp ecx, edx
    cmovg ecx, edx; ecx = min(a, b)
    cmp ecx, r8d
    cmovg ecx, r8d; ecx = min(a, b, c)
    mov eax, ecx
    ret
SignedMinB_ endp

; max(a, b, c)
SignedMaxB_ proc
    cmp ecx, edx
    cmovl ecx, edx
    cmp ecx, r8d
    cmovl ecx, r8d
    mov eax, ecx
    ret
SignedMaxB_ endp
end