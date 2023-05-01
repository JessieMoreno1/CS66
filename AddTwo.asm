; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE Irvine32.inc
INCLUDE macros.inc

.data
	prompts			BYTE		"jessie is handsome", "jessie is a good programmer", "Assembly language is such a pain, I miss C plus plus"	

	prompt			BYTE		"jessie", 0			; working	

	promptX			BYTE		50
	promptY			BYTE		0
	promptSize		BYTE		6

	storedLetter		BYTE		50 DUP (?)
	
	storedLetterSize	BYTE		?

	missedWordsCounter	BYTE		0
	finishedWordCounter BYTE		0

	temp				BYTE		0

.code
main proc
	
	mov esi, 0				; counter



	gameLoop:
		call clrscr

		;Print original string
		mov eax, white
		call setTextColor
		mGoToXY promptX, promptY
		;mWriteString OFFSET prompt	; for one word

	
		;Print Cover				; this is the colored text
		mov eax, lightGreen
		call setTextColor
		mGoToXY promptX, promptY
		mov edx, OFFSET storedLetter
		call WriteString

		
		cmp promptY, 25
		jle fall
		jge failedprompt


		mov bl, [promptSize]
		mov al, [storedLetterSize]

		cmp bl, [storedLetterSize]
		jne acceptInput

		call killprompt			; clears the original string 
		call clearStoredLetter		; clears the cover string (Color string)
		
		

		call clrscr

		fall:
			mov bl, [promptSize]
			cmp bl, [storedLetterSize]
			je FinishedWords

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

failedprompt PROC
.code

	inc missedWordsCounter	; increased the count of how many words missed

	call clrscr
	mgotoxy promptX, promptY

	mov eax, red
	call SetTextColor	; sets the text to red

	mov edx, OFFSET prompt
	call WriteString		; writes the string in red

	mov eax, 500
	call Delay		; delay used so the text will stay on screen a half second

	call Clrscr		; show red for a bit then clear the screen 

	call killprompt		; this allows the prompt to not used again as its dead
	call clearStoredLetter	; this clears the colored string and makes it ready for use again

	mov eax, black
	call setTextColor	
	call WriteString
	
	ret
failedprompt ENDP

FinishedWords PROC
.code
	inc finishedWordCounter
	call killprompt
	call clearStoredLetter

	mov eax, white 
	call setTextColor

	call clrscr

	mov promptY, 0
	mgotoxy promptX, promptY



	ret

FinishedWords ENDP
		

end main