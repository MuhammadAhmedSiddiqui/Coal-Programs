.model small
.stack 100h

.code
main proc

mov ax,6
int 10h

mov ah,0ch
mov al,1

mov dx,08

check_row:
    mov cx,50
    call print_row
    add dx,16d
    cmp dx,150
    jle check_row
    
mov cx,48
check_column:
    mov dx,08
    call print_column
    add cx,66d
    cmp cx,600
    jle check_column







mov ah,1
;mov al,3
int 10h

mov ah,6
mov cx,0106h  
mov dx,020dh  

mov bh,43h

mov al,0
int 10h






mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,030eh 
mov dx,0417h  

mov bh,43h

mov al,0
int 10h






mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0518h 
mov dx,061fh  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0720h 
mov dx,0827h  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0928h 
mov dx,0a2fh  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0b30h 
mov dx,0c37h  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0d38h 
mov dx,0e3fh  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0f40h 
mov dx,1047h  

mov bh,43h

mov al,0
int 10h


mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0118h 
mov dx,021fh  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0320h 
mov dx,0427h  

mov bh,43h
mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0528h 
mov dx,062fh  ;;;;;;;;;;;;;;;;;

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0730h 
mov dx,0837h  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0938h 
mov dx,0a3fh  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0b40h 
mov dx,0c47h  

mov bh,43h

mov al,0
int 10h












mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0128h 
mov dx,022fh  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0330h 
mov dx,0437h  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0538h 
mov dx,063fh  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0740h 
mov dx,0847h  

mov bh,43h

mov al,0
int 10h





mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0138h 
mov dx,023fh  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0340h 
mov dx,0447h  

mov bh,43h

mov al,0
int 10h







mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0506h 
mov dx,060dh  

mov bh,43h

mov al,0
int 10h





mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,070eh 
mov dx,0817h  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0918h 
mov dx,0a1fh  

mov bh,43h

mov al,0
int 10h






mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0b20h 
mov dx,0c27h  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0d28h 
mov dx,0e2fh  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0f30h 
mov dx,1037h  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0906h 
mov dx,0a0dh  

mov bh,43h

mov al,0
int 10h




mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0b0eh 
mov dx,0c17h  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0d18h 
mov dx,0e1fh  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0f20h 
mov dx,1027h  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0d06h 
mov dx,0e0dh  

mov bh,43h

mov al,0
int 10h



mov ah,1
mov al,3
int 10h

mov ah,6
mov cx,0f0eh 
mov dx,1017h  

mov bh,43h

mov al,0
int 10h


mov ah,0
int 16h

mov ax,3
int 10h

mov ah,4ch
int 21h


main endp


print_column proc

    top1:
        int 10h
        inc dx
        cmp dx,136
        jle top1

    ret
    print_column endp



print_row proc
    top:
        int 10h
        inc cx
        cmp cx,575
        jle top

    ret
    print_row endp

end main 