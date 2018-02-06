section .data
section .text
    global _ft_memcpy
    extern _ft_puts

_ft_memcpy:
    mov r9, rcx
    call _ft_puts
    cmp r9, 0
    jg _ft_memcpy_check
    jmp _ft_memcpy_end

_ft_memcpy_check:
    mov r8, 0
    mov r10, 0
    call _ft_puts
    jmp _ft_memcpy_loop

_ft_memcpy_loop:
    cmp r8, r9
    jg _ft_memcpy_end
    call _ft_puts
    mov al, [rsi+r8]
    inc r8
    call _ft_puts
    mov byte [rdi+r10], al
    inc r10
    call _ft_puts
    jmp _ft_memcpy_loop

_ft_memcpy_end:
    mov rax, rdi
    ret
