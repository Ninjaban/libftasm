section .text
    global _ft_digit
    
_ft_digit:
    mov rax, 0
    jmp _ft_isdigit_0

_ft_isdigit_0:
    cmp rsi, 48
    jge _ft_isdigit_9
    jmp _ft_isdigit_end

_ft_isdigit_9:
    cmp rsi, 57
    jle _ft_isdigit_ok
    jmp _ft_isdigit_end

_ft_isdigit_ok:
    mov rax, 1
    jmp _ft_isdigit_end

_ft_isdigit_end:
    ret