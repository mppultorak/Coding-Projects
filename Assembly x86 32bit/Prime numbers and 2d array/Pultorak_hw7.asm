TITLE Pultorak_hw7.asm
;// Author:  Michael Pultorak
;// Date:    Nov 2021
;// Description: This program 1: takes input n and finds all prime numbers between 1-n
;// 			 			  2: Generates 2d array of letter half of which are vowels and finds words within array.
;// 1.  Finds prime numbers
;// 2.  Generates array and finds words
;// 3.  Exit program
;// ====================================================================================

include Irvine32.inc

; // Prototypes:
; // ---------------------------------------
DisplayMenu PROTO, useropt : ptr byte   ; //		General functions
Modulus PROTO, keyval : ptr byte 	    ; // 
OutOfRangeError PROTO 				    ; //
; // --------------------------------------- 

; // ------------------------------------------------------------------------------------
readprimeinput PROTO, primeslooplimit : ptr word									 ; //
findprimes PROTO, primevalarray : ptr byte, loopval : word, totalofprimes : ptr word ; //  Functions for option 1:
removemultiples PROTO, boolarray : dword, limitvalue : word, itterable : word		 ; //      (Finding primes)
DisplayThem PROTO, primearray : ptr byte, primerange : word, numofprimes : word		 ; //
primenumbermenu PROTO, primesvalue : word, rangevalue : word						 ; // 
nInputError PROTO 																	 ; //
; // ------------------------------------------------------------------------------------

; // -------------------------------------------------------------------------------------------------------------
GenerateRandomChar PROTO, ReturnChar : ptr byte																  ; //
GenerateRandomVowel PROTO, voweladress : ptr byte															  ; //
GenerateRandomNonvowel PROTO, charadress : ptr byte															  ; //
FillArray PROTO, arrayoffset : ptr byte																		  ; //  Functions for option 2:
printmatrix PROTO, matrixarray : ptr byte																	  ; //		(finding words in array)
FindRowWords PROTO, rarray : ptr byte, rowboolarray : ptr byte												  ; //
checkvowel PROTO, charbyte : ptr byte																		  ; //
FindColumnWords PROTO, carray : ptr byte, columnarray : ptr byte											  ; //
FindDiagonalWords PROTO, darray : ptr byte, diagonalarray : ptr byte										  ; //
PrintMatrixWords PROTO, tmatrix : ptr byte, rowarray : ptr byte, colarray : ptr byte, diagonalarray : ptr byte; //
; // -------------------------------------------------------------------------------------------------------------


ClearEAX textequ <mov eax, 0>
ClearEBX textequ <mov ebx, 0>
ClearECX textequ <mov ecx, 0>
ClearEDX textequ <mov edx, 0>
ClearESI textequ <mov esi, 0>
ClearEDI textequ <mov edi, 0>

.data
menuoption byte 0		; //
primes byte 3002 dup(1)	; // Vars for options 1
primelooplimit word 0	; //
totalprimes word 0		; //

rownum = 1
charvar byte 0 
columnbool byte 6 dup(0)	; //
rowbool byte 6 dup(0)		; // bool arrays 1 means row/column/diagonal is a word
diagonalbool byte 2 dup(0)	; //
TableMatrix byte 0h, 0h, 0h, 0h, 0h, 0h
rowsize = ($ - TableMatrix)
			byte 0h, 0h, 0h, 0h, 0h, 0h
			byte 0h, 0h, 0h, 0h, 0h, 0h		
			byte 0h, 0h, 0h, 0h, 0h, 0h		
			byte 0h, 0h, 0h, 0h, 0h, 0h
			byte 0h, 0h, 0h, 0h, 0h, 0h					

.code
main PROC

start:
invoke DisplayMenu, ADDR menuoption
call clrscr

opt1: ; // finds primes in range
cmp menuoption, 1
jne opt2
invoke readprimeinput, ADDR primelooplimit
invoke findprimes, ADDR primes, primelooplimit, ADDR totalprimes
invoke DisplayThem, ADDR primes, primelooplimit, totalprimes
jmp start

opt2: ; // finds words in array
cmp menuoption, 2
jne opt3
invoke FillArray, ADDR TableMatrix
invoke printmatrix, ADDR TableMatrix
invoke FindRowWords, ADDR TableMatrix, ADDR rowbool
invoke FindColumnWords, ADDR TableMatrix, ADDR columnbool
invoke FindDiagonalWords, ADDR TableMatrix, ADDR diagonalbool
invoke PrintMatrixWords, ADDR TableMatrix, ADDR rowbool, ADDR columnbool, ADDR diagonalbool
jmp start


