%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT			1
%define READ			3
%define WRITE			4

section .data
	fmt db 'read return %d for %d', 10, 0
	
section .text
	global _ft_cat
	extern _malloc
	extern _free
	extern _printf

_ft_cat:
	push rbp
	mov rbp, rsp                	; Initialise la stack pour la fonction

	sub rsp, 0x110			; Ajoute de la stack (multiple de 16 obligatoire !)

	cmp rdi, 0
	jl _ft_cat_end			; Si fd < 0 va a _ft_cat_end
	
	mov [rsp+0x00], rdi		; Sauve fd dans la stack

	jmp _ft_cat_read		; Va a _ft_cat_read

_ft_cat_read:
	mov rbx, [rsp+0x00]		; Charge fd depuis la stack
	mov rcx, [rsp+0x10]		; Charge le retour de malloc depuis la stack
	mov rdx, 0x100			; Set rdx a 0x100
	mov rax, MACH_SYSCALL(READ)	; Init read
	syscall				; Call read

	mov [rsp+0x08], rax		; Sauve le retour de read dans la stack

	lea rdi, [rel fmt]
	mov rsi, [rsp+0x08]
	mov rdx, 0x100
	call _printf
	
	cmp byte [rsp+0x08], 0
	jle _ft_cat_end			; Si le retour de read est <= a 0 va a _ft_cat_end
	jmp _ft_cat_write		; Va a _ft_cat_write

_ft_cat_write:
	mov rdx, [rsp+0x08]		; Set rdx au retour de read depuis la stack
	mov rsi, [rsp+0x10]		; Set rsi au retour de malloc
	mov rdi, STDOUT			; Set rdi a STDOUT
	mov rax, MACH_SYSCALL(WRITE)	; Init write
	syscall				; Call write

	cmp word [rsp+0x08], 0x100
	jl _ft_cat_end			; Si le retour de read est < a 0x100 va a _ft_cat_end
	jmp _ft_cat_read		; Va a _ft_cat_read

_ft_cat_end:
	add rsp, 0x110			; Rend la stack

	xor rax, rax			; Set rax a 0
	
	leave				; reset la stack
	ret				; return (rax);
