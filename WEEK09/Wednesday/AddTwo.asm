; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

; const int num = 5;
; in c++, 5 would be called a "literal"
; in assembly, 5 would be  called a "constant"
; aka, a value that is IN THE CODE

.386
.model flat,stdcall
.stack 4096
.data
; #########################
; #########################
; FROM WEDNESDAY 10/22
; #########################
; #########################
NUM10 DWORD ?  ; 32 bits, 4 bytes
NUM11 BYTE ?   ; 8 bits, 1 byte

letter1 BYTE 'a'
letter2 BYTE "A"

; string is an array of bytes
letters BYTE 'hello'
letters2 BYTE "hello"
letters3 BYTE 'h', 'e', 'l', 'l', 'o'

; in general, creating arrays
temps DWORD 12, 45, 99, 102
temps1 DWORD 10101b, 77o, ?, 0ABh, ?






; #########################
; #########################
; FROM MONDAY 10/20
; #########################
; #########################
; this section defines
; data in RAM
; gives easy to remember
; names to RAM locations
; allocates memory (in heap)

; when you define a variable
; 1) what "type"
; 2) name/identifier
; 3) initial value (if applicable)
; int num = 5
; in assembly
; IDENTIFIER TYPE INITIAL VALUE
num5 dword 12
HOT_DOGS dword ?
COUNTER dword 0
counter1 dword 0h
counter2 dword 00101000b

; other types
; DWORD = 32bit
; we do not enforce data type
COUNTER3 DWORD 'H'

; WORD = 16 BIT
; BYTE = 8 BIT
; QWORD = 64 BIT (4 WORDS, QUAD WORD 16X4)
; TBYTE = 80 BITS (TEN BYTES, 10X8)

BLAH BYTE 10
BLAH1 QWORD 1012390487
BLAH2 TBYTE 012341342124124O

RESULT DWORD ?

ExitProcess proto,dwExitCode:dword

.code
main proc

	; #########################
	; #########################
	; FROM WEDNESDAY 10/22
	; #########################
	; #########################

	; instructions
	; label, nmemonic, ops, comment

	CALC_TAX: MOV eax, 6 ; comment

	; operand rules are same as mov
	; NUM10 is DWORD, or 32 BITS
	ADD NUM10, 8976
	ADD NUM10, EAX

	; what if I want to start dealing with different size stuff
	; can't add 8 bits to 32 bits
	; ADD NUM11, EAX	; NUM11 = BYTE
	MOV AL, 10
	ADD NUM11, AL
	ADD NUM11, 123

	; different types of operands
	; mov a constant into a register
	MOV EAX, 10 
	MOV EBX, 20
	MOV ECX, 30

	; move a constant into memory
	MOV NUM10, 5
	MOV NUM11, 0101010b

	; can't do
	; MOV 5, NUM10
	; nonsense, 5 can't be a destination

	; memory <> register
	MOV EAX, NUM10
	MOV NUM10, EAX

	; but CANNOT do memory <> memory
	; instead of doing
	; MOV NUM10, NUM11
	; MOV EAX, NUM10
	; MOV NUM10, NUM11
	; MOV NUM11, EAX

	COMMENT /
		oh hey... what's up down
	/


	JMP CALC_TAX ; this is an infinite loop

	; #########################
	; #########################
	; FROM MONDAY 10/20
	; #########################
	; #########################
	; our first assembly instruction!
	; mov = MOVE value into somewhere
	; move = operation
	; it takes 2 operands
	; first operand is dest
	; second operand is the value to move into dest
	; eax is a register = 32 bit register

	; NOT case sensitive
	mov eax, (1+99)/2 ; eax = 199
	; can use expressions
	; however
	; there is NO COMPUTING going on here
	; after this is converted to machine language
	; meaning... (1+99)/2 converted into a constant
	; then the result is "baked" into the instruction
	; aka - the computing is done by the assembler
	; not by "THIS" program
	MOV eax, 199h
	moV EAX, 177o



	mOv eaX, 1010101010b
	Mov eax, 0abh	; eax = ab (hex)
	; if your hex constant value
	; starts with a letter
	; must use a leading 0

	mov	eax, num5       ; comment
	mov ebx,10
	add	eax,ebx
	; ADD IS 2 OPERANDS
	; EAX = EAX + EBX
	; FIRST OP IS BOTH DEST AND OP1
	; ADD OP1, OP2 IS OP1 = OP1 + OP2

	MOV RESULT, EAX
	invoke ExitProcess,0
main endp
end main