opt3: 
cmp menuoption, 3
jne outofrange
jmp exitprogram


outofrange:
invoke OutOfRangeError
jmp start


exitprogram:
exit
main ENDP


Modulus PROC, keyval : ptr byte
;===========================
; modulus PROC:
;---------------------------
; Discription: Takes Key val and finds modulus base 2.
;			   Leaves registers uneffected
; Recieves: ASCII key value
; Requires: Nothing
; Returns: mod in keyval

push edx
push ebx
push eax

mov edx, keyval
movzx eax, byte ptr [edx]
mov edx, 0
mov ebx, 2h
DIV ebx
mov eax, keyval
mov byte ptr [eax], dl

pop eax
pop ebx
pop edx

ret
Modulus ENDP


DisplayMenu PROC, useropt : ptr byte
;===========================
; DisplayMenu PROC:
;---------------------------
; Discription: Displays menu for input
; Recieves: Pointer to a user option
; Requires: Nothing
; Returns: userinput
.data
mainmenu byte "Option 1:", 0AH, 0DH,
			  "/* Finds primes between (2-n) using", 0AH, 0DH,
			  "   the Sieve of Eratosthes. */", 0AH, 0DH, 0AH, 0DH,
			  "Option 2:", 0AH, 0DH,
			  "/* Generates random 2D array of    ", 0AH, 0DH,
			  "   charaters, half vowels, and     ", 0AH, 0DH,
			  "	  finds words in array. */", 0AH, 0DH, 0AH, 0DH,
			  "Option 3:", 0AH, 0DH,
			  "/* Exit program */", 0AH, 0DH, 0AH, 0DH,
			  "Please enter a option (1-3): ", 0d

.code
call clrscr
mov edx, offset mainmenu
call writestring
call readhex
mov edx, useropt
mov byte ptr [edx], al

ret
DisplayMenu ENDP


readprimeinput PROC, primeslooplimit : ptr word
;===========================
; readprimeinput PROC:
;---------------------------
; Discription: Takes user input for n
; Recieves: Pointer to the loop limit
; Requires: Nothing
; Returns: userinput
.data
primelimitmenu byte "Please enter upperlimit 'n' for ( n <= 3000 )", 0AH, 0DH,
					"for algorithm to find all (primes <= n)", 0AH, 0DH,
					"(n): ", 0d

.code
ninputstart:
mov edx, offset primelimitmenu
call writestring
call readdec

cmp ax, 2			; //  Checks if below 2
jb incorrectninput	; //

cmp ax, 3000		; //  Checks if above 3000
ja incorrectninput	; //
jmp correctninput
incorrectninput:
invoke nInputError  ; //  Displays error
jmp ninputstart		; //  Restarts input

correctninput:
mov edx, primeslooplimit
mov word ptr [edx], ax

ret
readprimeinput ENDP


findprimes PROC, primevalarray : ptr byte, loopval : word, totalofprimes : ptr word
local arrayval : word
;===========================
; findprimes PROC:
;---------------------------
; Discription: Finds prime numbers from 2 to loopval
; Recieves: Pointer loop array, loop limit, and counter
; Requires: Nothing
; Returns: Number of primes and array now is full of prime numbers
mov arrayval, 2
mov bx, 0
movzx ecx, loopval
mov edx, primevalarray 
add edx, 2

findprimesloop:

mov al, byte ptr [edx] ; // If value = 0 skip removal
cmp al, 0 
je continuesearch
invoke removemultiples, primevalarray, loopval, arrayval ; // Removes all mulitples of arrayval up to range
inc bx ; // counts number of primes

continuesearch:
inc edx
inc arrayval
loop findprimesloop

mov edi, totalofprimes
mov word ptr [edi], bx

ret
findprimes ENDP


removemultiples PROC, boolarray : dword, limitvalue : word, itterable : word
;===========================
; removemultiples PROC:
;---------------------------
; Discription: sets all mulitples of a number, up to a limit = 0
; Recieves: Pointer loop array, loop limit, and itterable
; Requires: Nothing
; Returns: nothing but array now has mulitples set to 0
push ebx
push eax
push esi
push edi

mov ebx, boolarray
movzx eax, itterable ; // value to incement by
movzx esi, limitvalue; // loop limit 
sub esi, eax		 ; // correcting limit
movzx edi, itterable
add ebx, eax

