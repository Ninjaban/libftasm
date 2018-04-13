%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT			1
%define READ			3
%define WRITE			4
%define BUFFER_SIZE		1024

section .text
	global _ft_cat
	extern _malloc
	extern _free

_ft_cat:
	push rbp
	mov rbp, rsp                	; Initialise la stack pour la fonction

	sub rsp, 0x10			; Ajoute de la stack (multiple de 16 obligatoire !)

	mov [rsp+0x00], rdi		; Sauve fd dans la stack
	mov rdi, BUFFER_SIZE		; Set rdi a BUFFER_SIZE
	call _malloc			; Call malloc

	mov [rsp+0x08], rax		; Sauve le retour de malloc dans la stack

	jmp _ft_cat_read		; Va a _ft_cat_read

_ft_cat_read:
	mov rbx, [rsp+0x00]		; Charge fd depuis la stack
	mov rcx, [rsp+0x08]		; Charge le retour de malloc depuis la stack
	mov rdx, BUFFER_SIZE		; Set rdx a BUFFER_SIZE
	mov rax, MACH_SYSCALL(READ)	; Init read
	syscall				; Call read
	cmp rax, 0
	jle _ft_cat_end			; Si le retour de read est <= a 0 va a _ft_cat_end
	jmp _ft_cat_write		; Va a _ft_cat_write

_ft_cat_write:
	mov rdx, rax			; Set rdx au retour de read
	mov rsi, [rsp+0x08]		; Set rsi au retour de malloc
	mov rdi, STDOUT			; Set rdi a STDOUT
	mov rax, MACH_SYSCALL(WRITE)	; Init write
	syscall				; Call write
	jmp _ft_cat_read		; Va a _ft_cat_read

_ft_cat_end:
	mov rdi, [rsp+0x08]		; Charge le retour de malloc depuis la stack
	call _free			; Call free

	add rsp, 0x10			; Rend la stack

	leave				; reset la stack
	ret				; return (rax);
