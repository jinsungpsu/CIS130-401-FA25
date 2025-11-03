comment \
Jin An
CIS130
\


.386
.model flat,stdcall
.stack 4096
.data

arr BYTE 1,2,3,4,5
; arr is the very first thing being defined in this program
; 0: 1 (arr + 0)
; 1: 2 (arr + 1)
; 2: 3 (arr + 2)
; 3: 4 (arr + 3)
; 4: 5 (arr + 4)
wordArr WORD 6,7,8,9,10
; 5: 6 (wordArry, 2 bytes)
; 7: 7 (wordArray + 2)
; 9: 8 (wordArray + 4)
; 11: 9 (wordArray + 6)
; 13: 10 (wordArray + 8)

dwArray DWORD 10, 20, 30, 40
; 15: 10 (dwArray + 0, 4 bytes, or 32 bits)
; 19: 20 (dwArray + 4)
; 23: 30 (dwArray + 8)
; 27: 40 (arr + 40, or dwArray + 12, or wordArr + 26)

ExitProcess proto,dwExitCode:dword

.code
main proc
	
	; value 40 is
	; stored in label dwArray
	; but can be accessed from any
	; of the other labels... since
	; it's all just pointer arithmetic
	; + some value is how many BYTES we are adding
	; to that initial memory address
	movsx eax, arr+27

	; arr BYTE 1,2,3,4,5
	; how to move 1 to eax
	movsx eax, arr+0
	movsx eax, [arr+0]
	movsx eax, arr[0]

	; arr BYTE 1,2,3,4,5
	; how to move 4 to eax
	movsx eax, arr+3
	movsx eax, [arr+3]
	movsx eax, arr[3]
	movzx eax, arr+3


	; wordArr WORD 6,7,8,9,10
	; move 6 into ax
	mov ax, wordArr
	mov ax, wordArr+0
	mov ax, [wordArr]
	mov ax, wordArr[0]

	; wordArr WORD 6,7,8,9,10
	; move 8 into ax
	mov ax, wordArr + 4
	mov ax, wordArr - 2 ; this would go backwards to the arr, and go to the 2nd to last item
	; should be 4 (but it took 16 bits starting at that address, so it got some other stuff too)

	invoke ExitProcess,0
main endp
end main
