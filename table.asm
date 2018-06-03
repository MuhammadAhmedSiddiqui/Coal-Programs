.model small
.stack 100h

.data

msg1 db 0dh,0ah,'Enter Table Number : $'
msg2 db 0dh,0ah,'Till Number ?  $'
msg3 db ' * $'
msg4 db ' = $'

tabel db ?
num db ?
multiplicand db 31h

.code

main proc 

mov AX,@DATA
mov DS,AX

mov ah,09
lea dx,msg1
int 21h

mov ah,01
int 21h

sub al,30h
mov tabel,al


mov ah,09
lea dx,msg2
int 21h

mov ah,01
int 21h

sub al,30h
mov bl,al
mov cx,bx

print:
    mov ah,02
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    add tabel,30h
    mov dl,tabel
    int 21h
    sub tabel,30h
    mov ah,09
    lea dx,msg3
    int 21h
    mov ah,02
    mov dl,multiplicand
    int 21h
    mov ah,09
    lea dx,msg4
    int 21h
    mov al,tabel
    sub multiplicand,30h
    mul multiplicand
    add multiplicand,30h
    inc multiplicand
    aam
    
    add al,30h
    add ah,30h
    mov bx,ax
    mov ah,02
    mov dl,bh
    int 21h
    mov dl,bl
    int 21h

    
    loop print



















    
mov ah,4ch
int 21h


main endp
end main