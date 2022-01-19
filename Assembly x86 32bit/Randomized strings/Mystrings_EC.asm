TITLE Mystrings_EC.asm
; // Program Description: Creates random string of random size and color
; // Author: Michael Pultorak
; // Creation Date: 10/17/2021

INCLUDE Irvine32.inc
move textequ <mov>
clearEAX textequ <mov eax, 0>
clearEBX textequ <mov ebx, 0>
clearECX textequ <mov ecx, 0>
clearEDX textequ <mov edx, 0>
clearEDI textequ <mov edi, 0>
clearESI textequ <mov esi, 0>

.code
main PROC

call nstrings

exit 
main endp


UserEnter PROC uses edx
;---------------------------------------------------------
; Promps user for unsigned integer input
; Recives: Nothing
; Returns: EAX = input, and the status flags are changed.
; Requires: Nothing
;---------------------------------------------------------
	.data
	str1 BYTE "Please enter a unsigned number specifing the ammount of random strings to generate: ", 0d
	.code
	mov edx, offset str1
	call WriteString
	call readint
	ret
UserEnter ENDP


String PROC uses ecx
;-------------------------------------------------------------
; Creates A random size string of random capital letters
; Recives: Nothing
; Returns: String pointer: EDX / string size: EBX
; Requires: Nothing
;-------------------------------------------------------------
	.data
	array1 byte 24 dup(0)
	strsize byte ?

	.code
	; // Initializing data for creating string 
	call HowMany
	mov cl, al
	mov strsize, al
	clearEDI
	
	; // Loop to create random string by byte
	strbuild:
	call Alpha
	mov [array1+edi], al
	inc edi
	loop strbuild
	
	; // Return values
	mov bl, strsize
	mov edx, offset array1
	ret
String ENDP


HowMany PROC
;----------------------------------------------------------------
; Generates random number from 13 to 23
; Recives: Nothing
; Returns: EAX = random number, and the status flags are changed.
; Requires: Nothing
;----------------------------------------------------------------
	mov al, 14
	call RandomRange
	add al, 10
	ret 
HowMany ENDP


Alpha PROC
;----------------------------------------------------------------
; Generates random ascii capital number
; Recives: Nothing
; Returns: EAX = random ascii char, and the status flags are changed.
; Requires: Nothing
;----------------------------------------------------------------
	mov eax, 26
	call RandomRange
	add eax, 65
	ret
Alpha ENDP


ClrString PROC uses ecx
;-------------------------------------------------
; Clears array
; Recives: size of array in ebx and pointer in edx
; Returns: Nothing
; Requires: Nothing
;-------------------------------------------------
	clearEDI
	mov ecx, ebx
	mov edi, edx
	clearstring:
	mov byte ptr [edi], 0
	inc edi
	loop clearstring	
	ret
ClrString ENDP


clearregs PROC
;-------------------------------
; Clears Registers
; Recives: Nothing
; Returns: Nothing
; Requires: Nothing
;-------------------------------
	clearEAX
	clearEBX
	clearECX
	clearEDI
	clearEDX
	clearESI
	ret
clearregs endp


colorthestring PROC
;--------------------------------
; Sets terminal text to random color
; Recives: Nothing
; Returns: Nothing
; Requires: Nothing 
;--------------------------------
	mov eax, 15
	call RandomRange
	inc eax
	call settextcolor
	ret
colorthestring ENDP


nstrings PROC
;-------------------------------------------------------------------------------
; Generates User input N, to generate N number of random strings of random color
; Recives: Nothing
; Returns: Nothing
; Requires: Nothing
;-------------------------------------------------------------------------------
	; // User input
	call clearregs
	call UserEnter
	mov cl, al
	; // Generates random string, writes it, and clears array N times.
	randomstring:
	call string
	call colorthestring
	call writestring
	call Crlf
	call clrstring
	loop randomstring
	
	mov eax, white
	call settextcolor
	
	ret
nstrings ENDP


end main