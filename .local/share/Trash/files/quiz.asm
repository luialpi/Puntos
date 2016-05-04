 
 section .data
	asterisco db "*"
	len equ $ - asterisco
	numero dd 7
	tiempo dd 1,0

 section .text
 global _start

 _start:
 	mov edi,[numero]
  	call imprimir

 imprimir:
 	
 	mov ecx,asterisco
 	mov edx,len
 	call display
 	int 0x80

 	call pausa
 	sub edi,1
 	cmp edi,0
 	jnz imprimir
 	jmp salir

 pausa:
 	mov ebx,tiempo
	mov eax,162  ; nanosleep
	int 0x80
	ret
display:
	mov eax,4
 	mov ebx,1
 	ret


salir:
 	mov eax,1
	int 0x80
