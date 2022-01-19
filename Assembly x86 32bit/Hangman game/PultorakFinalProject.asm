TITLE PultorakFinalProject.asm
;// Author:  Michael Pultorak
;// Date:    Dec 2021
;// Description: This program creates a hangman game
;//
;// 1.  plays hangman
;// 2.  Exit program
;// ====================================================================================

include Irvine32.inc

printmainmenu PROTO, mainopt : ptr byte
printrules PROTO
randomwordval PROTO, randomstore : ptr byte
MyStrLength PROTO, wordarray : ptr byte, wordlenpointer : ptr byte, wordstrpicked : ptr byte
BuildGameArray PROTO, gamedisplayptr : ptr byte, wordlenval : byte
PrintGameMenu PROTO, wordchoicesleft : byte, letterchoicesleft : byte, gamearrayptr : ptr byte, userchoice : ptr byte
PrintLetterGuess PROTO, userletterguessptr : ptr byte
findLetter PROTO, thestring : dword, startingindex : byte, theletter : byte, thestrlen : byte, letterreturnval : ptr byte, firstcall : byte
placeLetters PROTO, gamemenustring : ptr byte, pickedstring: ptr byte, chosenletter : byte, stringlen : byte, lettersreturn : ptr byte
PrintWordGuess PROTO, strpointer : ptr byte, strguesslen : ptr byte
MakeUpperCase PROTO, userwordguessptr : ptr byte, userwordguesslenval : byte
RemoveNonletters PROTO, stringpointer : ptr byte, lenpointer : ptr byte, lenval : byte, temparray : ptr byte
CleanArray PROTO, arrayptr : ptr byte, arraylen : byte
WordCheck PROTO, wordguesspointer : ptr byte, gamestringpointer : ptr byte, gamestringlen : byte, wordguesslen : byte, boolreturn : ptr byte
LetterCheck PROTO, letterval : byte, boolletterptr : ptr byte
InvalidLetterInput PROTO
MakeLetterUppercase PROTO, lettervalpointer : ptr byte
GameMenuError PROTO
LettersError PROTO
WinPrompt PROTO, gamestringptr : ptr byte
LosePrompt PROTO, gamestringvalptr : ptr byte
wordguesserror PROTO
incorrectwordguess PROTO, totalwordguesses : byte

ClearEAX textequ <mov eax, 0>
ClearEBX textequ <mov ebx, 0>
ClearECX textequ <mov ecx, 0>
ClearEDX textequ <mov edx, 0>
ClearESI textequ <mov esi, 0>
ClearEDI textequ <mov edi, 0>

.data
mainmenuoption byte 0 
; // words used for game: UPPERCASE null terminated
word0 byte "SUPERMAN",0d
word1 byte "PYTHON",0d
word2 byte "ANXIETY",0d
word3 byte "CANOE",0d
word4 byte "DOBERMAN",0d
word5 byte "FRAME",0d
word6 byte "FROST",0d
word7 byte "ORANGE",0d
word8 byte "FRIGATE",0d
word9 byte "BEAUCERON",0d 
word10 byte "POSTAL",0d
word11 byte "SHEET",0d
word12 byte "CABINET",0d
word13 byte "FLEET",0d
word14 byte "HANGMAN",0d
word15 byte "MISSISSIPPIAN",0d
word16 byte "DESTROYER",0d 
word17 byte "MUTT",0d
word18 byte "FRUIT",0d
word19 byte "ESPRIT",0d
word20 byte "PARISIAN",0d
word21 byte "ASSEMBLY",0d
word22 byte "COLORADO",0d
word23 byte "FINALS",0d 
word24 byte "DISCRETE",0d
word25 byte "TOILET",0d
word26 byte "TURKEY",0d
word27 byte "CHOCOLATE",0d
word28 byte "COFFEE",0d
word29 byte "MONDAYS",0d
		   
