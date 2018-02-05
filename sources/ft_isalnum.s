section .text
    global _ft_isalnum

_ft_isalnum:
    mov rax, 0
    jmp _ft_isalnum_A

_ft_isalnum_A:
    cmp rsi, 65
    jge _ft_isalnum_Z
    jmp _ft_isalnum_a

_ft_isalnum_Z:
    cmp rsi, 90
    jle _ft_isalnum_ok
    jmp _ft_isalnum_a

_ft_isalnum_a:
    cmp rsi, 97
    jge _ft_isalnum_z
    jmp _ft_isalnum_0

_ft_isalnum_z:
    cmp rsi, 122
    jle _ft_isalnum_ok
    jmp _ft_isalnum_0

_ft_isalnum_0:
    cmp rsi, 48
    jge _ft_isalnum_9
    jmp _ft_isalnum_end

_ft_isalnum_9:
    cmp rsi, 57
    jle _ft_isalnum_ok
    jmp _ft_isalnum_end

_ft_isalnum_ok:
    mov rax, 1
    jmp _ft_isalnum_end

_ft_isalnum_end:
    ret