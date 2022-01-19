TITLE pultorakHW6.asm
;// Author:  Michael Pultorak
;// Date:    Nov 2021
;// Description: This program take a string as input, makes uppercase, and removes non chars
;// 			then it will then encrypt and decrypt based on a user key.
;// 1.  The user enters a string of no more than 25 characters.
;//     The entered string is converted to upper case.
;//     The entered string has all non - letter elements removed.
;// 2.  Enters a key.
;// 3. 	Encrypts.
;// 4.  Decrypts.
;// 5.  Prints string
;// 6.  Exit
;// ====================================================================================

include Irvine32.inc


ClearEAX textequ <mov eax, 0>
ClearEBX textequ <mov ebx, 0>
ClearECX textequ <mov ecx, 0>
ClearEDX textequ <mov edx, 0>
ClearESI textequ <mov esi, 0>
ClearEDI textequ <mov edi, 0>


.data
userstring byte 151 DUP(0)
userkey byte 151 DUP(0)
workingarray byte 151 DUP(0)
userstringlen byte 0
userkeylen byte 0
useroption byte 0
stringcheck byte 0 
keycheck byte 0

.code
; // PROTOTYPES: 
DisplayMenu PROTO, useropt : ptr byte
EnterString PROTO, stringval : ptr byte, lengthval : ptr byte
RemoveNonletters PROTO, stringpointer : ptr byte, lenpointer : ptr byte, lenval : byte, temparray : ptr byte
MakeUppercase PROTO, straddress : ptr byte, strlengthval : byte
EnterKey PROTO, keypointer : ptr byte, keylenpointer : ptr byte
FixKeyLen PROTO, keyvalpointer : ptr byte, keyvallenpointer : ptr byte, userstrlen : byte, userkeylenval : byte, newkey : ptr byte
Modulus PROTO, keyval : byte
encrypt PROTO, UserKeyPointer : ptr byte, UserStrPointer : ptr byte, stringlength : byte
decrypt PROTO, UserKeyPtr : ptr byte, UserStrPtr : ptr byte, strlen : byte
CleanArray PROTO, ArrayPtr : ptr byte
StringError PROTO, strchoice : ptr byte
KeyError PROTO, keychoice : ptr byte
PrintIt PROTO, strpointer : ptr byte, stringlenvalue : byte
question PROTO, pointerpass : dword
keyquestion PROTO, keycheckptr : ptr byte
stringquestion PROTO, strcheckptr : ptr byte
outofrangeopt PROTO

main PROC

start:
invoke displaymenu, ADDR useroption ; // Prints string and gets input

call clrscr
opt1: ; Takes userinput, removes non chars, and makes uppcase
cmp useroption, 1
jne opt2 
invoke EnterString, ADDR userstring, ADDR userstringlen 
invoke RemoveNonletters, ADDR userstring, ADDR userstringlen, userstringlen, ADDR workingarray
invoke MakeUppercase, ADDR userstring, userstringlen
invoke PrintIt, ADDR userstring, userstringlen
mov stringcheck, 1

cmp keycheck, 1 ; // checks if key is in system
je continuemenuk
invoke keyquestion, ADDR keycheck ; // asks if user wants to enter key
cmp keycheck, 1
jne continuemenuk
mov useroption, 2
jmp opt2
continuemenuk:
jmp start


opt2: ; Takes userinput, then fixes length to match string
cmp useroption, 2 
jne check1
invoke EnterKey, ADDR userkey, ADDR userkeylen
mov keycheck, 1

cmp stringcheck, 1 ; // checks if string is in system
je continuemenus
invoke stringquestion, ADDR stringcheck ; // asks if user wants to enter string

cmp stringcheck, 1
jne continuemenus
mov useroption, 1
jmp opt1
continuemenus:
jmp start

check1: ; // Checks if a string has been entered
cmp useroption, 6 	; // Retains quit functionality 
je quitit 			; // when a string has not been entered
cmp stringcheck, 0 
jne check2
invoke StringError, ADDR stringcheck
cmp stringcheck, 1
jne continuestr
mov useroption, 1
jmp opt1
continuestr:
jmp start

check2: ; // Checks if a key has been entered
cmp keycheck, 0 ; // Checks if a key has been entered
jne opt3	
invoke KeyError, ADDR keycheck
cmp keycheck, 1
jne continuekey
mov useroption, 2
jmp opt2
continuekey:
jmp start

opt3: ; Takes user string and key, then encrypts using base 1A
cmp useroption, 3
jne opt4
mov al, userstringlen
cmp userkeylen, al ; // accounts for a new string being entered without a new key
je nofixlene
invoke FixKeyLen, ADDR userkey, ADDR userkeylen, userstringlen, userkeylen, ADDR workingarray
nofixlene:
invoke encrypt, ADDR userkey, ADDR userstring, userstringlen
invoke PrintIt, ADDR userstring, userstringlen
jmp start


