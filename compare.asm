.model small
.stack 100h

.data

msg1 db 'Enter First Letter  : $'
msg2 db 0dh,0ah,'Enter second Letter :   $'
msg3 db 0dh,0ah,'The biggest letter is :   $'
first db ?
second db ?

.code

main proc 

mov ax,@data
mov ds,ax

mov ah,09
lea dx,msg1
int 21h

mov ah,01
int 21h


mov first,al



mov ah,09
lea dx,msg2
int 21h

mov ah,01
int 21h


mov second,al




cmp al,first
jl print_second
mov ah,09
lea dx,msg3
int 21h
mov ah,02
mov dl,first
int 21h




print_second:
mov ah,09
lea dx,msg3

int 21h
mov ah,02
mov dl,second
int 21h

mov ah,4ch
int 21h

main endp
end main



