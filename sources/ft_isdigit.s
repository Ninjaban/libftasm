section .text
	global _ft_isdigit

_ft_isdigit:
	xor rax, rax		; Set rax a 0
	jmp _ft_isdigit_0	; Va a _ft_isdigit_0

_ft_isdigit_0:
	cmp rdi, '0'
	jge _ft_isdigit_9	; Si rdi >= '0' va a _ft_isdigit_9
	jmp _ft_isdigit_end	; Va a _ft_isdigit_end

_ft_isdigit_9:
	cmp rdi, '9'
	jle _ft_isdigit_ok	; Si rdi <= '9' va a _ft_isdigit_ok
	jmp _ft_isdigit_end	; Va a _ft_isdigit_end

_ft_isdigit_ok:
	inc rax			; Set rax a 1
	jmp _ft_isdigit_end	; Va a _ft_isdigit_end

_ft_isdigit_end:
	ret			; return (rax);
