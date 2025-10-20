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
num dword 12
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
	; our first assembly instruction!
	; mov = MOVE value into somewhere
	; move = operation
	; it takes 2 operands
	; first operand is dest
	; second operand is the value to move into dest
	; eax is a register = 32 bit register

	; NOT case sensitive
	mov eax, (1+99)/2 ; eax = 199
	MOV eax, 199h
	moV EAX, 177o
	mOv eaX, 1010101010b
	Mov eax, 0abh	; eax = ab (hex)
	; if your hex constant value
	; starts with a letter
	; must use a leading 0

	mov	eax, num       ; comment
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
