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
	cIngresar DB 'ingresa un numero', 10, 13, '$'
	cIngresado DB 10,13,'El numero es 6$'
	cMayor DB 10,13, 'El numero es mayor que 6$'
	cMenor DB 10,13, 'El numero es menor que 6$'
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

		cmp al,36h
		je eEs6
		ja eMayor6
		jb eMenor6

		eEs6:
		mov ah,09h
		mov dx, offset cIngresado
		int 21h
		jmp eFinProg

		eMayor6:
		mov ah,09h
		mov dx, offset cMayor
		int 21h
		jmp eFinProg
		
		
		eMenor6:
		mov ah,09h
		mov dx, offset cMenor
		int 21h
		jmp eFinProg		
		
		eFinProg:
		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio