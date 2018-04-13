section .text
	global _ft_isprint

_ft_isprint:
	xor rax, rax		; Set rax a 0
	jmp _ft_isprint_32	; Va a ft_isprint_32

_ft_isprint_32:
	cmp rdi, 32
	jge _ft_isprint_126	; Si rdi >= 32 va a _ft_isprint_126
	jmp _ft_isprint_end	; Va a _ft_isprint_end

_ft_isprint_126:
	cmp rdi, 126
	jle _ft_isprint_ok	; Si rdi <= 126 va a _ft_isprint_ok
	jmp _ft_isprint_end	; Va a _ft_isprint_end

_ft_isprint_ok:
	inc rax			; Set rax a 1
	jmp _ft_isprint_end	; Va a _ft_isprint_end

_ft_isprint_end:
	ret			; return (rax);
