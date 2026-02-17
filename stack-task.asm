.model small
.stack 100h 

.data
    msg1 db 'Enter a phrase: $'
    msg2 db 0Dh, 0Ah, 'Reversed phrase: $'
    
.code
    mov ax, @data
    mov ds, ax

    ; display prompt
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; initialize counter
    xor cx, cx          ; clear cx register to count characters

input_loop:
    ; read single character input
    mov ah, 01h
    int 21h

    ; check if enter key (0Dh) is pressed
    cmp al, 0Dh
    je start_output     ; if enter is pressed, go to output

    ; push character to stack
    xor ah, ah          ; clear ah, keep char in al
    push ax             ; push the character (in ax) to stack
    inc cx              ; increment counter
    jmp input_loop      ; continue reading

start_output:
    ; display second prompt
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; check if no characters were entered
    jcxz exit_program

print_loop:
    ; pop character from stack
    pop dx              ; pop top of stack into dx (char moves to dl)

    ; display the character
    mov ah, 02h
    int 21h

    loop print_loop     ; decrement cx and repeat until cx = 0

exit_program:
    ; exit program
    mov ah, 4Ch
    int 21h
end