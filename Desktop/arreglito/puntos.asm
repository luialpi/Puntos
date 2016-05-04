Section .data
;42=punto
;45=linea horizontal
;32=espacio
;124=linea vertical
	arreglo db 46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,10,
			db 32,32,32,32,32,32,32,10,
			db 46,32,46,32,46,32,46,10,10;
			
	
	len1: equ $-arreglo
	
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
	

	ocho dd 8
	siete dd 7
	cuarentacinco dd 45
	cienveinticuatro dd 124
	cuarentaseis dd 46
	doce dd 12
	once dd 11
	
	
	treintaYdos dd 32
	dieciseis dd 16
	quince dd 15

	msj1 db "digite su x: "
	msjlen1 equ $-msj1
	
	msj2 db "digite su y: "
	msjlen2 equ $-msj2
	
	
	jugadores db "Cuantos Jugadores se disponen a participar? "
	lenJugadores equ $-jugadores
	
	nombre db "Cual es el nombre del jugador: "
	lenNombre equ $-nombre
	
	Error1 db "En ese espacio ya hay una raya. ",10
	Error1len equ $-Error1

	Error2 db "En ese espacio no se puede dibujar una raya. ",10
	Error2len equ $-Error2
	
	Error3 db "Error! La cantidad de jugadores debe ser 2,3 o 4. ",10
	Error3len equ $-Error3
	
	turnoDe db "Es turno de:"
	lenTurnoDe equ $-turnoDe
	
Section .bss

	cantidadJugadores resb 2
	lenCantidadJugadores equ 2
	
	turno resb 1
	
	res resb 1
	
	punto resd 2
	
	x resb 4
	y resb 4
	xlen equ 4
	ylen equ 4
	
	
	
	letra resb 2
	
	nombre1 resb 20
	nombre2 resb 20
	nombre3 resb 20
	nombre4 resb 20
	lenNombre1 equ 20
	lenNombre2 equ 20
	lenNombre3 equ 20
	lenNombre4 equ 20
	
Section .text
	global _start
	
	_start:
	
	juego:
			mov ecx,jugadores
			mov edx,lenJugadores
			mov ebx,1
			mov eax,4
			int 0x80;imprimimos el msj de solicitud
			
			mov ecx,cantidadJugadores
			mov edx,lenCantidadJugadores
			mov ebx,0
			mov eax,3
			int 0x80;obtenemos datos del teclado
			
			mov al,[cantidadJugadores]
			sub al,48
			cmp al,2
			je pequenio

			cmp al,3
			je mediano
			
			cmp al,4
			je grande
			
			jmp Imprime_Error_Jugadores

	Imprime_Error_Jugadores:
			mov ecx,Error3
			mov edx,Error3len
			mov ebx,1
			mov eax,4
			int 0x80;imprimimos el msj de solicitud
			jmp juego

;=======================================================================
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;=======================================================================
	
	pequenio:
		
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
			
		mov ecx,nombre1
		mov edx,lenNombre1
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
			
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
			
		mov ecx,nombre2
		mov edx,lenNombre2
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
		
		
		mov bl,1
		mov [turno],bl
		
		controla_turno:
			mov al,[turno]
			cmp al,2
			ja reset_turno

			cmp al,1
			je cambio_jugador1
			
			cmp al,2
			je cambio_jugador2
		
		reset_turno:
			mov al,1
			mov [turno],al
			jmp controla_turno

		cambio_jugador1:
			mov al,76;[nombre1-(lenNombre1+1)]
			mov [letra],al
			jmp pequenio_aux
			
		cambio_jugador2:
			mov al,75;[nombre2-(lenNombre2+1)]
			mov [letra],al
			jmp pequenio_aux
			
			
		pequenio_aux:


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
				cmp edi,len1
				jne Imprime_matriz
			
			solicita_punto:
			
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
				
				mov ax,[x]
				sub ax,48
				mov [x],ax
				
				mov ax,[y]
				sub ax,48
				mov [y],ax
				

			localiza_punto:
				;recibe un x,y
				mov al,[y]
				mov bl,[ocho]
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
				mov esi,[siete]
				mov bl,[turno]
				add bl,1
				mov [turno],bl
				jmp verifica_letra
				jmp controla_turno
			
			linea_vertical:
				call verifica_punto
				mov al,124
				mov esi,[punto]
				mov [arreglo+esi],al
				
				mov bl,[turno]
				add bl,1
				mov [turno],bl
				
				mov esi,[siete]
				jmp verifica_letra
				jmp controla_turno
				
			
			
			verifica_letra:
				cmp esi,48
				ja controla_turno
				je controla_turno

				add esi,2
				
				mov al,[arreglo+esi]
				mov bl,[letra]

				cmp al,10
				je suma_ocho
				
				cmp al,bl
				je verifica_letra

				call verifica_cuadro
				jmp verifica_letra
				
				
			suma_ocho:
				add esi,8
				jmp verifica_letra
				
			verifica_cuadro:
				mov edi,esi
				mov al,[arreglo+edi]
				cmp al,32
				jne verifica_letra
				
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
				cmp al,[cuarentaseis]
				je imprime_error2
				
				mov al,[arreglo+esi]
				cmp al,[cienveinticuatro]
				je imprime_error1
				
				mov al,[arreglo+esi]
				cmp al,[cuarentacinco]
				je imprime_error1
				
				ret
				
			imprime_error1:
			
				mov ecx,Error1
				mov edx,Error1len
				mov ebx,1
				mov eax,4
				int 0x80	
				call solicita_punto
				
			imprime_error2:
			
				mov ecx,Error2
				mov edx,Error2len
				mov ebx,1
				mov eax,4
				int 0x80	
				call solicita_punto
			

