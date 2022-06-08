#ifndef WaterVehicle_h
#define WaterVehicle_h
#endif

#include <string>
using std::string;

class WaterVehicle
{
    public:
    WaterVehicle();
    WaterVehicle(int x, int y, int len, string orientationIn);
    int get_len() const;
    int get_x_starting_location() const;
    int get_y_starting_location() const;
    string get_orientation() const;
    bool get_sunk() const;
    void set_len(int lenIn);
    void set_orientation(string orientationIn);
    void set_sunk(bool sunkIn);
    void set_starting_location(int x, int y);

    private:
    int ship_len;
    int starting_location[2];
    string orientation; 
    bool sunk;
};