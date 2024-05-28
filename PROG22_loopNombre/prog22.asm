;programa que implementa la instruccion loop
;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Barranco $'
	cDesc DB 10,10,13,'Programa loop que imprime n numero de veces nuestro nombre',10,13,'$'
	cFinProg DB 10,13, '<Fin del programa>..$'
	cMensaje DB 10,13,' ingrese un numero: $'
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

		;entrada de numero por el ususario
		mov ah,09
		mov dx, offset cMensaje
		int 21h

		mov ah,01
		int 21h
		mov dl,al
		sub dl,30h

		;limite de veces para el ciclo
		mov dh, 0h
		mov cx, dx
		mov bh, dl
		
		eCiclo:

		mov ah,09h
		mov dx,offset cNombre
		int 21h

		;genera un ' ' para separar texto
		mov ah,02h
		mov dl,030h
		int 21h
		
		mov ah,02h
		mov dl,bh
		add dl,30h
		int 21h


		sub bh,01h

		loop eCiclo

		



		;final de programa
		eFinProg:		
		mov ah,09h
		mov dx, offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio





