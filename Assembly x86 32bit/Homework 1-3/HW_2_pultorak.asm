TITLE HWK_2_pultorak.asm
; // Program Description: (1) finds product from 3 to 8 
; // (2) Trips carry and overflow flags
; // (3) Calculates seconds in day in one line
; // and (4) finds (A - B) + (C - D) where A = 38d, B = 0010 1001b, C = A5h, and D = 85d
; // Author: Michael Pultorak
; // Creation Date: 09/14/2021

INCLUDE Irvine32.inc
move textequ <mov>
clearEAX textequ <mov eax, 0>; //
clearEBX textequ <mov ebx, 0>; // Clears registers
clearECX textequ <mov ecx, 0>; //
clearEDX textequ <mov edx, 0>; //
hours = 24; // Hours in a day : Part (3)
minutes = 60; // Minutes in a day : Part (3)
seconds = 60; // Seconds in a day : Part (3)
secondscount textequ %(hours*minutes*seconds) ; // Finds seconds in day
SECONDS_IN_DAY textequ <mov edx, secondscount> ; // Moves seconds in day into edx register


.data
product = (3*4*5*6*7*8); // Computes product from 3 to 8 : Part(1)
var1 BYTE 11111111b ; // Unsigned binary for carry flag : Part(2) [a]
var2 BYTE 00000001b ; // Unsigned binary for carry flag : Part(2) [a] 
var3 BYTE +01000000b ; // Signed binary for overflow flag : Part(2) [b]
var4 BYTE +01000000b ; // Signed binary for overflow flag : Part(2) [b] 
AvarDEC DWORD 38d ; // A variable : Part(4)
BvarBI DWORD 00101001b; // B variable : Part(4)
CvarHEX DWORD 0A5h; // C variable : Part(4)
DvarDEC DWORD 85d; // D variable : Part(4)


.code
main proc
	clearEAX; //
	clearEBX; // Clears registers
	clearECX; // 
	clearEDX; //
	
; // Part(1):
	mov ax, product; // Moves product into ax
	call DumpRegs; // Prints registers and flags

; // Part(2):
	; // [a]
	mov cl, var1; // Moves binary in var1 into bl
	add cl, var2; // Adds binary in var2 with bl to cause carry flag
	call DumpRegs; // Prints registers and flags
	
	; // [b]
	mov bl, var3; // Moves binary in var3 into cl
	add bl, var4; // Adds binary in var4 with bl to cause overflow flag
	call DumpRegs; // Prints registers and flags

; // Part(3)	
	SECONDS_IN_DAY; // Moves seconds in day into edx register
	call DumpRegs; // Prints registers and flags

; // Part(4):
	clearEAX; //
	clearEBX; // Clears registers
	clearECX; // 
	clearEDX; // 
	mov ebx, AvarDEC; // Moves 38d into ebx
	sub ebx, BvarBI; // Subtracts 0010 1001b from ebx: (A - B)
	mov AvarDEC, ebx; // Moves (A - B) into A
	mov ebx, CvarHEX; // Moves A5h into ebx
	sub ebx, DvarDEC; // Subtracts 85d from ebx: (C - D)
	add AvarDEC, ebx; // Adds ebx and A: (A - B) + (C - D) / Puts product into A 
	mov eax, AvarDEC; // Moves total into eax register
	call DumpRegs; // Prints registers and flags
	call WriteInt
	

	exit
main ENDP
END main