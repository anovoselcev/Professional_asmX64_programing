; table of encoding
.const
FibVals dword 0, 1, 1, 2, 3, 5, 8, 13
        dword 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597

NumFibVals_ dword ($ - FibVals) / sizeof dword
    public NumFibVals_

.data
; address over RIP
FibValsSum_ dword ?
    public FibValsSum_

; (int i, int* v1, int* v2, int* v3, int* v4) -> int(err code)
.code
MemoryAddressing_ proc

    cmp ecx, 0; check i
    jl InvalidIndex
    cmp ecx, [NumFibVals_]; check i >= NumFibVals_
    jge InvalidIndex

    movsxd rcx, ecx; extend i
    mov [rsp + 8], rcx; save i

    mov r11, offset FibVals; r11 = FibVals
    shl rcx, 2; rcx = i * 4
    add r11, rcx; r11 = FibVals + i * 4
    mov eax, [r11]; eax = FibVals[i]
    mov [rdx], eax; save eax in v1

    mov r11, offset FibVals; r11 = FibVals
    mov rcx, [rsp + 8]; rcx = i
    shl rcx, 2; rcx = i * 4
    mov eax, [r11 + rcx]; eax = FibVals[i]
    mov [r8], eax; save eax in v2

    mov r11, offset FibVals; r11 = FibV
    mov rcx, [rsp + 8]; rcx = i
    mov eax, [r11 + rcx * 4]; eax = FibVals[i]
    mov [r9], eax; save eax in v3

    mov r11, offset FibVals - 42; r11 = FibVals - 42
    mov rcx, [rsp + 8]; rcx = i
    mov eax, [r11 + rcx * 4 + 42]; eax = FibVals[i]
    mov r10, [rsp + 40]; r10 = ptr to v4
    mov [r10], eax; save in v4

    add [FibValsSum_], eax; refresh sum
    mov eax, 1; error code ok
    ret
    
InvalidIndex:
    xor eax, eax
    ret
MemoryAddressing_ endp
end