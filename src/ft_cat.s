%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT			1
%define READ			3
%define WRITE			4
%define BUFFER_SIZE		1024

section .text
	global _ft_cat

_ft_cat:
	push rbp
	mov rbp, rsp                	; Initialise la stack pour la fonction

	sub rsp, BUFFER_SIZE		; Ajoute de la stack (multiple de 16 obligatoire !)
	sub rsp, 0x10			; Ajoute de la stack (multiple de 16 obligatoire !)

	jmp _ft_cat_read		; Call _ft_cat_read

_ft_cat_read:
	mov [rsp+BUFFER_SIZE], rdi
	mov rcx, rsp
	mov rdx, BUFFER_SIZE
	mov rax, MACH_SYSCALL(READ)
	syscall
	cmp rax, 0
	jle _ft_cat_end
	jmp _ft_cat_write

_ft_cat_write:
	mov rdx, rax
	mov rsi, rsp
	mov rdi, STDOUT
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	mov rdi, [rsp+BUFFER_SIZE]
	jmp _ft_cat_read

_ft_cat_end:
	add rsp, 0x10			; Rend la stack
	add rsp, BUFFER_SIZE		; Rend la stack

	leave				; reset la stack
	ret				; return (rax);
