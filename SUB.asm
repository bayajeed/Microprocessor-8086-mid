.data
.code
main proc
    MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BL,AL;BL=AL 
     ;print newline
     MOV AH,2
     MOV DL,13 ;return cursor to the begin of left margin
     INT 21h
     MOV DL,10 ; print new line(cursor will show next line)
     INT 33
     
     MOV AH,1; input a single character
    INT 21h ;execute function  
     MOV BH,AL;BH=AL
     
     ;SUBTRACT
     SUB BL,BH; BL=BL-BH
     ADD BL,30H ;to get correct decimal digit
     
     ;print newline
     MOV AH,2
     MOV DL,13
     INT 21h
     MOV DL,10
     INT 33
     ;print result
     
     MOV DL,BL
     INT 21h
     
    main endp
end main