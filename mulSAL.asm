.model small
.stack 100h

.data

msg1 db 'Enter a Multiplier : $'
msg2 db 0ah,0dh,'Enter a Multiplicand (Should be multiple of 2) : $'
msg3 db 0ah,0dh,'The Result is : $'
num1 db ?
counter db ?

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
mov num1,al

lea dx,msg2
mov ah,09
int 21h

mov ah,01
int 21h
sub al,30h

sar al,1
mov cl,al


mov dl,al
add dl,30h
mov ah,02
int 21h



mov bl,num1
sal bx,cl


lea dx,msg3
mov ah,09
int 21h

mov ax,bx
aam
mov bl,al
mov bh,ah


mov ah,02

mov dl,bh
add dl,30h
int 21h


mov dl,bl
add dl,30h
int 21h

mov ah,4ch
int 21h

main endp
end main