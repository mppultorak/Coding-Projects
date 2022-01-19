#ifndef Submarine_h
#define Submarine_h
#endif
#include "Grid.h"
#include "WaterVehicle.h"


class Submarine : public WaterVehicle
{
    public:
    Submarine();
    Submarine(int x, int y, int ship_lenIn, string orinationIn, int dive_depthIn);
    int get_dive_depth() const;
    bool get_surfaced() const;
    void set_dive_depth(int dive);
    void set_surfaced();
    void build_vehicle();
    void torpedo_shots();
    void operator=(const Submarine &sub);
    void print();

    private:
    Grid water;
    int dive_depth;
    bool surfaced;
};
