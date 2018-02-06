section .text
    global _ft_toupper

_ft_toupper:
    cmp rdx, 97
    jge _ft_toupper_upper_than_a
    jmp _ft_toupper_end

_ft_toupper_upper_than_a:
    cmp rdx, 122
    jle _ft_toupper_lower_than_z
    jmp _ft_toupper_end

_ft_toupper_lower_than_z:
    sub rdx, 97
    add rdx, 65
    jmp _ft_toupper_end

_ft_toupper_end:
    mov rax, rdx
    ret