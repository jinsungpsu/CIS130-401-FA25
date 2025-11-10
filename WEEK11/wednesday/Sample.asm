comment \
| Overflow  | OV |
| Direction | UP |
| Interrupt | EI |
| Sign      | PL |
| Zero      | ZR |
| Auxiliary | AC |
| Parity    | PE |
| Carry     | CY |

\
.386
.model flat,stdcall
.stack 4096
.data

var sbyte 127
; 	Rval = Xval - (-Yval + Zval)
rval DWORD ?
xval DWORD 10
yval DWORD 42
zval DWORD 43

zeroexample DWORD 5

arr1 BYTE 1,2,3
arr2 WORD 3,4,5
arr3 DWORD 9,9,9

ExitProcess proto,dwExitCode:dword

.code
main proc
	; lab 2
	; add everything in an array
	;
	; arr1 BYTE 1,2,3
	; arr2 WORD 3,4,5
	; arr3 DWORD 9,9,9
	mov ebx, TYPE arr
	; ebx will hold
	; how many bytes
	; each element
	; in arr will be
	mov al, arr
	add al, arr+(ebx*1)
	add al, arr+(ebx*2)

	mov ebx, TYPE arr2
	mov ax, arr2
	add ax, arr2+(ebx*1)
	add ax, arr2+(ebx*2)





	mov eax, offset zeroexample ; addresses are 32 bits
	mov eax, zeroexample
	sub eax, 4

	neg var
	add var, (5+1)
	; mov eax, 5+1+(-var) <-- this does NOT work only a constant expression can be an operand
	; this should make sense, because any actual WORK/MATH done by the CPU
	; needs to be an instruction
	mov al, var
	neg al ; negate, will set carry (CY) flag

	add var, 1  ; this should go from 127 to 128
				; this should set the overflow (OV) flag


	; 	Rval = Xval - (-Yval + Zval)
	mov eax, yval
	neg eax
	add eax, zval
	mov ebx, xval
	sub ebx, eax
	mov rval, ebx
	invoke ExitProcess,0
main endp
end main
