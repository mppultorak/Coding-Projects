import os
from dealer import Dealer
from car import Car


def read_dealers_and_cars(filename):
    assert filename, "Must supply file."
    assert isinstance(filename, str), "File name must be of type str"

    if not os.path.exists(filename):
        raise ValueError(f"Supplied File name {filename} does not exist.")

    dealers_list = []
    with open(filename, 'r') as file:

        dealer_name = file.readline().strip()

        while dealer_name != "":
            dealer_number = file.readline().strip()
            number_of_cars = int(file.readline().strip())

            dealer = Dealer(dealer_name, dealer_number, number_of_cars)

            for i in range(number_of_cars):
                vin = file.readline().strip()
                make = file.readline().strip()
                model = file.readline().strip()
                year = file.readline().strip()
                price = file.readline().strip()

            car = Car(vin, make, model, year, price)
            dealer.add_car(car)
            dealers_list.append(dealer)

            dealer_name = file.readline().strip()

    return dealers_list


def display_cars(dealers_list):
    dealer_num = int(input('Enter dealer: '))
    for dealer in dealers_list:
        if dealer.id == dealer_num:
            for car in dealer.lot:
                print(car)