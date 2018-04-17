section .text
	global _ft_strcat
	extern _ft_strlen

_ft_strcat:
	push r8			; Sauve r8 sur la pile
	push rbp
	mov rbp, rsp		; Initialise la stack pour la fonction

	sub rsp, 0x10		; Ajoute de la stack (multiple de 16 obligatoire !)

	mov [rsp+0x00], rdi	; Sauve rdi sur la stack
	mov rdi, rsi		; Set rdi a rsi
	call _ft_strlen		; Call ft_strlen
	mov [rsp+0x08], rax	; Sauve le retour de ft_strlen sur la stack

	mov rdi, [rsp+0x00]	; Charge rdi depuis la stack
	call _ft_strlen		; Call ft_strlen
	mov r8, rax		; Set r8 au retour de ft_strlen

	cmp byte [rsp+0x08], 0
	jg _ft_strcat_check	; Si src len > 0 va a _ft_strcat_check
	jmp _ft_strcat_end	; Va a _ft_strcat_end

_ft_strcat_check:
	xor rcx, rcx		; Set rcx a 0
	jmp _ft_strcat_loop	; Va a _ft_strcat_loop

_ft_strcat_loop:
	cmp rcx, [rsp+0x08]
	jg _ft_strcat_end	; Si rcx > src len va a _ft_strcat_end
	mov al, [rsi+rcx]	; tmp = src[rcx]
	mov byte [rdi+r8], al	; dest[r8] = tmp
	inc rcx			; rcx += 1
	inc r8			; r8 += 1
	jmp _ft_strcat_loop	; Va a _ft_strcat_loop

_ft_strcat_end:
	add rsp, 0x10		; Rend la stack
	mov rax, rdi		; Set rax a dest

	leave			; reset la stack
	pop r8			; reset r8
	ret			; return (rax);
