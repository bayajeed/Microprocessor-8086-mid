.data
.code
main proc
    MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BL,AL;BL=AL 
     ;print newline
     MOV AH,2
     MOV DL,13
     INT 21h
     MOV DL,10
     INT 33
     
     MOV AH,1; input a single character
    INT 21h ;execute function  
     MOV BH,AL;BH=AL
     
     ;ADD
     ADD BH,BL; BH=BH+BL
     SUB BH,30H ;to get correct decimal digit
     
     ;print newline
     MOV AH,2
     MOV DL,13
     INT 21h
     MOV DL,10
     INT 33
     ;print result
     
     MOV DL,BH
     INT 21h
     
    main endp
end main