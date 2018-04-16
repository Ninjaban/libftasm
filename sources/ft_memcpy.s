section .text
	global _ft_memcpy

_ft_memcpy:
	cmp rdx, 0
	jg _ft_memcpy_loop		; Si n > 0 va a _ft_memcpy_loop
	jmp _ft_memcpy_end		; Va a _ft_memcpy_end

_ft_memcpy_loop:
	cmp rdx, 0
	je _ft_memcpy_end		; Si n == 0 va a _ft_memcpy_end
	dec rdx				; n -= 1
	mov al, [rsi+rdx]		; tmp = src[n]
	mov byte [rdi+rdx], al		; dest[n] = tmp
	jmp _ft_memcpy_loop		; Va a _ft_memcpy_loop

_ft_memcpy_end:
	mov rax, rdi			; Set rax a dest

	ret				; return (rax);
