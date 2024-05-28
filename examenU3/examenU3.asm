;Luis Barranco
;examen u3


;DECLARACION INICIAL DE MACROS
Datos MACRO
	mov ax, @Data
	mov ds,ax
ENDM

Mensaje MACRO cad
	mov ah,09h
	mov dx,offset cad
	int 21h
ENDM

impCar MACRO registro
	mov ah,02h
	mov dl, registro
	int 21h
ENDM

Bienvenida MACRO
	Datos

	Mensaje cNombre

	Mensaje cDesc
ENDM

ingCar MACRO reg
	;ingresamos el caracter
	Mensaje cIng
	call Ingresar
	sub al,30h
	mov reg,al
ENDM

solucion MACRO
	ingCar bh
	ingCar bl

	;realizamos la suma
	call suma

	Mensaje cRes
	impCar bh
	impCar bl
ENDM



;FINAL DECLARACION MACROS


.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Ernesto Barranco Nunez $'
	cDesc DB 10,10,13,'Examen unidad 3, suma de valores numericos mediante el uso de macros y procedimientos: ',10,13,'$'
	cIng DB 10,10,13, 'Ingrese un valor: ',10,13,'$'
	cRes DB 10,10,13, 'El resultado es: ',10,13,'$'
	cFinProg DB 10,13, '<Fin del programa>..$'
.CODE
	eInicio:
		Bienvenida

		solucion		

		;FINAL PROGRAMA
		Mensaje cFinProg
		call ReadKey
		call ControlDOS



		;DECLARACION DE PROCEDIMIENTOS
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

		Ingresar PROC near
			mov ah,01
			int 21h
			ret
		Ingresar ENDP 

		suma PROC near
			add bl,bh
			mov bh,00
			mov ax,bx
			aaa
			mov bx,ax
			add bl,30h
			add bh,30h
			ret
		suma ENDP



	END eInicio





