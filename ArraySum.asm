.386

.model flat,c

.data

intArray DWORD 10000h, 20000h, 30000h, 40000h;

.code

ArraySum	PROC

	mov edi, OFFSET intArray
	mov ecx, LENGTHOF intArray
	mov eax, 0

LP:

	add eax, [edi]
	add edi, TYPE intArray
	loop LP

	ret

ArraySum endp
end