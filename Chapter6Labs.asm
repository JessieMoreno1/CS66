; Chapter6Labs - The lab document for chapter 6 


INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	;call lab1		; complete
	;call lab2		; complete
	;call lab3		; complete
	;call lab4		; complete
	;call lab5		; complete
	;call lab6		; not complete
	;call lab7		; complete
	;call lab8		; complete
	;call lab9		; 90% complete
	;call lab10		; complete
	;call lab11		; complete
	;call lab12		; complete
	;call lab13		; complete
	;call lab14		; complete
	;call lab15		; complete
	call lab16		; not done yet
	;call lab17		; not done yet
	;call lab18		; not done yet




	invoke ExitProcess,0
main endp

lab1 proc						; complete
COMMENT $
Lab 1. 
	1. problem:	
		are one or more of the bits set? 
		are any of the bits 0,3,6 set?
	answer: 
		BIT 3 is set. 
	
	2. problem:  are all bits 0,3,6 set?
	answer:	
		Only BIT 3 is set
$

.data
	given BYTE 10011100b
.code
	and given, 01001001b
	ret

lab1 endp											

COMMENT $
Lab 2. Find this in the text and give an explaination 
Zero Flag		Sign Flag		Value in AL is...
------------------------------------------------
Clear		Clear		Greater than zero
Set			Clear		Equal to zero
Clear		Set			Less than zero

answer: The OR instruction always clears the Carry and Overflow flags.
It modifies the Sign, Zero, and Parity flags in a way that is consistent
with the value assigned to the destination operand.

we are OR'ing the number by itself to obtain certain to
information on its value:
			
			or al, al

The table above is what the outcomes mean
$

lab3 PROC
COMMENT $
lab 3.
	Task: Jump to a label if the value in AL is not zero. 
	Solution: OR the byte with itself, then use the JNZ
	(jump if not zero) instruction.

LAB: Check with AND
answer: Using AND is still a valid choice. It still enters
the loop as the jnz is still working with AND.
$

.code
	;or al, al 
	and al, al
	jnz IsNotZero

	isNotZero:
		mov edx, 1
	ret
lab3 ENDP

lab4 PROC

COMMENT $
Lab 4: Check Parity of x: XOR with zero, check parity bit

Try this with OR

$

.data
	x	BYTE		11011011b
.code
	;xor x, 00000000	;outputs db which is equivalent to 11011011b
	or x, 00000000		;outputs db which is equivalent to 11011011b
	ret
lab4 ENDP

lab5 PROC

COMMENT $
Task : Jump to a label if the value in AL is not zero.
Solution: OR the byte with itself, then use teh JNZ 
(jump not zero) instruction.

Lab: Check with AND
$

.code
	;or al,al
	and al,al
	jnz IsNotZero ; jump if not zero

	isNotZero:
		mov al, 0
	ret

COMMENT $
Doing the same task with AND renders the same result
this is because the same bits remain set the entire time.
$
lab5 ENDP

lab6 PROC

COMMENT $									; needs to be completed
CMP Results			Flags
-----------------------------------
Destination < source	SF != OF
Destination > source	SF = OF
Destination = source	ZF = 1

Lab : why?

$

lab6 ENDP



lab7 PROC

COMMENT $
Jumps based on Signed Comparisons
$

.code
	mov al, +127 
	cmp al, -128

	ja isAbove
	jg isGreater

	isAbove:
		mov cl, 3
	isGreater:			; the value inside AL is greater than the one that is being compared with
		mov cl, 5
	ret

lab7 ENDP

lab8 PROC	

COMMENT $
MASK BYTE 0,3,5,7 
Given : bits 0,3,5,7 are set?
Generate 0A9 (programatically)

Answer: In order to compare if these bits are 
actually set, since we are already given that they
are. To make sure that is true, we and with the 
expected outcome see if anything changes. If nothing changes, 
then those bits are actually set.
$

.data
	set	BYTE		10101001b
.code
	and set, 10101001b
	ret
lab8 ENDP

lab9 PROC

COMMENT $
Your Turn 1

; done
1. Write code that jumps to label L1 if either bit 4,5,6 is 
set in the BL register

;  done
2. Write code that jumps to label L1 if bits 4,5, and 6 are all
set in the BL register.

;  done , but not working correctly
3. Write code that jumps to label L2 if AL has even parity 

; not done
4. Write code that jumps to label L3 if EAX is negative. 

;  done
5. Write code that jumps to label L4 if the expression 
(EBX - ECX) is greater than zero. 

$

.data
	;bits		BYTE		00001000b		; for #1
	;bits		BYTE		01110000b		; for #2
