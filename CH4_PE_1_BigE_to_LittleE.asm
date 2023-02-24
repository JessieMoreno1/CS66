
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	bigEndian		BYTE		12h, 34h, 56h, 78h
	littleEndian	DWORD	?
.code
main proc
	mov	ebx, 0
	mov	ecx, 0
	mov	bx, WORD PTR bigEndian 
	mov	cx, WORD PTR [bigEndian + 2] 

	mov eax, littleEndian ; moving littleEndian into the edx register
	mov edx, ebx ; moving the full thing into edx
	mov littleEndian, edx
	

	invoke ExitProcess,0

main endp
end main