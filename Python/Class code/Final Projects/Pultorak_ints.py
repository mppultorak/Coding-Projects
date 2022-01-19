
class Integer:

    def __init__(self, num):
        self.num = num

    def isEven(self):
        if self.num % 2 == 0:
            return True

    def isOdd(self):
        if self.num % 2 != 0:
            return True

    def isPrime(self):
        for i in range(2, self.num):
            if (self.num % i) == 0:
                return
        return True

    def __str__(self):
        return f"""{self.num}"""

    def __add__(self, other):
        return self.num + other.num

    def __mul__(self, other):
        return self.num * other.num


int = Integer(10)
int2 = Integer(11)
print(int.isEven())
print(int.isOdd())
print(int.isPrime())
print(int)
print(int + int2)
print(int * int2)


