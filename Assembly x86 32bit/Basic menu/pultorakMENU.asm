TITLE pultorakMENU.asm
;// Author:  Michael Pultorak
;// Date:    Oct 2021
;// Description: This program presents a menu allowing the user to pick a menu option
;//              which then performs a given task.
;// 1.  The user enters a string of no more than 100 characters.
;// 2.  The entered string is converted to lower case.
;// 3.  The entered string has all non - letter elements removed.
;// 4.  Is the entered string a palindrome.
;// 5.  Print the string.
;// 6.  Exit
;// ====================================================================================

Include Irvine32.inc 

;//Macros
ClearEAX textequ <mov eax, 0>
ClearEBX textequ <mov ebx, 0>
ClearECX textequ <mov ecx, 0>
ClearEDX textequ <mov edx, 0>
ClearESI textequ <mov esi, 0>
ClearEDI textequ <mov edi, 0>
Newline  textequ <0ah, 0dh>
maxLength = 51d

.data
stringcheck byte 0
UserOption byte 0h               ;// holds user option from menu
theString byte maxLength dup(0)	;// declare the array to hold entered string of length maxlength
theStringLen byte 0              ;// holds length of entered string 

.code
main PROC

call ClearRegisters          ;// clears registers

startHere:                   ;// starting point to redisplay menu

mov ebx, OFFSET UserOption   ;// Passing address of UserOption in ebx to display Menu Proc
call displayMenu

;// setting up for future procedure calls
mov edx, offset theString    ;// edx holds the offset of the string
mov ecx, lengthof theString  ;// holds the length of the string

call clrscr
;// find procedure to call
opt1:
cmp useroption, 1             ;// useroption = 1
jne opt2
mov ebx, offset thestringlen  ;// will hold the length of the entered string
mov stringcheck, 1 			  ;// sets that a string has been provided by user
call option1
jmp starthere

opt2:
cmp stringcheck, 0			  ;// Checks if a string has been entered
je stringerror	
cmp useroption, 2             ;// useroption = 2
jne opt3
movzx ecx, thestringlen       ;// sets the loop count for option 2 since a string has been entered
call option2
jmp starthere

opt3:
cmp useroption, 3             ;// useroption = 3    
jne opt4
movzx ecx, thestringlen       ;// sets the loop count
mov edx, offset theString
mov ebx, offset thestringlen  
call option3
jmp starthere

opt4:
cmp useroption, 4
jne opt5
movzx ecx, theStringLen
mov edx, offset theString
call option4
jmp starthere

opt5:                         
cmp useroption, 5             ;// useroption = 5  
jne opt6
call option5
call crlf
call waitmsg
jmp starthere

opt6:
cmp useroption, 6             ;// useroption = 5  
jne oops                      ;// invalid entry
jmp quitit

oops:                         ;// invalid option entered
call errorMsg
jmp starthere  

stringerror:
cmp useroption, 6  
je opt6						  ;// useroption = 6  
cmp useroption, 6
ja oops						  ;// invalid number entry
call strerror				  
jmp startHere

quitit:
exit
main ENDP

;// Procedures
;// ===============================================================
DisplayMenu Proc
;// Description:  Displays the Main Menu to the screen and gets user input
;// Receives:  Offset of UserOption variable in ebx
;// Returns:  User input will be saved to UserOption variable

.data
MainMenu byte 'MAIN MENU', 0Ah, 0Dh,
              '==========', 0Ah, 0Dh,
              '1. Enter a String:', 0Ah, 0Dh,
              '2. Convert all elements to lower case: ',0Ah, 0Dh,
              '3. Remove all non-letter elements: ',0Ah, 0Dh,
              '4. Determine if the string is a palindrome: ',0Ah, 0Dh,
              '5. Display the string: ',0Ah, 0Dh,
              '6. Exit: ',0Ah, 0Dh, 0Ah, 0Dh,
              'Please enter a number between 1 and 6 -->  ', 0h

.code
push edx  				      ;// preserves current value of edx - the strings offset
call clrscr
mov edx, offset MainMenu   ;// required by WriteString
call WriteString
call readhex			      ;// get user input
mov byte ptr [ebx], al	   ;// save user input to UserOption
pop edx    				      ;// restores current value of edx

ret
DisplayMenu ENDP

;//--------------------------------------------------------------------------

option1 proc uses edx ecx
;// Description: Gets string from user.
;// Receives:  Address of string
;// Returns:   String is modified and length of entered string is in saved in theStringLen

.data
option1prompt byte 'Please enter a string of characters (', 0h
option1prompt2 byte ' or less): ', newline, '--->   ', 0h

.code
push edx       ;//saving the address of the string pass in.

mov edx, offset option1prompt
call writestring
mov eax, maxlength
call writedec
mov edx, offset option1prompt2
call writeString

pop edx
;// add procedure to clear string
call readstring
mov byte ptr [ebx], al     ;//length of user entered string, now in thestringlen

ret
option1 endp

;// ------------------------------------------------------------------------------------

option2 proc 
;// Description:  Converts all elements to lower case
;// Receives:  address of string in edx, esi = 0h
;// Returns:  noting, but string is now lower case.

