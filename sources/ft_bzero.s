section .text
	global _ft_bzero

_ft_bzero:
	cmp rcx, 0
	jg _ft_bzero_loop		; Si rcx > 0 va a _ft_bzero_loop
	jmp _ft_bzero_end		; Va a _ft_bzero_end

_ft_bzero_loop:
	cmp rcx, 0
	je _ft_bzero_end		; Si rcx == 0 va a _ft_bzero_end
	dec rcx				; rcx -= 1
	mov byte [rdi+rcx], 0		; rdi[rcx] = 0
	jmp _ft_bzero_loop		; Va a _ft_bzero_loop

_ft_bzero_end:
	xor rax, rax			; Set rax a 0
	ret				; return (rax);
