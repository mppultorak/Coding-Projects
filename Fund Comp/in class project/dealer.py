from car import Car


class Dealer:
    def __init__(self, name, dealer_id, number_of_cars):
        self.name = name
        self.id = int(dealer_id)
        self.number_of_cars = number_of_cars
        self.lot = []

    def add_car(self, car: Car):
        self.lot.append(car)

    def __str__(self):
        return f"""
        Dealer Name    : {self.name}
        Dealer Id      : {self.id}
        Number of Cars : {self.number_of_cars}
        """