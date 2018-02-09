section .text
    global _ft_isalpha
    
_ft_isalpha:
    mov rax, 0
    jmp _ft_isalpha_A

_ft_isalpha_A:
    cmp rdi, 'A'
    jge _ft_isalpha_Z
    jmp _ft_isalpha_a

_ft_isalpha_Z:
    cmp rdi, 'Z'
    jle _ft_isalpha_ok
    jmp _ft_isalpha_a

_ft_isalpha_a:
    cmp rdi, 'a'
    jge _ft_isalpha_z
    jmp _ft_isalpha_end

_ft_isalpha_z:
    cmp rdi, 'z'
    jle _ft_isalpha_ok
    jmp _ft_isalpha_end

_ft_isalpha_ok:
    mov rax, 1
    jmp _ft_isalpha_end

_ft_isalpha_end:
    ret