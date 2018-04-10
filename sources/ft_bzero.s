section .text
	global _ft_bzero

_ft_bzero:
	cmp rcx, 0
	jg _ft_bzero_loop		; IF rcx > 0 THEN Call _ft_bzero_loop
	jmp _ft_bzero_end		; Call _ft_bzero_end

_ft_bzero_loop:
	cmp rcx, 0
	je _ft_bzero_end		; IF rcx == 0 THEN CALL _ft_bzero_end
	dec rcx				; rcx -= 1
	mov byte [rdi+rcx], 0		; rdi[rcx] = 0
	jmp _ft_bzero_loop		; Call _ft_bzero_loop

_ft_bzero_end:
	xor rax, rax			; Set rax a 0
	ret				; return (rax);
