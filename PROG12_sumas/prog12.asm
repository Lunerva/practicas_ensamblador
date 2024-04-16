;SUMA DE 2 VALORES
;contenidos en registros
;Luis Barranco

.MODEL SMALL
.STACK 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cDesc DB 'Programa que lee dos numeros y los suma',10,10,13,'$'
	cIngresar DB 10,13,'ingresa un numero', 10,10, 13, '$'
	cFinProg DB 10,13, 'Fin del programa$'
	cRes DB 10,13,'El resultado de la suma es: $'
	vNum1 DB 00h
	vNum2 DB 00h
.CODE
	eInicio:
		mov ax, @Data
		mov ds,ax

		mov ah,09h
		mov dx, offset cNombre
		int 21h
		
		mov ah,09h
		mov dx, offset cDesc
		int 21h

		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar caracter
		mov ah,01h
		int 21h
		mov bl,al

		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar segundo caracter
		mov ah,01h
		int 21h
		mov cl,al

		add bl,cl
		
		mov ah,09h
		mov dx,offset cRes
		int 21h

		mov ah,02h
		mov dl, bl
		sub dl,30h
		int 21h

		mov ah,09h
		mov dx, offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio