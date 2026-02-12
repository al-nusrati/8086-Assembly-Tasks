.model small
.stack 100h
.data
    msg1 db 'Enter your first name: $'
    msg2 db 0Ah, 0Dh, 'Enter your last name: $'
    msg3 db 0Ah, 0Dh, 'Complete name: $'
    msg4 db 0Ah, 0Dh, 'First name char length: $'
    msg5 db 0Ah, 0Dh, 'Last name char length: $'
    buffer1 db 10, 11 dup(?)
    buffer2 db 10, 11 dup(?)

.code
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset msg1
    int 21h
    mov ah, 0Ah
    mov dx, offset buffer1
    int 21h

    mov ah, 09h
    mov dx, offset msg2
    int 21h
    mov ah, 0Ah
    mov dx, offset buffer2
    int 21h

    mov ah, 09h
    mov bh, 00h
    mov bl, buffer1[1]
    mov buffer1[bx+2], '$'
    mov bl, buffer2[1]
    mov buffer2[bx+2], '$'

    mov ah, 09h
    mov dx, offset msg3
    int 21h
    lea dx, buffer1[2]
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov ah, 09h
    lea dx, buffer2[2]
    int 21h

    mov ah, 09h
    mov dx, offset msg4
    int 21h
    mov al, buffer1[1]
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 09h
    mov dx, offset msg5
    int 21h
    mov al, buffer2[1]
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
    mov ah, 4ch
    int 21h
end