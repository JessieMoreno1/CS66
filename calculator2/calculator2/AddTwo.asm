; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE Irvine32.inc
INCLUDE macros.inc

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	call displayUI
		

		



	

	invoke ExitProcess,0
main endp

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

end main