%define MACH_SYSCALL(nb)    0x2000000 | nb
%define STDOUT              1
%define WRITE               4

section .data
    nl db 10

section .text
    global _ft_puts
    extern _ft_strlen

_ft_puts:
    call _ft_strlen
    push rdx
    mov rdx, rax
    mov rsi, rdi
    mov rdi, STDOUT
    mov rax, MACH_SYSCALL(WRITE)
    syscall
    lea rsi,[rel nl]
    mov rdx, 1
    mov rdi, STDOUT
    mov rax, MACH_SYSCALL(WRITE)
    syscall
    pop rdx
    ret