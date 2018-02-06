section .data
    string1 db 'Hello', 10
    string2 db 'World!', 10
    len1 equ $ - string1
    len2 equ $ - string2

section .text
    global start
	global _main
	extern _ft_puts
	extern _ft_bzero

start:
    call _main
    ret

_main:
    lea rsi, [rel string1]
    call _ft_puts
    mov rdi, rsi
    lea rdi, [rel string2]
    mov rcx, len2
    call _ft_puts
	ret