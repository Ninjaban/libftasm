%define MACH_SYSCALL(nb)    0x2000000 | nb
%define WRITE               4

section .data
	string db '(null)', 0
	
section .text
	global _ft_fputstr
	extern _ft_strlen

_ft_fputstr:
	push r9				; Push r9 sur la stack

	cmp rsi, 0
	je _ft_fputstr_null		; Si rdi est NULL va a _ft_putstr_null
	jmp _ft_fputstr_string		; Va a _ft_putstr_string	

_ft_fputstr_null:
	lea rsi, [rel string]		; Charge string dans rdi
	jmp _ft_fputstr_string		; Va a _ft_putstr_string

_ft_fputstr_string:
	mov r9, rdi			; Sauve rdi dans r9
	mov rdi, rsi			; Set rdi a rsi
	call _ft_strlen			; Call ft_strlen()

	push rdx			; Sauve rdx sur la pile

	mov rdx, rax			; Param 3 = ft_strlen return
	mov rsi, rdi			; Param 2 = String
	mov rdi, r9			; Param 1 = r9
	mov rax, MACH_SYSCALL(WRITE)	; Initialise l'appelle a write()
	syscall

	pop rdx				; reset rdx
	pop r9				; reset r9

	ret				; return (rax);
