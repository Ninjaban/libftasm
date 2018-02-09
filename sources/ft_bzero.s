section .text
    global _ft_bzero
    
_ft_bzero:
    cmp rcx, 0
    jg _ft_bzero_loop
    jmp _ft_bzero_end

_ft_bzero_loop:
    cmp rcx, 0
    je _ft_bzero_end
    dec rcx
    mov byte [rdi+rcx], 0
    jmp _ft_bzero_loop

_ft_bzero_end:
    ret