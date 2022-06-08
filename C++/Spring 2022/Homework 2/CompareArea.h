#ifndef Rectangle_h
#define Rectangle_h
#endif

/***************************************
 * comepareArea class: 
 * Class allows for comparing a Rectangle class by area.
 * Class has one function that compares rectangle class by area.

 * Author: Michael Pultorak
 * Version: 02/20/22
***************************************/
class compareArea
{
    public:
    bool isLessThan(const Rectangle &r1, const Rectangle &r2)
    {
        return (r1.get_area() < r2.get_area());
    }  
};