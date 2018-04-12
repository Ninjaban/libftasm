section .text
    global _ft_strdup
    extern _ft_strlen
    extern _ft_memcpy
    extern _malloc
    
_ft_strdup:
    cmp rdi, 0
    je _ft_strdup_end
    jmp _ft_strdup_dup

_ft_strdup_dup:
    call _ft_strlen
    push rdi
    mov rdi, rax
    inc rdi
    mov r15, rax
    call _malloc
    cmp rax, 0
    je _ft_strdup_end
    pop rdi
    mov rsi, rdi
    mov rdi, rax
    mov rdx, r15
    mov byte [rdi + rdx], 0
    call _ft_memcpy

_ft_strdup_end:
    ret