randomval byte 0 ; // random value for finding random word		
pickedword byte 26 dup(0) ; // empty array for chosen word
pickedwordlen byte 0
displayarray byte 52 dup(0) ; // array for the game display ie:" _ _ _ _ " 
letterchoices byte 0 ; // counter for inputs  
wordchoices byte 0   ; //
gamemenuchoice byte 0  ; // pick to enter letter or word
userletterguess byte 0
userwordguess byte 26 dup (0)
userwordguesslen byte 0
gamelettersleft byte 0 ; // if 0  user wins set to len of word
workingarray byte 26 dup (0)
mixreturnval byte 0
boollettercheck byte 0 ; // checks for if letter entered is not a letter 


.code
main PROC 
invoke printrules

mainmenustart:
call clrscr 
invoke printmainmenu, ADDR mainmenuoption
call clrscr 

option1:
cmp mainmenuoption, 1
jne option2
; // add clear array functions ===============

invoke randomwordval, ADDR randomval ; // finds position of word
; ========================================================================
; This block of code finds word, then finds str len by invoke function
; ========================================================================
cmp randomval, 0
jne wordpick1
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word0
jmp exitfindword

wordpick1:
cmp randomval, 1
jne wordpick2
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word1
jmp exitfindword

wordpick2:
cmp randomval, 2
jne wordpick3
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word2
jmp exitfindword

wordpick3:
cmp randomval, 3
jne wordpick4
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word3
jmp exitfindword

wordpick4:
cmp randomval, 4
jne wordpick5
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word4
jmp exitfindword

wordpick5:
cmp randomval, 5
jne wordpick6
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word5
jmp exitfindword

wordpick6:
cmp randomval, 6
jne wordpick7
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word6
jmp exitfindword

wordpick7:
cmp randomval, 7
jne wordpick8
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word7
jmp exitfindword

wordpick8:
cmp randomval, 8
jne wordpick9
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word8
jmp exitfindword

wordpick9:
cmp randomval, 9
jne wordpick10
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word9
jmp exitfindword

wordpick10:
cmp randomval, 10
jne wordpick11
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word10
jmp exitfindword

wordpick11:
cmp randomval, 11
jne wordpick12
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word11
jmp exitfindword

wordpick12:
cmp randomval, 12
jne wordpick13
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word12
jmp exitfindword

wordpick13:
cmp randomval, 13
jne wordpick14
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word13
jmp exitfindword

wordpick14:
cmp randomval, 14
jne wordpick15
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word14
jmp exitfindword

wordpick15:
cmp randomval, 15
jne wordpick16
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word15
jmp exitfindword

wordpick16:
cmp randomval, 16
jne wordpick17
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word16
jmp exitfindword

wordpick17:
cmp randomval, 17
jne wordpick18
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word17
jmp exitfindword

wordpick18:
cmp randomval, 18
jne wordpick19
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word18
jmp exitfindword

wordpick19:
cmp randomval, 19
jne wordpick20
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word19
jmp exitfindword

wordpick20:
cmp randomval, 20
jne wordpick21
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word20
jmp exitfindword

wordpick21:
cmp randomval, 21
jne wordpick22
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word21
jmp exitfindword

wordpick22:
cmp randomval, 22
jne wordpick23
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word22
jmp exitfindword

wordpick23:
cmp randomval, 23
jne wordpick24
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word23
jmp exitfindword

wordpick24:
cmp randomval, 24
jne wordpick25
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word24
jmp exitfindword

wordpick25:
cmp randomval, 25
jne wordpick26
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word25
jmp exitfindword

wordpick26:
cmp randomval, 26
jne wordpick27
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word26
jmp exitfindword

wordpick27:
cmp randomval, 27
jne wordpick28
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word27
jmp exitfindword

wordpick28:
cmp randomval, 28
jne wordpick29
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word28
jmp exitfindword

wordpick29:
cmp randomval, 29
invoke MyStrLength, ADDR pickedword, ADDR pickedwordlen, ADDR word29

exitfindword: ; // exits word finding 
; ========================================================================
invoke BuildGameArray, ADDR displayarray, pickedwordlen 
mov wordchoices, 3  ; // sets total choices
mov letterchoices, 5; // at start of game
mov al, pickedwordlen
mov gamelettersleft, al

