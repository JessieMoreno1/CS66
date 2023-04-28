; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE Irvine32.inc
INCLUDE macros.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	prompt		BYTE		"jessie", 0			; working	
	promptX		BYTE		50
	promptY		BYTE		0

	storedLetter	BYTE		50 DUP (?)
	storedLetterX	BYTE		50
	storedLetterY	BYTE		0
.code
main proc
	; in charge of positioning text at the top 
	;mov bh, 50
	;mov bl, 0
	mGotoxy promptX, promptY

	; writes string onto the console window
	mWriteString prompt						; working

	
		
	mov ecx, SIZEOF prompt
	mov esi, 0

	; need a continuous loop for ReadKey
	checkInput:						; working
		 
		mov eax, 1500					; needed for delay
		call Delay
		call ReadKey						; working
		
		call Clrscr
		inc promptY
		inc storedLetterY

		mGotoxy promptX, promptY
		mWriteString prompt

		cmp al, 1
		jle checkInput
		
		cmp al, prompt[esi]	
		je matching

	
		cmp al, 27d						; check if user wants to quit

		

		
		
		jne checkInput
		

		

	matching:
		push eax
		
		mGotoxy storedLetterX, storedLetterY

		mov storedLetter[esi], al

		mov eax, green
		call SetTextColor
		;mWriteString OFFSET prompt
		mWriteString OFFSET storedLetter

		inc esi

		pop eax

		mov eax, white
		call SetTextColor

		jmp checkInput
	


	
	invoke ExitProcess,0
main endp
end main