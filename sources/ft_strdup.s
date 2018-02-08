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
    mov r14, rax
    mov r15, rsi
    call _malloc
    cmp rax, 0
    je _ft_strdup_end
    mov rsi, r15
    mov rdi, rax
    mov rcx, r14
    mov byte [rdi + rcx], 0
    call _ft_memcpy

_ft_strdup_end:
    ret