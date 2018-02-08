%define MACH_SYSCALL(nb)    0x2000000 | nb
%define READ                3
%define READ_BUF            4096

section .data
    buffer_size dw 1024

section .bss
    buffer resb 1024

section .text
    global _ft_cat
    extern _ft_puts

_ft_cat:
    mov rcx, buffer
    mov r15, rcx
    mov rdx, buffer_size
    mov rax, MACH_SYSCALL(READ)
    syscall
    cmp rax, 0
    je _ft_cat_end
    sub r15, 9
    mov byte [r15 + rax], 0
    mov rsi, r15
    call _ft_puts
    jmp _ft_cat

_ft_cat_end:
    ret