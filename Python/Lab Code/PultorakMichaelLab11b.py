###########################################################################
# Name: Michael Pultorak  
# Date: 05/04/21
# This program will perform the following tasks:
#    1) Ask for file name and word.
#    2) Return abmount of times the word appears in the file
###########################################################################

###########################################################################
# Function Name: file_open()
# Description: Opens file and returns contents in list
# Parameter: None
# Returns list of words in file
###########################################################################

def file_open():
    catch = True
    out = []
    while catch == True:
        try:
            file = input('Please enter a text file: ')
            with open(file, 'r') as file:
                for line in file:
                    for word in line.split():
                        out.append(word)
                catch = False
                return out
        except FileNotFoundError: 
            print(f'File {file} not found. Please try again')
            continue
        
         
###########################################################################
# Function Name: list_read(word, list)
# Description: reads list and returns number of times a word appears in list
# Parameter: word and list
# Returns int
###########################################################################

def list_read(word, ls):
    count = 0
    for wd in ls:
        if wd == word:
            count += 1
    return count

###########################################################################
# Function Name: main()
# Description: Ask for file name and word
#             Return abmount of times the word appears in the file
# Parameter: None
# Returns number of times word appears in file
###########################################################################

def main():
        ls = file_open()
        word = input('Please enter a word: ')
        count = list_read(word, ls)
        print(count)
    
