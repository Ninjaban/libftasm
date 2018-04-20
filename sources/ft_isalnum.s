section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

_ft_isalnum:
	xor rax, rax		; Set rax a 0

	call _ft_isalpha	; Call ft_isalpha
	cmp rax, 1
	je _ft_isalnum_end	; Si le retour de ft_isalpha == 1 va a _ft_isalnum_end

	call _ft_isdigit	; Call ft_isdigit

	jmp _ft_isalnum_end	; Va a _ft_isalnum_end

_ft_isalnum_end:
	ret			; return (rax);
