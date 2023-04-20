; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	call initialtitle	
	mov eax, BLACK + (BLACK * 16)
	call SetTextColor
	invoke ExitProcess,0
main endp

initialtitle proc
	mGotoxy 50d, 5d			; sets the position for the prompt below
	mWriteln "Typing Game"

	mGotoxy 48d,10d			; sets the position for the prompt below
	mWrite "Press P to play"

	mGotoxy 105d, 0d
	mWrite "Jessie Mejia"

	mGotoxy 105d, 1d
	mWrite "Assembly CS66"

	mov eax, 50
	call Delay

	; ask the user for input of P key 
	call ReadChar
	cmp al, 50h
	je Game
	ret
initialtitle endp

game proc
	call Clrscr
	mGotoxy 45d, 0d
	;mGotoxy 45d, 29d ; 29d is the max y value that it can go down on the screen 
	mov bl, 45d
	mov bh, 0d

	;mWriteln "This Is the Typing Prompt"


	; create a loop that makes the word fall down 
	fall:
		inc bh
		mGotoxy bl, bh
		mWriteln "This Is the Typing Prompt"
		

		mov eax, 1200
		call Delay

		call Clrscr

		cmp bh, 28d
		jle fall
		ret


	; create portion of code that accepts user input
	; and compared it to the prompt 



	ret
game endp

end main