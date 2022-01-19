#ifndef Grid_h
#define Grid_h
#endif

#include <iostream>
#include <stdlib.h>     /* for rand generator */

using namespace std;

#define PORTION 3       //assignment defines portion of grid to be 1/3
//#define SIZE 100        //we will assume there is no grid larger than a 100x100.

#define TEST 0           //change to 1 to see verbose, change to 0 for basic

//############################## CLASS DEFINITION BEGINS####################################

class Grid{
    private:
        int array[10][10]; //2D array, default size
        int col;//column size
        int row;//row size
        int compare(int a, int b);
        /* used in AND to create bitwise & functionality */
        
    public:
        Grid();
        /*Create 2D array to size X (col) by Y (row), initiate appropriate values to 0 */
        int getCol();
        /* returns col size */
        int getRow();
        /* returns row size */
        int getVal(int incol, int inrow);
        /* returns value of a specific index */
        void setVal(int incol, int inrow);
        /* sets value of index */
        void print();
        /* interate over row and col to print grid in understandable order */
        void random();
        /* fill grid with 1/portion of 1 values in random locations */
        
        void AND(Grid a, Grid b);
        /* checks a and b are same dimensions. Compares every index using by and, sets grid to result*/
        
        void build_vehicle(int x, int y, int length, string orienation, bool surfaced);
};

