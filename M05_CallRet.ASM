; =================================================
; CALL and RET Example (Procedure)
; =================================================

.model small
.stack 100h

.data

.code
start:

    mov ax, @data           ; init DS
    mov ds, ax

    mov ax, 5               ; AX = 5
    mov bx, 3               ; BX = 3

    call add_values         ; CALL procedure to add AX + BX
                            ; NOTICE: IP pushed onto stack automatically

    ; After return:
    ; AX = 8 (result from procedure)
    ; BX unchanged

    ; Exit program
    mov ah, 4Ch
    int 21h

; ---------------------------
; Procedure: Add AX + BX
; ---------------------------
add_values PROC
    push dx                 ; save DX if we use it (good practice)

    mov dx, ax              ; copy AX to DX
    add dx, bx              ; DX = AX + BX
    mov ax, dx              ; return result in AX

    pop dx                  ; restore DX
    ret                     ; return to caller (IP restored from stack)
add_values ENDP

END start