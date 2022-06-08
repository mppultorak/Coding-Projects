#ifndef _Grid_h
#define _Grid_h
#endif

#include <iostream>
#include <stdlib.h>     /* for rand generator */

using namespace std;

#define PORTION 3       //assignment defines portion of grid to be 1/3
#define SIZE 100        //we will assume there is no grid larger than a 100x100.

#define TEST 0           //change to 1 to see verbose, change to 0 for basic


Grid::Grid(){
    /*Create 2D array to size X (col) by Y (row), initiate appropriate values to 0 */
    col = 10;
    row = 10;
    for (int i = 0; i<row ; i++) {      //iterate over row
        for (int j = 0; j<col; j++) {   //iterate over column
            array[i][j] = 0;
        }
    }
}

int Grid::getCol(){
    /* returns col size */
    return col;
}

int Grid::getRow(){
    /* returns row size */
    return row;
}

int Grid::getVal(int incol, int inrow){
    /* returns value of a specific index */
    return array[inrow-1][incol-1];
}

void Grid::print(){
    /* interate over row and col to print grid in understandable order */
    for (int y = 0; y<row ; y++) {
        for (int x = 0; x<col; x++) {
            cout << array[y][x] << " ";//access every value, print space
        }
        cout << endl; //print new line for new row
    }
    
}

void Grid::random(){
    /* fill grid with 1/portion of 1 values in random locations */
    int fill = 15;           //determine amount of 1s to place
    if (TEST){
        cout << "third of " << (col*row) << " is " << fill << endl;
    }
    int index = 0;
    while (index<fill) {
        int rcol = rand() % col;            //random number for col index
        int rrow = rand() % row;
        if (8!=array[rrow][rcol]) {
            array[rrow][rcol] = 8;          //change value to 1
            index++;                        //one more filled, continue loop
        }                                   //if location already changed, do not iterate, try again.
    }
    
}

int Grid::compare(int a, int b){
    if ((1==a)&&(1==b)) {
        return 1;
    }else
        return 0;
}

void Grid::AND(Grid a, Grid b){
    /* checks a and b are same dimensions. Compares every index using by and, sets grid to result*/
    if ((a.getCol()!=b.getCol())||(a.getRow()!=b.getRow())){
        cout << "These grids are not the same dimensions, and cannot be compared";
        return;
    }else{
        col = a.getCol();           //this is redundant
        row = a.getRow();           //already assuming grid C created to the same dimensions ***** TODO *******
        for (int y = 0; y<row ; y++) {
            for (int x = 0; x<col; x++) {
                array[y][x] = compare(a.getVal(x, y),b.getVal(x, y));
            }
        }
    }
    
}

void Grid::setVal(int incol, int inrow)
{
    incol--;
    inrow--;
    array[incol][inrow] = 1;
}

/*
void Grid::build_vehicle(int x, int y, int length ,string orienation, bool surfaced)
{
    if (surfaced == false)
        return;
    else if (orienation == "h")
    {
        for (int i = 0; i < length; i++)
        {
            setVal(x,y);
            y++;

        }
    }

    else
    {
    for (int i = 0; i < length; i++)
        {
            setVal(x,y);
            x++;

        }   
    }
}
*/
// ###################################CLASS DEFINITION ENDS################################
