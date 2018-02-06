section .data
    string db 'Helloqwertyuiop', 0, 'totototo'
    len equ $ - string
    data db ' World!', 10, 0
    size equ $ - data

section .text
    global start
	global _main
	extern _ft_puts
	extern _ft_strcat
	extern _ft_strlen
	extern _ft_strdup

start:
    call _main
    ret

_main:
    lea rsi, [rel data]
    call _ft_strdup
    mov rsi, rax
    call _ft_puts
	ret