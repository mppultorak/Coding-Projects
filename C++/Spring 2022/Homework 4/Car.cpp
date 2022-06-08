#include "Car.h"

// implementation of car class
Car::Car()
{
    int car_number = 0;
    int arrival_time = 0;
    int start_time = 0;
}

Car::Car(int car_number, int arrival_time, int start_time)
{
    this->car_number = car_number;
    this->arrival_time = arrival_time;
    this->start_time = start_time;
}

int Car::get_number() const
{
    return car_number;
}

int Car::get_arrival() const
{
    return arrival_time;
}

int Car::get_start() const
{
    return start_time;
}

void Car::set_arrival(int arrival_time)
{
    this->arrival_time = arrival_time;
}

void Car::set_number(int car_number)
{
    this->car_number = car_number;
}

void Car::set_start(int start_time)
{
    this->start_time = start_time;
}