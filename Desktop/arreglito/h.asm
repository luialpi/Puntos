Section .data
;42=punto
;45=linea horizontal
;32=espacio
;124=linea vertical
	arreglo2 db 46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,10,10;
			
	
	len2: equ $-arreglo2
	
	cuarentacinco dd 45
	cienveinticuatro dd 124
	cuarentaseis dd 46
	doce dd 12
	once dd 11
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
		
	Imprime_matriz2:
		
		mov al,[arreglo2+edi]
		mov [res],al
		mov edx,1
		mov ecx,res
		
		mov ebx,1
		mov eax,4
		int 0x80
		
		inc edi
		cmp edi,len2
		jne Imprime_matriz2
		

		
	solicita2_X:
	
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
		je Ingresa2_normalX
		mov al,10
		mov bl,[x+1]
		sub bl,48
		add al,bl
		mov [x],al
		jmp solicita2_Y
		
	Ingresa2_normalX:
		mov al,[x]
		sub al,48
		mov [x],al
	
	solicita2_Y:
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
		je Ingresa2_normalY
		mov al,10
		mov bl,[y+1]
		sub bl,48
		add al,bl
		mov [y],al
		jmp localiza_punto2
	
	Ingresa2_normalY:
		mov al,[y]
		sub al,48
		mov [y],al
		
	localiza_punto2:
		;recibe un x,y
		mov al,[y]
		mov bl,[doce]
		mul bl
		add al,[x]
		mov [punto],al

		
	par_o_impar2:
		mov ax,[punto] 
		AND ax,1 
		jnz linea_horizontal2
		jmp linea_vertical2 
	

	linea_horizontal2:
		call verifica_punto2
		mov al,45
		mov esi,[punto]
		mov [arreglo2+esi],al
		mov esi,[once]
		jmp verifica_letra2
		jmp _start
	
	linea_vertical2:
		call verifica_punto2
		mov al,124
		mov esi,[punto]
		mov [arreglo2+esi],al
		mov esi,[once]
		jmp verifica_letra2
		jmp _start
		
	
		
;-----------------------------------------------------------------------	
	
	
	verifica_letra2:
		cmp esi,120
		ja _start
		je _start

		add esi,2
		
		mov al,[arreglo2+esi]
		mov bl,[letra]

		cmp al,10
		je verifica_letra2
		
		cmp al,bl
		je suma_doce

		call verifica_cuadro2
		jmp verifica_letra2
		
		
	suma_doce:
		add esi,12
		jmp verifica_letra2
		
	verifica_cuadro2:

		mov edi,esi
		sub edi,12
		mov al,[arreglo2+edi]
		cmp al,32
		je verifica_letra2

		mov edi,esi
		add edi,1
		mov al,[arreglo2+edi]
		cmp al,32
		je verifica_letra2

		mov edi,esi
		sub edi,1
		mov al,[arreglo2+edi]
		cmp al,32
		je verifica_letra2
			
		mov edi,esi
		add edi,12
		mov al,[arreglo2+edi]
		cmp al,32
		je verifica_letra2
			
		mov al,[letra]
		mov [arreglo2+esi],al

		ret
		
	verifica_punto2:
		
		mov esi,[punto]
		
		mov al,[arreglo2+esi]
		cmp al,[cuarentaseis]
		je imprime_error2
		
		mov al,[arreglo2+esi]
		cmp al,[cienveinticuatro]
		je imprime_error1
		
		mov al,[arreglo2+esi]
		cmp al,[cuarentacinco]
		je imprime_error1
		
		ret
		
	imprime_error1:
	
		mov ecx,Error1
		mov edx,Error1len
		mov ebx,1
		mov eax,4
		int 0x80	
		call solicita2_X
		
	imprime_error2:
	
		mov ecx,Error2
		mov edx,Error2len
		mov ebx,1
		mov eax,4
		int 0x80	
		call solicita2_X

