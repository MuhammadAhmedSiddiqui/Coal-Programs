.model small
.stack 100h

.data

msg1 db 'Enter n Number : $'
msg2 db 'Sum of n Number is : $'
sum dw 0
.code

main proc 

mov ax,@data
mov ds,ax

lea dx,msg1
mov ah,09
int 21h

mov ah,01
int 21h
sub al,30h
mov cl,al

mov bl,49d

print:
    mov ah,02
    mov dl,0ah
    int 21h
    mov ah,02
    mov dl,0dh
    int 21h
    mov dl,bl
    int 21h
    sub bl,30h
    
    add sum,bx
    add bl,30h
    inc bl
    loop print
    
    
mov ah,02
mov dl,0ah
int 21h

mov dl,0dh
int 21h

lea dx,msg1
mov ah,09
int 21h


mov ax,sum
aam
add al,30h
add ah,30h
mov bx,ax

mov ah,02
mov dl,bh
int 21h

mov ah,02
mov dl,bl
int 21h



mov ah,4ch
int 21h

main endp

end main

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
