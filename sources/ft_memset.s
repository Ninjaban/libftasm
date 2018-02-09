section .data
section .text
    global _ft_memset

_ft_memset:
    cmp rdx, 0
    jg _ft_memset_loop
    jmp _ft_memset_end

_ft_memset_loop:
    cmp rdx, 0
    je _ft_memset_end
    dec rdx
    mov byte [rdi + rdx], sil
    jmp _ft_memset_loop

_ft_memset_end:
    mov rax, rdi
    ret