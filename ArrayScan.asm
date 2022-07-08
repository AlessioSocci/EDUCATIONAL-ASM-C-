.386

.model flat, c

.data

intArray SWORD 0, 0, 0, 0;  4, 3, 0, -34, -56, 7, 8

.code

ArrayScan	PROC

	mov ebx, OFFSET intArray
	mov ecx, LENGTHOF intArray

LP1:
	
	cmp WORD PTR[ebx], 0 
	jnz	found				;jnz jump if zero flag = 0, jz jump if zero flag = 1
	ADD ebx, 2
	LOOP LP1
	jmp notFound

found:

	movsx eax, WORD PTR[ebx]
	jmp quit

notFound:

	mov eax, 999999

quit:


	ret

	ArrayScan endp

	end










ArrayScan endp
end
