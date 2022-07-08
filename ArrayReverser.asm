.386

.model flat,c

.data

num1 BYTE 13h
numArray1 BYTE 10h, 20h, 30h, 40h, 50h

count WORD 1


.code

ArrayReverser	PROC
	
	push ebp	
	mov ebp, esp				; esp is a stack pointer register
	push esi
	push edi

	xor eax, eax
	mov edi, [ebp + 8]
	mov esi, [ebp + 12]
	mov ecx, [ebp + 16]
	test ecx, ecx

	lea esi, [esi + ecx * 4 - 4]
	pushfd
	std
	
@@:	lodsd
	mov [edi], eax
	add edi, 4
	dec ecx
	jnz	@B

	popfd
	mov eax, 1

	pop edi
	pop esi
	pop ebp

	ret

ArrayReverser endp
end