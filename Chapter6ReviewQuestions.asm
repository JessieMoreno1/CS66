; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


COMMENT $
1. What will be the value of BX after the following instructions execute?
    mov  bx,0FFFFh
    and  bx,6Bh

    Answer : The value of BX is 6B after the instructions execute 

2. What will be the value of BX after the following instructions execute?
    mov  bx,91BAh
    and  bx,92h

    Answer: The value of BX is 0092 after the instructions execute 

3. What will be the value of BX after the following instructions execute?
    mov  bx,0649Bh
    or   bx,3Ah

    Answer : The value of BX is 64BB after the instructions execute 

4. What will be the value of BX after the following instructions execute?
    mov  bx,029D6h
    xor  bx,8181h

    Answer : The value of BX is A857 after the instructions execute 

5. What will be the value of EBX after the following instructions execute?
    mov  ebx,0AFAF649Bh
    or   ebx,3A219604h

    Answer : The value of EBX is BFAFF69F after the instructions execute 

6. What will be the value of RBX after the following instructions execute?
    mov  rbx,0AFAF649Bh
    xor  rbx,0FFFFFFFFh

    Answer : The value of RBX is 50509B64 after the instructions execute 

7. In the following instruction sequence,show the resulting value of AL where indicated,in binary:
	mov  al,01101111b
	and  al,00101101b	; a.
	mov  al,6Dh
	and  al,4Ah		; b.
	mov  al,00001111b
	or   al,61h		; c.
	mov  al,94h
	xor  al,37h		; d. 

    Answer : a) 00101101b
		   b) 01001000b
		   c) 01101111b
		   d) 10100011b
	
8. In the following instruction sequence, show the resulting value of AL where indicated, in hexadecimal:
	mov  al,7Ah
	not  al		; a.
	mov  al,3Dh
	and  al,74h	; b.
	mov  al,9Bh
	or   al,35h	; c.
	mov  al,72h
	xor  al,0DCh	; d.

	Answer : a) 85h
		    b) 34h
		    c) BFh
		    d) AEh
	  
9. In the following instruction sequence, show the values of the Carry, Zero, and Sign flags where indicated:
	mov  al,00001111b
	test al,00000010b	;a.	CF = 0 ZF = 0 SF = 0
	mov  al,00000110b
	cmp  al,00000101b	;b.	CF = 0 ZF = 0 SF = 0
	mov  al,00000101b
	cmp  al,00000111b	;c.	CF = 1 ZF = 0 SF = 1

10. Which conditional jump instruction executes a branch based on the contents of ECX?

	Answer : The JECXZ conditional jump instruction jumps to a label if ECX is 0

11. How are JA and JNBE affected by the Zero and Carry flags?
	
	Answer : JA means that the left is greater than the right so sign flag is set
		    JNBE is the same thing as JA but also can set zero flag if below itself

12. What will be the final value in EDX after this code executes?
	   mov  edx,1
        mov  eax,7FFFh
        cmp  eax,8000h
        jl   L1
        mov  edx,0
	L1:

	Answer : The final value of EDX is 00000001

13. What will be the final value in EDX after this code executes?
        mov  edx,1
        mov  eax,7FFFh
        cmp  eax,8000h
        jb   L1
        mov  edx,0
	L1:

	Answer : The final value of EDX is 00000001

14. What will be the final value in EDX after this code executes?
        mov  edx,1
        mov  eax,7FFFh
        cmp  eax,0FFFF8000h
        jl   L2
        mov  edx,0
	L2:

	Answer : The final value of EDX is 00000000

15. (True/False): The following code will jump to the label named Target.
    mov  eax,-30
    cmp  eax,-50
    jg   Target

    Answer : False

16. (True/False): The following code will jump to the label named Target.
    mov  eax,-42
    cmp  eax,26
    ja   Target

    Answer : False

17. What will be the value of RBX after the following instructions execute?
    mov  rbx,0FFFFFFFFFFFFFFFFh
    and  rbx,80h

