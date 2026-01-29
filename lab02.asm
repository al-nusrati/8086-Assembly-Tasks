.model small
.stack 100h    


.data          

    msg db 'Enter letter: $'
                  
 
.code
    
    ;initializing data segment
    mov ax, @data
    mov ds, ax
    
    ;displaying prompt
    mov ah, 09h     ;displaying string function
    lea dx, msg     ;copy whole addresses of msg
    int 21h
    
    ;getting input            
    mov ah, 01h     ;getting char input function
    int 21h
    
    ;uppercase to lowercase
    add al, 20h     
    
    ;saving converted character
    mov bl, al      ; bl = al
         
    ;moving to new line                
    mov dl, 0Ah     ;line feed <10>
    mov ah, 02h     ;displaying char function
    int 21h
    mov dl, 0Dh     ;carriage return   <13>
    mov ah, 02h     ;displaying char function
    int 21h   
                         
    ;display output
    mov dl, bl
    mov ah, 02h
    int 21h
       
    ;exiting prog
    mov ah, 4ch
    int 21h  
    
end