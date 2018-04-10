section .text
	global _ft_tolower

_ft_tolower:
	cmp rdi, 'A'
	jge _ft_tolower_upper_than_A	; IF rdi >= 'A' THEN Call _ft_tolower_upper_than_A
	jmp _ft_tolower_end		; Call _ft_tolower_end

_ft_tolower_upper_than_A:
	cmp rdi, 'Z'
	jle _ft_tolower_lower_than_Z	; IF rdi <= 'Z' THEN Call _ft_tolower_upper_than_Z
	jmp _ft_tolower_end		; Call _ft_tolower_end

_ft_tolower_lower_than_Z:
	sub rdi, 'A'			; rdi -= 'A'
	add rdi, 'a'			; rdi += 'a'
	jmp _ft_tolower_end		; Call _ft_tolower_end

_ft_tolower_end:
	mov rax, rdi			; rax = rdi
	ret				; return (rax);
