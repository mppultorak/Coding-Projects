class Menu:
    def __init__(self):
        self._select_menu = None
        self.menu = """
            1. Read Dealers and Cars from file
            2. Display Dealers
            3. Choose a Dealer Number, Display Cars
            4. Choose a Dealer Number, Add Car
            5. Choose a Dealer Number, List Cars and Modify a Car
            6. Choose a Dealer, Sort cars by VIN
            7. Write Dealers and Cars to file
            8. Exit
            """

    def selected_menu(self):
        selection = self._select_menu
        return selection
    
    def display(self):
        print(self.menu)
        
    def select(self):
        self._select_menu = None
        while not self._select_menu:
            self.display()
            try:
                self._select_menu = int(input('Select a menu option: '))

            except ValueError as err:
                print(f'Invalid input. Menu: {self._select_menu}')
                self._select_menu = None
                continue

            if self._select_menu < 1 or self._select_menu > 8:
                print("Error: Selected menu is outside of range [1,8].")
                self._select_menu = None


if __name__ == "__main__":
    menu = Menu()
    menu.display()
    menu.select()  
