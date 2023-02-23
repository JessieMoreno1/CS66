COMMENT $
Jessie Mejia

2 / 23 / 2022

Chapter 5 Project 1

Write a program that displays the same string in four different colors
using a loop. Call the SetTextColor procedure from the book's link library. 
Any colors may be chosen, but you may find it easiest to change the 
foreground color. 
$


INCLUDE Irvine32.inc 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	string BYTE "JESSIE",0	; this is the string we will change the color of

.code
main proc
	mov eax, black + (white * 16) 	
	call SetTextColor
	mov edx, OFFSET string
	call WriteString
	add eax, 1

	invoke ExitProcess,0
main endp
end main