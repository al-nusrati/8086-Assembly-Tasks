; -------------------------------------------------
; Arithmetic practice: ADD, SUB, MUL, DIV, 8-bit ADD
; -------------------------------------------------

.model small
.stack 100h

.data

.code
start:

    mov ax, @data           ; initialize DS 
    mov ds, ax

    ; -------- 16-bit ADD ----------
    mov ax, 0005h           ; AX = 5
    mov bx, 0003h           ; BX = 3
    add ax, bx              ; AX = 8

    ; -------- 16-bit SUB ----------
    mov cx, 000Ah           ; CX = 10
    sub cx, 0004h           ; CX = 6

    ; -------- 16-bit MUL ----------
    mov ax, 0004h           ; AX = 4
    mov bx, 0003h           ; BX = 3 
    mul bx                  ; DX:AX = 12

    ; -------- 16-bit DIV ----------
    mov dx, 0000h           ; clear high word
    mov ax, 000Ch           ; AX = 12
    mov bx, 0003h           ; BX = 3
    div bx                  ; AX = 4, DX = 0

    ; -------- 8-bit ADD ----------
    mov al, 05h             ; AL = 5
    mov bl, 03h             ; BL = 3
    add al, bl              ; AL = 8

    ; program exit
    mov ah, 4Ch
    int 21h

END start