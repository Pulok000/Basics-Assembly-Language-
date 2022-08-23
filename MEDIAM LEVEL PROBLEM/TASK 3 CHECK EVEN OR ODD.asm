.MODEL SMALL
.STACK 100H                         

.DATA

NEWLINE DB "",0AH,0DH,24H 

MSG1 DB "EVEN NUMBER ",0AH,0DH,24H 
MSG2 DB "ODD NUMBER ",0AH,0DH,24H
MSG3 DB "NOT A NUMBER ",0AH,0DH,24H  

.CODE

MAIN PROC   
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    ;(22-23)TAKING USER INPUT
    
    MOV AH,01H
    INT 21H
    
    ;(26) MOVE THE VALUE TO BL REGISTER AS IT CRAETE PROBLEM IF WE DO THE CALCULATION IN THE AL REGISTER WHILE PRINTING NEW LINE
    MOV BL,AL 
    
    ;(25-27) --> PRINTING NEW LINE
 
    LEA DX,NEWLINE
    MOV AH,09H
    INT 21H
    
    ;(31-34) --> CHECKING NUMBER OR NOT(1ST CHECKING LESS THAN 30H ASSCI VALUE OR NOT THEN CHECKING MORE THAN 39H ASSCI VALUE OR OR NOT  AND DEPENDING ON THAT SENDING ITT TO INVALIED LEVEL)
    
    CMP BL,30H
    JL INVALID
    CMP BL,39H
    JG INVALID
    
    ;(27-38) --> CHECKING EVEN OR NOT:TEST IS DOING AND OPERATION AND SAVING THE RESULT ON CARRY FLAG, JZ IS COMPARING IF CARRY ZERO IS TRUE OR NOT , IF TRUE THEN SENDING THE CONTROLL TO EVEN LEVEL ELSE GOING TO ODD LEVEL
    TEST BL,1B
    JZ EVEN
    
    ODD:
    ;(42-44) --> PRINTING MESSAGE 2
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    ;(46) --> TESK COMPLETED SO SENDING IT TO EXIT 
    JMP EXIT
    
    EVEN: 
    ;(50-52) --> PRINTING MESSAGE 1
    LEA DX,MSG1
    MOV AH,09H
    INT 21H 
    ;(54) --> SIMILARLY,TESK COMPLETED SO SENDING IT TO EXIT
    JMP EXIT 
    
    INVALID: 
    
    LEA DX,MSG3
    MOV AH,09H
    INT 21H 
    
    
    EXIT: 
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN  