gameloop:
cmp wordchoices, 0 ; // checks if loss
je losegameprompt
cmp gamelettersleft, 0 ; // checks if all letters are visable if yes user wins
je wingameprompt

invoke PrintGameMenu, wordchoices, letterchoices, ADDR displayarray, ADDR gamemenuchoice


letterguess: ; // finished other than error checking
cmp gamemenuchoice, 1
jne wordguess
cmp letterchoices, 0
je letterslefterror
invoke PrintLetterGuess, ADDR userletterguess
invoke LetterCheck, userletterguess, ADDR boollettercheck
cmp boollettercheck, 0 ; // checks if input is a letter
jne lettercheckpassed
invoke InvalidLetterInput ; // print error
jmp letterguess ; // reset input

lettercheckpassed: ; // imput was letter
invoke MakeLetterUppercase, ADDR userletterguess
invoke placeLetters, ADDR displayarray, ADDR pickedword, userletterguess, pickedwordlen, ADDR mixreturnval
mov al, mixreturnval ; // number of letters found
sub gamelettersleft, al ; // sub number of letters found (if any) to total letters left
cmp al, 0				; // checks if the letter guess was correct
jne correctletterguess	; // if not decrease the number of letter guesses left
dec letterchoices ; // decreases number of letter choices able to use
correctletterguess:
jmp gameloop

wordguess:
cmp gamemenuchoice, 2
jne gamemenuinputerror
invoke PrintWordGuess, ADDR userwordguess, ADDR userwordguesslen
cmp userwordguesslen, 0 ; // Error if no input is entered
jne worderrorcheck2     ; // Prompts to enter word again
invoke wordguesserror
jmp wordguess

worderrorcheck2:
invoke RemoveNonletters, ADDR userwordguess, ADDR userwordguesslen, userwordguesslen, ADDR workingarray
cmp userwordguesslen, 0 ; // Error if a number is entered then removed by above function
jne passedwordcheck		; // Prompts to enter word again
invoke wordguesserror
jmp wordguess

passedwordcheck:
invoke MakeUpperCase, ADDR userwordguess, userwordguesslen
invoke WordCheck, ADDR userwordguess, ADDR pickedword, pickedwordlen, userwordguesslen, ADDR mixreturnval
cmp mixreturnval, 1 ; // checks if guess was correct
je wingameprompt ; // if it is exitgame
dec wordchoices ; // if not dec number of guesses
invoke incorrectwordguess, wordchoices ; // displays guesses left
invoke CleanArray, ADDR userwordguess, userwordguesslen
jmp gameloop

gamemenuinputerror:
invoke GameMenuError
jmp gameloop

letterslefterror:
invoke LettersError
jmp gameloop

wingameprompt:
invoke WinPrompt, ADDR pickedword
jmp exitgameloop

losegameprompt:
invoke LosePrompt, ADDR pickedword
jmp exitgameloop

exitgameloop:
invoke CleanArray, ADDR pickedword, pickedwordlen ; // clear print array
mov pickedwordlen, 52 ; // temp length to clear whole game array 
invoke CleanArray, ADDR displayarray, pickedwordlen
jmp mainmenustart

option2:
cmp mainmenuoption, 2
jne outofboundserror
jmp exitprogram

outofboundserror:
invoke GameMenuError
jmp mainmenustart

exitprogram:
exit
main ENDP


printrules PROC
;===========================
; printrules PROC:
;---------------------------
; Discription: Displays rules
; Recieves: Nothing
; Requires: Nothing
; Returns: Nothing
.data
rules byte "---/* Rules of hangman */---", 0AH, 0DH, 
		   "1. You have [5] letter and [3] word guesses", 0AH, 0DH, 
		   "2. Each letter guess will display the corrisponding letter (if any exist)", 0AH, 0DH, 
		   "3. The game only ends when you run out of word guesses or guess the correct word", 0AH, 0DH,
		   "4. To win, you must guess the correct word", 0AH, 0DH, 0d
		   
.code
mov edx, offset rules
call writestring
call waitmsg
call clrscr
ret
printrules ENDP


