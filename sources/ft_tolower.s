section .text
    global _ft_tolower

_ft_tolower:
    cmp rdi, 65
    jge _ft_tolower_upper_than_a
    jmp _ft_tolower_end

_ft_tolower_upper_than_a:
    cmp rdi, 90
    jle _ft_tolower_lower_than_z
    jmp _ft_tolower_end

_ft_tolower_lower_than_z:
    sub rdi, 65
    add rdi, 97
    jmp _ft_tolower_end

_ft_tolower_end:
    mov rax, rdi
    ret
