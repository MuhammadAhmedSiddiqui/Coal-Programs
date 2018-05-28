.model small
.stack 100h

.data

msg1 db 'Enter Your Name : $'
msg2 db 'Enter Your Height(IN METERS Only) : $'
msg3 db 'Enter Your Gender : $'
msg4 db 'Enter Your Age : $'
msg5 db 'Enter Your Weight(In KG) : $'


msg6 db 0ah,0dh,'Name           : $'
msg7 db 0ah,0dh,'Height(METERS) : $'
msg8 db 0ah,0dh,'Gender         : $'
msg9 db 0ah,0dh,'Age            : $'
msg10 db 0ah,0dh,'Weight(KG)     : $'
msg11 db 0ah,0dh,'BMI is         : $'

under_weight db 0ah,0dh,'Recomendations :  Underweight. Drink 6 to 8 glasses of water.' ,0ah,0dh,'Eat frequent but small meals. Eat lots of raw fruits and vegetables.' ,0ah,0dh,'Avoid coffee, processede food, redd meat and animal fats.$'
perfect_weight db 0ah,0dh,'Recomendations : You are normal. Keep your current diet. $'
over_weight db 0ah,0dh,'Recomendations : Overweight. Eliminate red meat. Cut out fried foods. ',0ah,0dh,'Start with a soup or salad. Stop Cola consumption. Drink water.  $'
obesity db 0ah,0dh,'Recomendations : You must improve your eating habits. Eat variety of foods. ',0ah,0dh,'Specilly pasta, rice and other grain foods. Eat lots of fruits and vegetables.',0ah,0dh,' Try to do atleast 30 minutes of physical activity a day !!$'




age dw 0
weight dw 0
name1 db 20 dup(0)
height dw 0
gender db 7 dup(0)
bmi dw ?

.code
main proc 

call proc_initialize_data    ;calling the procedure to initialize data

lea dx,msg1
call proc_str_output          ;calling the procedure to print defined string
lea di,name1
call input

lea dx,msg2
call proc_str_output          ;calling the procedure to print defined string
call int_input
mov height,ax                   ;move the input in height


lea dx,msg3
call proc_str_output         ;calling the procedure to print defined string  
lea di,gender
call input

lea dx,msg4
call proc_str_output         ;calling the procedure to print defined string
call int_input
mov age,ax                  ;move the input in age 

lea dx,msg5
call proc_str_output         ;calling the procedure to print defined string
call int_input
mov weight,ax               ;move the input in weight


lea dx,msg6
call proc_str_output        ;calling the procedure to print defined string
lea si,name1
call output

lea dx,msg7
call proc_str_output        ;calling the procedure to print defined string
mov ax,height
call proc_outdec

lea dx,msg8
call proc_str_output        ;calling the procedure to print defined string
lea si,gender
call output

lea dx,msg9
call proc_str_output        ;calling the procedure to print defined string
mov ax,age
call proc_outdec

lea dx,msg10
call proc_str_output        ;calling the procedure to print defined string
mov ax,weight
call proc_outdec

lea dx,msg11
call proc_str_output        ;calling the procedure to print defined string
mov bx,height
call proc_bmi               ;calling the procedure for bmi calculation
mov bmi,ax
call proc_outdec
jmp bmi_checkup

bmi_checkup:
    cmp bmi,19              ;cmp the value of bmi with 19
    jle print_under         ;if less or equal jump print_under
    jg more_check           ;if greater than 19 jump more_check

print_under:
    call proc_crlf         ;calling procedure carriage return
    lea dx,under_weight     ;load the address of under_weight defined string in dx
    call proc_str_output   ;calling the procedure to print defined string
    call proc_exitDOS       ;calling procedure exit to dos

more_check:
    cmp bmi,25              ;comparing bmi with 25
    jle print_perfect       ;if less of equal jump to print_perfect label
    jg again_check          ;if greater than jump to more check

print_perfect:
    call proc_crlf         ;calling procedure carriaage return
    lea dx,perfect_weight   ;load the address of perfect_weight defined string in dx
    call proc_str_output   ;calling the procedure to print defined string
    call proc_exitDOS       ;calling procedure exit to dos

again_check:
    cmp bmi,30              ;comparing bmi with 30
    jle print_over          ;if bmi is 30 or less than jump to print_over
    jg print_obesity        ;if bmi is greater than 30 jump to print_obesity

    
print_over:
    call proc_crlf         ;calling procedure carriage return
    lea dx,over_weight      ;load the address of over_weight defined string in dx
    call proc_str_output   ;calling the procedure to print defined string
    call proc_exitDOS       ;calling procedure exit to dos
    
print_obesity:
    call proc_crlf         ;calling procedure carrige return
    lea dx,obesity          ;load the address of obesity defined string in dx
    call proc_str_output   ;calling the procedure to print defined string
    call proc_exitDOS       ;calling procedure exit to dos



call proc_exitDOS       ;calling procedure exit to dos


main endp

include lib.asm

end main