section .text
    global _ft_isalnum

_ft_isalnum:
    mov rax, 0
    jmp _ft_isalnum_A

_ft_isalnum_A:
    cmp rdi, 'A'
    jge _ft_isalnum_Z
    jmp _ft_isalnum_a

_ft_isalnum_Z:
    cmp rdi, 'Z'
    jle _ft_isalnum_ok
    jmp _ft_isalnum_a

_ft_isalnum_a:
    cmp rdi, 'a'
    jge _ft_isalnum_z
    jmp _ft_isalnum_0

_ft_isalnum_z:
    cmp rdi, 'z'
    jle _ft_isalnum_ok
    jmp _ft_isalnum_0

_ft_isalnum_0:
    cmp rdi, '0'
    jge _ft_isalnum_9
    jmp _ft_isalnum_end

_ft_isalnum_9:
    cmp rdi, '9'
    jle _ft_isalnum_ok
    jmp _ft_isalnum_end

_ft_isalnum_ok:
    mov rax, 1
    jmp _ft_isalnum_end

_ft_isalnum_end:
    ret