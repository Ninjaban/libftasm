section .text
	global _ft_isalpha
	extern _ft_islower
	extern _ft_isupper

_ft_isalpha:
	xor rax, rax		; Set rax a 0

	call _ft_islower	; Call ft_islower
	cmp rax, 1
	je _ft_isalpha_end	; Si le retour de ft_islower == 1 va a _ft_isalpha_end

	call _ft_isupper	; Call ft_islower

	jmp _ft_isalpha_end
	
_ft_isalpha_end:
	ret			; return (rax);
