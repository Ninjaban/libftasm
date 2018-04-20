%define MACH_SYSCALL(nb)    	0x2000000 | nb
%define STDOUT              	1
%define READ                	3
%define WRITE               	4
%define BUFFER_SIZE		1024

section .data
	buffer times BUFFER_SIZE db 0	; Cree un tableau de taille BUFFER_SIZE

section .text
	global _ft_cat
	extern _ft_memset

_ft_cat:
	push r8				; Sauve r8 sur la pile
	push r9				; Sauve r9 sur la pile

	mov r8, rdi			; Set r8 a fd
	jmp _ft_cat_read		; Va a _ft_cat_read

_ft_cat_read:
	lea rdi, [rel buffer]		; Param 1 = buffer
	mov rsi, 0			; Param 2 = '\0'
	mov rdx, BUFFER_SIZE+1		; Param 3 = BUFFER_SIZE + 1
	call _ft_memset			; Call ft_memset()

	mov rdi, r8			; Param 1 = fd
	lea rsi, [rel buffer]		; Param 2 = buffer
	mov rdx, BUFFER_SIZE		; Param 3 = BUFFER_SIZE
	mov rax, MACH_SYSCALL(READ)	; Init read
	syscall				; Call read()

	mov r9, rax			; Set r9 au retour de read
	cmp r9, 0
	jle _ft_cat_end			; Si le retour de read est <= a 0 va a _ft_cat_end
	jmp _ft_cat_write		; Va a _ft_cat_write

_ft_cat_write:
	lea rsi, [rel buffer]		; Param 1 = buffer
	mov rdi, STDOUT			; Param 2 = STDOUT
	mov rdx, r9			; Param 3 = retour de read
	mov rax, MACH_SYSCALL(WRITE)	; Init write
	syscall				; Call write()

	cmp r9, BUFFER_SIZE
	jl _ft_cat_end			; Si le retour de read est < a BUFFER_SIZE va a _ft_cat_end

	jmp _ft_cat_read		; Va a _ft_cat_read

_ft_cat_end:
	pop r9				; Charge r9 depuis la pile
	pop r8				; Charge r8 depuis la pile

	ret				; return(void);
