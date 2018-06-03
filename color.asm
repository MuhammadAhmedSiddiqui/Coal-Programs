.model small
.stack 100h

.code
main proc

mov ah,05h
mov al,3
int 10h

mov ah,6
mov cx,081ah
mov dx,1035h
mov bh,43h

mov al,0
int 10h

    
mov ah,4ch
int 21h


main endp


end main 
   