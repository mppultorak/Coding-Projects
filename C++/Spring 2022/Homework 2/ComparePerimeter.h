#ifndef Rectangle_h
#define Rectangle_h
#endif

/***************************************
 * comeparePerimeter class: 
 * Class allows for comparing a Rectangle class by perimeter.
 * Class has one function that compares rectangle class by perimeter.

 * Author: Michael Pultorak
 * Version: 02/20/22
***************************************/
class comparePerimeter
{
    public:
    bool isLessThan(const Rectangle &r1, const Rectangle &r2)
    {
        return (r1.get_perimeter() < r2.get_perimeter());
    }
};