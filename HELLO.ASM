.model small		     ; Use SMALL memory model | [One code segment + one data segment (each ≤ 64 KB)]
.stack 100h		     ; Allocate 256 bytes (100h) for stack | [Stack segment (SS) is set up automatically by DOS loader]

.data			     ; --- Start of data segment
msg db 'Hello from MASM!$'   ; string to display, $-terminated  |  ('$' is required by DOS interrupt 21h, function 09h)

.code			     ; --- Start of code segment
start:
    mov ax, @data            ; load data segment address into AX
    mov ds, ax               ; initialize DS

    mov dx, offset msg       ; load offset of msg into DX
    mov ah, 09h              ; DOS function 09h: display string terminated by '$'
    int 21h                  ; call DOS interrupt (Displays the string pointed to by DS:DX)

    mov ah, 4Ch              ; DOS function 4Ch: terminate program
    int 21h                  ; call DOS interrupt (Return control to DOS)

end start