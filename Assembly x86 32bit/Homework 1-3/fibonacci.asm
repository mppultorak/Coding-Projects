TITLE fibonacci.asm
; // Program Description: Finds fibonacci value of number
; // Author: Michael Pultorak
; // Creation Date: 10/04/2021


INCLUDE Irvine32.inc
move textequ <mov>
clearEAX textequ <mov eax, 0>; //
clearEBX textequ <mov ebx, 0>; // Clears registers
clearECX textequ <mov ecx, 0>; // 
clearESI textequ <mov esi, 0>; //
moveoffset textequ<mov esi, offset fibArray> ; // Macro for moving the offset of fibarray into esi


.data
fib0 = 0h; 				     	 // Fibonacci value for n = 0
fib1 = 1h; 					 	 // Fibonacci value for n = 1
fibArray byte 7 dup(0); 		 // Empty byte array for fibonacci values 2 through 9
LoopLimit DWORD sizeof fibArray; // Number of loops exicuted 
position = 3;	 				 // Position for fib 5 in array

.code
main PROC
clearEAX; //
clearEBX; // Clears registers
clearECX; // 
clearESI; // 

mov al, fib0; 		// al: 00
mov ah, fib1; 		// ah; 01 
mov ecx, LoopLimit; // ecx: 0000 0008
moveoffset; 		// <mov esi, offset fibArray>

fibonacci: ;    // Loop name
add al, ah ;    // Adds upper fib value into lower creating next value
xchg al, ah;    // Exchanges al and ah, placing next fib value into ah
mov [esi], ah;  // Moves ah into fibArray
inc esi ; 	    // Increases pointer to point to next adress in fibArray
call dumpregs;  // Dumps registers to show actions of loop per itteration
loop fibonacci; // Loops fibonacci (dec ecx then compares to zero)
	
mov ebx, DWORD PTR [fibArray+position] ; // Moves fib values from fib(5) to fib(8) into ebx
call dumpregs; // Dumps registers to show result


exit
main ENDP
END main