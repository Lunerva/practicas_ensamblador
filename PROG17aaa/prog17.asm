;Luis Barranco

.MODEL SMALL
.Stack 20h
.CODE
	eInicio:

		;mov ax, 0109h
		;add al, 0Ah
		;aaa

		mov ax,010ch
		aaa

		;mov bx,0007h
		;add bl,05h
		;aaa

		

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h
	END eInicio





