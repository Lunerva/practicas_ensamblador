;Luis Barranco
;Macros sin parametros
Datos MACRO
	mov ax, @Data
	mov ds,ax
ENDM

;Macros con parametros
Mensaje MACRO cad
	mov ah,09h
	mov dx,offset cad
	int 21h
ENDM

Bienvenida MACRO
	Datos

	Mensaje cNombre

	Mensaje cDesc
ENDM


.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Barranco $'
	cDesc DB 10,10,13,'Programa que utiliza Macros sin parametros y procedimientos',10,13,'$'
	cFinProg DB 10,13, '<Fin del programa>..$'
.CODE
	eInicio:
		
		Bienvenida

		Mensaje cFinProg

		call ReadKey
		call ControlDOS


		;PROCEDIMIENTOS
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





