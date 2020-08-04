.data

msg db 'ALL ASCII CHARACTER using For Loop:$'
msg1 db 'ALL ASCII CHARACTER using WHILE Loop:$'
msg2 db 'ALL ASCII CHARACTER using DO_WHILE Loop:$'
  
.code
main proc
    ;initialize data segment
    mov ax,@data
    mov ds,ax
    ;print result message
    lea dx,msg
    mov ah,9
    int 21h
    ;FOR LOOP
    MOV AH,2
    MOV DL,0 ; store first ASCII value
    AND CX,0
    MOV CX,255  ; Loop counter
    @LOOP:
          INT 21H  ;print ASCII value 
          INC DL 
    LOOP @LOOP
    
           
          ;JMP EXIT 
    
    ;print new line
    MOV AH,2
    MOV DL,10
    int 21h
    MOV DL,13
    int 21h
    
    
          
    ;print result message
    lea dx,msg1
    mov ah,9
    int 21h
    ;WHILE LOOP 
    AND DX,0
            MOV   CL, 255 ; CL = 255 (Loop counter)
			MOV   AH, 2  ;  prepare to display
			MOV   DL, 0  ; DL= first ascii character
            MOV   BL, 0   ; BL = 0
  TOP:
			CMP  CL , BL  ;  if CL == 0
            JE     END_WHILE 
                  
            INT  21H   ; CALL  function to display  
            
            INC DL
			DEC   CL ;  CL= CL -1
            JMP TOP
END_WHILE:
        ;JMP EXIT
    ;print new line
    MOV AH,2
    MOV DL,10
    int 21h
    MOV DL,13
    int 21h    
    ;print result message
    lea dx,msg2
    mov ah,9
    int 21h
        
        ;DO_WHILE_LOOP
         AND DX,0
        MOV   CL, 255 ; CL = 255 (Loop counter)
	    MOV   AH, 2  ;  prepare to display
	    MOV   DL, 0  ; DL= first ASCII CHARACTER
        MOV   BL ,  0  ; BL= 0
  TOP1:
			
        INT  21H   ; CALL  function to display
		
		INC DL	
        CMP  CL , BL ;  if CL == 0
        JE     END_DO_WHILE
        DEC   CL ;  CL= CL -1
        JMP  TOP1  
        
END_DO_WHILE:
   
    
    
  EXIT:  
    main endp
end main