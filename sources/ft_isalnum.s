section .text
	global _ft_isalnum

_ft_isalnum:
	xor rax, rax		; Set rax a 0
	jmp _ft_isalnum_A	; Va a _ft_isalnum_A

_ft_isalnum_A:
	cmp rdi, 'A'
	jge _ft_isalnum_Z	; Si rdi >= 'A' va a _ft_isalnum_Z
	jmp _ft_isalnum_a	; Va a _ft_isalnum_a

_ft_isalnum_Z:
	cmp rdi, 'Z'
	jle _ft_isalnum_ok	; Si rdi <= 'Z' va a _ft_isalnum_ok
	jmp _ft_isalnum_a	; Va a _ft_isalnum_a

_ft_isalnum_a:
	cmp rdi, 'a'
	jge _ft_isalnum_z	; Si rdi >= 'a' va a _ft_isalnum_z
	jmp _ft_isalnum_0	; Va a _ft_isalnum_0

_ft_isalnum_z:
	cmp rdi, 'z'
	jle _ft_isalnum_ok	; Si rdi <= 'z' va a _ft_isalnum_ok
	jmp _ft_isalnum_0	; Va a _ft_isalnum_0

_ft_isalnum_0:
	cmp rdi, '0'
	jge _ft_isalnum_9	; Si rdi >= '0' va a _ft_isalnum_9
	jmp _ft_isalnum_end	; Va a _ft_isalnum_end

_ft_isalnum_9:
	cmp rdi, '9'
	jle _ft_isalnum_ok	; Si rdi <= '9' va a _ft_isalnum_ok
	jmp _ft_isalnum_end	; Va a _ft_isalnum_end

_ft_isalnum_ok:
	inc rax			; Set rax a 1
	jmp _ft_isalnum_end	; Va a _ft_isalnum_end

_ft_isalnum_end:
	ret			; return (rax);
