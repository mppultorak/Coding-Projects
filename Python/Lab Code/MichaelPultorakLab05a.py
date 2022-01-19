# Michael
# Pultorak
# 03/01/21
# Description: Lab 5. This lab is developing skills in str opperations

def main():
    firstName = input("Please enter your first name: ")
    lastName = input("Please enter your last name: ")


    length = len(firstName)
    print("length of the first name is:", length)

    length_2 = len(lastName)
    print("length of your last name is: ", length_2)


    fullName = firstName + " " + lastName
    print("Your full name is: ", fullName)


    n = int(input("Enter a number: "))
    print("Repeating your name", n, "times")
    print((firstName + " ") * n)


    print("Printing the full name using for loop")
    for ch in fullName:
        print(ch, end = "")


    print("\nPrinting the full name using indexing")
    for i in range(len(fullName)):
        print(fullName[i], end = "")

    print("\nPrinting the name in reverse order")
    for i in range(-1, -(len(fullName)+1), -1):
         print(fullName[i], end = "")

    userName = lastName[0:3] + firstName[0:3]
    print("\nYour username is: ",userName)


