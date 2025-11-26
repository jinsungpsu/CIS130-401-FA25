.386
.model flat,stdcall
.stack 4096
.data

; example that might be helpful
; for final project

arr WORD 3,4,5
avg WORD ?

ExitProcess proto,dwExitCode:dword

.code
main proc
	; add up all the elements of arr
	XOR eax, eax ; clear out eax
	add ax, arr			; 3 items total
	add ax, arr + 2		; each is 2 bytes (WORD)
	add ax, arr + 4

	; total is currently in AX
	; to get the average
	; divide the total by 3

	; 16 bit result
	; divident is in DX:AX
	; aleady have the sum in AX
	; so I just need to extend sign into DX

	CWD ; convert word to double word

	MOV BX, 3

	; ax is the dividend, so it should be 3 + 4 + 5 = 12
	; bx = 3
	; 12 / 3 = 4 R 0
	; quotient = ax = 4
	; remainder = dx = 0

	IDIV BX



	mov eax, 10
	mul eax
	; edx:eax = eax * eax, eax = 10 * 10
	; eax is implied multiplicand
	; eax is also the explicit multiplier

	mov eax, 99 ; <-- implied multiplicand
	mov ebx, 20
	mul ebx     ; <-- explicit multiplier
				; <-- also implied product (destination)
				; if CY flag is set
				; then we need to make sure we take EDX result into account
				; otherwise if CY is NOT set
				; then the entire valid result is just in EAX
	; edx:eax = 99 * 20

	; a = b * c
	; a = product
	; b = multiplicand
	; c = multiplier



	; a / b = c R d
	; dividend / divisor = quotient and remainder

	; 10 / 5
	; 8 bit
	; dividend = AX
	; divisor = explicit
	; quotient = AL
	; remainder = AH

	mov eax, 10			; yes i know i'm doing 8 bit, but i need to fill 16 bits
						; 32 bit divided by 16 bit = 16 bit result
						; big / small = small
						; opposite of multiplication
						; small * small = big


	; ################################################################
	; ################################################################
	; this is for SIGNED division (IDIV)
	; ################################################################
	; ################################################################
	; more generally, if i were doing 16 bit division
	; i'd do
	mov ax, 10
	; but the dividend is actually dx:ax
	mov dx, 0	; this is all 0's for MSD's
				; of dividend
				; but this wouldn't work
				; if dividend is negative
				; so instead, I'd want to do
				; CWD
				; Convert Word > DW
	CWD			; <- yep that's the whole instruction
				; cwd has implied operands
				; sign extend AX into DX
				; don't HAVE to using the CBW instruction
				; since you couldn't just movsx or even just MOV if using immediate/memory

	mov bl, 5
	div bl				; results are saved in AL (quotient)
						; and AH (remainder)





	invoke ExitProcess,0
main endp
end main
