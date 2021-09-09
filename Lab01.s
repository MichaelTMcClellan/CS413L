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
	MOV R7, #0x04
	MOV R0, #0x01
	MOV R2, #0x0C
	LDR   r1, =welcomestring
	SVC 0
	
	LDR  r0, =stringarray1
	BL printf
	
	MOV r7, #0x01
	SVC 0
	
	
writeloop:
	CMP R0, #10
	BEQ writedone
	
	ADD R0, R0, #1
	
.data
.balign 4
welcomestring: .asciz "Now printing three arrays\n" @Length 0x1A
.balign 4
stringarray1: .asciz "Now printing array one\n" @Length 0x17
.balign 4
stringarray2: .asciz "Now printing array two\n" @Length 0x17
.balign 4
stringarray3: .asciz "Now printing array three\n" @Length 0x19

.global printf