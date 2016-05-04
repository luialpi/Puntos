 
.MODEL TINY
.CODE
ORG 100h
inicio:
    mov cx,10
    mov si,offset array
Ciclo:
    mov dl,[si]
    add dl,48 &#59; converiosn a ASCII
    mov ah,02h&#59;Servicio para mostrar un caracter
    int 21h&#59;Interrupcion del D.O.S
    inc si
    LOOP Ciclo&#59;Se supone decrementa el CX en 1
int 20h
ARRAY DB 1,2,3,4,5,6,7,8,9,0
end inicio