opt4: ; Takes user string and key, then decrypts using base 1A
cmp useroption, 4
jne opt5
mov al, userstringlen
cmp userkeylen, al ; // accounts for a new string being entered without a new key
je nofixlend										
invoke FixKeyLen, ADDR userkey, ADDR userkeylen, userstringlen, userkeylen, ADDR workingarray
nofixlend:
invoke decrypt, ADDR userkey, ADDR userstring, userstringlen
invoke PrintIt, ADDR userstring, userstringlen
jmp start


opt5: ; prints string to terminal
cmp useroption, 5
invoke PrintIt, ADDR userstring, userstringlen
jne opt6
jmp start


opt6: ; Quits program
cmp useroption, 6
jne outofrange
jmp quitit

outofrange:
invoke outofrangeopt
jmp start



quitit:
exit
main ENDP

DisplayMenu PROC, useropt : ptr byte
;===========================
; DisplayMenu PROC:
;---------------------------
; Discription: Displays menu for input
; Recieves: Pointer to a user option
; Requires: Nothing
; Returns: userinput
.data
mainmenu byte "MAIN MENU", 0AH, 0DH,
			  "--------------", 0AH, 0DH,
			  "1. Enter a string", 0AH, 0DH,
			  "2. Enter a key", 0AH, 0DH,
			  "3. Encrypt string", 0AH, 0DH, 
			  "4. Decrypt string", 0AH, 0DH,
			  "5. Display string", 0AH, 0DH,
			  "6. Exit program", 0AH, 0DH,
			  "Please enter an option (1,9): ", 0d
.code

call clrscr
mov edx, offset mainmenu
call writestring
call readhex
mov edx, useropt
mov byte ptr [edx], al

ret
DisplayMenu ENDP


EnterString PROC, stringval : ptr byte, lengthval : ptr byte
;===========================
; EnterString PROC:
;---------------------------
; Discription: Takes string input and puts into str pointer
; Recieves: Pointer to string and length
; Requires: Nothing
; Returns: String and len of string
.data
stringprompt byte "Please enter a string between (1-150) charaters long: ", 0d

.code

mov ecx, 150
mov edx, offset stringprompt
call writestring
mov edx, stringval
call readstring
mov esi, lengthval
mov byte ptr [esi], al

ret
EnterString ENDP


EnterKey PROC, keypointer : ptr byte, keylenpointer : ptr byte
;===========================
; EnterKey PROC:
;---------------------------
; Discription: Takes key input and returns key in key pointer
; Recieves: Pointer to string and length
; Requires: Nothing
; Returns: String and len of string
.data
keyprompt byte "Please enter a key between (1-150) characters: ", 0d

.code

mov ecx, 150
mov edx, offset keyprompt
call writestring
mov edx, keypointer
call readstring
mov esi, keylenpointer
mov byte ptr [esi], al

ret
EnterKey ENDP


FixKeyLen PROC, keyvalpointer : ptr byte, keyvallenpointer : ptr byte, userstrlen : byte, userkeylenval : byte, newkey : ptr byte
LOCAL newkeysize : byte
;===========================
; FixKeyLen PROC:
;---------------------------
; Discription: Takes key input and lets number of character to match string
; Recieves: Pointer to key and len.
; 			Size of string.
; Requires: String to have been entered
; Returns: Key and len of key

; // Setting up variables

mov newkeysize, 0
mov bl, userkeylenval
mov bh, 0
movzx ecx, userstrlen
mov edx, keyvalpointer
mov edi, newkey
push ecx
push edx
push edi


clearesi
fixlen:
cmp bh, bl ; // Are we at the end of the key but not at the end of the loop?
je fixitterable ; // If yes fix index
jmp continueloop; // if not continue

fixitterable:
movzx ebx, userkeylenval
sub edx, ebx ; // moves index back to start of key
mov bh, 0

continueloop:
mov al, byte ptr [edx]
mov byte ptr [edi], al ; // puts key[i] into local key[i]
inc edi 
inc edx
inc bh
inc newkeysize
loop fixlen

; // Now we need to replace current key
movzx ecx, userkeylenval
pop edi ;// adress of new key
pop edx ;// adress of old key
mov esi, edx

cleanstring: ;// removes all elements of old key
mov byte ptr [esi], 0
inc esi
loop cleanstring

pop ecx
replacekey: ;// puts new key into old key 
mov al, byte ptr [edi]
mov byte ptr [edx], al
inc edi
inc edx
loop replacekey

mov dl, newkeysize		  ;//
mov esi, keyvallenpointer ;// Replaces key len
mov byte ptr [esi], dl	  ;//

