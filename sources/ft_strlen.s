section .text
	global _ft_strlen

_ft_strlen:
	push rcx		; Sauve rcx sur la pile
	xor rcx, rcx		; Set rcx a 0
	jmp _ft_strlen_loop	; Va a _ft_strlen_loop

_ft_strlen_loop:
	cmp byte [rdi + rcx], 0
	je _ft_strlen_end	; Si rdi[rcx] == 0 va a _ft_strlen_end
	inc rcx			; rcx += 1
	jmp _ft_strlen_loop	; Va a _ft_strlen_loop

_ft_strlen_end:
	mov rax, rcx		; rax = rcx

	pop rcx			; reset rcx
	ret			; return (rax);
