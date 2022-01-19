

class Student:
    """"Student class for holding data"""
    def __init__(self, name, home_address, email_address):
        """Initializes name address and email"""
        self.name = name
        self.home_address = home_address
        self.email_address = email_address

    def return_name(self):
        """Returns name"""
        return self.name

    def return_address(self):
        """Returns address"""
        return self.home_address

    def return_email(self):
        """Returns email"""
        return self.email_address

    def return_state(self):
        """Return state of student"""
        city_state = self.home_address[1]
        state = city_state.split(',')
        return state[1].strip()

    def __str__(self):
        """Prints object in format"""
        return f"""
        Name  : {self.name}
        Home  : {self.home_address}
        Email : {self.email_address}
        """

######
# Opens file and reads student data.
# Creates object instance with data and appends to list
######
list_of_students = []
file = input('Enter file: ')
with open(file, 'r') as data:
    while True:
        name = data.readline().strip()
        if name == "":
            break
        address = (data.readline().strip(), data.readline().strip(), data.readline().strip())
        email = data.readline().strip()
        list_of_students.append(Student(name, address, email))
######
# While loop for menu.
######
while True:
    print('============================')
    print('1 - Add Student')
    print('2 - Display info')
    print('3 - Drop student')
    print('4 - List all students')
    print('5 - List CO state students')
    print('6 - Print to file')
    print('7 - Exit')
    print('============================')
    select = int(input(': '))
    # Takes address information in format and create new object instance with data
    if select == 1:
        name = input('Enter full name: ')
        address = input('Enter address: ')
        state = input('Enter city and state separated by a comma: ')
        zip = input('Enter zip: ')
        email = input('Enter full email: ')
        home = (address, state, zip)
        portal = Student
        list_of_students.append(portal(name, home, email))
    # Takes name and prints object instance with matching name.
    elif select == 2:
        name = input('Enter full name: ')
        for obj in list_of_students:
            if obj.return_name() == name:
                print(obj)
    # Takes name and removes object instance with matching name
    elif select == 3:
        name = input('Enter full name: ')
        for obj in list_of_students:
            if obj.return_name() == name:
                list_of_students.remove(obj)
                print(f'Student {name} has been removed.')
    # Prints every object instance
    elif select == 4:
        for obj in list_of_students:
            print(obj)
    # Prints objects with CO as state
    elif select == 5:
        for obj in list_of_students:
            state = obj.return_state()
            if state == 'CO':
                print(obj)
    # Prints all objects to file in same formate and read
    elif select == 6:
        with open(file, 'w') as data:
            for obj in list_of_students:
                name = obj.return_name()
                address = obj.return_address()
                email = obj.return_email()
                data.write(f'{name}\n{address[0]}\n{address[1]}\n{address[2]}\n{email}\n')
                print('Data successfully written to file.')
    # Exits program
    elif select == 7:
        exit(0)
    else:
        continue