push esi
call option5

L2:
mov al, byte ptr [edx+esi]
cmp al, 41h
jb keepgoing  ;// not a letter
cmp al, 5ah
ja keepgoing  ;// not a letter
or al, 20h     ;// make lowercase
mov byte ptr [edx+esi], al ;// store lower case letter.

;// not a letter, need to skip.
keepgoing:
inc esi
loop L2

pop esi
call option5 
call waitmsg
ret
option2 endp

;// ------------------------------------------------------------------------------
option3 PROC
;// Description:  removes all non-letter elements.  There is no requirement for 
;//               option2 to have been executed.
;// Receives:  ecx - length of string
;//            edx - offset of string
;//            ebx - offset of string length variable
;//            esi preserved
;// Returns:   nothing, but the string will have all non-letter elements removed


.data
temparray byte 51 dup(0)
newsize byte 0

.code
call option5
push esi
push ecx
clearedi
mov esi, edx
push esi


strloop:
cmp byte ptr [esi], 41h ; // compares to lowest captal ascii hex val: ("A")
jb remove
cmp byte ptr [esi], 5Ah; // compares to highest capital ascii hex val: ("Z")
jbe continue
cmp byte ptr [esi],  61h; // compares to lowest lowercase ascii hex val: ("a")
jb remove
cmp byte ptr [esi], 7Ah; // compares to highest lowercase ascii hex val: ("z") 
jbe continue
jmp remove

continue: ; // Moves letter values into temparray
mov al, byte ptr [esi]
mov [temparray+edi], al
inc newsize
inc edi

remove: ;// Skips non letter values
inc esi
loop strloop

pop esi
pop ecx
clearedi


replacestring:  ;// Replaces string with generated array of letter elements / clears temparray
mov al, [temparray+edi]
mov [temparray+edi], 0
mov byte ptr [esi], al
inc edi
inc esi
loop replacestring

mov al, newsize
mov byte ptr [ebx], al ;// Sets new str length
call option5 ;// Prints new string
call waitmsg
pop esi
ret
option3 ENDP

;// ------------------------------------------------------------------------

option4 Proc
;// Description: Determines if a string is palindrome
;// Receives:  ecx - length of string
;//            edx - offset of string 
;// Returns: nothing
;// Requires: nothing
.data
opt4prompt byte "The current value of the string: ", 0d
opt4pass byte " is palindromic.", 0d
opt4fail byte " is not palindromic.", 0d

.code
push edx
mov esi, ecx
dec esi						;// esi: end of str
clearedi					;// edi: start of str

mov edx, offset opt4prompt
call writeString 			;// Prints prompt: "The current value of the string: "

pop edx
call writeString			;// prints current value of str 


palindrome:
mov al, byte ptr [edx+esi] ;// checks if string is equal by itterating forward and backwards
mov ah, byte ptr [edx+edi] ;// 
cmp al, ah 				   ;// If the two letters do not equal, loop is exited
jne exitloop

dec esi 
inc edi
loop palindrome

mov edx, offset opt4pass	;// If loop does not fail print pass message and exit proc
call writeString
jmp endproc

exitloop:					;// If a value does not agree print fail message and exit proc
mov edx, offset opt4fail
call writeString

endproc: 					;// exit proc
call crlf
call waitmsg
ret
option4 ENDP

option5 proc 
;// Description:  Displays the string.
;// Receives: address of string in edx
;// Returns:  nothing

.data
option5prompt byte 'The current value of the string is: ', 0h

.code
;// call clrscr
push edx	;// save the address of the string to write prompt
mov edx, offset option5prompt
call writestring
pop edx
call writestring ;// write the string
call crlf

ret
option5 endp

;// Utilities
;//=================================================================
ClearRegisters Proc
;// Description:  Clears the registers EAX, EBX, ECX, EDX, ESI, EDI
;// Requires:  Nothing
;// Returns:  Nothing, but all registers will be cleared.

cleareax
clearebx
clearecx
clearedx
clearesi
clearedi

ret
ClearRegisters ENDP

;// -------------------------------------------------------------
errorMsg PROC
;// Description:  Displays Error Message on invalid entry
;// Receives :    Nothing
;// Returns :     Nothing

.data
errormessage byte 'You have entered an invalid option. Please try again.', Newline, 0h

.code
push edx                      ;// Save value in edx
mov edx, offset errormessage
call writestring
call waitmsg
pop edx                       ;// restore value in edx

ret
errorMsg ENDP
;// -------------------------------------------------------------

;----------------------------------------------------------------
StrError PROC
; // ------------------------------------------------------------
; // Description: Error for opt 2 - 5 when a string has not been given
; // Receives: Nothing
; // Requires: Nothing

.data
strerrormessage byte 'Option 1:  /*Enter a string */   is required before using other functionalities.', 0AH, 0DH,
				  'Please enter a string before continuing.', 0AH, 0DH
 
.code
push edx
mov edx, offset strerrormessage
call writeString
call waitmsg
pop edx

ret
StrError ENDP
; // ------------------------------------------------------------


END main