printmainmenu PROC, mainopt : ptr byte
;===========================
; printmainmenu PROC:
;---------------------------
; Discription: Displays menu for input
; Recieves: Pointer to a user option
; Requires: Nothing
; Returns: userinput
.data
mainmenu byte "===== MAIN MENU =====", 0AH, 0DH,
			  "1. Play Hangman", 0AH, 0DH, 
			  "2. Exit program", 0AH, 0DH, 
			  "Please enter a option (1-2): ", 0d

.code
mov edx, offset mainmenu
call writestring
call readhex
mov edx, mainopt
mov byte ptr [edx], al

ret
printmainmenu ENDP


randomwordval PROC, randomstore : ptr byte
;===========================
; randomwordval PROC:
;---------------------------
; Discription: Finds random val to be used to find word
; Recieves: Pointer to storage value
; Requires: Nothing
; Returns: random number
push eax
push edx
push ebx

mov eax, 11111111h	; //
call randomrange	; // finds random int between FFFF FFFF and EEEE EEEE 
add eax, 0EEEEEEEEh ; //
clearedx 
mov ebx, 30 ; // number of words change when increased or decrease
div ebx
mov ebx, randomstore
mov byte ptr [ebx], dl ; // remainder = word

pop ebx
pop edx 
pop eax

ret
randomwordval ENDP


MyStrLength PROC, wordarray : ptr byte, wordlenpointer : ptr byte, wordstrpicked : ptr byte
;===========================
; MyStrLength PROC:
;---------------------------
; Discription: Finds length of word puts word into separate array
; Recieves: Pointer word array, and pointer to len storage, lenval, and word storage
; Requires: Nothing
; Returns: length of word
mov bl, 0h ; // check if at end of word
mov bh, 0 	; // count for len of string
mov edx, wordstrpicked
mov edi, wordarray

customloop:
mov al, byte ptr [edx] ; gets current ascii
cmp al, 0 ; // if random val = 0 end of word
je foundword
inc bh
mov byte ptr [edi], al ; // puts word into word array
inc edi
inc edx
jmp customloop


foundword:
mov edx, wordlenpointer
mov byte ptr [edx], bh  ; // saves word len

ret 
MyStrLength ENDP


BuildGameArray PROC, gamedisplayptr : ptr byte, wordlenval : byte
;===========================
; BuildGameArray PROC:
;---------------------------
; Discription: makes array of underscores for game
; Recieves: Pointer to game display array, len of word
; Requires: Nothing
; Returns: Nothing but the array is full of underscores
mov edx, gamedisplayptr
movzx ecx, wordlenval

buildgamemenu:
mov byte ptr [edx], 5Fh ; // ascii value for  " _ " 
inc edx
mov byte ptr [edx], 20h ; // creates spaces between underscores
inc edx
loop buildgamemenu

ret
BuildGameArray ENDP


PrintGameMenu PROC, wordchoicesleft : byte, letterchoicesleft : byte, gamearrayptr : ptr byte, userchoice : ptr byte
;===========================
; PrintGameMenu PROC:
;---------------------------
; Discription: Prints game menu takes input 
; Recieves: Pointer to game display array, len of word
; Requires: Nothing
; Returns: Nothing but the array is full of underscores
.data
menupt1 byte "Word: ", 0d
menupt2 byte "Remaining letter guesses [", 0d
menupt3 byte "Remaining word guesses [",0d
menupt4 byte "Do you want to (1. enter a letter) or (2. enter a word): ", 0d

.code
; // prints menuopt1 / underscores
mov edx, offset menupt1
call writestring
mov edx, gamearrayptr
call writestring
; // prints menuop2 and letterchoices surrounded by brackets
call crlf
mov edx, offset menupt2
call writestring
movzx eax, letterchoicesleft
call writedec
mov al, 5Dh
call writechar
; // prints menuop3 and wordchoices surrounded by brackets
call crlf
mov edx, offset menupt3
call writestring
movzx eax, wordchoicesleft
call writedec
mov al, 5DH
call writechar
; // prints menuopt4 and takes input
call crlf
mov edx, offset menupt4
call writestring
call readhex
mov edx, userchoice
mov byte ptr [edx], al

