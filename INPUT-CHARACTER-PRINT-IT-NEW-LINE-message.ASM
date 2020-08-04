; input a single character from keyboard with message
;and print it new line.
.data 
; variable declaration sytax 
; variable_name <space> data_type <space> value
;here variable name can be written as valid identifier rules
;data_type here used "DB" means define byte
;string written between single quotation 
;here dolar($) symbol represent end of string

message1 DB 'Input a character:$' 
message2 DB 'Input character is:$' 
.code
main proc
     
    ;initialize data segment (following two line is fixed)
    MOV AX,@DATA ; take word size data from data segment to Accumulator
    MOV DS,AX  ; finally store value to the specified memory(RAM)
    ; of data segment from accumulator
    
    ;print message for input 
    LEA DX, message1 ;read string from memory of data segment
    MOV AH,9; declare function to print string
    INT 21h ; execute function to print string
    
    
     
    MOV AH,1; input a single character
    INT 21h ;execute function
        
    MOV BL,AL;BL=AL  
    
     ;print newline
     MOV AH,2
     MOV DL,13 ; return cursor position begining of the left margin
     INT 21h
     MOV DL,10 ; show cursor to the next line
     INT 33
      
    ;print output message
     
    LEA DX, message2 ;read string from memory of data segment
    MOV AH,9; declare function to print string
    INT 21h ; execute function to print string
     
      
     ;print input character
     MOV AH,2; print a single character
    
     MOV DL,BL ; DL= BL
     INT 21h
     
    main endp
end main