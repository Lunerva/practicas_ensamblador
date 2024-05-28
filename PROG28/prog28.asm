;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Barranco $'
	cDesc DB 10,10,13,' programa que utiliza procedimientos',10,13,'$'
	cFinProg DB 10,13, '<Fin del programa>..$'
.CODE
	eInicio:


		call Datos

		mov dx,offset cNombre
		call Mensaje

		mov dx,offset cDesc
		call Mensaje

		mov dx,offset cFinProg
		call Mensaje

		call ReadKey
		call ControlDOS


		;PROCEDIMIENTOS
		Datos PROC near
			mov ax, @Data
			mov ds,ax
			ret
		Datos ENDP

		Mensaje PROC near
			mov ah,09h
			int 21h
			ret
		Mensaje ENDP
		
		ReadKey PROC near
			mov ah,08h
			int 21h
			ret
		ReadKey ENDP

		ControlDOS PROC near
			mov ax,4c00h
			int 21h
			ret
		ControlDOS ENDP


	END eInicio





