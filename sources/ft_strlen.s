section .data
section .text
    global _ft_strlen
    global _internal_strlen
    global _ft_strlen_ret

_ft_strlen:
    push rcx
    push rdi
    sub rcx, rcx
    sub rdi, rdi
    not rcx
    repne scasb
    not rcx
    mov rax, rcx
    pop rcx
    pop rdi
    ret
