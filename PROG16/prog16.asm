;SUMA DE 3 VALORES
;su suma que limita hasta el 27
;Luis Barranco

.MODEL SMALL
.Stack 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cDesc DB 10,13,'Programa que lee tres numeros y los suma',10,13,'$'
	cIngresar DB 10,13,'ingresa un numero', 10,10, 13, '$'
	cFinProg DB 10,13, '<Fin del programa>..$'
	cSum DB 10,13,'el resultado de la suma es: $'
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

		;PEDIMOS EL PRIMER NUMERO
		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar caracter
		mov ah,01h
		int 21h
		mov bl,al

		;PEDIMOS EL SEGUNDO NUMERO
		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar segundo caracter
		mov ah,01h
		int 21h
		mov cl,al

		;PEDIMOS EL TERCER NUMERO
		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar tercer caracter
		mov ah,01h
		int 21h
		mov bh,al

		;realizamos las sumas bl=bl+cl
		add bl,cl
		;realizamos las sumas bl=bl+bh
		add bl,bh
		
		
		;mostramos mensaje del resultado de suma
		mov ah,09h
		mov dx,offset cSum
		int 21h
		
		mov dl, bl
		sub dl,60h
				
		cmp dl, 43h
		ja eAjuste2


		cmp dl, 39h
		ja eAjuste

		mov ah,02h		
		mov al, dl
		int 21h

		jmp eFinprog

		;ajuste en caso de que sea mayor a 9
		eAjuste:
		sub dl,0Ah
		mov dh,dl
		
		mov ah,02h
		mov dl,31h
		int 21h
		
		mov ah,02h
		mov dl,dh
		int 21h

		jmp eFinProg

		;ajuste en caso de que sea mayor a 19
		eAjuste2:
		sub dl,14h
		mov dh,dl
		
		mov ah,02h
		mov dl,32h
		int 21h
		
		mov ah,02h
		mov dl,dh
		int 21h

		jmp eFinProg

		
		eFinProg:
		mov ah,09h
		mov dx, offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio





