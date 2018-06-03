.model small
.stack 100h

.data

msg1 db 'Enter First value : $'
msg2 db 0dh,0ah,'Enter Second value : $'
msg3 db 0dh,0ah,'Enter Range : $'
msg4 db 0dh,0ah,'Fibonacci Series : $'
num1 db ?
num2 db ?
sum dw 0

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
mov num1,al

mov ah,09
lea dx,msg2
int 21h


mov ah,01
int 21h
sub al,30h
mov num2,al



mov ah,09
lea dx,msg3
int 21h


mov ah,01
int 21h
sub al,32h
mov cl,al

mov ah,09
lea dx,msg4
int 21h


mov ah,02
mov dl,0ah
int 21h

mov dl,0dh
int 21h

add num1,30h 
mov dl,num1 
int 21h
sub num1,30h 

mov ah,02
mov dl,0ah
int 21h

mov dl,0dh
int 21h

add num2,30h 
mov dl,num2
int 21h
sub num2,30h 


series:
    mov ah,02
    mov dl,0ah
    int 21h

    mov dl,0dh
    int 21h
    
    mov dh,num1
    mov al,num2
    mov num1,al
    add num2,dh
    
    mov dl,num2
    mov ax,0
    mov ax,dx
    
    aam
    
    add al,30h
    add ah,30h
    mov bx,ax
    mov ah,02
    mov dl,bh
    int 21h
    mov dl,bl
    int 21h

   
    
    
   
    loop series
    

mov ah,4ch
int 21h

main endp
end main
