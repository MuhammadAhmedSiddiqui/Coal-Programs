.model small
.stack 100h

.data

msg1 db 'Enter a Phrase : $'
msg2 db 0ah,0dh,'Total Letters : $'
msg3 db 0ah,0dh,'Capiatl Letters : $'
msg4 db 0ah,0dh,'Small Letters : $'

smal dw 0
capital dw 0



.code

main proc 

mov ax,@data
mov ds,ax
lea dx,msg1
mov ah,9
int 21h

eve:
    
    cmp al,0dh
    je print
    mov ah,1
    int 21h
    inc cx
    cmp al,96
    jg count_small1
    cmp al,64
    jg count_capital1
    jmp eve


    
    
count_capital1:

    cmp al,91
    jl count_capital2
    jmp eve


    
    
count_capital2:

    inc capital
    jmp eve




count_small1:

    cmp al,123
    jl count_small2
    jmp eve


count_small2:
    inc smal
    jmp eve 

print:


   lea dx,msg2
   mov ah,9
   int 21h
   mov ax,cx
   aam
   add al,30h
   add ah,30h
   mov bx,ax
   mov ah,02
   mov dl,bh
   int 21h
   mov dl,bl
   int 21h
   
   lea dx,msg3
   mov ah,9
   int 21h
   mov ax,capital
   aam
   add al,30h
   add ah,30h
   mov bx,ax
   mov ah,02
   mov dl,bh
   int 21h
   mov dl,bl
   int 21h
   
   lea dx,msg4
   mov ah,9
   int 21h
   
   mov ax,smal
   aam
   add al,30h
   add ah,30h
   mov bx,ax
   mov ah,02
   mov dl,bh
   int 21h
   mov dl,bl
   int 21h
   
   



mov ah,4ch
int 21h   


main endp
end main