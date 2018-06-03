.model small
.stack 100h

.code

main proc


mov ah,01
int 21h


mov ah,02
mov dl,al
int 21h

mov ah,4ch
int 21h

main endp
end main
