# Name Michael Pultorak 
# Date 04/13/2012
# Reading Assignment 4

def question1():
    logic = True
    while logic:
        try:
            speed = int(input('Enter a speed: '))
            limit = int(input('Enter the speed limit: '))
            if speed <= 0 or limit <= 0:
                print(f'Please enter only positve numbers.')
                continue
            if speed <= limit:
                print('Speed not beyond limit. Please try again.')
                continue
            logic = False
        except:
            print('One or more inputs are illogical. Please try again.')
            continue
    fine = 60 + (5*(speed - limit))
    if speed > 90:
        fine += 300
    print(f'The fine is: ${fine}')
    

def question2():
    logic = True
    while logic:
        try:
            year = int(input('Enter a year: '))
            if year < 1900 or year > 2099:
                print('Year not in range. PLease try again')
                continue
            logic = False
        except:
            print('Year is illogical. Please try again.')
            continue
    a = year % 19
    b = year % 4
    c = year % 7
    d = (19*a + 24) % 30
    e = (2*b + 4*c + 6*d + 5)%7
    day = 22 + d + e
    if year == 1954 or year == 1981 or year == 2049 or year == 2076:
        day -= 7
    if day > 31:
        day = day - 31
        date = f'April {day}'
    else:
        date = f'March {day}'
    print(date)    

def question3():
    logic = True
    while logic:
        try:
            n = int(input('Enter a number: '))
            if n < 0: 
                print('Please enter a positive number.')
                continue
            logic = False
        except:
            print('Please enter a number.')
            continue
    i = 1
    a = 1
    b = 0
    while i < n:
        c = a + b
        b = a
        a = c
        i += 1     
    print(f'{n} term of the fibonacci sequence is {c}')
        

def question4():
    logic = True
    while logic:
        try:
            x = int(input('Enter a number: '))
            if x < 0: 
                print('Please enter a positive number.')
                continue
            logic = False
        except:
            print('Please enter a number.')
            continue
    out = []
    out.append(x)
    while x != 1:
        if x % 2 == 0:
            x = x//2
        else:
            x = 3*x + 1
        out.append(x)
    print(f'The sequence is {out}')

def question5():
    mpg = []
    logic = True
    while logic:
        try:
            start = int(input('PLease enter the starting odometer reading: '))
            if start < 0:
                print('Please enter a positive number.')
                continue
            break
        except:
            print('Please enter a number.')
            continue      
    while True:
        try:
            i = input('Please enter current odometer reading and gas used separated by a space: ')
            if i == "":
                break
            i = i.split(' ')
            if int(i[0]) < 0 or int(i[1]) < 0:
                print('Please enter positive numbers.')
                continue
            odo = int(i[0])
            if odo < start:
                print('Please enter logical odometer reading.')
                continue
            miles = int(i[0]) - start
            start += miles
            gas = int(i[1])
            if gas == 0:
                print('Please enter non zero gas amount.')
                continue
            mpg.append(miles/gas)
        except:
            print('Error, please try again.')
            continue
    temp = 1
    for item in mpg:
        print(f'For leg {temp} the MPG was: {item:.2f}')
        temp += 1


if __name__ == "__main__":
    question1()
    question2()
    question3()
    question4()
    question5()
    print("-----------------End------------------")
    