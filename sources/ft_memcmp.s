section .text
	global _ft_memcmp

_ft_memcmp:
	push rcx		; Sauve rcx sur la pile
	mov rcx, rdx		; Set rcx a n
	xor rax, rax		; Set rax a 0
	
	cld			; Set Direction Flag a 0 (gauche a droite)
	repe cmpsb		; Compares two data items in memory
	jecxz _ft_memcmp_end	; Si rcx == 0 va a _ft_memcmp_end
	mov rax, 1		; Set rax a 1
	jmp _ft_memcmp_end	; Va a _ft_memcmp_end

_ft_memcmp_end:	
	pop rcx			; reset rcx
	ret
