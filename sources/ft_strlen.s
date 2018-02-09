section .text
    global _ft_strlen

_ft_strlen:
    push r8
    mov r8, 0
    jmp _ft_strlen_loop

_ft_strlen_loop:
    cmp byte [rdi + r8], 0
    je _ft_strlen_end
    inc r8
    jmp _ft_strlen_loop

_ft_strlen_end:
    mov rax, r8
    pop r8
    ret
