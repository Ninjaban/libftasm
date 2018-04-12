section .text
	global _ft_isalnum

_ft_isalnum:
	xor rax, rax		; Set rax a 0
	jmp _ft_isalnum_A	; Call _ft_isalnum_A

_ft_isalnum_A:
	cmp rdi, 'A'
	jge _ft_isalnum_Z	; IF rdi >= 'A' THEN Call _ft_isalnum_Z
	jmp _ft_isalnum_a	; Call _ft_isalnum_a

_ft_isalnum_Z:
	cmp rdi, 'Z'
	jle _ft_isalnum_ok	; IF rdi <= 'Z' THEN Call _ft_isalnum_ok
	jmp _ft_isalnum_a	; Call _ft_isalnum_a

_ft_isalnum_a:
	cmp rdi, 'a'
	jge _ft_isalnum_z	; IF rdi >= 'a' THEN Call _ft_isalnum_z
	jmp _ft_isalnum_0	; Call _ft_isalnum_0

_ft_isalnum_z:
	cmp rdi, 'z'
	jle _ft_isalnum_ok	; IF rdi <= 'z' THEN Call _ft_isalnum_ok
	jmp _ft_isalnum_0	; Call _ft_isalnum_0

_ft_isalnum_0:
	cmp rdi, '0'
	jge _ft_isalnum_9	; IF rdi >= '0' THEN Call _ft_isalnum_9
	jmp _ft_isalnum_end	; Call _ft_isalnum_end

_ft_isalnum_9:
	cmp rdi, '9'
	jle _ft_isalnum_ok	; IF rdi <= '9' THEN Call _ft_isalnum_ok
	jmp _ft_isalnum_end	; Call _ft_isalnum_end

_ft_isalnum_ok:
	mov rax, 1		; Set rax a 1
	jmp _ft_isalnum_end	; Call _ft_isalnum_end

_ft_isalnum_end:
	ret			; return (rax);
