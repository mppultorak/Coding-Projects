# Michael
# Pultorak
# 03/08/21
# Description: Lab 5. Create a ceaser cipher


def main():
    
    ch = input("Please enter a single character: ")
    value = ord(ch)
    print("The numeric representation of", ch, "is", value)


    print("The equivalent character of the number", value, "is", chr(value))


    txt = input("Please enter a text: ")
    for ch in txt:
        print(ord(ch), end=" ")


    txt1 = input("\nPlease enter a string with space: ")
    listSubStrings = txt1.split(" ")
    print(listSubStrings)
    

    newString = "-".join(listSubStrings);
    print(newString)
