section .text
    global _ft_isascii
    
_ft_isascii:
    mov rax, 0
    jmp _ft_isascii_0

_ft_isascii_0:
    cmp rdi, 0
    jge _ft_isascii_127
    jmp _ft_isascii_end

_ft_isascii_127:
    cmp rdi, 127
    jle _ft_isascii_ok
    jmp _ft_isascii_end

_ft_isascii_ok:
    mov rax, 1
    jmp _ft_isascii_end

_ft_isascii_end:
    ret
