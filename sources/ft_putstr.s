%define MACH_SYSCALL(nb)    0x2000000 | nb
%define STDOUT              1
%define WRITE               4

section .data
	string db '(null)', 0
	
section .text
	global _ft_putstr
	extern _ft_fputstr

_ft_putstr:
	push rsi			; Sauve rsi sur la pile

	mov rsi, rdi			; Param 2 = str
	mov rdi, STDOUT			; Param 1 = STDOUT

	call _ft_fputstr		; Call ft_fputstr()

	pop rsi				; reset rsi

	ret				; return (rax);
