from menu import Menu
from dealer_utils import read_dealers_and_cars, display_cars


class Portal:
    def __init__(self):
        self._menu = Menu()
        self._dealers = []




    def run(self):
        self._menu.select()

        while True:
            menu_selection = int(self._menu.selected_menu())

            if menu_selection == 1:
                print('1. Read dealers and cars from file')
                self._dealers = read_dealers_and_cars('data.txt')

            elif menu_selection == 2:
                for dealer in self._dealers:
                    print(dealer)

            elif menu_selection == 3:
                display_cars(self._dealers)

            elif menu_selection == 4:
                pass

            elif menu_selection == 5:
                pass
            elif menu_selection == 6:
                pass


            elif menu_selection == 7:
                pass
            elif menu_selection == 8:
                print('Ending program: Bye!')
                exit(0)
            self._menu.select()


if __name__ == '__main__':
    portal = Portal()
    portal.run()
