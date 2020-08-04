; input a single character from keyboard
;and print it new line.

.code
main proc
    
    MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BL,AL;BL=AL 
     ;print newline
     MOV AH,2
     MOV DL,13 ; return cursor position begining of the left margin
     INT 21h
     MOV DL,10 ; show cursor to the next line
     INT 33
     
     ;print input character
     MOV AH,2; print a single character
    
     MOV DL,BL ; DL= BL
     INT 21h
     
    main endp
end main