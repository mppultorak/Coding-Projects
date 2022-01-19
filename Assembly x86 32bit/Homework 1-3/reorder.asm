TITLE reorder.asm
; // Program Description: Rearranges values of the array
; // Author: Michael Pultorak
; // Creation Date: 10/02/2021


INCLUDE Irvine32.inc
move textequ <mov>
clearEAX textequ <mov eax, 0>; //
clearEBX textequ <mov ebx, 0>; // Clears registers
clearESI textequ <mov esi, 0>; //


.data
MyArray WORD 4567h, 2348h, 3338h; 			// Array for operations
MyArraySize = ($ - MyArray)/(Type MyArray); // Size of array
MyArrayAdress DWORD OFFSET MyArray; 		// Data adress for array
MyArrayType DWORD TYPE MyArray ;    		// Data type of array


.code
main PROC
clearEAX; // 
clearEBX; // Clears Registers
clearESI; //

mov ax, [MyArray+2];  // ax: 2348 | MyArray: 4567 2348 3338
xchg ax, [MyArray+0]; // ax: 4576 | MyArray: 2348 2348 3338
xchg ax, [MyArray+4]; // ax: 3338 | MyArray: 2348 2348 4567
xchg ax, [MyArray+2]; // ax: 2348 | MyArray: 2348 3338 4567

mov esi, MyArrayAdress; // Moves adress of first element of MyArray into edi.
mov ecx, MyArraySize;   // Moves size of array into ecx.    ecx: 0000 0003
mov ebx, MyArrayType;   // Moves type of MyArray into ebx.  ebx: 0000 0002 

call dumpmem; // Prints value of MyArray after operations


exit
main ENDP
END main