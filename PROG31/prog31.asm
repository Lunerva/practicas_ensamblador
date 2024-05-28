;Luis Barranco
;ejercicio de practica

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

solucion MACRO iter
	mov cx,iter
	eCiclo:
		;pedir numero
		Mensaje cIng

		call ingresa

		mov bl,al
		

		Mensaje cRes
		call impBL
		
	loop eCiclo
ENDM


ejercicio MACRO iter
	Bienvenida

	solucion iter		

	Mensaje cFinProg

	call ReadKey
	call ControlDOS

ENDM	

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Barranco $'
	cDesc DB 10,10,13,'Programa que utiliza Macros y procedimientos para practicar',10,13,'$'
	cIng DB 10,10,13,'Ingresa un caracter',10,13,'$'
	CRes DB 10,10,13, 'Ingresaste: ',10,13,'$'
	cFinProg DB 10,13, '<Fin del programa>..$'
.CODE
	eInicio:
		

		ejercicio 05h		
		



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

		ingresa PROC near
			mov ah,01h
			int 21h
			ret
		ingresa ENDP

		impBL PROC near
			mov ah,02h
			mov dl,bl
			int 21h
			ret
		impBL ENDP


	END eInicio





