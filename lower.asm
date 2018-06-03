.model small
.stack 100h

.data

msg1 db 0dh,0ah,'Enter a Lower Case character  : $'
msg2 db 0dh,0ah,'INVALID INPUT, Enter a lower case letter $'
msg3 db 0dh,0ah,'upper case letter is : $'

.code

main proc 

mov ax,@data
mov ds,ax

jmp print_msg


print_msg:
mov ah,09
lea dx,msg1
int 21h
mov ah,01
int 21h
 



cmp al,96
jl print
jg yess  
 
 
yess:
cmp al,123
jg print
jl done



done:
sub al,20h
mov ah,09
lea dx,msg3
int 21h
mov dl,al
mov ah,02
int 21h
mov ah,4ch
int 21h

print: 
 mov ah,09
 lea dx,msg2
 int 21h
 jmp print_msg


 
 
 

mov ah,4ch
int 21h

main endp
end main
