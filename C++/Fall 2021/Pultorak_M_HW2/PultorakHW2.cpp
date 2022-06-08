#include<iostream>
#include<vector>
#include<string>
#include"PultorakHW2.h"
using namespace std;

int main()
{
string input;
getline(cin, input); // Takes input as str


string str_input = input; // Places input into string container
if (isPalindromic(input) == 1) // Checks if string is palindromic 
    cout << "Palindromic string." << endl; // If yes: Prints palindromic string
else
{
    cout << "Not a palindromic string. "; // If not:
    makePalindromic(input);               // Prints Not a palindromci string. A generated one. <generated string>
}


vector<string> STRtemp = makestrArray(input); // Casts input into makestrarray, which separates by spaces and returns str vector
string* word_arr = &STRtemp[0]; // Creates array pointer to first element of vector
int strsize = STRtemp.size(); // Finds size of vector (or size of array)
if (isPalindromic(word_arr, strsize) == 1) // Checks if array is palindromic
    cout << "Palindromic word sequence." << endl; // If yes: print palindromic word sequence
else
{
    cout << "Not a palindromic word sequence. "; // If not:
    makePalindromic(word_arr, strsize);          // Prints Not a palindromic word sequence. A generated one. <generated word sequence>
}


try{ //Checks if intput given is possible to be transformed into int array
vector<int> INTtemp = makeintArray(input); // Casts input into makeintarray, which separates by spaces and returns int vector 
int* num_arr = &INTtemp[0]; // Creats array pointer to first element of vector
int num_size = INTtemp.size(); // Finds size of vector (or size of array)
if (isPalindromic(num_arr, num_size) == 1) // Checks if array is palindromic
    cout << "Palindromic number sequence." << endl; // If yes: prints palindromic number sequence
else
{
    cout << "Not a palinfromic number sequence. "; // If not:
    makePalindromic(num_arr, num_size);            // Prints Not a palindromic number sequence. A generated one. <generated number sequence>
}
}
catch(...){
    cout << "Not a palindomic number sequence. Generation of such sequence is not possible." << endl; // Prints error if creation not possible
}


return 0;
}