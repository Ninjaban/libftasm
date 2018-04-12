section .text
	global _ft_memset

_ft_memset:
	cmp rdx, 0
	jg _ft_memset_loop		; Si rdx > 0 va a _ft_memset_loop
	jmp _ft_memset_end		; Va a _ft_memset_end

_ft_memset_loop:
	cmp rdx, 0
	je _ft_memset_end		; Si rdx == 0 va a _ft_memset_end
	dec rdx				; rdx -= 1
	mov byte [rdi+rdx], sil		; String[rdx] = c
	jmp _ft_memset_loop		; Va a _ft_memset_loop

_ft_memset_end:
	mov rax, rdi			; Set rax a String
	ret				; return (rax);