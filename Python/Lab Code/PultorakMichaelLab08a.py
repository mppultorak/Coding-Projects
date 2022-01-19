# Michael
# Pultorak
# Date: 03/18/21
# Description: This program shows techniques of defining function,
# parameter passing and function invocation.



def fahrenToCel(fahren):
    result = (fahren - 32) * (5.0 / 9.0);
    return result

def fahrenToCelList(fahrenList):
    for i in range(len(fahrenList)):
        fahren = fahrenList[i]
        celsius = (fahren - 32) * (5.0 / 9.0)
        fahrenList[i] = round(celsius,2)

def main():
    fval = float(input("Please enter the temperature in Fahrenheite: "))
    # call the function fahrenToCel  
    cval = fahrenToCel(fval)
    print("Equivalent temperature in Celcius is {0:0.2f} ".format(cval))
    
    fahrenheiteList = []
    # Take 5 temperature as inputs and store them in fahrenhiteList
    for i in range(5):
        fahren = float(input("Enter temperature in Fahrenheit: "))
        fahrenheiteList.append(fahren)

    # call the function fahrenToCelList
    fahrenToCelList(fahrenheiteList)
    print("The converted temperature list")
    print(fahrenheiteList)
