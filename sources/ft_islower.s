section .text
	global _ft_islower

_ft_islower:
	xor rax, rax		; Set rax a 0
	jmp _ft_islower_a	; Va a _ft_islower_a

_ft_islower_a:
	cmp rdi, 'a'
	jge _ft_islower_z	; Si rdi >= 'a' va a _ft_islower_z
	jmp _ft_islower_end	; Va a _ft_islower_end

_ft_islower_z:
	cmp rdi, 'z'
	jle _ft_islower_ok	; Si rdi <= 'z' va a _ft_islower_ok
	jmp _ft_islower_end	; Va a _ft_islower_end

_ft_islower_ok:
	inc rax			; Set rax a 1
	jmp _ft_islower_end	; Va a _ft_islower_end

_ft_islower_end:
	ret			; return (rax);
