.386
.model flat,stdcall
.stack 4096
.data

grades WORD 85, 90, 85, 99, 84
gradeLetter BYTE 5 DUP(?)
; expectation at end of program is
; gradeLetter is filled with "F", "A", B", "A", "B"

ExitProcess proto,dwExitCode:dword

.code
main proc

	comment \
		grades[]
		gradeLetter[]

		if grades[0] > 89
			gradeLetter[0] = 'a'
		if grades[0] > 79
			then B
		etc.

		Then repeat...
	\

	; this an unsigned comparison

Grade_A:
	CMP grades[0], 89 ; nondesctructive compare
						; this sets appropriate flags
	; JA = jump if above, grades[0] > 89
	; JNA = jump if NOT above, grades[0] < 89
	JNA Grade_B		; meaning, skip over setting the grade to "A"
	MOV gradeLetter[0], 'A'
	JMP Exit
Grade_B:
	CMP grades[0], 79	
	JNA Grade_C
	MOV gradeLetter[0], "B"	
	JMP Exit
Grade_C:
	CMP grades[0], 69	
	JNA Grade_F
	MOV gradeLetter[0], "C"	
	JMP Exit
Grade_F:
	MOV gradeLetter[0], "F"

Exit:

	invoke ExitProcess,0
main endp
end main