.code
	; for # 1 - done
	;mov bl, bits
	;OR	bl, 01110000b
	;jmp L1

	; for #2 - done
	;mov bl, bits
	;and bl, 01110000b
	;jmp L1

	; for #3 - not working correctly in terms of jmp
	;mov bl, bits
	;cmp bl, 11110000b
	;jpe L2

	; for #4 - not done yet
	


	; for #5 
	mov ebx, 5
	mov ecx, 2
	sub ebx, ecx
	mov eax, ebx
	jns L4

	L1:
		mov bl, 0
		
	L2: 
		mov cl, 1

	L3:
		mov dl, 0

	L4:
		mov cl, 4

	
	ret
		
lab9 ENDP


lab10 PROC

COMMENT $
The following loop uses the XOR instruction to transform
every character in a string into a new value. 

LAB: XOR each byte with KEY
$

KEY = 239							; can be any byte value
BUFMAX = 10

.data
buffer	BYTE		BUFMAX+1 DUP(0)
bufSize	DWORD	BUFMAX

.code
	mov ecx, bufSize				; loop counter
	mov esi, 0					; index 0 in buffer

	L1:
		xor buffer[esi], KEY		; translate a byte
		inc esi					; point to the next byte 
		loop L1

	mov ecx, bufSize
	mov esi, 0

	L2:							; decrypts the buffer
		xor buffer[esi], KEY
		inc esi
		loop L2

	ret 
lab10 ENDP


lab11 PROC

COMMENT $
Locate the first nonzero value in the array. If none is found, 
let ESI point to the sentinel value: 
$

.data
	array		SWORD	10 DUP(?)
	sentinel		SWORD	0FFFFh

.code
	mov esi, OFFSET	array
	mov ecx, LENGTHOF	array

	L1:	
		cmp WORD PTR [esi], 0 ; check for zero
		jnz quit
		loop L1
	
	quit:
		mov al , 1
	ret

lab11 ENDP


lab12 PROC

COMMENT $
Your Turn 3 

Implement the following pseudocode in assembly language. 
All values are unsigned: 

if ( ebx <= ecx )
{
	eax = 5;
	edx = 6; 
}

(There are multiple correct solutions to this problem)
$

.code
	mov ebx, 2
	mov ecx, 5

	jle conditionsMet

	conditionsMet:
		mov eax, 5
		mov edx, 6
	ret

lab12 ENDP

lab13 PROC

COMMENT $
Implement the following pseudocode in assembly language.
All values are 32-bit signed integers:

if (var1 <= var2)
	var3 = 10;
else 
{
	var3 = 6;
	var4 = 7;
}

(There are multiple correct solutions to this problem.)
$

.data
	var1		DWORD	?
	var2		DWORD	?
	var3		DWORD	?
	var4		DWORD	?
.code
	mov var1, 10
	mov var2, 5
	mov eax, var1
	mov ecx, var2
	cmp ecx, eax
	jle ifMet
	jge elseMet

	ifMet:
		mov var3, 10
		ret

	elseMet:
		mov var3, 6
		mov var4, 7
		ret
	ret

lab13 ENDP


lab14 PROC
COMMENT $
Implement the following pseudocode in assembly language. 
All values are unsigned:

if (ebx <= ecx && ecx > edx)
{
	eax = 5;
	edx = 6;
}
$

.code
	mov edx, 20
	mov ebx, 5
	mov ecx, 5
	cmp ecx, ebx
	jle firstConditionMet

	firstConditionMet:
		cmp ecx, edx
		jl secondConditionMet

	secondConditionMet:
		mov eax, 5
		mov edx, 6
	ret

lab14 ENDP

lab15 PROC

COMMENT $
Implement the following loop, using unsigned 32 bit integers:

while (ebx <= val1)
{
	ebx = ebx + 5;
	val1 = val1 - 1;
}
$
.data
	val1		DWORD	?
.code
	mov val1, 20
	mov ebx, 5

	cmp ebx, val1
	jle looper

	looper:
		add ebx, 5
		sub val1, 1
		cmp ebx, val1
		jle looper
	ret
lab15 ENDP

lab16 PROC

COMMENT $
Rewrite code to do a 'random access selection' rather than 
sequential search. 

Random Access Selection: not a linear search

Lab: (option - 'A') * size of the table row

 -----------
|'A'	Append |
|-----------|
|'B' Delete |
|-----------|
|'C' Show   |
|-----------|
|'D' Insert |
 -----------

$

lab16 ENDP


lab17 PROC

COMMENT $
Your Turn 7 :
Explain why the following FSM does not work as well for
signed integers as the one shown on the previous slide: 
$

lab17 ENDP

lab18 PROC

COMMENT $
Your Turn 8: 
- Draw a FSM diagram for hexadecimal integer constant 
  that conforms to MASM syntax. 

- Implement your FSM in assembly language. Let the user 
  input a hexadecimal constant from the keyboard. 
  
$
lab18 ENDP

END main