ret 
PrintGameMenu ENDP


PrintLetterGuess PROC, userletterguessptr : ptr byte
;===========================
; PrintLetterGuess PROC:
;---------------------------
; Discription: Prints menu for letter guess takes input of user
; Recieves: Pointer to storage value
; Requires: Nothing
; Returns: letter guess
.data
lettersmenu byte "Please enter a letter (a-z): ",0d

.code 
mov edx, offset lettersmenu
call writestring
call readchar
call writechar ; // displays char
mov edx, userletterguessptr
mov byte ptr [edx], al
call crlf ; // formating
call crlf ; //
ret 
PrintLetterGuess ENDP


findLetter PROC, thestring : dword, startingindex : byte, theletter : byte, thestrlen : byte, letterreturnval : ptr byte, firstcall : byte
;===========================
; findLetter PROC:
;---------------------------
; Discription: Finds fist occurance of a letter 
;              	  starting at an inxex and returns it
; Recieves: Pointer to string, a bool value for checking if it is first call to function, 
;				the starting index, letter value, length, and the return value
; Requires: Nothing
; Returns: index of letter
push ebx
push edi 
push ecx
push eax

movzx ebx, startingindex 

mov edi, thestring
mov al, theletter
movzx ecx, thestrlen
add edi, ebx ; // account for startingindex val
sub ecx, ebx ; //

mov bl, firstcall
cmp bl, 0 ; // if not = 0 then a letter has already been found and the starting index is pointing at it
je nopointershift
inc edi 			 ; // inc edi to point to next val after letter
dec ecx				 ; // dec ecx to account for increase in edi

nopointershift:
cld ; // loop forward
repne scasb 
jnz notfound
mov ebx, thestring ; // points to start of array
dec edi
sub edi, ebx ; // index of letter
mov eax, edi
mov ebx, letterreturnval
mov byte ptr [ebx], al
jmp exitfindletter

notfound:
mov eax, letterreturnval
mov byte ptr [eax], 20h
exitfindletter:
pop eax
pop ecx 
pop edi
pop ebx
ret
findLetter ENDP


placeLetters PROC, gamemenustring : ptr byte, pickedstring: ptr byte, chosenletter : byte, stringlen : byte, lettersreturn : ptr byte
LOCAL currentindexval : byte, indexofgame : byte, indexval : byte, functioncallbool : byte
;===========================
; placeLetters PROC:
;---------------------------
; Discription: Replaces underscores with letter if correct guess
; Recieves: Pointer to gamearray, pickedword, userletter and len of picked string
; Requires: Nothing
; Returns: letters found
mov functioncallbool, 0
mov indexofgame, 0
mov bh, chosenletter ; // holder for letter val
mov bl, 0 ; // way to track number of letters found
mov currentindexval, 0
mov edx, gamemenustring
movzx ecx, stringlen
mov indexval, 0

invoke findLetter, pickedstring, currentindexval, chosenletter, stringlen, ADDR indexval, functioncallbool ; // finds first value
mov al, indexval
mov currentindexval, al ; // shifts index
mov functioncallbool, 1 ; // tells it has called the function once

noindexcorrect:
cmp al, 20h       ; // exit if no letter found
je exitplaceletter

replaceunderscores: 
cmp indexofgame, al ; // if correct index in game str find next
jne continueletterloop

mov byte ptr [edx], bh
inc bl ; // number of letters found
invoke findLetter, pickedstring, currentindexval, chosenletter, stringlen, ADDR indexval, functioncallbool
cmp indexval, 20h       ; // exit if no letter found
je exitplaceletter
mov al, indexval
mov currentindexval, al ; // shifts index

continueletterloop:
inc indexofgame ; // index of str
add edx, 2 ;// moves game index
loop replaceunderscores

exitplaceletter:
mov eax, lettersreturn
mov byte ptr [eax], bl
ret
placeLetters ENDP


