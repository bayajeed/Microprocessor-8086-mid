; Factorial(result of the factorial must be between 0 to 255 ) 
; You can input single digit only upto 5
; because we use byte size register (AL/AH/DL/DH) for input and print
;In 8 bit (11111111) decimal content is 255 
      
.stack 10h  ;declare stack memory area size is 10 by default
.data
msg db 'Input a number:$'
msg1 db '  Factorial of input nummber is:$'
msg2 db '  Factorial result exceed 255 $'
number1 db 1  ; declare 'number1' variable and set default value 1
number2 db 1  ; declare 'number2' variable and set default value 1

.code

main proc 
    
    mov ax,@data
    mov ds,ax
    
    ; print input message
    
    lea dx,msg
    mov ah,9
    int 21h
    
    
    ;input first number
    MOV AH,1
    INT 21H
    MOV BL,AL
     SUB BL,30H
     
     MOV number1,BL  ; input number is stored into number1
     
     ;print new line
     
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 33
    
    MOV AL,5 ; if factorial number input is greater than 5
             ;then it exceeds 255 that is not easy to
             ;print that's why here check if input number
             ; is greater than 5 or not. 
    CMP BL,AL 
    JA MESSAGE  ; JA is jump if above (CL > AL)
    JBE FACTORIAL ;JBE meaning is jump if below or equal (CL<= AL)
    
     
     
     
     FACTORIAL:
    
    lea dx,msg1 ; print message for print factorial number
    mov ah,9
    int 21h
     
     
     ; CALCULATE Factorial 
     
     AND AX,0
     AND CX,0  
     
     MOV BL,number1 ;input number store in BL
     MOV AL,1  ; AL =1 (default number)because if we multiply any number
               ; with 1  the result will not change.
       
     TOP2:
     
     MUL BL   ; here Factorial result is stored in AL because
              ; AL = AL * BL
     
     
      
     CMP BL,1 ;here check by repeatedly decrement BL, if (BL ==1) 
     JNE TOP3
     JE  RESULT 
     
      
     TOP3: 
         
         DEC BL  ; BL = BL -1
         JMP TOP2
     
       
    RESULT: 
    MOV number2,AL   ;factorial result store in number2 variable
   
      
     
     ;STORE number into STACK with seperate digit 
     
     ; here we use the logic to separate digits from a number that 
     ; we learn from C programming that is (if a number is 123 then
     ;we count, here is three digits and they are 1 and 2 and 3 )
     ;it performs dision by 10 and store remainder as a digit and
     ;quotent as further division and by repeating this process until 
     ; quotent is zero(0), after finshing the process we get
     ;separate digits from the number, this logic is needed here
     ;because at present we know print only a single character
     ;we don't use print multiple character. 
     
     MOV CL,10D ;divisor is 10 by default and store in CL
     MOV CH,0  ; for counter
     AND AX,0  ; reset zero to get correct division result
     MOV AL,number2 ; store dividend into AL
                    ;dividend is in number2 variable
                    ;which is factorial result 
                    
                    
     TOP5:
     DIV CL  ;Al = Al/CL perform division
     AND DX,0  ; data register reset to zero
     MOV DL,AH  ; store remainder (AH) which is actual digit into DL 
     
     PUSH DX    ; here perform insert operation of STACK
                ; here noted that stack will perform only WORD size
                ; register (during PUSH or POP operation)  
                ; that's why we have to use DX (actually our 
                ; remainder or digit is very small that will store
                ; in DL so DH part is contain zero)  
                
                ; here DX is the source operand and destination operand is
                ; actually the memory address of the stack where value
                ;will store. So, content of DX will store in STACK memory
                ;after PUSH operation. 
                 
     INC CH   ; count how many digits store into stack
     AND AH,0 ; remainder reset to zero to get correct result 
              ; further division    
              
     CMP AL,0 ; the end condition of division
              ;division process will stop when quotent (AL) will zero 
              
     JNE TOP5  ;otherwise repeat the division 
      ;jump if Al is not zero
     
     
     ;print Number digit wise from STACK    
     
     MOV AH,2 ;print single character
     TOP6:
     POP DX    ; In POP operation, DX is the destination operand 
               ;and stack memory address is the source operand. 
               ; So, the value of the stack memory
               ; will store into DX register. Actually the value is too 
               ; small that it's enough to store in DL register, and DH will
               ;store zero.
               
     ADD DL,30H   ; actually our value is in DL part, that's why we 
                  ; convert decimal to hexadecimal to get 
                  ;correct result at the time of print
                  ; only DL register, DH is not  needed to consider.  
                  
     INT 21H   ;print by executing interrupt call     
     
     DEC CH  ; counter decrement and it indicates how many digits 
             ; already print from store values of the STACK  
             
     CMP CH,0 ; when CH is zero no digit to print
     JNE TOP6 ; jump if CH not zero
    
    JMP EXIT 
    
   
   
   MESSAGE:
    
   lea dx,msg2 ; print message if Factorial result exceed 255
    mov ah,9
    int 21h 
    
    EXIT: 
    main endp
end main