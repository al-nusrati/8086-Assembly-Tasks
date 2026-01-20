; =====================
; Do Nothing program
; =====================

.model small            ; small memory model
.stack 100h             ; stack size

.data                   ; data segment (empty)

.code                   ; code segment
start:                  ; program entry label

    mov ax, @data       ; load data segment address
    mov ds, ax          ; initialize DS

    mov ah, 4Ch         ; DOS terminate program function
    int 21h             ; return to DOS

END start               ; entry point for linker