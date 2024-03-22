;Primer programa en ensamblador, el cual muestra una cadena
;de caracteres en pantalla...
.MODEL SMALL
.STACK 20h
.DATA
	cNombre DB 'LUIS ERNESTO BARRANCO NUNIEZ$',10,13,'$'
	cTec DB 10,13, 'INSTITUTO TECNOLOGICO DE LA LAGUNA$'
	cMat DB 10,13,'Lenguajes de interfaz$'
.CODE
	eInicio: 
		mov ax, @Data			;mov dx, @Data
		mov ds, ax
		
		mov dx, offset cNombre
		mov ah, 09h
		int 21h

		mov dx, offset cTec
		mov ah, 09h
		int 21h

		mov dx, offset cMat
		mov ah, 09h
		int 21h

		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END eInicio