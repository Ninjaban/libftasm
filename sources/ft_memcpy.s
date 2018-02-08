section .data
section .text
    global _ft_memcpy

_ft_memcpy:
    mov r9, rcx
    cmp r9, 0
    jg _ft_memcpy_check
    jmp _ft_memcpy_end

_ft_memcpy_check:
    mov r8, 0
    mov r10, 0
    jmp _ft_memcpy_loop

_ft_memcpy_loop:
    cmp r8, r9
    jg _ft_memcpy_end
    mov al, [rsi+r8]
    inc r8
    mov byte [rdi+r10], al
    inc r10
    jmp _ft_memcpy_loop

_ft_memcpy_end:
    mov rax, rdi
    ret
