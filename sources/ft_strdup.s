section .text
    global _ft_strdup
    extern _ft_strlen
    extern _ft_memcpy
    extern _ft_puts
    extern _malloc
    
_ft_strdup:
    cmp rsi, 0
    je _ft_strdup_end
    jmp _ft_strdup_dup

_ft_strdup_dup:
    call _ft_strlen
    inc rax
    mov rdi, rax
    mov r8, rax
    mov r15, rsi
    call _malloc
    mov rdi, rax
    mov byte [rdi + r8], 0
    mov rcx, r8
    mov rsi, r15
    call _ft_puts
    call _ft_memcpy
    jmp _ft_strdup_end

_ft_strdup_end:
    ret