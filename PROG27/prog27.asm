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
		call Mensaje1
		call Mensaje2
		call ReadKey
		call ControlDOS


		Datos PROC near
			mov ax, @Data
			mov ds,ax
			ret
		Datos ENDP

		Mensaje1 PROC near
			mov ah,09h
			mov dx, offset cNombre
			int 21h
			
			mov ah,09h
			mov dx, offset cDesc
			int 21h
			ret
		Mensaje1 ENDP
		
		Mensaje2 PROC near
			mov ah,09h
			mov dx, offset cFinProg
			int 21h
			ret
		Mensaje2 ENDP
			

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





