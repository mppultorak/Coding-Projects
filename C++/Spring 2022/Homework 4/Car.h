#ifndef CAR_H
#define CAR_H

/***********************
 * class: Car
 * Description: One car object contains a car number, or order of arrival, a arrival time,
 *                  and the start time of when the carwash begins.
 *                  (contains all get / set methods)
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
class Car
{
    public:
    Car();
    Car(int car_number, int arrival_time, int start_time);
    int get_number() const;
    int get_arrival() const;
    int get_start() const;
    void set_number(int car_number);
    void set_arrival(int arrival_time);
    void set_start(int start_time);

    private:
    int car_number;
    int arrival_time;
    int start_time;

};

#endif //CAR_H
