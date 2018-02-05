section .text
    global _ft_strlen

_ft_strlen:
    mov rcx, 0
    jmp _ft_strlen_loop

_ft_strlen_loop:
    cmp byte [rsi + rcx], 0
    je _ft_strlen_end
    inc rcx
    jmp _ft_strlen_loop

_ft_strlen_end:
    mov rax, rcx
    ret
