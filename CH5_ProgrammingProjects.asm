; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE Irvine32.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	;call projectOne			
	;call projectTwo
	;call projectThree
	call projectFour ; working but not to its best ability
	;call projectFive
	invoke ExitProcess,0
main endp


projectOne PROC
.data
	text BYTE	"jessie", 0Ah,0Dh,0
.code
mov ecx, 4
L3:
	mov eax, black + (green * 16)
	call SetTextColor
	mov edx, OFFSET text
	call WriteString
	loop L3
	ret
projectOne ENDP



projectTwo PROC
; still need to implement project 2
projectTwo ENDP


COMMENT $
3. Simple addition (1):
Write a program that clears the screen, 
locates the cursor near the middle of 
the screen, prompts the user for two
integers, and displays their sum 
$
projectThree PROC
.data
	prompt1	BYTE "Enter first integer: ", 0
	prompt2	BYTE	"Enter second integer: ", 0
	prompt3	BYTE	"Answer: ", 0
	Val1		DWORD	?
	Val2		DWORD	?
.code
	call ClrScr

	; first number
	mov dl, 1
	mov dh, 1
	call Gotoxy
	mov edx, OFFSET prompt1
	call WriteString
	call ReadInt
	mov val1, eax

	; second number
	mov dl, 1
	mov dh, 1
	call Gotoxy
	mov edx, OFFSET prompt2
	call WriteString
	call ReadInt
	mov val2, eax

	mov eax, val1
	add eax, val2

	call Gotoxy
	mov edx, OFFSET prompt3
	call WriteString
	call WriteInt

	ret
projectThree ENDP


projectFour PROC ; not working
.data
	prompt4	BYTE "Enter first integer: ", 0
	prompt5	BYTE	"Enter second integer: ", 0
	prompt6	BYTE	"Answer: ", 0
	Val3		DWORD	?
	Val4		DWORD	?
.code
	mov ecx, 3
	L3:
		call ClrScr

		; first number
		mov dl, 1
		mov dh, 1
		call Gotoxy
		mov edx, OFFSET prompt4
		call WriteString
		call ReadInt
		mov val3, eax

		; second number
		mov dl, 1
		mov dh, 1
		call Gotoxy
		mov edx, OFFSET prompt5
		call WriteString
		call ReadInt
		mov val4, eax

		mov eax, val3
		add eax, val4

		call Gotoxy
		mov edx, OFFSET prompt6
		call WriteString
		call WriteInt
		loop L3
	ret

projectFour ENDP

; -------------------------------- ;




end main