.386
.model flat,stdcall
.stack 4096
.data

arr DWORD 1,1,2,2
arrSize = 4 ; bytes!!!

arr2 WORD 1,2,3,4,5,6,7,8,9
sumEveryThird WORD ?	; 1 + 4 + 7 = 12
comment \
	how many times do i loop????
	3 times
	length of arr2 = 9
	9/3 = 3
	LENGTH arr2 / 3

	start by setting a register
	as the first item address
	addresses are 32 bit, so need to use whole register
	mov EBX, OFFSET arr2

	since data we're adding is WORD
	xor EAX, EAX	; clearing whole register to avoid confusion

	set the counter for the loop
	mov ECX, LENGTHOF arr2 / 3

	LOOPSTART:
		add ax, [ebx]
		add ebx, TYPE arr2 * 3
		LOOP LOOPSTART

	mov sumEveryThird, ax

\

ExitProcess proto,dwExitCode:dword

.code
main proc
	xor eax, eax		; FASTER! than mov eax, 0
	add eax, arr
	add eax, arr+4
	add eax, arr+8
	add eax, arr[12]
	; can't generalize and use a loop

	xor eax, eax		; FASTER! than mov eax, 0
	mov ebx, OFFSET arr
	add eax, [ebx]
	add ebx, arrSize
	add eax, [ebx] 
	add ebx, arrSize

	xor eax, eax		; FASTER! than mov eax, 0
	mov ebx, OFFSET arr
	mov ecx, LENGTHOF arr

LOOPEXAMPLE1:
	add eax, [ebx]		; repeated instruction
	add ebx, arrSize	; repeated instruction
	LOOP LOOPEXAMPLE1

	; general purpose registers
	; ecx is used for looping
	; so i need to find something else to use
	; eax, ebx, ecx, edx, esi, edi

	xor eax, eax
	mov ebx, OFFSET arr
	mov esi, TYPE arr
	mov ecx, LENGTHOF arr

LOOPEXAMPLE2:


	add eax, [ebx]	; repeated instruction
	add ebx, esi	; repeated instruction
	LOOP LOOPEXAMPLE2


	; index scaling
	xor eax, eax
	mov ebx, OFFSET arr
	mov esi, 0			; counter, like i = 0
	mov ecx, LENGTHOF arr

LOOPEXAMPLE3:
	add eax, arr[esi*TYPE arr]  ; repeated instruction
	inc esi						; repeated instruction
	LOOP LOOPEXAMPLE3


	invoke ExitProcess,0
main endp
end main
