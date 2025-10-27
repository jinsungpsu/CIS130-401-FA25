comment \
Jin An
CIS130

################### PRACTICE #########################
######################################################
######################################################
######################################################
######################################################
######################################################

create an array of 3 DWORD values
add them all together and save it back
to memory

######################################################
######################################################
######################################################
######################################################
######################################################
######################################################

add r8/16/32, r8/16/32
\


.386
.model flat,stdcall
.stack 4096
.data

; right now... the $ counter is at "0" <--- but 0 doesn't mean address 0 in memory
; 0 means the first memory address that this program is going to use

some_var byte 2 ; this one is 8 bits

; now counter has moved over 1 byte
; in our architecture, 1 byte = 1 address

some_var2 WORD 123 ; this one is 16 bits
; now our counter has moved over 2 bytes

test_arr BYTE 5 dup(?)		; <--- 8 x 5 = 40 bits (5 bytes)
test_arr_size = ($-test_arr) ; <--- size in bytes of test_arr
							; WHEN/What line in our assembly app
							; we use the $ (current location counter)
							; is EXTREMELY important

word_arr WORD 1,2,3,4,5
word_arr_length = ($ - word_arr) / 2 ; <--- need to divide by 2, b/c each element
										; in the arr is 16 bits or 2 bytes
									; if it's DWORD, then divide by 4

; symbolic constant
NUM_STUDENTS = 999 ; <------ this is NOT saved in RAM
					; aka it's not a "variable"
					; basically a convenience feature in assembly

STARTING_GRADE = 4

STUDENTS DWORD NUM_STUDENTS DUP(?)

STUDENT_GRADES BYTE NUM_STUDENTS DUP(STARTING_GRADE)

NUM SDWORD -5

NUMS BYTE 1,2,3,4,5,
			6,7,8,9,10

message BYTE "Hello World", 0

; arr BYTE 1,2,3,4,5,6,6,6,66,3,23,3215,324,2364,135,513,135135,135,135,134,134,13,135
arr1 BYTE 400 dup("HELLO")
; LABEL/IDENTIFIER TYPE/SIZE.... combination of whatever we want
; including how_counter DUP(thing to duplicate)

arr2 DWORD 1,2,3
arr3 DWORD ?,?,?
arr4 DWORD 1,?,3,?
arr5 DWORD 5 DUP(99)
arr6 DWORD 1,2,3, 100 DUP(?)

little_endian DWORD 12345678h

SAQUON WORD 45, 60, 23, 70, 150

comment /
	int a = b + c;
	ADD B, C
	MOV A, B
/

ExitProcess proto,dwExitCode:dword

.code
main proc
	; how do I print saquon's 1st game??
	; aka move into EAX
	; go to the label... it's called saquon
	; the computer does know
	; based on the label
	; how big each element...
	; in this case word = 16 bits (2 bytes)
	; oops - can't put it into eax, must be 16 bits
	; so let's put it into AX

	mov ax, saquon
	; aka ax = saquon[0]

	; what about 2nd game???
	mov ax, saquon + 2
	; aka ax = saquon[1] OR
	; aka ax = saquon[2/2]

	mov ax, saquon + 3
	; this is WRONG - LOGICALLY
	; this is NOT a syntax error


	; what about 3rd game??
	mov ax, saquon + 4
	; aka ax = saquon[2]
	; aka ax = saquon[4/2]
	; the first address is saquon (base)
	; the 4 is the "OFFSET"
	; 4 is in BYTES, because that's our smallest addressable cell
	; in this architecture
	; but since each element is 2 BYTES
	; we divide by 2



	mov eax, test_arr_size

	MOV EBX, offset little_endian	
	MOV EAX, little_endian

	MOV		EAX, EBX		; asdfasdf
	MOV		ECX, num			; asdfasdf
	invoke ExitProcess,0
main endp
end main
