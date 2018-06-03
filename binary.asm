.model small
.stack 100h

.data

msg1 db 'Enter the Number : $'
msg2 db 0ah,0dh,'The Decimal Number is : $'

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
    jcxz exit
    shl bl,1
    jnc zerop
    jc onep
    loop check
    
    
zerop:
    jcxz exit
    mov ah,2
    mov dl,30h
    int 21h
    loop check
    
onep:
    jcxz exit
    mov ah,2
    mov dl,31h
    int 21h
    loop check
    
exit:
    mov ah,4ch
    int 21h

main endp
end main