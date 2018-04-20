%define MACH_SYSCALL(nb)    0x2000000 | nb
%define STDOUT              1
%define WRITE               4

section .data
	string db '(null)', 0
	
section .text
	global _ft_putstr
	extern _ft_strlen

_ft_putstr:
	cmp rdi, 0
	je _ft_putstr_null		; Si rdi est NULL va a _ft_putstr_null
	jmp _ft_putstr_string		; Va a _ft_putstr_string	

_ft_putstr_null:
	lea rdi, [rel string]		; Charge string dans rdi
	jmp _ft_putstr_string		; Va a _ft_putstr_string

_ft_putstr_string:	
	call _ft_strlen			; Call ft_strlen()

	push rdx			; Sauve rdx sur la pile
	push rsi			; Sauve rsi sur la pile

	mov rdx, rax			; Param 3 = ft_strlen return
	mov rsi, rdi			; Param 2 = String
	mov rdi, STDOUT			; Param 1 = STDOUT
	mov rax, MACH_SYSCALL(WRITE)	; Initialise l'appelle a write()
	syscall

	pop rsi				; reset rsi
	pop rdx				; reset rdx

	ret				; return (rax);