ret
FixKeyLen ENDP


Modulus PROC, keyval : byte
LOCAL shiftval : dword
;===========================
; modulus PROC:
;---------------------------
; Discription: Takes Key val and finds modulus base 1A.
;			   Leaves registers other than eax uneffected
; Recieves: ASCII key value
; Requires: Nothing
; Returns: ascii shift value in eax

push edx
push ebx

movzx eax, keyval
mov edx, 0
mov ebx, 01Ah
DIV ebx
mov shiftval, edx ; // moves remainder into shiftval

mov eax, shiftval ;// moves value into ax for return

pop ebx
pop edx

ret
Modulus ENDP


encrypt PROC, UserKeyPointer : ptr byte, UserStrPointer : ptr byte, stringlength : byte
LOCAL currentkey : byte
;===========================
; encrypt PROC:
;---------------------------
; Discription: Takes modulus base 1a of key and shifts string my values
; Recieves: String and key pointers. 
;			length of string.
; Requires: string and key to be same length
; Returns: nothing but string is now encrypted

movzx ecx, stringlength ;//
mov edx, UserStrPointer ;// setting up variables for loop
mov edi, UserKeyPointer ;//

encryptstr:
mov bl, byte ptr[edx]; // bl = currentascii
mov bh, byte ptr [edi]; // bh = currentkey
mov currentkey, bh
INVOKE modulus, currentkey ; // finds modulus base 1A of key val 
add bl, al

cmp bl, 5Ah 		
jbe ContinueEncrypt ; // checkes if value is in range
sub bl, 1Ah			; // if not subtracts 1a from shift

ContinueEncrypt:
mov byte ptr [edx], bl ; // Replaces ascii string
inc edx
inc edi
loop encryptstr

ret
encrypt ENDP


decrypt PROC, UserKeyPtr : ptr byte, UserStrPtr : ptr byte, strlen : byte
LOCAL currentkeyval : byte
;===========================
; decrypt PROC:
;---------------------------
; Discription: Takes modulus base 1a of key and shifts string my values
; Recieves: String and key pointers. 
;			length of string.
; Requires: string and key to be same length
; Returns: nothing but string is now decrypted

movzx ecx, strlen
mov edx, UserStrPtr 
mov edi, UserKeyPtr  

decryptstr:
mov bl, byte ptr [edx] ; // bl = currentasci
mov bh, byte ptr [edi] ; // bh = currentkeyval
mov currentkeyval, bh
INVOKE modulus, currentkeyval

sub bl, al
cmp bl, 41h
jge continuedecrypt
add bl, 1Ah

continuedecrypt:
mov byte ptr [edx], bl
inc edx
inc edi
loop decryptstr

ret
decrypt ENDP



RemoveNonletters PROC, stringpointer : ptr byte, lenpointer : ptr byte, lenval : byte, temparray : ptr byte
LOCAL newsize : byte
;===========================
; RemoveNonletters PROC:
;---------------------------
; Discription: Removes nonletter elemnts of a string
; Recieves: Pointer to string and length. 
;           It also recieves the length value
; Requires: Nothing
; Returns: Nothing

mov newsize, 0
mov ebx, lenpointer
movzx ecx, lenval
mov edi, temparray
mov esi, stringpointer
push ecx
push edi
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
mov byte ptr [edi], al
inc newsize
inc edi

remove: ;// Skips non letter values
inc esi
loop strloop

pop esi
pop edi
pop ecx
push ebx
clearebx
movzx edx, newsize

replacestring:  ;// Replaces string with generated array of letter elements
cmp ebx, edx
jbe charreplace
mov byte ptr [esi], 0
jmp contloop

charreplace:
mov al, byte ptr [edi]
mov byte ptr [esi], al

contloop:
inc edi
inc esi
inc ebx
loop replacestring

pop ebx
mov al, newsize
mov byte ptr [ebx], al ;// Sets new str length

ret
RemoveNonletters ENDP


MakeUppercase proc, straddress : ptr byte, strlengthval : byte
;===========================
; MakeUppercase PROC:
;---------------------------
; Discription: Makes all lowercase letters uppercase
; Recieves: Pointer to string and length value. 
; Requires: String to have no non character elements
; Returns: Nothing

clearesi
mov edx, straddress
movzx ecx, strlengthval

L2:
mov al, byte ptr [edx+esi]
cmp al, 5Ah
jbe keepgoing  ;// Not lowercase
xor al, 20h     ;// make uppercase
mov byte ptr [edx+esi], al ;// store lower case letter.

keepgoing:
inc esi
loop L2

ret
MakeUppercase endp


CleanArray PROC, ArrayPtr : ptr byte
;===========================
; CleanArray PROC:
;---------------------------
; Discription: Removes all values in a array
; Recieves: Pointer to array
; Requires: Nothing
; Returns: Nothing, but array is now empty

