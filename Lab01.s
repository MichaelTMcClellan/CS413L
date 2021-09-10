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
	
	LDR r0, =welcomestring 		@ load welcome string into r0
	BL printf 					@ call the c library printf function

@ initialize addloop registers
	LDR r0, =array1				@ load the address of array1 into r0
	LDR r1, =array2				@ load the address of array2 into r1
	LDR r2, =sumarray			@ load the address of sumarray into r2
	MOV r3, #0					@ hold the data for array1[i]
	MOV r4, #0					@ hold the data for array2[i]
	MOV r5, #0					@ hold the data for sumarray[i]
	MOV r8, #0					@ initialize r8 for loop counter
addloop:
	LDR r3, [r0], #4			@ load the element of array1 into r3 and increment r0 by 4bytes
	LDR r4, [r1], #4			@ load the element of array2 into r4 and increment r1 by 4bytes
	ADD r5, r3, r4				@ add array1 & array2 elements together and store in r5
	STR r5, [r2], #4			@ store r5 into sumarray
	ADD r8, r8, #1				@ increment r8 as loop counter
	CMP	r8, #10					@ Compare r8 to 10
	BNE	addloop
	
	LDR  r0, =stringarray1 		@ load string1 into r0
	BL printf @ Call printf

	MOV r10, #10					@ initialize r8 for loop counter
	LDR r4, =array1				@ load address of array to be printed to r4
	PUSH {r4}					@ push r4 on to the stack
	BL printloop			
	
	LDR  r0, =stringarray2 		@ load string2 into r0
	BL printf @ Call printf
	
	MOV r10, #10				@ initialize r8 for loop counter	
	LDR r4, =array2				@ load address of array to be printed to r4
	PUSH {r4}					@ push r4 on to the stack
	BL printarraysub			
	
	LDR  r0, =stringsumarray 	@ load string3 into r0
	BL printf @ Call printf
	
	MOV r10, #10					@ initialize r8 for loop counter
	LDR r4, =sumarray			@ load address of array to be printed to r4
	PUSH {r4}					@ push r4 on to the stack
	BL printarraysub	
	
	@ Exit program/return to OS.	
	MOV r7, #0x01
	SVC 0
	
printarraysub:
printloop:
	LDR r0, =loopstring			@ load %d into r1
	LDR r1, [r4], #4			@ load value to be printed into r1, increment array pointer
	BL printf					@ print decimal of array element
	
	SUB r10, r10, #1
	CMP r10, #0
	BNE printloop
	
	LDR r0, =linebreak			@ load linebreak into r0
	BL printf					@ print linebreak after list
	MOV pc, r14
	
	
	
.data
.balign 4
welcomestring: .asciz "Welcome to Lab 01\n"
stringarray1: .asciz "Now printing array one\n"
stringarray2: .asciz "Now printing array two\n"
stringsumarray: .asciz "Now printing summed array\n"
loopstring: .asciz "%d "
linebreak: .asciz "\n"

array1: .word 32, 64, -9, 42, 234, 55, 92, 0, -23, -55
array2: .word -32, 11, 6, -2222, -55, 1, 4, 0, 522, 7
sumarray: .word 99, 99, 99 ,99 ,99 ,99, 99, 99, 99, 99

.global scanf
.global printf
@	r0 - starting address of string to be printed
@	r1 - If the string contains an output, r1 must contain the value to be printed.
@	When the call returns registers: r0, r1, r2, r3 and r12 are changed.

@	end of code and end of file
