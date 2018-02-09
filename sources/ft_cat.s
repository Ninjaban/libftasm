%define MACH_SYSCALL(nb)    0x2000000 | nb
%define STDOUT              1
%define READ                3
%define WRITE               4

section .data
    buffer_size equ 10
section .bss
    buffer resb 10

section .text
    global _ft_cat

_ft_cat:
    jmp _ft_cat_read

_ft_cat_read:
    mov r14, rdi
    lea rcx, [rel buffer]
    mov rdx, buffer_size
    mov rax, MACH_SYSCALL(READ)
    syscall
    cmp rax, 0
    jle _ft_cat_end
    jmp _ft_cat_write

_ft_cat_write:
    mov rdx, rax
    lea rsi, [rel buffer]
    mov rdi, STDOUT
    mov rax, MACH_SYSCALL(WRITE)
    syscall
    mov rdi, r14
    jmp _ft_cat_read

_ft_cat_end:
    ret