Section .data
;42=punto
;45=linea horizontal
;32=espacio
;124=linea vertical
	arreglo3 db 46,32,46,32,46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,32,46,32,46,10,10;
			
	
	len3: equ $-arreglo3
	
	cuarentacinco dd 45
	cienveinticuatro dd 124
	cuarentaseis dd 46
	dieciseis dd 16
	quince dd 15
	letra dd 76
	treintaydos dd 32

	
	msj1 db "digite su x: "
	msjlen1 equ $-msj1
	
	msj2 db "digite su y: "
	msjlen2 equ $-msj2
	
	Error1 db "En ese espacio ya hay una raya. ",10
	Error1len equ $-Error1
	
	Error2 db "En ese espacio no se puede dibujar una raya. ",10
	Error2len equ $-Error2
	
	

Section .bss
	
	res resb 1
	punto resd 2
	x resb 4
	y resb 4
	xlen equ 4
	ylen equ 4

	

Section .text
	global _start
	
	_start:

			
	mov edi,0
		
	Imprime_matriz3:
		
		mov al,[arreglo3+edi]
		mov [res],al
		mov edx,1
		mov ecx,res
		
		mov ebx,1
		mov eax,4
		int 0x80
		
		inc edi
		cmp edi,len3
		jne Imprime_matriz3
	
	
	solicita3_X:
	
		mov ecx,msj1
		mov edx,msjlen1
		mov ebx,1
		mov eax,4
		int 0x80
		
		mov ecx,x
		mov edx,xlen
		mov ebx,0
		mov eax,3
		int 0x80
		
		mov al,[x+1]
		cmp al,10
		je Ingresa3_normalX
		mov al,10
		mov bl,[x+1]
		sub bl,48
		add al,bl
		mov [x],al
		jmp solicita3_Y
		
	Ingresa3_normalX:
		mov al,[x]
		sub al,48
		mov [x],al
	
	solicita3_Y:
		mov ecx,msj2
		mov edx,msjlen2
		mov ebx,1
		mov eax,4
		int 0x80
	
		mov ecx,y
		mov edx,ylen
		mov ebx,0
		mov eax,3
		int 0x80
		
		mov al,[y+1]
		cmp al,10
		je Ingresa3_normalY
		mov al,10
		mov bl,[y+1]
		sub bl,48
		add al,bl
		mov [y],al
		jmp localiza_punto3
	
	Ingresa3_normalY:
		mov al,[y]
		sub al,48
		mov [y],al

	localiza_punto3:
		;recibe un x,y
		mov al,[y]
		mov bl,[dieciseis]
		mul bl
		add al,[x]
		mov [punto],al


		
	par_o_impar3:
		mov ax,[punto] 
		AND ax,1 
		jnz linea_horizontal3
		jmp linea_vertical3
	

	linea_horizontal3:
		call verifica_punto3
		mov al,45
		mov esi,[punto]
		mov [arreglo3+esi],al
		mov esi,[quince]
		jmp verifica_letra3
		jmp _start
	
	linea_vertical3:
		call verifica_punto3
		mov al,124
		mov esi,[punto]
		mov [arreglo3+esi],al
		mov esi,[quince]
		jmp verifica_letra3
		jmp _start
		
	
		
;-----------------------------------------------------------------------	
	
	
	verifica_letra3:
		cmp esi,224
		ja _start
		je _start

		add esi,2
		
		mov al,[arreglo3+esi]
		mov bl,[letra]

		cmp al,10
		je verifica_letra3
		
		cmp al,bl
		je suma_dieciseis

		call verifica_cuadro3
		jmp verifica_letra3
		
		
	suma_dieciseis:
		add esi,16
		jmp verifica_letra3
		
	verifica_cuadro3:

		mov edi,esi
		sub edi,16
		mov al,[arreglo3+edi]
		cmp al,32
		je verifica_letra3

		mov edi,esi
		add edi,1
		mov al,[arreglo3+edi]
		cmp al,32
		je verifica_letra3

		mov edi,esi
		sub edi,1
		mov al,[arreglo3+edi]
		cmp al,32
		je verifica_letra3
			
		mov edi,esi
		add edi,16
		mov al,[arreglo3+edi]
		cmp al,32
		je verifica_letra3
			
		mov al,[letra]
		mov [arreglo3+esi],al

		ret
		
	verifica_punto3:
		
		mov esi,[punto]
		
		mov al,[arreglo3+esi]
		cmp al,[cuarentaseis]
		je imprime3_error2
		
		mov al,[arreglo3+esi]
		cmp al,[cienveinticuatro]
		je imprime3_error1
		
		mov al,[arreglo3+esi]
		cmp al,[cuarentacinco]
		je imprime3_error1
		
		ret
		
	imprime3_error1:
	
		mov ecx,Error1
		mov edx,Error1len
		mov ebx,1
		mov eax,4
		int 0x80	
		call solicita3_X
		
	imprime3_error2:
	
		mov ecx,Error2
		mov edx,Error2len
		mov ebx,1
		mov eax,4
		int 0x80	
		call solicita3_X
