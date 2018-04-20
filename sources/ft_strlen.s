section .text
	global _ft_strlen

_ft_strlen:
	push rdi		; Sauve rdi sur la pile
	push rcx		; Sauve rcx sur la pile
	
	xor rcx, rcx		; Set rcx a 0
	xor al, al		; Set al a 0

	not rcx			; rcx *= -1
	
	cld			; Make the operation left to right
	repne scasb		; It repeats the operation while the zero flag indicates not equal/zero

	not rcx			; rcx *= -1
	dec rcx			; rcx -= 1
	
	mov rax, rcx		; rax = rcx

	pop rcx			; reset rcx
	pop rdi			; reset rdi
	ret			; return (rax);
