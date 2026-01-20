; =================================================
; Arithmetic + CMP + Conditional Jump Example
; =================================================

.model small
.stack 100h

.data

.code
start:

    mov ax, @data           ; init DS
    mov ds, ax

    ; -------- Arithmetic ----------
    mov ax, 5               ; AX = 5
    mov bx, 3               ; BX = 3
    add ax, bx              ; AX = 8 ; NOTICE: AX updated, flags updated

    ; -------- Compare ----------
    cmp ax, 10              ; compare AX with 10
                            ; NOTICE: ZF (Zero Flag) set if AX==10
                            ;         SF (Sign Flag) set if result negative
                            ;         CF, OF may also update

    je equal_section        ; if AX == 10 jump to equal_section
                            ; NOTICE: IP/CS may change here if jump taken
    jne notequal_section    ; if AX != 10 jump to notequal_section
                            ; NOTICE: IP/CS may change here if jump taken

; --------------------------- 
; Default section (won't run in this case)
; ---------------------------
default_section:
    mov cx, 0               ; CX = 0
    jmp end_program         ; skip the rest

; --------------------------- 
; Equal section (AX == 10)
; ---------------------------
equal_section:
    mov cx, 100             ; CX = 100 ; NOTICE: CX changed based on jump
    jmp end_program         ; skip the rest

; --------------------------- 
; Not equal section (AX != 10)
; ---------------------------
notequal_section:
    mov cx, 50              ; CX = 50  ; NOTICE: CX changed based on jump

; ---------------------------
end_program:
    mov ah, 4Ch
    int 21h

END start