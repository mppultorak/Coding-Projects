#include "Rectangle.h"

/***************************************
 * Rectangle class definition: 
 * Definiion of class functions in Rectangle class.

 * Author: Michael Pultorak
 * Version: 02/20/22
***************************************/
Rectangle::Rectangle(int width, int length)
{
    this->width = width;
    this->length = length;
}

Rectangle::Rectangle()
{
    width = 0;
    length = 0;
}

int Rectangle::get_width() const
{
    return width;
}

int Rectangle::get_length() const
{
    return length;
}

int Rectangle::get_area() const
{
    return (length * width);
}

int Rectangle::get_perimeter() const
{
    return (2*length + 2*width);
}

void Rectangle::set_width(int width)
{
    this->width = width;
}

void Rectangle::set_length(int length)
{
    this->length = length;
}