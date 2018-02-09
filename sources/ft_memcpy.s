section .text
    global _ft_memcpy

_ft_memcpy:
    push r8
    push r9
    push r10
    mov r9, rdx
    cmp r9, 0
    jg _ft_memcpy_check
    jmp _ft_memcpy_end

_ft_memcpy_check:
    mov r8, 0
    mov r10, 0
    jmp _ft_memcpy_loop

_ft_memcpy_loop:
    cmp r8, r9
    je _ft_memcpy_end
    mov al, [rsi + r8]
    inc r8
    mov byte [rdi + r10], al
    inc r10
    jmp _ft_memcpy_loop

_ft_memcpy_end:
    mov rax, rdi
    pop r10
    pop r9
    pop r8
    ret