setval:
cmp eax, esi ; // checks if beyond range of n
jg exitloop
mov byte ptr [ebx+eax], 0 ; // removes multiple 
add eax, edi	; // inc by the prime value

jmp setval
exitloop:

pop edi
pop esi
pop eax
pop ebx

ret 
removemultiples ENDP


DisplayThem PROC, primearray : ptr byte, primerange : word, numofprimes : word
LOCAL currentvalue : word
;===========================
; DisplayThem PROC:
;---------------------------
; Discription: prints values in a array for a given range
;			   in a grid
; Recieves: Pointer to array and range
; Requires: Nothing
; Returns: Nothing
invoke primenumbermenu, numofprimes, primerange

mov edi, primearray
add edi, 2
movzx ecx, primerange
dec ecx ; // accounts for starting at 0
mov currentvalue, 2
clearedx
mov dh, 2 ; // accounts for 2 lines of menu printed in primenumbermenu PROC
clearebx

primeloop:
mov al, byte ptr [edi] ; // checks if val = 6
cmp al, 0
je continuesearch

call Gotoxy
movzx eax, currentvalue ; // if not print value and increase goto x by 4
call writedec
inc bl

cmp bl, 5 ; // if five values have been printed move next line and make x = 0
je resetgoto
add dl, 5
jmp continuesearch

resetgoto:
mov dl, 0
add dh, 1
mov bl, 0

continuesearch:
inc edi
inc currentvalue
loop primeloop

call crlf
call waitmsg

ret
DisplayThem ENDP


primenumbermenu PROC, primesvalue : word, rangevalue : word
;===========================
; primenumbermenu PROC:
;---------------------------
; Discription: Prints menu for number of primes
; Recieves: total of primes and n
; Requires: Nothing
; Returns: Nothing
.data
menu1 byte "There are ",0d
menu2 byte " prime numbers between 2 and (n = ",0d
menu3 byte ")", 0AH, 0DH, 0d
menu4 byte "--------------------------------------------------", 0AH, 0DH, 0d


.code
call clrscr
mov edx, offset menu1
call writestring
movzx eax, primesvalue
call writedec
mov edx, offset menu2
call writestring
movzx eax, rangevalue
call writedec
mov edx, offset menu3
call writestring
mov edx, offset menu4
call writestring

ret
primenumbermenu ENDP


GenerateRandomChar PROC, ReturnChar : ptr byte
LOCAL tempchar : byte
;===========================
; GenerateRandomChar PROC:
;---------------------------
; Discription: Geneates a random char.
;              Leaves registers uneffected
; Recieves: Pointer to a byte var
; Requires: Nothing
; Returns: Random char
push edx
push eax

mov edx, ReturnChar
mov tempchar, 0			
mov eax, 0FFh
call randomrange
mov tempchar, al
invoke modulus, ADDR tempchar ; // returns if odd/even

cmp tempchar, 1 ; // if odd then generate vowel
jne nonvowel 
invoke GenerateRandomVowel, ADDR tempchar
jmp exitchar

nonvowel: 
invoke GenerateRandomNonvowel, ADDR tempchar

exitchar:
mov al, tempchar
mov byte ptr [edx], al

pop eax
pop edx
ret
GenerateRandomChar ENDP


GenerateRandomVowel PROC, voweladress : ptr byte
;===========================
; GenerateRandomVowel PROC:
;---------------------------
; Discription: Geneates a random vowl.
;              Leaves registers uneffected
;			   To be called by another function not directly
; Recieves: Pointer to a byte var
; Requires: Nothing
; Returns: Random vowl
push edx
push eax

mov edx, voweladress
mov eax, 4
call randomrange

cmp al, 0 
jne vowel2
mov byte ptr [edx], 41h
jmp returnvowel

vowel2:
cmp al, 1
jne vowel3
mov byte ptr [edx], 45h
jmp returnvowel

vowel3:
cmp al, 2
jne vowel4
mov byte ptr [edx], 49h
jmp returnvowel

vowel4:
cmp al, 3
jne vowel5
mov byte ptr [edx], 4Fh
jmp returnvowel

vowel5:
mov byte ptr [edx], 55h

returnvowel:

pop eax
pop edx 
ret
GenerateRandomVowel ENDP


GenerateRandomNonvowel PROC, charadress : ptr byte
;===========================
; GenerateRandomNonvowel PROC:
;---------------------------
; Discription: Geneates a random char (not vowel).
;              Leaves registers uneffected
;			   To be called by another function not directly
; Recieves: Pointer to a byte var
; Requires: Nothing
; Returns: Random char
push edx
push eax 

