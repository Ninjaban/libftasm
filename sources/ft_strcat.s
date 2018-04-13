section .text
	global _ft_strcat
	extern _ft_strlen

_ft_strcat:
	push rbp
	mov rbp, rsp		; Initialise la stack pour la fonction

	sub rsp, 0x10		; Ajoute de la stack (multiple de 16 obligatoire !)

	mov [rsp+0x00], rdi	; Sauve rdi sur la stack
	mov rdi, rsi		; Set rdi a rsi
	call _ft_strlen		; Call ft_strlen
	mov r9, rax		; Set r9 au retour de ft_strlen

	mov rdi, [rsp+0x00]	; Charge rdi depuis la stack
	call _ft_strlen		; Call ft_strlen
	mov [rsp+0x08], rax	; Sauve le retour de ft_strlen sur la stack
	cmp [rsp+0x08], 0
	jg _ft_strcat_check	; Si src len > 0 va a _ft_strcat_check
	jmp _ft_strcat_end	; Va a _ft_strcat_end

_ft_strcat_check:
	xor rcx, rcx		; Set rcx a 0
	jmp _ft_strcat_loop	; Va a _ft_strcat_loop

_ft_strcat_loop:
	cmp rcx, [rsp+0x08]
	jg _ft_strcat_loop_end	; Si rcx > src len va a _ft_strcat_loop_end
	mov r8, [rsi+rcx]	; r8 = src[rcx]
	mov [rdi+r9], r8	; dest[r9] = r8
	inc rcx			; rcx += 1
	inc r9			; r9 += 1
	jmp _ft_strcat_loop	; Va a _ft_strcat_loop

_ft_strcat_loop_end:
	mov byte [rdi+r9], 0	; Met un '\0' a la fin de la chaine
	jmp _ft_strcat_end	; Va a _ft_strcat_end

_ft_strcat_end:
	add rsp, 0x10		; Rend la stack
	mov rax, rdi		; Set rax a dest

	leave			; reset la stack
	ret			; return (rax);
