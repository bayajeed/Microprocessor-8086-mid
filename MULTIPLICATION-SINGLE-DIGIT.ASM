; input two number from keyboard 
;and print multiplication result in new line.
.data
.code
main proc
    
    MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BL,AL;BL=AL (store first number in BL)
    SUB BL,30H ; convert hexadecimal to decimal
     ;print newline
     MOV AH,2
     MOV DL,13 ; return cursor position begining of the left margin
     INT 21h
     MOV DL,10 ; show cursor to the next line
     INT 33
      
    
     MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BH,AL;BL=AL (store second number in BL)
    SUB BH,30H ; convert hexadecimal to decimal
     ;print newline
     MOV AH,2
     MOV DL,13 ; return cursor position begining of the left margin
     INT 21h
     MOV DL,10 ; show cursor to the next line
     INT 33
      
    ;MULTUIPLICATION
    ;multiplier or multiplicand must be stored in AL
    ; other number store in any other register variable
    ; after multiplication result result will store in AL
    
    MOV Al,BL ; AL= BL
    MUL BH ; AL = AL* BH
    
    MOV DL, AL
    ADD DL,30H ;convert decimal to hexadecimal to print
    ;correct decimal number
    
      
     ;print result
     MOV AH,2; print a single character stored in DL
     INT 21h
     
    main endp
end main