mov edx, charadress
mov eax, 1Ah
call randomrange
add eax, 41h

cmp al, 41h
jne check2
add al, 1
jmp exitcharval

check2:
cmp al, 45h
jne check3
sub al, 1
jmp exitcharval

check3:
cmp al, 49h
jne check4
add al, 1
jmp exitcharval

check4:
cmp al, 4Fh
jne check5
add al, 1
jmp exitcharval

check5:
cmp al, 55h
jne exitcharval
sub al, 1

exitcharval:
mov byte ptr [edx], al

pop eax
pop edx
ret
GenerateRandomNonvowel ENDP


FillArray PROC, arrayoffset : ptr byte
LOCAL currentchar : byte
;===========================
; FillArray PROC:
;---------------------------
; Discription: Generates an 2D array of random chars
; Recieves: Pointer to 2D array
; Requires: 2D array of 6x6 size
; Returns: Nothing but array is now full
mov edx, arrayoffset
mov currentchar, 0;
mov ecx, 36 ; // total number of elements in 2D array
clearesi ; // row val
mov bl, 0 ; // how to tell if end of row

fillloop:
invoke GenerateRandomChar, ADDR currentchar
cmp bl, 6 	; // checks if end of row
jne notnextrow 
mov bl, 0 ; // resets column counter
add edx, 6 ; // moves to next row
clearesi

notnextrow:
mov al, currentchar
mov byte ptr [edx+esi], al
inc esi
inc bl
loop fillloop

ret 
FillArray ENDP


printmatrix PROC, matrixarray : ptr byte
;===========================
; printmatrix PROC:
;---------------------------
; Discription: Prints 2D array of chars
; Recieves: Pointer to 2D array
; Requires: 2D array of 6x6 size
; Returns: Nothing
.data
matrixprompt byte "The matrix is: ", 0AH, 0DH, 0d

.code
mov edx, offset matrixprompt
call writestring


mov edi, matrixarray
mov ecx, 36
mov dh, 2 ; // acountes for prompt print
mov dl, 0 
clearebx

printmatrixloop:

cmp bl, 6
jne continueprint ;// reset goto if bl = 6
add dh, 2 ; // moves to next row
mov dl, 0
mov bl, 0

continueprint:
mov al, byte ptr [edi]
call Gotoxy
call writechar
inc edi
add dl, 3 
inc bl

loop printmatrixloop

call crlf
ret 
printmatrix ENDP


checkvowel PROC, charbyte : ptr byte
;===========================
; checkvowel PROC:
;---------------------------
; Discription: checks if char is a vowel
; Recieves: Pointer char
; Requires: nothing
; Returns: boolval
push edx
push eax

mov edx, charbyte
mov al, byte ptr [edx]

cmp al, 41h
jne vowelcheck2
mov al, 1
jmp exitvowlproc

vowelcheck2:
cmp al, 45h
jne vowelcheck3
mov al, 1
jmp exitvowlproc

vowelcheck3:
cmp al, 49h
jne vowelcheck4
mov al, 1
jmp exitvowlproc

vowelcheck4:
cmp al, 4Fh
jne vowelcheck5
mov al, 1
jmp exitvowlproc

vowelcheck5:
cmp al, 55h
jne exitvowlproc
mov al, 1
jmp exitvowelcheck


exitvowelcheck:
mov al, 0

exitvowlproc:
mov byte ptr [edx], al

pop eax
pop edx
ret
checkvowel ENDP


FindRowWords PROC, rarray : ptr byte, rowboolarray : ptr byte
local rowvowel : byte, totalvowel : byte, totalrowloops : byte
;===========================
; FindRowWords PROC:
;---------------------------
; Discription: finds rows in array that are words
; Recieves: Pointer to 2D array
; Requires: 2D array of 6x6 size
; Returns: Nothing
mov ecx, 37 ; // allows to run for extra half loop fixes edge case
mov edx, rarray
mov edi, rowboolarray
mov totalrowloops, 0
mov rowvowel, 0 
mov totalvowel, 0
mov bl, 0; // value to know when end of row
clearesi

