#ifndef CARWASH_H
#define CARWASH_H
#include <queue>
#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
#include <cmath>
#include "Car.h"

/***********************
 * class: Carwash
 * Description: The carwash class simulates a carwash. A file of arrival times is read into a queue of Car classes.
 *              The carwash can then by simulated by start_simulation().
 *              Finally, the output of the simulation can by written by write_output();
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
class Carwash
{
    public:
    Carwash();
    void wash_car();
    void read_input(std::string const &input_file);
    void start_simulation();
    void write_output(Car &item) const;
    void write_header() const;
    void print_late_error();
    void print_results() const;

    private:
    int number_of_cars;
    int current_time;
    int closing_time;
    int total_wait_time;
    int total_carwash_time;
    std::queue<Car> carwash_queue;
    float avg_wait_time;
    float percent_usage;
};


#endif //HW4_CARWASH_H
