;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Barranco $'
	cDesc DB 10,10,13,' programa que utiliza procedimientos',10,13,'$'
	cFinProg DB 10,13, '<Fin del programa>..$'
.CODE
	eInicio:

		mov ax, @Data
		mov ds,ax

		call Mensaje




		;fin programa
		eFinProg:

			mov ah,09h
			mov dx, offset cFinProg
			int 21h

			mov ah,08h
			int 21h

			mov ax,4c00h
			int 21h

		Mensaje PROC near
			mov ah,09h
			mov dx, offset cNombre
			int 21h
			
			mov ah,09h
			mov dx, offset cDesc
			int 21h
			ret
		Mensaje ENDP

	END eInicio





