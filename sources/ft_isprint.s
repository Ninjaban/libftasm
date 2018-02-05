section .text
    global _ft_isprint

_ft_isprint:
    mov rax, 0
    jmp _ft_isprint_32

_ft_isprint_32:
    cmp rsi, 32
    jge _ft_isprint_126
    jmp _ft_isprint_end

_ft_isprint_126:
    cmp rsi, 126
    jle _ft_isprint_ok
    jmp _ft_isprint_end

_ft_isprint_ok:
    mov rax, 1
    jmp _ft_isprint_end

_ft_isprint_end:
    ret
