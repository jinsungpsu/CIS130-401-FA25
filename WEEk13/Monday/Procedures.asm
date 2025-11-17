comment \
	for (int i = 0; i < 5; i++) {
		// whatever is here...
		// will repeat 5 times
		push i
		for (int i = 0; i < 10; i++) {
			// i did this on purpose
			// whatever is here will repeat
			// 50 times (or 5 x 10)
		}
		pop i
		// whatever is here repeats 5
	}

\

.386
.model flat,stdcall
.stack 4096
.data

stuff BYTE 6,7,10,11


ExitProcess proto,dwExitCode:dword

var WORD 123h

.code
main proc		; <-- main procedure
	mov edi, OFFSET stuff
	mov ecx, LENGTHOF stuff
	call addBytes
	push 1
	push 2
	push 3
	push 4 ; 4 is the "top"... 1 is the "bottom"

	pop eax ; value 4 and put it into var
	pop eax ; value 3 into eax
	pop ax ; value 2 into ax

	pushfd ; implied operand

	popfd	; implied operand

	push eax
	push var

	invoke ExitProcess,0

; NOT HERE

main endp ; <--- end of main procedure

; WHERE DO MY PROCEDURES GO?
; INSIDE THE MAIN BUT OUTSIDE OF MAIN PROCEDURE
; PRDCEDURES GO HERE!!!!!

; make sure you document!!!!!!

; --------------------------
addBytes PROC uses EDI
; description:
; add all elements in BYTE array
; receives:
; EDI is address of array
; ECX is # of items in that array
; need the array itself!
; we do NOT want to use specific
; memory labels/data labels
; that is the equivalent of hard coding stuff
; "pass in" the address of the stuff I'm gonna add
; also need # of elements
; returns:
; the sum = al
; requires:
; nothing

; ---------------------------
	
	xor al, al
loop_start:
	add al, [edi]
	add edi, 1		; bc we're doing arr of bytes
	loop loop_start


	RET
addBytes ENDP

end main ;<--- NOT end of main procedure

; NOT HERE
