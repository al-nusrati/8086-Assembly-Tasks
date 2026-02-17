.model small
.stack 100h
.data
    msg1 db 'Enter a number: $'
    msg2 db '! = $'
    newline db 0Dh, 0Ah, '$'
    
.code    

    main proc
        mov ax, @data
        mov ds, ax

;-----------------------------------------------------------------------

        ; --- Input ---
        lea dx, msg1        ; displaying msg1
        mov ah, 09h
        int 21h

        mov ah, 01h         ; reading char 
        int 21h
        mov bl, al          ; saving the ASCII character in BL

        
        
        ; --- Display Format ---
        lea dx, newline     ; -> newline
        mov ah, 09h
        int 21h

        mov dl, bl          ; print entered number
        mov ah, 02h
        int 21h

        lea dx, msg2        ; display msg2
        mov ah, 09h
        int 21h

        
;-----------------------------------------------------------------------------        
        
        ; --- Prepare & Call Procedure ---
        sub bl, 30h         ; ascii entered -> that number
        xor bh, bh          ; BH = 0 -> BX = Number
        mov cx, bx          ; number -> CX - counter
        
        call CalcFactorial  ; result back in AX

;----------------------------------------------------------------------------        
        
        ; --- Print Result (AX) ---
        mov cx, 0           ; counter = 0
        mov bx, 10          ; divisor = 10

    push_digits:
        xor dx, dx          ; DX = 0
        div bx              ; AX / 10 (Remainder in DX)
        push dx             ; push digit on stack
        inc cx              ; count the digit
        cmp ax, 0           ; check is result 0?
        jne push_digits     ; if not, keep dividing

    pop_digits:
        pop dx              ; get digit back
        add dl, 30h         ; convert to ASCII
        mov ah, 02h         ; print it
        int 21h
        loop pop_digits     ; repeat for all digits

;--------------------------------------------------------------------------- 

        ; --- Exit ---
        mov ah, 4Ch
        int 21h
    main endp

;----------------------------------------------------------------------------


    ; Input: CX (Number) | Output: AX (Factorial)
    CalcFactorial proc
        mov ax, 1           ; start result at 1
    fact_loop:
        mul cx              ; AX = AX * CX
        loop fact_loop      ; CX = CX - 1 and repeat
        ret
    CalcFactorial endp

end main