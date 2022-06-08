#include "WaterVehicle.h"

int WaterVehicle::get_len() const
{
    return ship_len;
}

std::string WaterVehicle::get_orientation() const
{
    return orientation;
}

bool WaterVehicle::get_sunk() const
{
    return sunk;
}

void WaterVehicle::set_len(int lenIn)
{
    ship_len = lenIn;
}

void WaterVehicle::set_orientation(string orientationIn)
{
    orientation = orientationIn;
}

void WaterVehicle::set_sunk(bool sunkIn)
{
    sunk = sunkIn;
}   

int WaterVehicle::get_x_starting_location() const
{
    int x = starting_location[0];
    return x;
}

int WaterVehicle::get_y_starting_location() const
{
    int y = starting_location[1];
    return y;
}

void WaterVehicle::set_starting_location(int horz, int vert)
{
    starting_location[0] = vert;
    starting_location[1] = horz;
}

/*
void WaterVehicle::build_vehicle()
{
    int x = get_x_starting_location();
    int y = get_y_starting_location();
    if (orientation == "h")
    {
        for (int i = 0; i < ship_len; i++)
        {
            water.setVal(x,y);
            y++;

        }
    }

    else
    {
    for (int i = 0; i < ship_len; i++)
        {
            water.setVal(x,y);
            x++;

        }   
    }
}
*/

WaterVehicle::WaterVehicle(int x, int y, int ship_lenIn, string orinationIn)
{
    orientation = orinationIn;
    ship_len = ship_lenIn;
    set_starting_location(x,y);
}

WaterVehicle::WaterVehicle()
{
    int x = 5;
    int y = 5;
    orientation = "h";
    sunk = false;
}

