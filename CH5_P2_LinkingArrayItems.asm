COMMENT $
Jessie Mejia

2 - 23 - 2023

Chapter 5 Project 2: Linking Array Items

Suppose you are given tree data items that indicate a starting
index in a list, an array of characters, and an array of link index. 
You are to write a program that traverses the links and locates
the characters in their correct sequence. For each character you 
locate, copy it to a new array. Suppose you used the following sample 
data, and assumed the arrays use zero-based indexes 

	start = 1
	chars:		H	A	C	E	B	D	F	G
	links:		0	4	5	6	2	3	7	0

Then the values copied (in order) to the output array would be
A,B,C,D,E,F,G. Declare the character array as type BYTE, and 
to make the problem more interesting, declare the links array
as type DWORD. 
$

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	characterArr	BYTE	H,A,C,E,B,D,F,G
	linksArr		DWORD	0,4,5,6,2,3,7,0
.code
main proc
	// traverse the links
	ecx, LENGTHOF linksArr
	
	
	

	invoke ExitProcess,0
main endp
end main