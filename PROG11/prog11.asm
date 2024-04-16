;programa que LEE DOS NUMERS DE TECLADO
;compara y guarda los numeros en variables
;Luis Barranco

.MODEL SMALL
.STACK 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cDesc DB 'Programa que lee dos numeros y los compara',10,10,13,'$'
	cIngresar DB 10,13,'ingresa un numero', 10,10, 13, '$'
	cFinProg DB 10,13, 'Fin del programa$'
	cMayoruno DB 10,13,'El mayor de los numeros es el primero, el numero: $'
	cMayordos DB 10,13, 'El mayor de los numeros es el segundo, el numero: $'
	cigual DB 10,13, 'los numeros son iguales$'
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
		mov vNum1,al

		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar segundo caracter
		mov ah,01h
		int 21h
		mov vNum2, al

		cmp al,vNum1
		
		ja eMayor2
		je eIgual
		jmp eMayor1

		eMayor1:
		mov ah,09h
		mov dx,offset cMayoruno
		int 21h
		mov ah,02h
		mov dl, vNum1
		int 21h
		jmp eFinProg

		eMayor2:
		mov ah,09h
		mov dx,offset cMayordos
		int 21h
		mov ah,02h
		mov dl, vNum2
		int 21h
		jmp eFinProg

		eIgual:
		mov ah,09h
		mov dx,offset cIgual
		int 21h
		jmp eFinProg
								
		eFinProg:
		mov ah,09h
		mov dx, offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio