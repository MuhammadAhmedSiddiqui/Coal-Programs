.model small
.stack 100h

.data

msg1 db 'How Many Numbers you want to Enter : $'
msg2 db 0ah,0dh,'Enter Character : $'
array1 db 100 dup (?)
count db ?
diff db 0

.code
main proc 

mov ax,@data
mov ds,ax

lea si,array1

lea dx,msg1
mov ah,09
int 21h

mov ah,01
int 21h
sub al,30h
mov count,al
mov cl,al
mov bl,al

input:

    lea dx,msg2
    mov ah,09
    int 21h

    mov ah,01
    int 21h
    
    mov array1[si],al
    inc si
    loop input
    




lea si,array1
mov cl,bl

sort:
    inc diff
    mov al,array1[si]
    cmp al,array1[si+1]
    jg swap
    jle eve
    loop sort

swap:
    mov bh,array1[si]
    mov dh,array1[si+1]
    mov array1[si+1],bh
    mov array1[si],dh
    mov dl,count
    cmp dl,diff
    je reset
    inc si
    jp sort

eve:
    mov dl,count
    cmp dl,diff
    je reset
    inc si
    jp sort

reset:
    lea si,array1
    mov diff,0
    mov cl,count
    jp sort



lea si,array1    
mov ah,02
mov cl,bl
    
print:
    call nextline
    mov dl,array1[si] 
    int 21h
    inc si
    loop print

mov ah,4ch
int 21h
 
main endp

nextline proc
    mov ah,02
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    ret
    nextline endp

    
end main   