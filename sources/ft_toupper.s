section .text
	global _ft_toupper

_ft_toupper:
	cmp rdi, 'a'
	jge _ft_toupper_upper_than_a	; Si rdi >= 'a' va a _ft_toupper_upper_than_a
	jmp _ft_toupper_end		; Va a _ft_toupper_end

_ft_toupper_upper_than_a:
	cmp rdi, 'z'
	jle _ft_toupper_lower_than_z	; Si rdi <= 'z' va a _ft_toupper_upper_than_z
	jmp _ft_toupper_end		; Va a _ft_toupper_end

_ft_toupper_lower_than_z:
	sub rdi, 'a'			; rdi -= 'a'
	add rdi, 'A'			; rdi += 'A'
	jmp _ft_toupper_end		; Va a _ft_toupper_end

_ft_toupper_end:
	mov rax, rdi			; Set rax a rdi
	ret				; return (rax);
