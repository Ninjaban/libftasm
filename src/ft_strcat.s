section .text
    global _ft_strcat
    extern _ft_strlen

_ft_strcat:
    mov r11, rdi
    mov rdi, rsi
    call _ft_strlen
    mov r9, rax
    mov rdi, r11
    call _ft_strlen
    mov r10, rax
    cmp r9, 0
    jg _ft_strcat_check
    jmp _ft_strcat_end

_ft_strcat_check:
    mov r8, 0
    jmp _ft_strcat_loop

_ft_strcat_loop:
    cmp r8, r9
    jg _ft_strcat_loop_end
    mov al, [rsi+r8]
    inc r8
    mov byte [rdi+r10], al
    inc r10
    jmp _ft_strcat_loop

_ft_strcat_loop_end:
    mov byte [rdi+r10], 0
    jmp _ft_strcat_end

_ft_strcat_end:
    mov rax, rdi
    ret