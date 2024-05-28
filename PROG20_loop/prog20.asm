;programa que implementa la instruccion loop
;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cDesc DB 10,10,13,'Programa loop$ '
	cFinProg DB 10,13, '<Fin del programa>..$'
	cMensaje DB 10,13,' el mensaje es: $'
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

		
		mov cx, 0005h
		mov bh, 01h
		
		eCiclo:
		
		mov ah,02h
		mov dl,bh
		add dl,30h
		int 21h

		mov ah,09h
		mov dx,offset cMensaje
		int 21h

		inc bh

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





