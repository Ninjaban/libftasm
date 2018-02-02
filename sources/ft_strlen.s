section .data
section .text
    global _ft_strlen
    global _internal_strlen
    global _ft_strlen_ret

_ft_strlen:
    mov rax, 0
    call _internal_strlen
    ret

_internal_strlen:
    cmp byte[rax], 0
    jz _ft_strlen_ret
    inc rax
    jmp _internal_strlen

_ft_strlen_ret:
    ret