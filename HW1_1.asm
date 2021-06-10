; This is the 8-bit version for the fibonacci series
; MOV R7, #6 ;Load N into R7
; MOV R7, #9 ;Load N into R7
MOV R7, #12 ;Load N into R7
MOV R1, #40H ;R1 holds the address 0x40H where the first element of the series is stored
MOV @R1, #0 ;Load number 0 into address 0x40H
INC R1 ;R1 now points to the address 0x41H
MOV @R1, #1 ; Load number 1 into address 0x41H
DEC R1 ;R1 now points to the address 0x40H
DEC R7
DEC R7 ;Decrement N twice because two numbers has been entered into the memory
REPT: MOV A, @R1 ;Move the content @ address indicated by R1 into accumulator
INC R1 ;Increment R1 to move to the next memory location
ADD A, @R1 ;Add the two elements and store in accumulator
INC R1; R1 now holds the memory location where the result will be stored
MOV @R1, A; Store the result in address indicated by R1
DEC R1 ;Decrement R1 to the previous memory address
DJNZ R7, REPT ;Repeat the above block until N reaches 0
END
