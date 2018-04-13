section .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_memcpy
	extern _malloc

_ft_strdup:
	push rbp
	mov rbp, rsp		; Initialise la stack pour la fonction

	sub rsp, 0x10		; Ajoute de la stack (multiple de 16 obligatoire !)

	call _ft_strlen		; Call ft_strlen
	mov [rsp+0x00], rdi	; Sauve rdi sur la stack
	mov [rsp+0x08], rax	; Sauve de retour de ft_strlen sur la stack
	mov rdi, rax		; Set rdi au retour de ft_strlen
	inc rdi			; rdi += 1
	call _malloc		; Call malloc
	cmp rax, 0
	je _ft_strdup_end	; Si le retour de malloc est null va a _ft_strdup_end
	mov rdi, rax		; Set rdi au retour de malloc
	mov rsi, [rsp+0x00]	; Charge rdi depuis la stack et le stock dans rsi
	mov rdx, [rsp+0x08]	; Set rdx au retour de ft_strlen
	mov byte [rdi+rdx], 0	; Met un '\0' a la fin de la nouvelle chaine
	call _ft_memcpy		; Call ft_memcpy

_ft_strdup_end:
	add rsp, 0x10		; Rend la stack

	leave			; reset la stack
	ret			; return (rax); (Set in ft_memcpy)
