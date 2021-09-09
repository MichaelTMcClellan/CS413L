@ Filename: Lab01.s
@ Author:   Michael McClellan
@ Purpose:  Create 3 integer arrays, add the first two using a for loop and auto-indexing. 
@			Then print a welcome message and print all elements from all three arrays.
@			Each array will be 10 elements and the user will then select either 'positive',
@			'negative', or 'zero'. After selection, it will then print the numbers only assosiated
@			with that type. All inputs must be valid and no overflow conditions can occur.
@ 
@ History: 
@    Date       Purpose of change
@    ----       ----------------- 
@   8-Sept-2021 First version submitted  
@
@ Use these commands to assemble, link, run and debug this program:
@    as -o Lab01.o Lab01.s
@    gcc -o Lab01 Lab01.o
@    ./Lab01 ;echo $?
@    gdb --args ./Lab01

	.global main
	
main:

@	Depreciated print using system call
@	MOV R7, #0x04 				@ A 4 sets the write command (has to be in r7).
@	MOV R0, #0x01 				@ A 1 sets the output device. 
@	MOV R2, #0x12 				@ Length of string in hex.
@	LDR   r1, =welcomestring 	@ load string into r1
@	SVC 0 @ System call
@	Depreciated print using system call
	
	LDR r0, =welcomestring 		@ load welcome string into r0
	BL printf 					@ call the c library printf function
	
	LDR  r0, =stringarray1 		@ load string into r0
	BL printf @ Call printf
	
@ Exit program/return to OS.	

	MOV r7, #0x01
	SVC 0
	
.data
.balign 4
welcomestring: .asciz "Welcome to Lab 01\n" @Length 0x12
.balign 4
stringarray1: .asciz "Now printing array one\n" @Length 0x17
.balign 4
stringarray2: .asciz "Now printing array two\n" @Length 0x17
.balign 4
stringarray3: .asciz "Now printing array three\n" @Length 0x19

.global printf
@	r0 - starting address of string to be printed
@	r1 - If the string contains an output, i.e., r1 must contain the value to be printed.
@	When the call returns registers: r0, r1, r2, r3 and r12 are changed.

@	end of code and end of file
