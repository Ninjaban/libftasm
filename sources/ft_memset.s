section .text
	global _ft_memset

_ft_memset:
	push rdi		; Sauve rdi sur la pile
	push rcx		; Sauve rcx sur la pile
	
	mov rcx, rdx		; Set rcx a rdx
	mov rax, rsi		; Set rax a rsi

	cld			; Make the operation left to right
	rep stosb		; Repeats the operation while rcx > 0, store data in memory

	pop rcx			; reset rcx
	pop rdi			; reset rdi
	mov rax, rdi		; Set rax a rdi
	
	ret			; return (rax);
