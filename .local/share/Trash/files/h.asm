Section .data
;42=punto
;45=linea horizontal
;32=espacio
;124=linea vertical
	arreglo db 46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,32,46,32,46,10,10;
			
	
	len: equ $-arreglo
	
	ff dd 45
	cientf dd 124
	doce dd 12
	once dd 11
	letra dd 76
	treintaydos dd 32

	
	msj1 db "digite su x: "
	len1 equ $-msj1
	
	msj2 db "digite su y: "
	len2 equ $-msj2
	
	Error1 db "En ese espacio ya hay una raya. ",10
	Error1len equ $-Error1
	
	entro db "entro",10
	elen equ $-entro
	
	entro2 db "entro2",10
	elen2 equ $-entro2
	
Section .bss
	res resb 1
	punto resd 2
	x resb 2
	y resb 2
	xlen equ 2
	ylen equ 2

	

Section .text
	global _start
	
	_start:

			
	mov edi,0
		
	Imprime_matriz:
		
		mov al,[arreglo+edi]
		mov [res],al
		mov edx,1
		mov ecx,res
		
		mov ebx,1
		mov eax,4
		int 0x80
		
		inc edi
		cmp edi,len
		jne Imprime_matriz
		

		
	solicita_punto:
	
		mov ecx,msj1
		mov edx,len1
		mov ebx,1
		mov eax,4
		int 0x80
		
		mov ecx,x
		mov edx,xlen
		mov ebx,0
		mov eax,3
		int 0x80
		
		mov ecx,msj2
		mov edx,len2
		mov ebx,1
		mov eax,4
		int 0x80
	
		mov ecx,y
		mov edx,ylen
		mov ebx,0
		mov eax,3
		int 0x80
		
		mov ax,[x]
		sub ax,48
		;call revisa_numero
		mov [x],ax
		
		mov ax,[y]
		sub ax,48
		;revisa_numero
		mov [y],ax
	
	;revisa_numero:
		;mov al,[x+1]
		;cmp al,0
		;jne
		;mov al,[y+1]
		;cmp al,0
		
	;Asigna_datos:
		

	localiza_punto:
		;recibe un x,y
		mov al,[y]
		mov bl,[doce]
		mul bl
		add al,[x]
		mov [punto],al
		
	par_o_impar:
		mov ax,[punto] 
		AND ax,1 
		jnz linea_horizontal 
		jmp linea_vertical 
	

	linea_horizontal:
		call verifica_punto
		mov al,45
		mov esi,[punto]
		mov [arreglo+esi],al
		mov esi,[once]
		jmp verifica_letra
		jmp _start
	
	linea_vertical:
		call verifica_punto
		mov al,124
		mov esi,[punto]
		mov [arreglo+esi],al
		mov esi,[once]
		jmp verifica_letra
		jmp _start
		
	
		
		
		
;-----------------------------------------------------------------------	
	
	
	verifica_letra:
		cmp esi,len
		ja _start
		je _start

		add esi,2
		
		mov al,[arreglo+esi]
		mov bl,[letra]

		cmp al,10
		je verifica_letra
		
		cmp al,bl
		je suma_doce

		call verifica_cuadro
		jmp verifica_letra
		
		
	suma_doce:
		add esi,12
		jmp verifica_letra
		
	verifica_cuadro:

		
		mov edi,esi
		sub edi,8
		mov al,[arreglo+edi]
		cmp al,32
		je verifica_letra

		mov edi,esi
		add edi,1
		mov al,[arreglo+edi]
		cmp al,32
		je verifica_letra

		mov edi,esi
		sub edi,1
		mov al,[arreglo+edi]
		cmp al,32
		je verifica_letra
			
		mov edi,esi
		add edi,8
		mov al,[arreglo+edi]
		cmp al,32
		je verifica_letra
		
		mov al,[letra]
		mov [arreglo+esi],al
		
		ret
		
	verifica_punto:
		
		mov esi,[punto]
		
		mov al,[arreglo+esi]
		cmp al,[cientf]
		je imprime_error1
		
		mov al,[arreglo+esi]
		cmp al,[ff]
		je imprime_error1
		
		ret
		
	imprime_error1:
	
		mov ecx,Error1
		mov edx,Error1len
		mov ebx,1
		mov eax,4
		int 0x80	
		call solicita_punto
