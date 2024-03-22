;programa que imprime un caracter
;ingresado por el usuario a traves
;de teclado
;Luis Barranco

;SALTOS CONDICIONADOS
; je : salta a etiqueta si A=B
; ja : salta a etiqueta si A>B


.MODEL SMALL
.STACK 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cIngresar DB 'ingresa un caracter', 10, 13, '$'
	cIngresado DB 10,13,'El caracter es I$'
	cDiferente DB 10,13, 'El caracter es diferente de I$'
.CODE
	eInicio:
		mov ax, @Data
		mov ds,ax
		
		mov ah, 09h
		mov dx,offset cNombre
		int 21h

		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar caracter
		mov ah,01h
		int 21h

		mov bl,al

		cmp al,49h
		je eEsI
		jmp eFinProg

		eEsI:
		mov ah,09h
		mov dx, offset cIngresado
		int 21h
		
		
		eFinProg:
		mov ah,09h
		mov dx, offset cDiferente
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio