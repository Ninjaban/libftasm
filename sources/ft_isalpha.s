section .text
	global _ft_isalpha

_ft_isalpha:
	xor rax, rax		; Set rax a 0
	jmp _ft_isalpha_A	; Va a _ft_isalpha_A

_ft_isalpha_A:
	cmp rdi, 'A'
	jge _ft_isalpha_Z	; Si rdi >= 'A' va a _ft_isalpha_Z
	jmp _ft_isalpha_a	; Va a _ft_isalpha_a

_ft_isalpha_Z:
	cmp rdi, 'Z'
	jle _ft_isalpha_ok	; Si rdi <= 'Z' va a _ft_isalpha_ok
	jmp _ft_isalpha_a	; Va a _ft_isalpha_a

_ft_isalpha_a:
	cmp rdi, 'a'
	jge _ft_isalpha_z	; Si rdi >= 'a' va a _ft_isalpha_z
	jmp _ft_isalpha_end	; Va a _ft_isalpha_end

_ft_isalpha_z:
	cmp rdi, 'z'
	jle _ft_isalpha_ok	; Si rdi <= 'z' va a _ft_isalpha_ok
	jmp _ft_isalpha_end	; Va a _ft_isalpha_end

_ft_isalpha_ok:
	inc rax			; Set rax a 1
	jmp _ft_isalpha_end	; Va a _ft_isalpha_end

_ft_isalpha_end:
	ret			; return (rax);