;=======================================================================
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;=======================================================================


	mediano:
	
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
			
		mov ecx,nombre1
		mov edx,lenNombre1
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
			
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
			
		mov ecx,nombre2
		mov edx,lenNombre2
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
			
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
			
		mov ecx,nombre3
		mov edx,lenNombre3
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
		
		mov bl,1
		mov [turno],bl
		
		controla_turno2:
			mov al,[turno]
			cmp al,3
			ja reset_turno2

			cmp al,1
			je cambio2_jugador1
			
			cmp al,2
			je cambio2_jugador2
			
			cmp al,3
			je cambio2_jugador3
		
		reset_turno2:
			mov al,1
			mov [turno],al
			jmp controla_turno2

		cambio2_jugador1:
			mov al,76;[nombre1-(lenNombre1+1)]
			mov [letra],al
			jmp mediano_aux
			
		cambio2_jugador2:
			mov al,75;[nombre2-(lenNombre2+1)]
			mov [letra],al
			jmp mediano_aux
			
		cambio2_jugador3:
			mov al,77;[nombre2-(lenNombre2+1)]
			mov [letra],al
			jmp mediano_aux
		
		mediano_aux:
				
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
				
				mov bl,[turno]
				add bl,1
				mov [turno],bl
				
				mov esi,[once]
				jmp verifica_letra2
				jmp controla_turno2
			
			linea_vertical2:
				call verifica_punto2
				mov al,124
				mov esi,[punto]
				mov [arreglo2+esi],al
				
				mov bl,[turno]
				add bl,1
				mov [turno],bl
				
				mov esi,[once]
				jmp verifica_letra2
				jmp controla_turno2
			
			verifica_letra2:
				cmp esi,120
				ja controla_turno2
				je controla_turno2

				add esi,2
				
				mov al,[arreglo2+esi]
				mov bl,[letra]

				cmp al,10
				je suma_doce
				
				cmp al,bl
				je verifica_letra2
				
				cmp al,32
				jne verifica_letra2

				call verifica_cuadro2
				jmp verifica_letra2
				
				
			suma_doce:
				add esi,12
				jmp verifica_letra2
				
			verifica_cuadro2:
				mov al,[arreglo2+esi]
				cmp al,32
				jne verifica_letra2
				
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
				je imprime2_error2
				
				mov al,[arreglo2+esi]
				cmp al,[cienveinticuatro]
				je imprime2_error1
				
				mov al,[arreglo2+esi]
				cmp al,[cuarentacinco]
				je imprime2_error1
				
				ret
				
			imprime2_error1:
			
				mov ecx,Error1
				mov edx,Error1len
				mov ebx,1
				mov eax,4
				int 0x80	
				call solicita2_X
				
			imprime2_error2:
			
				mov ecx,Error2
				mov edx,Error2len
				mov ebx,1
				mov eax,4
				int 0x80	
				call solicita2_X

;=======================================================================
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;=======================================================================


	grande:
	
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
		
		mov ecx,nombre1
		mov edx,lenNombre1
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
		
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
		
		mov ecx,nombre2
		mov edx,lenNombre2
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
		
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
		
		mov ecx,nombre3
		mov edx,lenNombre3
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
		
					
		mov ecx,nombre
		mov edx,lenNombre
		mov ebx,1
		mov eax,4
		int 0x80;imprimimos el msj de solicitud
		
		mov ecx,nombre4
		mov edx,lenNombre4
		mov ebx,0
		mov eax,3
		int 0x80;obtenemos datos del teclado
			
		mov bl,1
		mov [turno],bl
		
		controla_turno3:
			mov al,[turno]
			cmp al,4
			ja reset_turno3

			cmp al,1
			je cambio3_jugador1
			
			cmp al,2
			je cambio3_jugador2
			
			cmp al,3
			je cambio3_jugador3
			
			cmp al,4
			je cambio3_jugador4
		
		reset_turno3:
			mov al,1
			mov [turno],al
			jmp controla_turno3

		cambio3_jugador1:
			mov al,76;[nombre1-(lenNombre1+1)]
			mov [letra],al
			jmp grande_aux
			
		cambio3_jugador2:
			mov al,75;[nombre2-(lenNombre2+1)]
			mov [letra],al
			jmp grande_aux
			
		cambio3_jugador3:
			mov al,77;[nombre2-(lenNombre2+1)]
			mov [letra],al
			jmp grande_aux	
			
		cambio3_jugador4:
			mov al,78;[nombre2-(lenNombre2+1)]
			mov [letra],al
			jmp grande_aux
				
		grande_aux:
		
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
				
				mov bl,[turno]
				add bl,1
				mov [turno],bl
				
				mov esi,[quince]
				jmp verifica_letra3
				jmp controla_turno3
			
			linea_vertical3:
				call verifica_punto3
				mov al,124
				mov esi,[punto]
				mov [arreglo3+esi],al
				
				mov bl,[turno]
				add bl,1
				mov [turno],bl
				
				mov esi,[quince]
				jmp verifica_letra3
				jmp controla_turno3

			
			verifica_letra3:
				cmp esi,224
				ja controla_turno3
				je controla_turno3

				add esi,2
				
				mov al,[arreglo3+esi]
				mov bl,[letra]

				cmp al,10
				je suma_dieciseis
				
				cmp al,bl
				je verifica_letra3
				
				cmp al,32
				jne verifica_letra3

				call verifica_cuadro3
				jmp verifica_letra3

			suma_dieciseis:
				add esi,16
				jmp verifica_letra3
				
			verifica_cuadro3:
				mov al,[arreglo2+esi]
				cmp al,32
				jne verifica_letra3
			
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
				
		
		
		

