;programa que imprime una linea de caracteres
;ingresado por el usuario a traves
;de teclado
;Luis Barranco
.MODEL SMALL
.STACK 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cIngresar DB 'ingresa linea de caracteres', 10, 13, '$'
	cIngresado DB 10,13,'los datos que ingresaste $'
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

		;guarda linea de datos
		mov ah,0Ah
		int 21h
		mov bl,ah

		mov ah,09h		
		mov dx, offset cIngresado
		int 21h

		;mostrar datos guardados
		mov ah,02h
		mov dl,bl
		int 21h		

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio