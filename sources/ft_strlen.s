section .text
	global _ft_strlen

_ft_strlen:
	push rcx		; Sauve rcx sur la pile
	jmp _ft_strlen_loop	; Call _ft_strlen_loop

_ft_strlen_loop:
	cmp byte [rdi + rcx], 0
	je _ft_strlen_end	; IF rdi[rcx] == 0 THEN Call _ft_strlen_end
	inc rcx			; rcx += 1
	jmp _ft_strlen_loop	; Call _ft_strlen_loop

_ft_strlen_end:
	mov rax, rcx		; rax = rcx

	pop rcx			; reset rcx
	ret			; return (rax);
