; Chapter 4 Programming Projects

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data 
	vA		BYTE		'A', 0
	array	BYTE		7 DUP(?)
.code
main proc
	; 50% done 
	call initArray	
	;call rotate_right ; complete
	;call rotate_left ; complete
	;call shift_left ; complete
	;call shift_right ; complete
	invoke ExitProcess,0
main endp

initArray PROC
.code
	mov esi, 0 ; index register
	mov ecx, LENGTHOF array; loop counter max value size of array

	L1:
		mov al, vA ; mov the variable A into AL register
		mov array[esi], al ; move the value stored in AL into the index of array
		inc esi ; move the index to the next spot
		inc vA ; increment the value A 
		loop L1
	ret
initArray ENDP


rotate_right PROC
	.code
		mov dl, array[6]

		mov esi, 0
		mov ecx, 6

		L2:
			xchg array[esi], dl
			inc esi
			loop L2
		ret

rotate_right ENDP

rotate_left PROC
	.code
		mov dl, array[0]

		mov ecx, 7
		mov esi, 6

		
		L3:
			xchg array[esi], dl
			dec esi
			loop L3
	ret 
			
rotate_left ENDP



shift_left PROC

;shift left
;abcdefg
;abdefg

.code
	mov esi, 3
	mov ecx, 7
	mov dl, array[3] ; D into dl
	mov array[2], dl ; D in place of C

	L4:
		mov al, array[esi + 1]
		xchg array[esi], al
		inc esi
		loop L4
	ret
shift_left ENDP

shift_right PROC
; starting array : abcdefg
; end : abcddefg
.code
	mov esi, 3
	mov ecx, 7
	mov al, array[3]
	mov dl, array[4] ; storing E

	xchg array[esi + 1], al; adding another D to the E place

	L5: 
		xchg dl, array[esi + 2]
		inc esi
		loop L5
	
	ret	
shift_right ENDP






end main