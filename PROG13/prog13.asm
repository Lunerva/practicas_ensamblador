;SUMA DE 2 VALORES
;contenidos en registros
;Luis Barranco

.MODEL SMALL
.STACK 20h
.DATA
	cNombre DB 'Luis Barranco',10,13,'$'
	cDesc DB 'Programa que lee dos numeros por parte del usuario y realiza operaciones',10,10,13,'$'
	cIngresar DB 10,13,'ingresa un numero', 10,10, 13, '$'
	cFinProg DB 10,13, 'Fin del programa$'
	cOpciones DB 10,13, 'teclea: 1 -> sumar ~~ 2 -> restar $'
	cSum DB 10,13,'el resultado de la suma es: $'
	cRes DB 10,13,'el resultado de la resta es: $'
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

		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar caracter
		mov ah,01h
		int 21h
		mov bl,al

		mov ah,09h
		mov dx, offset cIngresar
		int 21h

		;guardar segundo caracter
		mov ah,01h
		int 21h
		mov cl,al

		;preguntamos por un tercer caracter
		;para ver si el usuario quiere sumar o restar
		;nos apoyaremos de una comparacion para realizar dicha accion
		
		mov ah,09h
		mov dx, offset cOpciones
		int 21h

		;guardar opcion de operacion a realizar
		mov ah,01h
		int 21h
		mov ch,al
		
		cmp al, 31h
		
		je eSuma
		ja eResta
		
		eSuma:
		add bl,cl
		mov ah,09h
		mov dx,offset cSum
		int 21h
		mov ah,02h
		mov dl, bl
		sub dl,30h
		int 21h
		jmp eFinprog

		eResta:
		sub bl,cl
		mov ah,09h
		mov dx,offset cRes
		int 21h
		mov ah,02h
		mov dl, bl
		add dl,30h
		int 21h
		jmp eFinprog


		
		eFinProg:
		mov ah,09h
		mov dx, offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio