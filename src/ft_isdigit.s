section .text
    global _ft_isdigit
    
_ft_isdigit:
    mov rax, 0
    jmp _ft_isdigit_0

_ft_isdigit_0:
    cmp rdi, '0'
    jge _ft_isdigit_9
    jmp _ft_isdigit_end

_ft_isdigit_9:
    cmp rdi, '9'
    jle _ft_isdigit_ok
    jmp _ft_isdigit_end

_ft_isdigit_ok:
    mov rax, 1
    jmp _ft_isdigit_end

_ft_isdigit_end:
    ret