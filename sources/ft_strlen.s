section .text
    global _ft_strlen

_ft_strlen:
    mov r8, 0
    jmp _ft_strlen_loop

_ft_strlen_loop:
    cmp byte [rsi + r8], 0
    je _ft_strlen_end
    inc r8
    jmp _ft_strlen_loop

_ft_strlen_end:
    mov rax, r8
    ret
