
/***************************************
 * Rectangle class: 
 * Class allows for the creation of a rectangle object. 
 * Class has two member variables length and width.
 * Class has basic set and get functions and functions to get area and perimeter.

 * Author: Michael Pultorak
 * Version: 02/20/22
***************************************/
class Rectangle
{
    private:
    int length;
    int width;

    public:
    Rectangle(int width, int length);
    Rectangle(); 
    int get_width() const;
    int get_length() const;
    int get_area() const;
    int get_perimeter() const;
    void set_width(int width);
    void set_length(int length);
};