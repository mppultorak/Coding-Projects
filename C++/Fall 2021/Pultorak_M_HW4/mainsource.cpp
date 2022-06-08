#include "Submarine.h"
#include <iostream>


int main()
{
    int x, y, ship_lenIn, dive_depthIn;
    string orientationIn;
    cout << "============== Build your ship! ==============\n"
              << "Enter ship length: ";
    cin >> ship_lenIn;
    cout << "Enter starting x location: ";
    cin >> x;
    cout << "Enter starting y location: ";
    cin >> y;
    cout << "Will the ship be orientated virtical ('v')\nOr horizontal ('h'): ";
    cin >> orientationIn;
    cout << "Enter dive depth: ";
    cin >> dive_depthIn;
    Submarine sub(x,y,ship_lenIn,orientationIn,dive_depthIn);
    Submarine sub2;
    sub.build_vehicle();
    sub.torpedo_shots();
    sub.print();
    if (sub.get_sunk() == true)
        cout << "You ship was hit by a torpedo!\n" << "It is sinking" << endl;
    else
        cout << "That was close!\n" << "Your ship survived the torpedos!" << endl;
    sub2 = sub;
    cout << "Sub2 x coordinate: " << sub2.get_x_starting_location() << endl;
    cout << "Sub2 y coordinate: " << sub2.get_y_starting_location() << endl;
    cout << "Sub2 ship length: " << sub2.get_len() << endl;
    cout << "Sub2 orientation: " << sub2.get_orientation() << endl;
    cout << "Sub2 bool sunk val: " << sub2.get_sunk() << endl;
    cout << "Sub2 dive depth: " << sub2.get_dive_depth() << endl;


    return 0;
}