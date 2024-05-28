;programa que implementa la instruccion loop
;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 10,13, 'Luis Barranco $'
	cDesc DB 10,10,13,' programa para mostrar una serie de numeros del 2 al 20',10,13,'$'
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

		mov bh,01h
		mov ax, 0002h

		;inicia el ciclo		
		eCiclo:
			mov cx,ax

			mov ah,02h
			mov dl,ch
			add dl,30h
			int 21h

			mov ah,02h
			mov dl,cl
			add dl,30h
			int 21h
	
			mov ah,02h
			mov dl,0Ah
			int 21h

			mov ax,cx
			inc bh
			add al,02h
			aaa
			
			cmp bh,0Ah
			jbe eCiclo
				
		;loopeCiclo



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





