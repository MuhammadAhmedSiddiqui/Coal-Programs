.model small
.stack 100h

.data

msg1 db 'Enter the Number : $'
msg2 db 0ah,0dh,'Number of 1s are : $'
count db 30h

.code
main proc 

mov ax,@data
mov ds,ax

lea dx,msg1
mov ah,09
int 21h

mov ah,01
int 21h
mov bl,al
sub bl,30h
mov cl,8

lea dx,msg2
mov ah,09
int 21h

check:
    shl bl,1
    jnc zerop
    jc onep
    loop check
    
    
zerop:
    loop check
    
onep:
    inc count
    loop check
    

mov dl,count
mov ah,02
int 21h

mov ah,4ch
int 21h

main endp
end main