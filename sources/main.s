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
	extern _ft_cat

start:
    call _main
    ret

_main:
lea rsi, [rel data]
    mov rdx, 0
    call _ft_cat
	ret