PrintWordGuess PROC, strpointer : ptr byte, strguesslen : ptr byte
;===========================
; PrintWordGuess PROC:
;---------------------------
; Discription: Writes prompt and takes str input
; Recieves: Pointer to word array, and lenval
; Requires: Nothing
; Returns: input and len
.data
lettersmenuval byte "Please enter a word of len (1-25): ",0d

.code
mov edx, offset lettersmenuval
call writestring
mov edx, strpointer
mov ecx, 25
call readstring
mov edx, strguesslen
mov byte ptr [edx], al
call crlf

ret
PrintWordGuess ENDP


MakeUpperCase PROC, userwordguessptr : ptr byte, userwordguesslenval : byte
;===========================
; MakeLowerCase PROC:
;---------------------------
; Discription: makes string lowercase
; Recieves: Pointer to word array, and length
; Requires: No non letters in str
; Returns: Nothing but str is lowercase
clearesi
mov edx, userwordguessptr
movzx ecx, userwordguesslenval

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
MakeUpperCase ENDP


RemoveNonletters PROC, stringpointer : ptr byte, lenpointer : ptr byte, lenval : byte, temparray : ptr byte
LOCAL newsize : byte
;===========================
; RemoveNonletters PROC:
;---------------------------
; Discription: Removes nonletter elemnts of a string
; Recieves: Pointer to string and length. 
;           It also recieves the length value
; Requires: Nothing
; Returns: Nothing, but non letters are removed

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


CleanArray PROC, arrayptr : ptr byte, arraylen : byte
;===========================
; CleanArray PROC:
;---------------------------
; Discription: removes all values from an array
; Recieves: Pointer to string and length. 
; Requires: Nothing
; Returns: Nothing, but array is empty
mov edx, arrayptr
movzx ecx, arraylen

cleanloop:
mov byte ptr [edx], 0h
inc edx
loop cleanloop

ret
CleanArray ENDP


WordCheck PROC, wordguesspointer : ptr byte, gamestringpointer : ptr byte, gamestringlen : byte, wordguesslen : byte, boolreturn : ptr byte
;===========================
; WordCheck PROC:
;---------------------------
; Discription: checks if a word guess is equal to string
; Recieves: Pointer to guess and string.
;				Also len of guess and string.
; Requires: Nothing, both strings to be only uppercase chars
; Returns: Bool val: 1 if equal 2 if not equal
movzx ecx, gamestringlen
cmp cl, wordguesslen
jne incorrectguess

mov edi, wordguesspointer
mov esi, gamestringpointer
cld ; // forword direction
repe cmpsb ; // repeat when equal
jne incorrectguess
mov eax, boolreturn
mov byte ptr [eax], 1
jmp exitwordcheck

incorrectguess:
mov eax, boolreturn
mov byte ptr [eax], 0

exitwordcheck:
ret
WordCheck ENDP


LetterCheck PROC, letterval : byte, boolletterptr : ptr byte
;===========================
; WordCheck PROC:
;---------------------------
; Discription: checks if letter input is valid
; Recieves: Pointer letter
; Requires: Nothing
; Returns: bool 1 if letter 0 if not a letter
mov edx, boolletterptr
mov al, letterval

cmp al, 41h ; // compares to lowest captal ascii hex val: ("A")
jb notletter
cmp al, 5Ah; // compares to highest capital ascii hex val: ("Z")
jbe isletter
cmp al,  61h; // compares to lowest lowercase ascii hex val: ("a")
jb notletter
cmp al, 7Ah; // compares to highest lowercase ascii hex val: ("z") 
jbe isletter
jmp notletter
notletter: ; // check failed : not a letter 
mov byte ptr [edx], 0
jmp exitlettercheck

isletter:  ; // check passed : is letter
mov byte ptr [edx], 1

exitlettercheck:
ret
LetterCheck ENDP


InvalidLetterInput PROC
;===========================
; InvalidLetterInput PROC:
;---------------------------
; Discription: Prints error message
; Recieves: Pointer letter
; Requires: Nothing
; Returns: Nothing
.data
lettererror1 byte "ERROR: /* Value entered was not a letter */", 0AH, 0DH, 0AH, 0DH, 0d
				  
