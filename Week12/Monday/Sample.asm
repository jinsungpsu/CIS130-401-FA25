.386
.model flat,stdcall
.stack 4096
.data

var DWORD 1,2,3,4,5

ExitProcess proto,dwExitCode:dword

.code
main proc
	; intro to loops

	mov ecx, 0 ; <-- HOW MANY TIMES DO I WANT TO LOOP
				; ECX is a general purpose register
				; so nothing is enforce anything (proper usage)
	MOV EAX, 0
	loop_start:

		inc eax
	loop loop_start

	comment \
		int x = 5;
		loop_start: while (x < 10) {
			// this while loop instruction
			// is doing a couple of things
			// checking for the condition
			// if it's true, then go INTO the loop body
			// if it's NOT true, then SKIP the loop BODY
			// IF X < 10, GO TO after_loop
			// meaning
			// load the next instruction (into EIP)
			cout << "hi";
			go back to loop_start
			// meaning
			// load the address of
			// loop_start instruction
			// into EIP
		}
		AFTER_LOOP:
	\



	
	; previously
	; dereferencing was optional

program_start: 
	mov eax, var
	
	
	mov eax, [var]

	mov ebx, OFFSET var
	mov eax, ebx ; <--- noves address of var into eax
	mov eax, [ebx] ; <--- moves contents of address (value of 1)

	add ebx, 4		; <-- what is ebx??? ADDRESS!!!!!!
					; "pointer arithmetic"

	mov eax, [ebx]	; now the pointer moved to the 2nd item.. so value is 2

	comment \
		trying to change my code from looking like
		mov eax, var
		mov eax, var + 4
		mov eax, var + 8

		trying to make a "generic" line of code that handles all of them

		mov ebx, OFFSET var
		mov eax, [ebx]
		add ebx, 4
		mov eax, [ebx]
		add ebx, 4
		mov eax, [ebx]
		add ebx, 4
		mov eax, [ebx]

	\

	JMP program_start
	invoke ExitProcess,0
main endp
end main
