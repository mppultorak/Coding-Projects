#include "Rectangle.h"
#include "CompareArea.h"
#include "ComparePerimeter.h"
#include <vector>
#include <iostream>
using namespace std;

/***************************************
 * mainsource: 
 * Code uses template function to compare a vector of
   Retangle classes by both area and width

 * 10 objects of Rectangle will be put into a vector, 
   then the largest area and perimeter will be found and printed.

 * Author: Michael Pultorak
 * Version: 02/20/22
***************************************/
template<typename Object, typename Comparator>
const Object &findmax(const vector<Object> & rectangles, Comparator cmp)
{
    int max = 0;
    for (int i = 0 ; i < rectangles.size() ; i++)
    {
        if (cmp.isLessThan(rectangles[max], rectangles[i]))
            max = i;
    }
    return rectangles[max];
}


int main()
{
    vector<Rectangle> rectangles;
    for (int i = 0 ; i < 10 ;  i++)  // Creates 10 Rectangle objects of random length and width 
    {
        int randwidth = rand() % 20 + 1;    
        int randlen = rand() % 20 + 1;      
        rectangles.push_back(Rectangle(randwidth, randlen)); // Adds rectangle object into vector
    }

    compareArea area;
    comparePerimeter perimeter;

    Rectangle maxarea = findmax(rectangles, area); // finds rectangle object of the max area.
    Rectangle maxperimeter = findmax(rectangles, perimeter); // finds rectangle object of the max perimeter

    // prints out all rectangles:
    for (int i = 1 ; i < 11 ; i++)
    {
        cout << "Rectangle " << i << ":" << "\nArea: " << rectangles[i].get_area() << "\nPerimeter: " << rectangles[i].get_perimeter()
        << "\n\n";
    }

    // prints out max area and perimeter:
    cout << "The maximum area is: " << maxarea.get_area() << "\n" << "The maximum perimeter is: " << maxperimeter.get_perimeter() << endl;
    return 0;
}