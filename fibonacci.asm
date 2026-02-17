.model small
.stack 100h
.data
    msg1 db 'Enter N: $'
    msg2 db 0Dh, 0Ah, 'Fibonacci Series: $'
    space db ' $'
    
.code    

    main proc
        mov ax, @data
        mov ds, ax

;-----------------------------------------------------------------------

        ; --- Input N ---
        lea dx, msg1        ; display prompt
        mov ah, 09h
        int 21h

        mov ah, 01h         ; read char
        int 21h
        
        sub al, 30h         ; convert ASCII to integer
        xor ah, ah          ; clear AH
        mov cx, ax          ; N -> CX - loop counter

;-----------------------------------------------------------------------------        
        
        ; --- Display Header ---
        lea dx, msg2        ; display msg2
        mov ah, 09h
        int 21h

        ; --- Call Procedure ---
        ; Input: CX = Number of terms (N)
        call FibonacciSeries

;--------------------------------------------------------------------------- 

        ; --- Exit ---
        mov ah, 4Ch
        int 21h
    main endp

;----------------------------------------------------------------------------

    ; Procedure: Generates and Prints Fibonacci Series
    ; Input: CX - count
    FibonacciSeries proc
        
        ; initialize first two terms
        mov bx, 0           ; Term 1 
        mov dx, 1           ; Term 2 

        ; --- Print 1st Term ---
        mov ax, bx          ; move 0 to AX for printing
        call PrintAX        ; print it
        dec cx              ; decrement count
        jz end_fib          ; if N=1, we are done

        ; --- Print 2nd Term ---
        mov ax, dx          ; move 1 to AX for printing
        call PrintAX        ; print it
        dec cx              ; decrement count
        jz end_fib          ; if N=2, we are done

    fib_loop:
        ; calculate Next Term: AX = BX + DX
        mov ax, bx
        add ax, dx
        
        ; Print Next Term
        push ax             ; save AX (Next Term) before printing
        push dx             ; save DX (Current Term)
        push bx             ; save BX (Old Term)
        
        call PrintAX        ; print the value in AX
        
        pop bx              ; restore registers
        pop dx
        pop ax

        ; Update Terms for next iteration
        mov bx, dx          ; Old = Current
        mov dx, ax          ; Current = Next
        
        loop fib_loop       ; repeat until CX = 0

    end_fib:
        ret
    FibonacciSeries endp

;----------------------------------------------------------------------------

    ; Procedure: Prints value in AX + Space
    PrintAX proc
        push ax             ; save registers
        push bx
        push cx
        push dx

        mov cx, 0           ; digit counter
        mov bx, 10          ; divisor

    push_digits_fib:
        xor dx, dx          ; clear DX
        div bx              ; AX / 10
        push dx             ; push remainder
        inc cx
        cmp ax, 0
        jne push_digits_fib

    pop_digits_fib:
        pop dx
        add dl, 30h         ; convert to ASCII
        mov ah, 02h
        int 21h
        loop pop_digits_fib

        ; Print Space
        lea dx, space
        mov ah, 09h
        int 21h

        pop dx              ; restore registers
        pop cx
        pop bx
        pop ax
        ret
    PrintAX endp

end main