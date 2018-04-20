section .text
	global _ft_memcpy

_ft_memcpy:
	push rdi		; Sauve rdi sur la pile
	push rsi		; Sauve rsi sur la pile
	push rcx		; Sauve rcx sur la pile

	mov rcx, rdx		; Set rcx a rdx

	cld			; Make the operation left to right
	rep movsb		; Repeats the operation while rcx > 0, move one byte from location to another
	
	pop rcx			; reset rcx
	pop rsi			; reset rsi
	pop rdi			; reset rdi
	mov rax, rdi		; Set rax a rdi

	ret			; return (rax);
