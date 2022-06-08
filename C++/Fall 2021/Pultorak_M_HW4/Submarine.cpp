#include "Submarine.h"

Submarine::Submarine()
{
    dive_depth = 0;
    set_starting_location(5,5);
    set_orientation("h");
    set_len(2);
    surfaced = true;
    Grid water;
}

Submarine::Submarine(int x, int y, int ship_lenIn, string orinationIn, int dive_depthIn)
{
    dive_depth = dive_depthIn;
    set_starting_location(x,y);
    set_orientation(orinationIn);
    set_len(ship_lenIn);
    if (dive_depthIn == 0)
        surfaced = true;
    else
        surfaced = false;
    Grid water;
}

int Submarine::get_dive_depth() const
{
    return dive_depth;
}

bool Submarine::get_surfaced() const
{
    return surfaced;
}

void Submarine::set_dive_depth(int dive)
{
    dive_depth = dive;
}

void Submarine::set_surfaced()
{
    surfaced = true;
}

void Submarine::build_vehicle()
{
    int x = get_x_starting_location();
    int y = get_y_starting_location();
    if (surfaced == false)
        return;
    else if (get_orientation() == "h")
    {
        for (int i = 0; i < get_len(); i++)
        {
            water.setVal(x,y);
            y++;

        }
    }

    else
    {
    for (int i = 0; i < get_len(); i++)
        {
            water.setVal(x,y);
            x++;

        }   
    }
}


void Submarine::torpedo_shots()
{
    int x = get_x_starting_location();
    int y = get_y_starting_location();
    int horzlim = x + get_len();
    int vertlim = y + get_len();
    water.random();
    if (dive_depth != 0)
        return;

    else if (get_orientation() == "h")
    {
        for (int i = x ; i < horzlim ; i++)
        {
            if (water.getVal(i,y) == 8)
                {
                    set_sunk(true);
                    return;
                }
        }
    }
    else
    {
        for (int k = y ; k < vertlim ; k++)
        {
            if (water.getVal(x,k) == 8)
                {
                    set_sunk(true);
                    return;
                }
        }
    }
}



void Submarine::operator=(const Submarine &sub)
{
    dive_depth = sub.get_dive_depth();
    surfaced = sub.get_surfaced();
    set_orientation(sub.get_orientation());
    set_len(sub.get_len());
    set_starting_location(sub.get_x_starting_location(),sub.get_y_starting_location());
    set_sunk(sub.get_sunk());
}

void Submarine::print()
{
    water.print();
}