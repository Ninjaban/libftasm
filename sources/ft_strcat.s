section .text
    global _ft_strcat
    extern _ft_strlen
    
_ft_strcat:
    call _ft_strlen
    mov rdx, rax
    cmp rcx, 0
    jg _ft_strcat_check
    jmp _ft_strcat_end

_ft_strcat_check:
    add rdx, rcx
    mov byte [rdi+rdx], 0
    jmp _ft_strcat_loop

_ft_strcat_loop:
    cmp rcx, 0
    je ft_strcat_end
    dec rcx
    mov byte [rdi+rdx], byte [rsi+rcx]
    jmp _ft_strcat_loop

_ft_strcat_end:
    mov rax, rdi
    ret