.code
mov edx, offset lettererror1
call writestring
call waitmsg
call crlf

ret
InvalidLetterInput ENDP


MakeLetterUppercase PROC, lettervalpointer : ptr byte
;===========================
; MakeLetterUppercase PROC:
;---------------------------
; Discription: Makes letter uppercase
; Recieves: Pointer letter
; Requires: Nothing
; Returns: Nothing or uppercase letter if letter was lowercase
mov edx, lettervalpointer
mov al, byte ptr [edx]

cmp al, 5Ah
jbe notlowercase  
xor al, 20h     ;// make uppercase
mov byte ptr [edx], al ;// store lower case letter.

notlowercase:
ret
MakeLetterUppercase ENDP


GameMenuError PROC
;===========================
; GameMenuError PROC:
;---------------------------
; Discription: Prints error
; Recieves: Nothing
; Requires: Nothing
; Returns: Nothing 
.data
Gamemenuerrorprompt byte " ERROR: /* Menu option does not exist */", 0AH, 0DH, 0AH, 0DH, 0d

.code
call crlf
mov edx, offset Gamemenuerrorprompt
call writestring
call waitmsg
call crlf
call crlf

ret
GameMenuError ENDP


LettersError PROC
;===========================
; LettersLeftError PROC:
;---------------------------
; Discription: Prints error
; Recieves: Nothing
; Requires: Nothing
; Returns: Nothing 
.data
letterslefterrorpromp byte "You have no [letter] guesses left. Please guess a word.", 0AH, 0DH, 0d

.code
call crlf
mov edx, offset letterslefterrorpromp
call writestring
call crlf

ret
LettersError ENDP


WinPrompt PROC, gamestringptr : ptr byte
;===========================
; WinPrompt PROC:
;---------------------------
; Discription: Prints win message
; Recieves: Pointer to string
; Requires: Nothing
; Returns: Nothing 
.data
menuwin1 byte "---------- YOU WIN ----------", 0AH, 0DH,
		      "You guessed the correct word: ",0d
menuwin2 byte "Congratulations!", 0d

.code
call clrscr
mov edx, offset menuwin1 
call writestring
mov edx, gamestringptr
call writestring
call crlf
mov edx, offset menuwin2
call writestring
call crlf
call waitmsg

ret
WinPrompt ENDP


LosePrompt PROC, gamestringvalptr : ptr byte
;===========================
; LosePrompt PROC:
;---------------------------
; Discription: Prints loss message
; Recieves: Pointer to string
; Requires: Nothing
; Returns: Nothing 
.data
menuloss1 byte "~~~~~~~~~~ YOU LOSE ~~~~~~~~~~", 0AH, 0DH,
		       "You did not guess the correct word: ", 0d

menuloss2 byte "Better luck next time!", 0d

.code
call clrscr
mov edx, offset menuloss1
call writestring
mov edx, gamestringvalptr
call writestring
call crlf
mov edx, offset menuloss2
call writestring
call crlf
call waitmsg

ret
LosePrompt ENDP


wordguesserror PROC
;===========================
; wordguesserror PROC:
;---------------------------
; Discription: Prints error message
; Recieves: Nothing
; Requires: Nothing
; Returns: Nothing 
.data
wordguesserrorprompt byte "ERROR: /* value entered for word guess is not a word */", 0ah, 0dh, 0d

.code
mov edx, offset wordguesserrorprompt
call writestring
call crlf
call waitmsg
call crlf ; // formating
ret
wordguesserror ENDP


incorrectwordguess PROC, totalwordguesses : byte
;===========================
; incorrectguess PROC:
;---------------------------
; Discription: Prints message displaying word guesses left
; Recieves: Number of wordguesses
; Requires: Nothing
; Returns: Nothing 
.data
wordprompt byte "That is incorrect. You have ",0d
wordprompt2 byte " guesses left.", 0ah, 0dh, 0d

.code
mov edx, offset wordprompt
call writestring
movzx eax, totalwordguesses
call writedec
mov edx, offset wordprompt2
call writestring
call waitmsg
call crlf
call crlf

ret
incorrectwordguess ENDP


END main