#################
#Michael Pultorak
#05/05/21
#################


#################  Question 1  #################

import random
from math import pi
from math import sqrt


class Sphere:
    def __init__(self, radius):
        self.radius = float(radius)

    def getRadius(self):
        return self.radius

    def surfaceArea(self):
        return 4*pi*(self.radius)**2


    def volume(self):
        return (4/3)*pi*(self.radius)**3

def question1():
    sphere = Sphere(10)
    print('Radius: ', sphere.getRadius())
    print('Surface Area: ', sphere.surfaceArea())
    print('Volume: ', sphere.volume())


#################  Question 2  #################


class ArrayInterface:
    def __init__(self, array: list):
        self._array = array

    def sum(self):
        return sum(self._array)

    def average(self):
        return sum(self._array) / len(self._array)

    def min(self):
        return min(self._array)

    def max(self):
        return max(self._array)

    def standard_deviation(self):
        dev = []
        avg = sum(self._array) / len(self._array)
        for num in self._array:
            dev.append((num - avg)**2)
        var = sum(dev) / len(self._array)
        std_dev = sqrt(var)
        return std_dev

def question2():
    lst = []
    while len(lst) < 10:
        lst.append(random.randint(1,100))
    obj = ArrayInterface(lst)
    print('sum: ', obj.sum())
    print('average: ', obj.average())
    print('min: ', obj.min())
    print('max: ', obj.max())
    print('standard dev: ', obj.standard_deviation())


#################  Question 3  #################

class user_atm:

    def __init__(self, id: int, pin: int):
        self._id = id
        self._pin = pin

    def user_check(self):
        try:
            file = f'{self._id}_{self._pin}.txt'
            with open(file, 'r') as user_data:
                print('Successfully found user.')
                return
        except FileNotFoundError:
            print('No user found with pin and id combo.\nCreating new user....')
            print('Starting accounts value of $1000 has been awarded for being the first user.')
            with open(file, 'w') as user_data:
                user_data.write('Checking Account:\n1000\nSavings Account:\n1000')

    def return_balance(self):
        with open(f'{self._id}_{self._pin}.txt', 'r') as user_data:
            text = user_data.readlines()
        checking = text[1].strip()
        savings = text[3].strip()
        return (int(checking), int(savings))

    def withdraw(self):
        account = input('Withdraw from checking or savings: ')
        try:
            val = int(input('Enter amount: '))
        except ValueError:
            print('Value given is not a number.\nPlease try again.')
            return
        text = []
        with open(f'{self._id}_{self._pin}.txt', 'r') as user_data:
            lines = user_data.readlines()
            for line in lines:
                line = line.strip()
                text.append(line)
            if account.lower() == 'checking':
                new_checking = int(text[1]) - val
                text[1] = new_checking
                print(f'Successfully withdrawn ${val} from checking.')
            elif account.lower() == 'savings':
                new_saving = int(text[3]) - val
                text[3] = new_saving
                print(f'Successfully withdrawn ${val} from savings.')
            else:
                print(f'Error in finding account: {account}\nPlease try again.')
                return
        with open(f'{self._id}_{self._pin}.txt', 'w') as user_data:
            for value in text:
                user_data.write(f'{value}\n')

    def transfer(self):
        account = input('Transfer from checking or savings: ')
        try:
            val = int(input('Enter amount: '))
        except ValueError:
            print('Value given is not a number.\nPlease try again.')
            return
        text = []
        with open(f'{self._id}_{self._pin}.txt', 'r') as user_data:
            lines = user_data.readlines()
            for line in lines:
                line = line.strip()
                text.append(line)
            if account.lower() == 'checking':
                new_checking = int(text[1]) - val
                new_saving = int(text[3]) + val
                text[1] = new_checking
                text[3] = new_saving
                print(f'Successfully transferred ${val} from checking to savings.')
            elif account.lower() == 'savings':
                new_saving = int(text[1]) - val
                new_checking = int(text[3]) + val
                text[1] = new_checking
                text[3] = new_saving
                print(f'Successfully transferred ${val} from savings to checking.')
            else:
                print(f'Error in finding account: {account}\nPlease try again.')
                return
        with open(f'{self._id}_{self._pin}.txt', 'w') as user_data:
            for value in text:
                user_data.write(f'{value}\n')


def question3():
    while True:
        try:
            id = int(input('Please enter id: '))
            pin = int(input('Please enter pin: '))
            break
        except ValueError:
            print('Value given for pin or id is not a number.')
    user = user_atm(id, pin)
    user.user_check()
    while True:
        print('=====================')
        print('1 - Check Balance')
        print('2 - Withdraw')
        print('3 - Transfer money')
        print('4 - Exit Program')
        print('=====================')
        try:
            select = int(input(': '))
        except ValueError:
            print('Selection given is not a number.\nPlease try again.')
            continue
        if select == 1:
            checking, savings = user.return_balance()
            print(f'Current checking balance: ${checking}')
            print(f'Current savings balance: ${savings}')
            continue
        if select == 2:
            user.withdraw()
            continue
        if select == 3:
            user.transfer()
            continue
        if select == 4:
            exit(0)
        else:
            print('Selection is not within range.\nPlease try again.')
            continue


if __name__ == '__main__':
    question1()
    question2()
    question3()