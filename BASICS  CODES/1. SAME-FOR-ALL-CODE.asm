;THIS SIGN MEANS COMMENT ';' 

;SAME FOR ALL CODE

.MODEL SMALL
.STACK 100H
.DATA


.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    ;start here
    


    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
