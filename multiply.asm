.model small
.stack 100h

.data 

msg1 db 'Enter multiplier : $'
msg2 db 0dh,0ah,'Enter multiplicand : $'
msg3 db 0dh,0ah,'Answer is : $'
result db ?
multi db ?

.code
main proc

mov ax,@data
mov ds,ax

mov ah,09
lea dx,msg1
int 21h

mov ah,01
int 21h

sub al,30h
mov multi,al

mov ah,09
lea dx,msg2
int 21h

mov ah,01
int 21h

sub al,30h
mul multi

mov ah,09
lea dx,msg3
int 21h

aam

add ah,30h
add al,30h

mov dx,ax

mov ah,02
mov dh,ah
int 21h

mov dl,al
int 21h


mov ah,4ch
int 21h

main endp
end main