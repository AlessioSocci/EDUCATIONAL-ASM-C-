.386


.model flat, c


.data

.code

SignedDivMul	PROC	; Return: 0 --> Error (Division by zero), 1 --> Success

	push ebp
	mov ebp, esp
	push ebx

	xor eax, eax
	mov ecx, [ebp + 8]		; ecx = 'factor_a'
	mov edx, [ebp + 12]		; edx = 'factor_b'

	or edx, edx
	jz InvalidDivisor		; jump if not zero

	imul edx, ecx			; edx = 'factor_a' * 'factor_b'

	mov ebx, [ebp + 16]     ; ebx = 'product'
	mov [ebx], edx			; ebx = 'product'

	mov eax, ecx			; eax = 'factor_a'
	cdq						; convert dword in quadord --> edx : eax contains dividend
	
	idiv dword ptr[ebp + 12]
	
	mov ebx, [ebp + 20]
	mov [ebx], eax
	mov ebx, [ebp + 24]
	mov [ebx], edx
	mov eax, 1

InvalidDivisor:
	
	pop ebx
	pop ebp
	ret



SignedDivMul endp
end