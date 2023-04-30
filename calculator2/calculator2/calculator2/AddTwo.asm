; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE Irvine32.inc
INCLUDE macros.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	firstNums		BYTE		5 DUP(0)
	secondNums	BYTE		5 DUP(0)
	MAX = 4

	Uoperator		BYTE		?

.code
main proc
	
	mGotoxy 0, 1
	call displayUI

	mGotoxy 0, 0
	call readFirst
	
	; the first set of numbers is displayed. 
	; clear the screen and redraw the UI
	; so that it can accept operator
	; -----------------------------------------------
	call Clrscr
	mGotoxy 0, 1
	call displayUI

	mGotoxy 15,0
	call ReadChar
	mov Uoperator, al
	call WriteChar

	mov eax, 500
	call Delay
	call Clrscr
	; -----------------------------------------------
	;call Clrscr
	mGotoxy 0, 1
	call displayUI

	mGotoxy 0, 0
	call readSecond
	; -----------------------------------------------
	cmp Uoperator, "+"
	je addition 

	cmp Uoperator, "-"
	je subtraction

	cmp Uoperator, "*"
	je multiplication

	cmp Uoperator, "/"
	je division
	; -----------------------------------------------
	; this removed the end program text
	mGotoxy 0,10
	mov eax, black
	call SetTextColor
	
	invoke ExitProcess,0
main endp

readFirst PROC
.code
	; reading the first set of numbers
	mGotoxy 12,0
	mov edx, OFFSET firstNums
	mov ecx, MAX
	call ReadString

	ret
readFirst ENDP

readSecond PROC
.code
	; reading the first set of numbers
	mGotoxy 12,0
	mov edx, OFFSET secondNums
	mov ecx, MAX
	call ReadString

	ret
readSecond ENDP

displayUI PROC
.code
	mWriteln	" -----------------"
	mWriteln	" | 1 | 2 | 3 | + |"
	mWriteln	" -----------------"
	mWriteln	" | 4 | 5 | 6 | - |"
	mWriteln	" -----------------"
	mWriteln	" | 7 | 8 | 9 | * |"
	mWriteln	" -----------------"
	mWriteln	"     | 0 | = | / |"
	mWriteln	"     -------------"
	ret
displayUI ENDP

addition proc
.code
	mWrite "Addition Operation running"
	ret
addition endp

subtraction proc
.data
	temp		BYTE		?
.code
	mWrite "Subtraction operation running"

	mov esi, 3

	additionLoop:
		mov al, firstNums[esi]
		adc al, secondNums[esi]
		aaa
		pushf
		or al, 30h
		mov temp[esi], al
		dec esi
		popf
		jmp additionLoop

	
		
	ret
subtraction endp

multiplication proc
.code
	mWrite "Multiplication operation running"
	ret
multiplication endp

division proc
.code
	mWrite "Division operation running"
	ret
division endp

end main