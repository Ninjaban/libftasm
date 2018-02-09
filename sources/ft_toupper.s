section .text
    global _ft_toupper

_ft_toupper:
    cmp rdi, 97
    jge _ft_toupper_upper_than_a
    jmp _ft_toupper_end

_ft_toupper_upper_than_a:
    cmp rdi, 122
    jle _ft_toupper_lower_than_z
    jmp _ft_toupper_end

_ft_toupper_lower_than_z:
    sub rdi, 97
    add rdi, 65
    jmp _ft_toupper_end

_ft_toupper_end:
    mov rax, rdi
    ret