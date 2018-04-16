%define MACH_SYSCALL(nb)    	0x2000000 | nb
%define STDOUT              	1
%define READ                	3
%define WRITE               	4
%define BUFFER_SIZE		1024

section .bss
	buffer resb BUFFER_SIZE+1

section .text
	global _ft_cat
	extern _ft_memset
	
_ft_cat:
	push r8
	push r9
	
	mov r8, rdi
	jmp _ft_cat_read

_ft_cat_read:
	lea rdi, [rel buffer]
	mov rsi, 0
	mov rdx, BUFFER_SIZE+1
	call _ft_memset

	mov rdi, r8
	lea rsi, [rel buffer]
	mov rdx, BUFFER_SIZE
	mov rax, MACH_SYSCALL(READ)
	syscall

	mov r9, rax
	cmp r9, 0
	jle _ft_cat_end
	jmp _ft_cat_write

_ft_cat_write:
	lea rsi, [rel buffer]
	mov rdi, STDOUT
	mov rdx, r9
	mov rax, MACH_SYSCALL(WRITE)
	syscall

	cmp r9, BUFFER_SIZE
	jl _ft_cat_end
	
	jmp _ft_cat_read

_ft_cat_end:
	pop r9
	pop r8
	
	ret