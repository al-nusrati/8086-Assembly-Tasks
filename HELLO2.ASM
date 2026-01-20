.model small
; Use SMALL memory model
; One code segment + one data segment (each ≤ 64 KB)

.stack 100h
; Allocate 256 bytes (100h) for stack
; Stack segment (SS) is set up automatically by DOS loader

.data
; Start of data segment

msg db 'Hello from MASM!$'
; Define a string message
; '$' is required by DOS interrupt 21h, function 09h

.code
; Start of code segment

main proc
; Entry point of the program (procedure named 'main')

    mov ax, @data
    ; Load segment address of data segment into AX
    ; @data is resolved by MASM at assemble time

    mov ds, ax
    ; Initialize DS register
    ; Required so data variables can be accessed correctly

    mov dx, offset msg
    ; Load offset (effective address) of 'msg' into DX
    ; EU computes the offset, BIU will later combine DS:DX

    mov ah, 09h
    ; DOS function 09h: display string terminated by '$'

    int 21h
    ; Call DOS interrupt
    ; Displays the string pointed to by DS:DX

    mov ah, 4Ch
    ; DOS function 4Ch: terminate program

    int 21h
    ; Return control to DOS

main endp
; End of main procedure

end main
; Tell assembler that 'main' is the program entry point