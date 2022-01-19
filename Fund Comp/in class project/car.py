class Car:
    def __init__(self, vin, make, model, year, price):
        self.vin = vin
        self.make = make
        self.model = model
        self.year = year
        self.price = price

    def __repr__(self):
        return f"""
                VIN   : {self.vin}
                Make  : {self.make}
                Model : {self.model}
                Year  : {self.year}
                Price : {self.price}"""
