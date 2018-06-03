.model small
.stack 100h

.data

msg1 db 'Enter Dividend : $'
msg2 db 0dh,0ah,'Enter Divisor :  $'
msg3 db 0dh,0ah,'Quotient is : $'
msg4 db 0dh,0ah,'Remainder is : $'

num1 dw ?
num2 db ?


.code

main proc 

MOV AX,@DATA
MOV DS,AX

LEA DX,msg1
MOV AH,9
INT 21H
MOV AH,1
INT 21H

SUB AL,30H
MOV BL,AL
MOV num1,BX

LEA DX,msg2
MOV AH,9
INT 21H
MOV AH,1
INT 21H

SUB AL,30H
MOV NUM2,AL
mov ax,num1
DIV NUM2

ADD AL,30H
mov bl,al
ADD AH,30H
mov bh,ah


LEA DX,msg4
MOV AH,09
INT 21H

MOV AH,02
MOV DL,BH
INT 21H

LEA DX,msg3
MOV AH,09
INT 21H

MOV AH,02
MOV DL,BL
INT 21H

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN