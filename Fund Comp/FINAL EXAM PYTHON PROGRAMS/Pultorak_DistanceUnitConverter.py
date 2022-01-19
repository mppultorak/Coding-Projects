

class DistanceUnitConverter:

    def __init__(self, value, unit):
        self.value = int(value)
        self.unit = unit

    def feet(self):
        if self.unit == 'feet':
            return self.value
        elif self.unit == 'inches':
            return self.value / 12
        elif self.unit == 'meters':
            return self.value * 3.281
        elif self.unit == 'miles':
            return self.value * 5280
        else:
            return self.value * 3

    def inches(self):
        if self.unit == 'feet':
            return self.value * 12
        elif self.unit == 'inches':
            return self.value
        elif self.unit == 'meters':
            return self.value / 39.37
        elif self.unit == 'miles':
            return self.value * 63360
        else:
            return self.value * 36

    def meters(self):
        if self.unit == 'feet':
            return self.value / 3.281
        elif self.unit == 'inches':
            return self.value / 39.37
        elif self.unit == 'meters':
            return self.value
        elif self.unit == 'miles':
            return self.value * 1609
        else:
            return self.value / 1.094

    def miles(self):
        if self.unit == 'feet':
            return self.value / 5280
        elif self.unit == 'inches':
            return self.value / 63360
        elif self.unit == 'meters':
            return self.value / 1609
        elif self.unit == 'miles':
            return self.value
        else:
            return self.value / 1760

    def yards(self):
        if self.unit == 'feet':
            return self.value / 3
        elif self.unit == 'inches':
            return self.value * 36
        elif self.unit == 'meters':
            return self.value * 1.094
        elif self.unit == 'miles':
            return self.value * 1760
        else:
            return self.value



