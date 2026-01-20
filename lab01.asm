.MODEL SMALL       

.DATA   

    msg1 DB 'Name: Jawad Ahmed', '$'
    msg2 DB 'Degree: 46', '$'
    msg3 DB 'Department: Computer Engineering', '$'

.CODE

    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET msg1
    MOV AH, 9
    INT 21H
    
    MOV DL, 013
    MOV AH, 2
    INT 21H
    MOV DL, 010
    MOV AH, 2
    INT 21H
    
    MOV DX, OFFSET msg2
    MOV AH, 9
    INT 21H
    
    MOV DL, 013
    MOV AH, 2
    INT 21H
    MOV DL, 010
    MOV AH, 2
    INT 21H
    
    MOV DX, OFFSET msg3
    MOV AH, 9
    INT 21H
    
    MOV AH, 4CH
    INT 21H  
    
END