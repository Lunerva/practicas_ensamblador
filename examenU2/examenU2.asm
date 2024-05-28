;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Barranco $'
	cDesc DB 10,10,13,'Examen unidad 2',10,13,'$'
	cDescProg DB 10,10,13, 'Ingrese un numero: ',10,13,'$'
	cEleccion DB 10,10,13, 'Ingrese I si desea incrementar$'
	cEleccion2 DB 10,10,13, 'Ingrese D si desea decrementar',10,13,'$'
	cRes DB 10,10,13, 'El numero original: $'
	cRes2 DB 10,10,13, 'modificado: $'
	cInvalido DB 10,10,13, 'caracter invalido!!!!',10,13,'$'
	cMenor DB 10,10,13,'ingrese un numero menor!!!$'
	cMayor DB 10,10,13, 'ingrese un numero mayor!!!$'
	cFinProg DB 10,13, '<Fin del programa>..$'
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

		;mostramos opciones del numero ingresado
		mov ah,09h
		mov dx, offset cEleccion
		int 21h

		mov ah,09h
		mov dx, offset cEleccion2
		int 21h

		;pedimos el caracter para decidir la acciona a realizar
		mov ah,01h
		int 21h
		mov bl,al

		;logica de eleccion

		cmp bl,49h
		je eInc

		cmp bl, 44h
		je eDec

		jmp eInvalido

		
		eInc:
			mov ah,09h
			mov dx, offset cDescProg
			int 21h

			;pedimos el caracter
			mov ah,01h
			int 21h
			mov bh,al


			;validamos que haya ingresado un caracter de numero
			cmp bh, 39h
			ja eInvalido
			
			cmp bh, 30h
			jb eInvalido
		
			cmp bh, 37h
			ja eMenor			
	
			;copiamos el valor a ch para realizar modificaciones sobre este
			mov ch,bh
			inc ch
			inc ch

			;ahora mostramos valor original y modificado
			mov ah,09
			mov dx, offset cRes
			int 21h 
		
			mov ah,02h
			mov dl, bh
			int 21h

			mov ah,09
			mov dx, offset cRes2
			int 21h	
		
			mov ah,02h
			mov dl,ch
			int 21h	
			
			jmp eFinProg

		eMenor:
			mov ah,09
			mov dx, offset cMenor
			int 21h
			jmp eInc

		eDec:
			mov ah,09h
			mov dx, offset cDescProg
			int 21h

			;pedimos el caracter
			mov ah,01h
			int 21h
			mov bh,al

			;validamos que haya ingresado un caracter de numero
			cmp bh, 39h
			ja eInvalido
			
			cmp bh, 30h
			jb eInvalido
		
			cmp bh, 32h
			jb eMayor
	
			;copiamos el valor a ch para realizar modificaciones sobre este
			mov ch,bh
			dec ch
			dec ch

			;ahora mostramos valor original y modificado
			mov ah,09
			mov dx, offset cRes
			int 21h 
		
			mov ah,02h
			mov dl, bh
			int 21h

			mov ah,09
			mov dx, offset cRes2
			int 21h	
		
			mov ah,02h
			mov dl,ch
			int 21h	
			
			jmp eFinProg


		eMayor:
			mov ah,09
			mov dx, offset cMayor
			int 21h
			jmp eDec


		eInvalido:
			mov ah,09
			mov dx, offset cInvalido
			int 21h
			jmp eFinProg

		;fin programa
		eFinProg:

			mov ah,09h
			mov dx, offset cFinProg
			int 21h

			mov ah,08h
			int 21h

			mov ax,4c00h
			int 21h
	END eInicio





