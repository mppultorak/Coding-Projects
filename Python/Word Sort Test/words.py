class word_sort:
    def __init__(self, input_string):       # Constructor: pass string value to sort
        self.class_string = input_string

    def print_words(self):                  # Prints string
        print(self.class_string)

    def __separate_words(self):
        self.class_string = self.class_string.split(" ")    # Separates words by space
    
    def __join_words(self):
        self.class_string = " ".join((i) for i in self.class_string)    # Joins words by space

    def __strip_nonchars(self):
        self.class_string = "".join(i for i in self.class_string if i.isalpha() or i == " ") # Removes non-characters from string except spaces 

    def sort_words(self):
        self.__strip_nonchars()
        self.__separate_words()
        self.class_string.sort()
        self.__join_words()