section .data
section .text
    global _ft_memset

_ft_memset:
    cmp rcx, 0
    jg _ft_memset_loop
    jmp _ft_memset_end

_ft_memset_loop:
    cmp rcx, 0
    je _ft_memset_end
    dec rcx
    mov al, [rdx]
    mov byte [rsi+rcx], al
    jmp _ft_memset_loop

_ft_memset_end:
    ret