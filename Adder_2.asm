.386

.model flat, c


.data

.code

Adder_2	PROC

	push ebp
	mov ebp, esp
	sub esp, 12; allocate local storage space
	push ebx
	push esi
	push edi

	; STACK

	; High Mem		s3 < -- + 28
	;			s2 < -- + 24
	;			s1 < -- + 20
	;			addendum_c < -- + 16
	;			addendum_b < -- + 12
	;			addendum_a < -- + 8
	;			Return < -- + 4
	;			Old ebp < --ebp
	;			Temp s3 < -- - 4
	;			Temp s3 < -- - 8
	;			Temp s3 < -- - 12
	;			Old ebx
	;			Old esi
	; Low Mem	Old edi


	mov eax, [ebp + 8]		; eax = 'addendum_a'
	mov ebx, [ebp + 12]		; ebx = 'addendum_b'
	mov ecx, [ebp + 16]		; ecx = 'addendum_c'
	mov edx, [ebp + 20]		; edx = 's1'
	mov esi, [ebp + 24]		; esi = 's2'
	mov edi, [ebp + 28]		; edi = 's3'


	; Compute s1 = addendum_a + addendum_b + addendum_c

	mov[ebp - 12], eax
	add[ebp - 12], ebx
	add[ebp - 12], ecx

	; Compute s2 = (addendum_a) ^ 2 + (addendum_b) ^ 2 + (addendum_c) ^ 2

	imul eax, eax
	imul ebx, ebx
	imul ecx, ecx

	mov[ebp - 8], eax
	add[ebp - 8], ebx
	add[ebp - 8], ecx

	; Compute s3 = (addendum_a) ^ 3 + (addendum_b) ^ 3 + (addendum_c) ^ 3

	imul eax, [ebp + 8]; eax is squared yet ![ebp + 8] = old eax...
	imul ebx, [ebp + 12]; ebx is squared yet ![ebp + 12] = old ebx...
	imul ecx, [ebp + 16]; ecx is squared yet ![ebp + 16] = old ecx...

	mov[ebp - 4], eax
	add[ebp - 4], ebx
	add[ebp - 4], ecx

	; save s1, s2, s3

	mov eax, [ebp - 12]
	mov [edx], eax

	mov eax, [ebp - 8]
	mov[esi], eax

	mov eax, [ebp - 4]
	mov[edi], eax

	pop edi
	pop esi
	pop ebx

	mov esp, ebp

	pop ebp

	ret

Adder_2 endp
end