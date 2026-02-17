.model small
.stack 100h
.data
    msg1 db 'Enter a multi-digit number: $'
    msg2 db 'Reversed number: $'
    newline db 0Dh, 0Ah, '$'
.code    

    main proc
        mov ax, @data
        mov ds, ax

;-----------------------------------------------------------------------

        ; --- Input Prompt ---
        lea dx, msg1        ; displaying msg1
        mov ah, 09h
        int 21h
        xor cx, cx          ; CX = 0

    input_loop:
        mov ah, 01h         ; reading char 
        int 21h
        
        cmp al, 0Dh         ; check if Enter key 010h is pressed
        je start_output     ; if Enter, go to output section
        
        push ax             ; push the digit inside AX to stack
        inc cx              ; CX++  
        jmp input_loop      ; continue reading next digit

;-----------------------------------------------------------------------------        
        
        ; --- Display Format ---
    start_output:
        lea dx, newline     ; -> newline
        mov ah, 09h
        int 21h
        lea dx, msg2        ; display msg2
        mov ah, 09h
        int 21h

        ; check if CX is 0 
        jcxz exit_program   

;----------------------------------------------------------------------------        
        
        ; --- Pop and Print Loop ---
    pop_loop:
        pop dx              ; pop top of stack into DX 
        
        mov ah, 02h         ; print char function
        int 21h             ; DL contains the char to print
        
        loop pop_loop       ; CX = CX - 1, if CX != 0 repeat

;--------------------------------------------------------------------------- 

        ; --- Exit ---
    exit_program:
        mov ah, 4Ch
        int 21h
    main endp

end main