%define MACH_SYSCALL(nb)    0x2000000 | nb
%define STDOUT              1
%define WRITE               4

section .text
	global _ft_puts
	extern _ft_strlen

_ft_puts:
	call _ft_strlen			; Call ft_strlen()

	push rdx			; Sauve rdx sur la pile
	push rsi			; Sauve rsi sur la pile

	mov rdx, rax			; Param 3 = ft_strlen return
	mov rsi, rdi			; Param 2 = String

	mov word [rsi+rdx], 10		; Set String + String_len a '\n'
	inc rdx				; String_len += 1
	
	mov rdi, STDOUT			; Param 1 = STDOUT
	mov rax, MACH_SYSCALL(WRITE)	; Initialise l'appelle a write()
	syscall

	pop rsi				; reset rsi
	pop rdx				; reset rdx

	ret				; return (rax);
