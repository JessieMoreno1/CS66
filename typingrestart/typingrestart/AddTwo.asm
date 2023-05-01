; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE Irvine32.inc
INCLUDE macros.inc

.data
	prompt			BYTE		"jessie", 0			; working	
	prompt2			BYTE		"assembly language", 0
	prompt3			BYTE		"Assembly language is such a pain, I miss C plus plus",0
	promptX			BYTE		50
	promptY			BYTE		0
	promptSize		BYTE		6

	storedLetter		BYTE		50 DUP (?)
	
	storedLetterSize	BYTE		?
.code
main proc
	
	mov esi, 0					; counter 
	

	gameLoop:
		call clrscr

		;Print original string
		mov eax, white
		call setTextColor
		mGoToXY promptX, promptY
		mWriteString OFFSET prompt

		;Print Cover				; this is the colored text
		mov eax, lightGreen
		call setTextColor
		mGoToXY promptX, promptY
		mov edx, OFFSET storedLetter
		call WriteString

		
		cmp promptY, 25
		jle fall


		mov bl, [promptSize]
		mov al, [storedLetterSize]

		cmp bl, [storedLetterSize]
		jne acceptInput

		call killprompt			; clears the original string 
		call clearStoredLetter		; clears the cover string (Color string)
		
		

		call clrscr

		fall:
			mov eax, 300
			call delay

			mov eax, black
			call settextcolor
			inc promptY

		acceptInput:
			mov eax, 15
			call delay

			call ReadKey
			cmp al, 1				; checks if user has input some value otherwise loop again

			jle gameLoop
			


		mov bl, prompt[esi]
		cmp al, prompt[esi]
		je validChar
		


		


	cmp al, 27d					; checks if the escape key was pressed and exits game
	jne gameLoop
	je endOfProgram



	validChar:					; if the character is alphabetical then its valid
		inc [storedLetterSize]
		mov storedLetter[esi], al
		inc esi 
		jmp gameloop

	endOfProgram:
		call crlf
		call crlf
	invoke ExitProcess,0
main endp

clearStoredLetter PROC
	mov ecx, 5
	mov esi, OFFSET storedLetter
	L1:
		mov DWORD PTR [esi], 0
		add esi, DWORD
		loop L1
	mov [storedLetterSize],0				; adds a zero to the front of the word so that the 
									; program thinks its the nullptr and doesnt show the word
	ret
clearStoredLetter ENDP

killprompt PROC
	push esi
	mov esi, OFFSET prompt
	mov eax, 0
	mov [esi], al
	pop esi
	mov [promptsize],0
	ret
killprompt ENDP
		
end main