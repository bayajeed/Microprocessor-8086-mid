; input two number from keyboard with message 
;and print multiplication result in new line.
.data 
; variable declaration sytax 
; variable_name <space> data_type <space> value
;here variable name can be written as valid identifier rules
;data_type here used "DB" means define byte
;string written between single quotation 
;here dolar($) symbol represent end of string

message1 DB 'Input first number:$' 
message2 DB 'Input second number:$' 
message3 DB 'Multiplication of two number is:$'   

.code
main proc
    
    ;initialize data segment (following two line is fixed)
    MOV AX,@DATA ; take word size data from data segment to Accumulator
    MOV DS,AX  ; finally store value to the specified memory(RAM)
    ; of data segment from accumulator
    
    ;print message for input first number
    LEA DX, message1 ;read string from memory of data segment
    MOV AH,9; declare function to print string
    INT 21h ; execute function to print string
    
    MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BL,AL;BL=AL (store first number  in BL)
    SUB BL,30H ; convert hexadecimal to decimal
     ;print newline
     MOV AH,2
     MOV DL,13 ; return cursor position begining of the left margin
     INT 21h
     MOV DL,10 ; show cursor to the next line
     INT 33
      
     
     
     ;print message for input second number
    LEA DX, message2 ;read string from memory of data segment
    MOV AH,9; declare function to print string
    INT 21h ; execute function to print string
     
     MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BH,AL;BL=AL (store second number  in BL)
    SUB BH,30H ; convert hexadecimal to decimal
     ;print newline
     MOV AH,2
     MOV DL,13 ; return cursor position begining of the left margin
     INT 21h
     MOV DL,10 ; show cursor to the next line
     INT 33
      
    ;MULTIPLICATION
    ;multiplier or multiplicand stored in AL
    ; other number store in any other register variable
    ; after multiplication  result will store in AL 
    
    MOV AX,0 ; both AL=0 and AH=0 (for correct multiplication but it's optional)
    MOV Al,BL ; AL= BL
    MUL BH ; AL = AL* BH
    
    
    
    MOV BL, AL ; BL=AL(store result in BL temporary)  
     
     
     
    
     
    
     ;print message for print result number
    LEA DX, message3 ;read string from memory of data segment
    MOV AH,9; declare function to print string
    INT 21h ; execute function to print string
    
    MOV DL, BL ;DL=BL (result)
    ADD DL,30H ;convert decimal to hexadecimal to print
    ;correct decimal number
    
      
     ;print result
     MOV AH,2; print a single character stored in DL
     INT 21h
    
    
   
    main endp
end main