
class Image:

    def __init__(self, data: list, width: int, height: int, channel: int):
        self.data = data
        self.width = width
        self.height = height
        self.channel = channel

    def width(self):
        return self.width

    def height(self):
        return self.height

    def channel(self):
        return self.channel

    def shape(self):
        return (self.width, self.height, self.channel)

    def normalize(self, factor):
        new_data = []
        for item in self.data:
            tmp = int(item) / factor
            new_data.append(tmp)
        self.data = new_data

    def average(self):
        summ = 0
        for item in self.data:
            summ += int(item)
        avg = summ / len(self.data)
        return avg


image = Image([1,2,3,4,5], 16, 10, 3)
print(f'Width: {image.width}')
print(f'Height: {image.height}')
print(f'Channel: {image.channel}')
print(f'Shape: {image.shape()}')
print(f'Avg: {image.average()}')
image.normalize(2)
print(f'Avg after normal: {image.average()}')
