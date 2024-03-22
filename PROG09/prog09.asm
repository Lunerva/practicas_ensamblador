;programa que imprime un caracter
;ingresado por el usuario a traves
;de teclado
;Luis Barranco

;SALTOS CONDICIONADOS
; jae : salta a etiqueta si A>=B
; jbe : salta a etiqueta si A<=B


.MODEL SMALL
.STACK 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cIngresar DB 'ingresa un numero', 10, 13, '$'
	cIngresado DB 10,13,'El numero es mayor o igual a 8$'
	cMenor DB 10,13, 'El numero es menor o igual que 3$'
	cEntre DB 10,13, 'El numero se encuentra entre 4 y 7$'
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

		cmp al,38h
		jae eEs8

		cmp al,33h
		jbe eMenor3

		jmp eEntre

		eEs8:
		mov ah,09h
		mov dx, offset cIngresado
		int 21h
		jmp eFinProg
		
		
		eMenor3:
		mov ah,09h
		mov dx, offset cMenor
		int 21h
		jmp eFinProg
		
		eEntre:
		mov ah,09h
		mov dx, offset cEntre
		int 21h
		jmp eFinProg		
		
		eFinProg:
		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio