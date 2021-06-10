; This is the 16-bit version of the Fibonacci calculator
; The 16-bit number is stored in 2 memory locations
; For example, The first number 0, the lower 8-bit is stored
; at memory address 0x41H and the upper 8-bit is stored at 
; memory address 0x40H
; MOV R7, #15 ;Store N in R7
MOV R7, #19 ;Store N in R7
MOV R0, #41H ;R0 Points to memory address 0x40H
MOV @R0, #0 ;0 is stored at memory address 0x41H
MOV R0, #43H ;R0 points to memory address 0x43H
MOV @R0, #1 ;1 is stored at memory address 0x43H
MOV R0, #41H ;R0 points to memory address 0x41H
MOV R1, #45H ;R1 points to memory address 0x45H, where the third element will be stored
DEC R7
DEC R7 ;Decrement N twice as there has been 2 elements entered in the memory
REPT: MOV A, @R0 ;Move the content at address indicated by R0 to accumulator
INC R0
INC R0 ;Increment R0 twice to get the lower 8-bit of the next element
ADD A, @R0 ;Calculate the lower 8-bit of the result
MOV @R1, A ;Store the lower 8-bit of the result
DEC R1 ;R1 now points to address storing the upper 8-bit
DEC R0
DEC R0
DEC R0 ;Decrement R0 three times to get the upper 8-bit of the first addee
MOV A, @R0 ;Copy the upper 8-bit of the first addee to the accumulator
INC R0
INC R0 ;Increment R0 twice to get to the upper 8-bit of the next element
ADDC A, @R0 ;Calculate the upper 8-bit of the result
MOV @R1, A ;Store the upper 8-bit of the result
INC R1
INC R1
INC R1 ;R1 now points to the address storing the lower 8-bit of the next element
INC R0 ;R0 now points to the address storing the lower 8-bit the next addee
DJNZ R7, REPT ;Repeat the above block until N reaches 0
END
 
