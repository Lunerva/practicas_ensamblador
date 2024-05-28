;programa que implementa la instruccion loop
;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Barranco $'
	cDesc DB 10,10,13,' programa para mostrar numeros pares e impares',10,13,'$'
	cFinProg DB 10,13, '<Fin del programa>..$'
	cPares DB 10,13,' pares: $'
	cImpares DB 10,13, ' impares: $'
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

		mov bl, 32h
		mov cx,04h

		mov ah,09h
		mov dx, offset cPares
		int 21h


		;inicia el ciclo		
		eCiclo:

		mov ah,02h
		mov dl, bl
		int 21h
		
		inc bl
		inc bl		
				
		loop eCiclo

		mov bl, 31h
		mov cx,04h
		
		mov ah,09h
		mov dx, offset cImpares
		int 21h

		;inicia el ciclo		
		eCiclo2:

		mov ah,02h
		mov dl, bl
		int 21h
		
		inc bl
		inc bl		

		loop eCiclo2

		eFinProg:

		mov ah,09h
		mov dx, offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio





