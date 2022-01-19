# Name: Michael Pultorak
# Class: CSCI 1411-00X
# Due Date: 02/08/21
# Description: Ask for user first and last name and inital temperature. Print out user's name and Celsius temperature followed by the next 10 temperatures.
def main():
    firstName = input('Enter your first name ')
    lastName = input('Enter you last name ')
    print('Hello ' + firstName + ' ' + lastName)
    fahren = int(input('What is the temperature in Fahreneit? '))
    for r in range(11):
        celsius = (fahren-32)*(5/9)
        print(firstName,'', lastName,' the Celsius temperature is ', celsius,'degrees')
        fahren += 1
