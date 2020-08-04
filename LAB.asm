.code 
MAIN PROC  ;procedure call
      MOV AH,1 ; input a single character from keyboard
      INT 21H ; execute function
      
      MOV BL, AL  ; store input into BL  
      ;print newline
      MOV AH,2
      MOV DL,13  ; set cursor position to the left margin
      INT 21h
      
      MOV DL,10  ; print newline character
      INT 21h
       ;print value
      MOV DL,BL ;  mov input data into data register
      ;MOV AH,2 ; print a single character from keyboard
      INT 21H ; execute function
      
    MAIN ENDP  ;procedure finish
END MAIN      ;exit from program