section .text
    global _ft_strcat
    extern _ft_strlen
    
_ft_strcat:
    call _ft_strlen
    mov rdx, rax
    jmp _ft_strcat_loop

_ft_strcat_loop:
    cmp rcx, 0
    jle ft_strcat_end
    dec rcx
    mov byte [rdi+rdx+rcx], byte [rsi+rcx]
    jmp _ft_strcat_loop

_ft_strcat_end:
    mov rax, rdi
    ret