mov ecx, 150
mov edx, ArrayPtr

sanitizearary:
mov byte ptr [edx], 0h
inc edx
loop sanitizearary

ret
CleanArray ENDP


PrintIt PROC, strpointer : ptr byte, stringlenvalue : byte
;===========================
; PrintIt PROC:
;---------------------------
; Discription: prints values is string
; Recieves: Pointer to array and string length
; Requires: Nothing
; Returns: Nothing
.data
printmessage byte "The current value of the string is: ", 0d


.code
mov edx, offset printmessage ; // Prints message before string
call writestring			 ; // 

movzx ecx, stringlenvalue
mov edx, strpointer
mov edi, 0 			; // value for checking if five chars have been printed

printstring:
cmp edi, 5 		; // Has 5 chars been printed
jne printchar	; // If not continue printing
mov al, 20h		
call writechar	; // If yes then print space
inc ecx			; // Inc ecx to account for extra loop
mov edi, 0		
jmp nextloop 	; // Jump to next loop

printchar:
mov al, byte ptr [edx]
call writechar			; // Print string char
inc edx
inc edi

nextloop:
loop printstring

call crlf
call waitmsg


ret
PrintIt ENDP


keyquestion PROC, keycheckptr : ptr byte
;===========================
; keyquestion PROC:
;---------------------------
; Discription: asks if user wants to enter a key
; Recieves: pointer to choice
; Requires: Nothing
; Returns: Choice bool
.data
keyquestionprompt byte  "You have not entered a key yet.",0AH, 0DH, 
						"Would you like to enter a key? (y/n): ",0AH, 0DH, 0d

.code
call clrscr
mov edx, offset keyquestionprompt
call writestring
invoke question, keycheckptr

ret
keyquestion ENDP


stringquestion PROC, strcheckptr : ptr byte
;===========================
; stringquestion PROC:
;---------------------------
; Discription: asks if user wants to enter a string
; Recieves: pointer to choice
; Requires: Nothing
; Returns: Choice bool
.data
strquestionprompt byte  "You have not entered a string yet.",0AH, 0DH, 
						"Would you like to enter a string? (y/n): ",0AH, 0DH, 0d

.code
call clrscr
mov edx, offset strquestionprompt
call writestring
invoke question, strcheckptr

ret
stringquestion ENDP


question PROC, pointerpass : dword
;===========================
; uestion PROC:
;---------------------------
; Discription: reads input for a question leaves regs uneffected
; Recieves: pointer to choice
; Requires: Nothing
; Returns: Choice bool
push eax

call readchar

cmp al, 79h		; // Checks for lowercase y
je enterstr		; // 

cmp al, 59h		; // Checks for uppercase Y
je enterstr		; //
jmp exitproc

enterstr:
mov eax, pointerpass
mov byte ptr [eax], 1
exitproc:

pop eax
ret
question ENDP


; ======================= Error messages =========================


StringError PROC, strchoice : ptr byte
;===========================
; StringError PROC:
;---------------------------
; Discription: Displays error if a 
;              	string has not been entered.
;				Asks if user wants to enter a string
; Recieves: Nothing
; Requires: Nothing
; Returns: choice bool

.data
stringerrorprompt byte "Error: /* Please enter a STRING before continuing */", 0AH, 0DH,
					   "----------------------------------------------------", 0AH, 0DH,
					   "Would you like to enter a string? (y/n): ",0AH, 0DH, 0d	
.code

mov edx, offset stringerrorprompt
call writestring
invoke question, strchoice

ret
StringError ENDP
					   

KeyError PROC, keychoice : ptr byte
;===========================
; KeyError PROC:
;---------------------------
; Discription: Displays error if a 
;              	key has not been entered.
;				Asks if user wants to enter a key
; Recieves: Nothing
; Requires: Nothing
; Returns: choice bool

.data
keyerrorprompt byte "Error: /* Please enter a KEY before continuing */", 0AH, 0DH,
					   "----------------------------------------------", 0AH, 0DH,
					   "Would you like to enter a key? (y/n): ",0AH, 0DH, 0d
					   
.code

mov edx, offset keyerrorprompt
call writestring
invoke question, keychoice

ret
KeyError ENDP


outofrangeopt PROC
;===========================
; outofrangeopt PROC:
;---------------------------
; Discription: error if non menu option is entered
; Recieves: Nothing
; Requires: Nothing
; Returns: Nothing
.data
outofrangeprompt byte "Error: /* Please value given is not in menu's range */", 0AH, 0DH,
					   "-----------------------------------------------------", 0AH, 0DH, 0d
.code
mov edx, offset outofrangeprompt
call writestring
call waitmsg

ret
outofrangeopt ENDP


END main