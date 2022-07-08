.386

.model flat, c

.data

.code

Adder	PROC
	
	push ebp
	mov ebp, esp

	mov eax, [ebp + 8]		; eax = 'addendum_a'
	mov ecx, [ebp + 12]		; eax = 'addendum_b'
	mov edx, [ebp + 16]		; eax = 'addendum_c'

	add eax, ecx			; eax = 'addendum_a' + 'addendum_b'
	add eax, edx			; eax = 'addendum_a' + 'addendum_b' + 'addendum_c'

	pop ebp

	ret

Adder endp
end