findrowwordsloop:
cmp bl, 6  			; // checks if at end of row
jne continuerow
cmp totalvowel, 2 ; // are there two vowels
jne notrowword ; // if not skip move to next row
mov byte ptr [edi], 1 ; // sets bool to show which row is word
jmp nextrowword
notrowword:
mov byte ptr [edi], 0
nextrowword:
cmp totalrowloops, 36
je exitrowword 			; // fixes if last char of last row makes row a word (allows to run for one extra half loop)

mov bl, 0
mov totalvowel, 0
clearesi
add edx, 6
inc edi ; // inc to represent current row

continuerow:
mov al, byte ptr [edx+esi]
mov rowvowel, al 
invoke checkvowel, ADDR rowvowel ; // returns if vowel
cmp rowvowel, 1 ; // if not vowel skip
jne notvowel
inc totalvowel

notvowel:
inc esi
inc bl
inc totalrowloops

loop findrowwordsloop

exitrowword:
ret
FindRowWords ENDP


FindColumnWords PROC, carray : ptr byte, columnarray : ptr byte
LOCAL columnvowel : byte, totalcolvowel : byte, totalcolloops : byte
;===========================
; FindColumnWords PROC:
;---------------------------
; Discription: finds columns in array that are words
; Recieves: Pointer to 2D array
; Requires: 2D array of 6x6 size
; Returns: Nothing
mov ecx, 37 ; // allows to run for extra half loop fixes edge case
mov edx, carray
push edx
mov edi, columnarray
mov totalcolloops, 0
mov columnvowel, 0 
mov totalcolvowel, 0
mov bl, 0; // value to know when end of column
clearesi

findcolwords: 
cmp bl, 6
jne continuecol
cmp totalcolvowel, 2
jne notcolword
mov byte ptr [edi], 1 ; // inc bool to represent current column
jmp nextcolword

notcolword:
mov byte ptr [edi], 0
nextcolword:
cmp totalcolloops, 36
je exitcolloop

mov bl, 0
mov totalcolvowel, 0
pop edx ; // returns to top of column
push edx ; // saves spot
inc esi ; // moves to next column
inc edi

continuecol:
mov al, byte ptr [edx+esi] ; // 
mov columnvowel, al
invoke checkvowel, ADDR columnvowel
cmp columnvowel, 1
jne notcolvowel
inc totalcolvowel

notcolvowel:
add edx, 6	; // moves to next column place
inc bl
inc totalcolloops

loop findcolwords

exitcolloop:
ret
FindColumnWords ENDP


FindDiagonalWords PROC, darray : ptr byte, diagonalarray : ptr byte
LOCAL diagonalvowel : byte, totaldiavowel : byte
;===========================
; FindDiagonalWords PROC:
;---------------------------
; Discription: finds diagonals in array that are words
; Recieves: Pointer to 2D array
; Requires: 2D array of 6x6 size
; Returns: Nothing
mov ecx, 6 ; // allows to run for extra half loop fixes edge case
push ecx
mov edx, darray
push edx
mov edi, diagonalarray
mov diagonalvowel, 0 
mov totaldiavowel, 0
clearesi

firstdiagonal:
mov al, byte ptr [edx+esi] ; // grabs diagonal value
mov diagonalvowel, al
invoke checkvowel, ADDR diagonalvowel ; // checks if vowel

cmp diagonalvowel, 1 ; // checks if vowel
jne notdiavowel
inc totaldiavowel ; // add to total

notdiavowel:
add edx, 6 ; // move to next diagoanl
inc esi

loop firstdiagonal

cmp totaldiavowel, 2 ; // checks if first diagonal is a word
jne notdiaword1
mov byte ptr [edi], 1
jmp nextdia
notdiaword1:
mov byte ptr [edi], 0
nextdia:
pop edx
pop ecx
inc edi
dec esi ; // accounts for esi = 6 at the end of the first loop
mov totaldiavowel, 0

seconddiagonal:
mov al, byte ptr [edx+esi] ; // gets diagonal char
mov diagonalvowel, al
invoke checkvowel, ADDR diagonalvowel

cmp diagonalvowel, 1
jne notdiavowel2
inc totaldiavowel

notdiavowel2:
add edx, 6
dec esi

loop seconddiagonal

cmp totaldiavowel, 2 ; // checks if second diagonal is word
jne notdiaword2
mov byte ptr [edi], 1 ; // if it is add to bool array
jmp exitdiaproc
notdiaword2:
mov byte ptr [edi], 0; // removes from array
exitdiaproc:

ret
FindDiagonalWords ENDP