18. What will be the value of RBX after the following instructions execute?
    mov  rbx,0FFFFFFFFFFFFFFFFh
    and  rbx,808080h

19. What will be the value of RBX after the following instructions execute?
    mov  rbx,0FFFFFFFFFFFFFFFFh
    and  rbx,80808080h
$
.code
main proc
	;call RQ1				
	;call RQ2
	;call RQ3
	;call RQ4
	;call RQ5
	;call RQ6
	;call RQ7
	;call RQ8
	;call RQ9
	;call RQ12
	;call RQ13 
	;call RQ14
	;call RQ15
	;call RQ16
	call RQ17
	invoke ExitProcess,0
main endp

RQ1 PROC
.code
	mov  bx,0FFFFh
	and  bx,6Bh
	ret
RQ1 ENDP

RQ2 PROC
.code 
	mov  bx,91BAh
	and  bx,92h
	ret
RQ2 ENDP

RQ3 PROC
.code
	mov  bx,0649Bh
	or   bx,3Ah
	ret
RQ3 ENDP

RQ4 PROC
.code
	mov  bx,029D6h
	xor  bx,8181h
	ret
RQ4 ENDP

RQ5 PROC
.code
	mov  ebx,0AFAF649Bh
	or   ebx,3A219604h
	ret
RQ5 ENDP

RQ6 PROC
.code
	mov  ebx,0AFAF649Bh
	xor  ebx,0FFFFFFFFh
	ret
RQ6 ENDP

RQ7 PROC
.code
	mov  al,01101111b
	and  al,00101101b	; a.
	mov  al,6Dh
	and  al,4Ah		; b.
	mov  al,00001111b
	or   al,61h		; c.
	mov  al,94h
	xor  al,37h		; d. 
	ret
RQ7 ENDP

RQ8 PROC
.code
	mov  al,7Ah
	not  al		; a.
	mov  al,3Dh
	and  al,74h	; b.
	mov  al,9Bh
	or   al,35h	; c.
	mov  al,72h
	xor  al,0DCh	; d.
	ret
RQ8 ENDP

RQ9 PROC
.code
	mov  al,00001111b
	test al,00000010b	; a.	CF = 0 ZF = 0 SF = 0
	mov  al,00000110b
	cmp  al,00000101b	; b.	CF = 0 ZF = 0 SF = 0
	mov  al,00000101b
	cmp  al,00000111b	; c.	CF = 1 ZF = 0 SF = 1
	ret
RQ9 ENDP

RQ12 PROC
.code
	mov  edx,1
     mov  eax,7FFFh
     cmp  eax,8000h
     jl   L1
     mov  edx,0
  L1:
  ret
RQ12 ENDP

RQ13 PROC
.code
	mov  edx,1
     mov  eax,7FFFh
     cmp  eax,8000h
     jb   L1
     mov  edx,0
  L1:
  ret
RQ13 ENDP

RQ14 PROC
.code
	mov  edx,1
	mov  eax,7FFFh
     cmp  eax,0FFFF8000h
     jl   L2
     mov  edx,0

	L2:
	ret
RQ14 ENDP

RQ15 PROC
.code
	mov  eax,-30
     cmp  eax,-50
     jg   Target

	Target: 
	ret
RQ15 ENDP

RQ16 PROC
.code
	mov  eax,-42
     cmp  eax,26
     ja   Target

	Target: 
	ret
RQ16 ENDP

;RQ17 PROC
;.code
;	push rbx
;	mov rbx,0FFFFFFFFFFFFFFFFh
;     and rbx,80h
;	pop rbx
;	ret
;RQ17 ENDP

;RQ18 PROC
;.code
;	push rbx
;	mov rbx,0FFFFFFFFFFFFFFFFh
;     and rbx,808080h
;	pop rbx
;	ret
;RQ18 ENDP

;RQ19 PROC
;	push rbx
;	mov  rbx,0FFFFFFFFFFFFFFFFh
;     and  rbx,80808080h
;	pop rbx
;RQ19 ENDP

end main