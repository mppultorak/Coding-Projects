def question47():
    a = int(input('Enter number a: '))
    b = int(input('Enter number b: '))
    c = int(input('Enter number c: '))
    if a >= b and a >= c:
        print(a)
    elif b >= a and b >= c:
        print(b)
    else:
        print(c)


def question48():
    d = {"Department": "CSCI", "Number": 1410, "Section": 2}
    for key_val in d:
        print(key_val,':', d[key_val])


def question49():
    try:
        x = int(input('Enter x: '))
        y = int(input('Enter y: '))
    except ValueError:
        print('Value given for x or y is not a number.')
        return
    try:
        val = x / y
        return val
    except ZeroDivisionError:
        print('Value for y is 0.')
        return


def question50():
    score = int(input('Enter score: '))
    if score > 60:
        print('Pass!')
    else:
        print('Fail.')


def question51():
    n = int(input('Enter number n: '))
    summ = 0
    while n > 0:
        summ += n
        n -= 1
    print(summ)
x = 3 or 4
while x == 3 or 4:
    print('x')
def question57():
    d = {"Department" :"CSCI", "Number" :1410 , "Section" : 2}
    d['Semester'] = 'Fall'
    print(d)

def question58():
    class Pizza:
        def __init__(self, crust, cheese):
            self.crust = crust
            self.cheese = cheese
            self.toppings = []
        def return_crust(self):
            return self.crust
        def remove_toppings(self):
            self.toppings = []
        def add_topping(self):
            topping = input('Enter a topping: ')
            self.toppings.append(topping)
        def return_cheese(self):
            return self.cheese
        def __str__(self):
            return f"""
            Crust    : {self.crust}
            Cheese   : {self.cheese}
            Toppings : {self.toppings}"""
