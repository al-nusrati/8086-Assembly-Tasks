.model small
.stack 100h

.data
    msg1 db 'Enter your first name: $'
    msg2 db 0Ah, 0Dh, 'Enter your last name: $'
    msg3 db 0Ah, 0Dh, 'Complete name: $'    
    
    buffer1 db 10, 11 dup(?)
    buffer2 db 10, 11 dup(?)
.code

;initialize data segment
    mov ax, @data
    mov ds, ax
    
;displaying first prompt
    mov ah, 09h
    mov dx, offset msg1
    int 21h
    
;reading first name
    mov ah, 0Ah
    mov dx, offset buffer1
    int 21h
    
;displaying second prompt
    mov ah, 09h
    mov dx, offset msg2
    int 21h
    
;reading last name
    mov ah, 0Ah
    mov dx, offset buffer2
    int 21h
    
;prepare first name for display
    mov ah, 09h
    mov bh, 00h
    mov bl, buffer1[1]          ; BX gets actual buffer length
    mov buffer1[bx+2], '$'      ; put a $ sign at the end of buffer
    
;prepare second name for display
    mov bl, buffer2[1]          ; BX gets actual buffer length
    mov buffer2[bx+2], '$'      ; put a $ sign at the end of buffer
    
;displaying complete name message
    mov ah, 09h
    mov dx, offset msg3
    int 21h
    
;displaying first name
    lea dx, buffer1[2]          ; load actual start of string
    int 21h
    
;displaying space
    mov dl, ' '
    mov ah, 02h
    int 21h
    
;displaying last name
    mov ah, 09h
    lea dx, buffer2[2]          ; load actual start of string
    int 21h
    
;exiting prog
    mov ah, 4ch
    int 21h
    
end