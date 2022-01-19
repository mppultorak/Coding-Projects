# Michael
# Pultorak
# 03/08/21
# Description: Lab 5. Create a ceaser cipher


def main():
    text = input('Please enter a string: ')   # Gets text input 
    key = int(input('Please enter a key: ')) # Gets key
    text = text.split(' ') # Splits text into list 
    i = 0
    for lst in text: # Iterates over each element of list
        i += 1 # Position in list
        out = ''
        for char in lst: # Iterates over each letter in list element
            old = ord(char) # Finds ord value
            new = old + key # Shifts ord
            out += chr(new) # Encoded letter back to text
            if len(out) == len(lst): # Checks to see if entirety of word is encoded
                text[i-1] = out # Replaces old text with encoded
                
                
    text = ' '.join(text) # Joins encoded list
    print(f'The encoded message is: {text}') # Prints result
    
    ### Reverts encoded text to original by subtracting key  
    text = text.split(' ')
    i = 0
    for lst in text: 
        i += 1
        out = ''
        for char in lst:
            old = ord(char)
            new = old - key
            out += chr(new)
            if len(out) == len(lst):
                text[i-1] = out
                
    text = ' '.join(text)
    print(f'The decoded message is: {text}')