PrintMatrixWords PROC, tmatrix : ptr byte, rowarray : ptr byte, colarray : ptr byte, diagonalarray : ptr byte
;===========================
; PrintMatrixWords PROC:
;---------------------------
; Discription: Prints words in matrix array
; Recieves: Pointer to 2D array, and bool arrays
; Requires: 2D array of 6x6 size
; Returns: Nothing
.data
printmatrixprompt byte "The words from this matrix is/are:", 0AH, 0DH, 0d


.code
call crlf							; //
mov edx, offset printmatrixprompt	; // formating
call writestring					; //

; // print for row vals:
mov ecx, 6
mov edx, tmatrix
push edx
mov edi, rowarray
mov bl, 0 ; // pointer to current row
mov bh, 0 ; // number of words printed

rowsearch:
mov al, byte ptr [edi] ; //
cmp al, 1			   ; // checks for 1 val (means row is a word)
jne continuerowsearch  ; // 

push ecx
push edx

mov al, 6
mul bl
movzx eax, ax
add edx, eax
mov ecx, 6
clearesi

cmp bh, 0			; // Adds formation for for words (except the first printed)
je noformatingrow 	; //
mov al, 2Ch
call writechar		; // prints , then a space : (", ")
mov al, 20h
call writechar

noformatingrow:
printrow:

mov al, byte ptr [edx+esi] 
call writechar				; // prints a row of the matrix
inc esi
loop printrow

inc bh 
pop edx
pop ecx

continuerowsearch:
inc edi
inc bl
loop rowsearch

pop edx ; // restores base value for matrix
push edx
mov edi, colarray
mov ecx, 6
mov bl, 0 ; // keeps track of column
clearesi

colsearch: 	; // Prints columns
mov al, byte ptr [edi]
cmp al, 1
jne continuecolsearch

push ecx
push edx

mov ecx, 6
movzx esi, bl

cmp bh, 0			; // Adds formation for for words (except the first printed)
je noformatingcol 	; //
mov al, 2Ch
call writechar		; // prints , then a space : (", ")
mov al, 20h
call writechar

noformatingcol:
colprint:
mov al, byte ptr [edx+esi]
call writechar
add edx, 6 ; // moves to next column value
loop colprint

inc bh
pop edx 
pop ecx

continuecolsearch:
inc edi
inc bl
loop colsearch

pop edx ; // restores base maxtrix adress
mov edi, diagonalarray
mov ecx, 2 ; // only two possible diagonals
mov bl, 0 ; // keeps track of current diagonal
clearesi

diagonalsearch:
mov al, byte ptr [edi]
cmp al, 1
jne continuediasearch

cmp bh, 0			; // Adds formation for for words (except the first printed)
je noformatingdia 	; //
mov al, 2Ch
call writechar		; // prints , then a space : (", ")
mov al, 20h
call writechar
noformatingdia:

push ecx
push edx
mov ecx, 6

cmp bl, 1
jne leftdiagonal
mov esi, 5 ; // sets colum value to last colum 

rightdiagonal: ; // prints diagonal from right to left
mov al, byte ptr [edx+esi]
call writechar
dec esi
add edx, 6
loop rightdiagonal
jmp exitprintdia

leftdiagonal: ; // prints diagaonal from left to right
mov al, byte ptr [edx+esi]
call writechar
inc esi
add edx, 6
loop leftdiagonal

exitprintdia:
pop edx 
pop ecx
inc bh

continuediasearch:
inc bl
inc edi
loop diagonalsearch

call crlf
call waitmsg

ret
PrintMatrixWords ENDP


OutOfRangeError PROC
;===========================
; OutOfRangeError PROC:
;---------------------------
; Discription: Pints error for wrong menu inputs
; Recieves: Nothing
; Requires: Nothing
; Returns: Nothing
.data
menuerror1 byte "Value entered is not a menu option. ", 0AH, 0DH,
		        "Please enter an option (1-3)", 0AH, 0DH, 0d

.code
mov edx, offset menuerror1
call writestring
call waitmsg
ret 
OutOfRangeError ENDP


nInputError PROC
;===========================
; nInputError PROC:
;---------------------------
; Discription: Pints error for wrong n input 
;				for option 1
; Recieves: Nothing
; Requires: Nothing
; Returns: Nothing
.data
nerror byte "Value given for /* n */ is incorrect.", 0AH, 0DH, 
			"Please enter a value between 2 and 3000.", 0AH, 0DH, 0d
			
.code
mov edx, offset nerror
call writestring
call waitmsg
call clrscr
ret
nInputError ENDP



END main