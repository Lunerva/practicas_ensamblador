;SUMA DE 2 VALORES
;su suma rebasa el 9 porque ahora se hace el ajuste con aaa
;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cDesc DB 'Programa que lee dos numeros y la suma de estos puede sobrepasar el 9',10,13,'$'
	cIngresar DB 10,13,'ingresa un numero', 10,10, 13, '$'
	cFinProg DB 10,13, '<Fin del programa>..$'
	cSum DB 10,13,'el resultado de la suma es: $'
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

		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar tercer caracter
		mov ah,01h
		int 21h
		mov ch,al



		;realizamos la suma
		add bl,cl
		mov ah,09h
		mov dx,offset cSum
		int 21h

		;movemos la suma ax para hacer el ajuste con aaa
		mov ax, bx
		aaa

		;movemos a bx
		mov bx, ax

		;realizamos la suma
		add bl,ch
		mov ah,09h
		mov dx,offset cSum
		int 21h

		;movemos la suma ax para hacer el ajuste con aaa
		mov ax, bx
		aaa

		;movemos a bx
		mov bx, ax


		;sumamos 30h a cada uno
		add bh,30h
		add bl,30h

		;mandamos a imprimir bh y luego bl
		mov ah,02h
		mov dl,bh
		int 21h
		mov ah,02h
		mov dl,bl
		int 21h
		
		mov ah,09h
		mov dx, offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio





