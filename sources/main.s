section .data
    string db 'Hello World!', 10

section .text
    global start
	global _main
	extern _ft_puts

start:
    call _main
    ret

_main:
    lea rsi, [rel string]
    call _ft_puts
	ret