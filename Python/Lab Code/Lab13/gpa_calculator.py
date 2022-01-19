# gpa_calculator.py
# Name: Michael Pultorak
# Date: 04/26/21

#Import Student class
from Student import Student

def main():
    name = input ('Enter your name: ')

    s1 = Student (name, 0,0)

    count = int (input ('Enter number of grades: '))

    for i in range (count):
        credit = float (input('Enter credit hours for course ' + str(i+1) + ': '))
        gp = float (input ('Enter grade points for course ' + str(i+1) + ': '))
        s1.add_grade (gp, credit)

    print ('Student name:', name)
    print ('Total Credit Hours {0:.2f}'.format(s1.getHours()))
    print ('Total Quality Points {0:.2f}'.format(s1.getQPoints()))
    print ('GPA {0:.2f}'.format(s1.gpa()))
