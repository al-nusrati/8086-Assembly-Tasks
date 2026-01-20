; =================================================
; PUSH & POP Example
; =================================================

.model small
.stack 100h

.data

.code
start:

    mov ax, @data           ; init DS
    mov ds, ax

    ; -------- Initialize registers ----------
    mov ax, 1234h           ; AX = 1234h
    mov bx, 5678h           ; BX = 5678h
    mov cx, 9ABC           ; CX = 9ABCh

    ; -------- Push registers onto stack ----------
    push ax                 ; NOTICE: AX pushed onto stack (SP decreases)
    push bx                 ; NOTICE: BX pushed onto stack (SP decreases)
    push cx                 ; NOTICE: CX pushed onto stack (SP decreases)

    ; -------- Change registers ----------
    mov ax, 0
    mov bx, 0
    mov cx, 0

    ; -------- Pop registers back ----------
    pop cx                  ; NOTICE: CX restored from stack (SP increases)
    pop bx                  ; NOTICE: BX restored
    pop ax                  ; NOTICE: AX restored

    ; -------- Final values ----------
    ; AX = 1234h, BX = 5678h, CX = 9ABCh

    ; Exit program
    mov ah, 4Ch
    int 21h

END start