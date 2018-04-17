section .text
	global _ft_isupper

_ft_isupper:
	xor rax, rax		; Set rax a 0
	jmp _ft_isupper_A	; Va a _ft_isupper_A

_ft_isupper_A:
	cmp rdi, 'A'
	jge _ft_isupper_Z	; Si rdi >= 'A' va a _ft_isupper_Z
	jmp _ft_isupper_end	; Va a _ft_isupper_end

_ft_isupper_Z:
	cmp rdi, 'Z'
	jle _ft_isupper_ok	; Si rdi <= 'Z' va a _ft_isupper_ok
	jmp _ft_isupper_end	; Va a _ft_isupper_end

_ft_isupper_ok:
	inc rax			; Set rax a 1
	jmp _ft_isupper_end	; Va a _ft_isupper_end

_ft_isupper_end:
	ret			; return (rax);
