input proc
    mov ah,01
    cld                        ;set bit =0
    top:
        int 21h                ;take's single character input
        cmp al,0dh             ;check if carriage return?
        je exit                ;if yes then exit
        cmp al,8h              ;check if backspace?
        jne continue1          ;if no then jump to continue1
        dec di                 ;if yes then decrement DI
        
        mov al,0               ;move 0 in al 
        stosb                  ;set 0 where di is pointing
        jmp top                ;jump to top 


    continue1:                 
    stosb                     ;store al where di is pointing                   
        jmp top               ;jump to top 
    
    exit:    
        ret              
    input endp


    
    
output proc                   

    cld                      ;set bit =0
    print:                   
        mov ah,02            
        lodsb                ;stores the character where si is pointing
        cmp al,0             ;comparing
        je exit1             ;if equal jump to exit1
        mov dl,al
        int 21h              
        jmp print            ;recursive calling
    exit1:
        ret                  
    output endp


proc_str_output proc         ;procedure to print defined string
    mov ah,09
    int 21h
   ret
   proc_str_output endp

int_input proc               ;procedure to take integer input

    mov bh,0
    mov bl,10d

    input99:
        mov ah,01
        int 21h              
        cmp al,8h            ;if the input is backspace
        je subtract          ;if equal jump to subtract
        cmp al,0dh           
        jne number99         ;if not equal jump to number99
        jmp exit99           ;jump to exit99
    
    
    number99:
        sub al,30h           ;subtract input with 30h
        mov cl,al           ;mov input in cl
        mov al,bh           ;mov the value of bh in al because al is default multiplicand register
        mul bl              ;multiply bl with al 
        add al,cl           ;add the value of cl in the result of multiplication
        mov bh,al           ;mov final value into bh because next input will overwrite the result 
        jmp input99


    subtract:
        push dx             ;push the value of dx in stack
        sub bh,cl           ;subtract the last input from the final result
        mov bl,bh           ;mov bh in bl 
        xor ax,ax           ;clear ax
        mov bh,0            ;clear bh
        mov ax,bx           ;mov bx in ax as ax is the default dividend
        mov bl,10d          ;move 10 in bl
        div bl              ;divide ax with 10
        mov bh,al           ;move final answer after division into bh
        mov bl,10d          ;again assign bl with 10
        pop dx              ;pop dx
        jmp input99


    exit99:
        mov dl,bh           ;mov the result in dl
        xor ax,ax           ;clear ax as ax will hold the result after calling this function
        mov dh,0            ;clear dh
        mov ax,dx           ;move final result in ax
        
    ret 
    int_input endp
   
   
   
   
   
single_char_input proc        ;to take single character input

   mov ah,01
   int 21h
   ret
   single_char_input endp
   
single_char_output proc       ;to taake single character output

   mov ah,02
   int 21h
   ret
   single_char_output endp
   
proc_crlf proc               ;carriage return
    
    mov ah,02
    mov dl,0ah
    int 21h
    
    mov ah,02
    mov dl,0dh
    int 21h
    ret
    proc_crlf endp

    
    
proc_exitDOS proc            ;to exit dos command
    mov ah,4ch
    int 21h
    ret
    proc_exitDOS endp
    
proc_initialize_data proc    ;to initialize the data

    mov ax,@data
    mov ds,ax
    mov es,ax                ;extra segment
    ret
    proc_initialize_data endp
    
    

    
    
    
proc_outdec proc
    push ax
    push bx
    push cx
    push dx
    
    or ax,ax
    jge @end_if1
    
    push ax
    mov dl,'-'
    mov ah,02
    int 21h
    pop ax
    neg ax
    
    @end_if1:
        xor cx,cx
        mov bx,10d
        
    @repeat1:
        xor dx,dx
        div bx
        push dx
        inc cx
        or ax,ax
        jne @repeat1
        mov ah,02
        
    @print_loop:
        pop dx
        or dl,30h
        int 21h
        loop @print_loop
    pop dx
    pop cx
    pop bx
    pop ax
    ret
    proc_outdec endp
    


proc_bmi proc             ;body mass index calculation
    
    xor ax,ax             ;initialize ax with 0
    mov ax,bx             ;mov the value of bx in ax as bx holds the value of height (in meters)
    mul bx                ; mutiply bx with ax (i-e height*height)
    xor bx,bx             ;initialize bx with 0
    mov bx,ax             ;move the result of multiply in bx
    xor ax,ax             ;initialize ax with 0
    mov ax,weight          ;ax holds the value of weight
    div bx                  ;divide (weight/height*height)
    ret                     ;now ax holds the final result after calling this function
    proc_bmi endp
