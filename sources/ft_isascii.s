section .text
	global _ft_isascii

_ft_isascii:
	xor rax, rax		; Set rax a 0
	jmp _ft_isascii_0	; Va a _ft_isascii_0

_ft_isascii_0:
	cmp rdi, 0
	jge _ft_isascii_127	; Si rdi >= 0 va a _ft_isascii_127
	jmp _ft_isascii_end	; Va a _ft_isascii_end

_ft_isascii_127:
	cmp rdi, 127
	jle _ft_isascii_ok	; Si rdi <= 127 va a _ft_isascii_ok
	jmp _ft_isascii_end	; Va a _ft_isascii_end

_ft_isascii_ok:
	inc rax			; Set rax a 1
	jmp _ft_isascii_end	; Va a _ft_isascii_end

_ft_isascii_end:
	ret			; return (rax);
