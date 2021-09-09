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
