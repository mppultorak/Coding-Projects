#include "Carwash.h"

/***********************
 * Carwash():
 * Description: Initalizes carwash. Closing time is set to 540 to represent time of 8:00am to 5:00pm
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
Carwash::Carwash()
{
    current_time = 0;
    closing_time = 540;
    total_wait_time = 0;
    total_carwash_time = 0;
    avg_wait_time = 0;
    number_of_cars = 0;
    percent_usage = 0;
}

/***********************
 * wash_car():
 * Description: Sets start time for car at top of queue. Increases car_wash time by 3 to represent a car wash.
 *              Increases total wait time by how long car waited to be washed. Increases time by 3 to represent time taken to wash car.
 *              Increases number of cars washed.
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
void Carwash::wash_car()
{
    carwash_queue.front().set_start(current_time);
    total_carwash_time += 3;
    total_wait_time += (carwash_queue.front().get_start() - carwash_queue.front().get_arrival());
    current_time += 3;
    number_of_cars++;
    write_output(carwash_queue.front());
    carwash_queue.pop();
}

/***********************
 * read_input():
 * Description: Populates car class queue with car objects given by the arrival time in a text file
 * Returns: Nothing but carwash queue is full
 * Receives: Input file name
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
void Carwash::read_input(std::string const &input_file)
{
    int number = 0;
    Car current_car;
    std::string current_val;
    std::ifstream file(input_file);
    if (!file.good())
    {
        std::cout << "ERROR: file could not open." << std::endl;
    }
    while(file.good())
    {
        getline(file, current_val);
        current_car.set_arrival(std::stoi(current_val));
        current_car.set_number(number);
        carwash_queue.push(current_car);
        number++;
    }
    file.close();
}

/***********************
 * print_late_error():
 * Description: For all items left in the car queue, print an error for all items
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
void Carwash::print_late_error()
{
    while(!carwash_queue.empty())
    {
        std::cout << std::left << std::setw(15) << std::setfill(' ') << carwash_queue.front().get_number();
        std::cout << std::left << std::setw(15) << std::setfill(' ') << carwash_queue.front().get_arrival();
        std::cout << std::left << std::setw(20) << std::setfill(' ') << "Car has not been served" << std::endl;
        carwash_queue.pop();
    }
}

/***********************
 * start_simulation():
 * Description: For all items in the car queue, while not past closing time, washes cars.
 *              Prints error for cars in queue not washed and finds average wait time and percentage of uses.
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
void Carwash::start_simulation()
{
    if (carwash_queue.empty())
    {
        std::cout << "ERROR: carwash queue is empty" << std::endl;
        return;
    }
    write_header();
    while (current_time < closing_time)
    {
        if (carwash_queue.front().get_arrival() <= current_time)
            wash_car();

        else
            current_time++;
    }

    print_late_error();
    avg_wait_time = ((float)total_wait_time/ (float)number_of_cars);
    percent_usage = ((float)total_carwash_time/(float)closing_time)*100;

}

/***********************
 * write_header():
 * Description: Prints header for table output
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
void Carwash::write_header() const
{
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "Car Number";              //
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "Arrival time";            //  Displays heading for data
    std::cout << std::left << std::setw(25) << std::setfill(' ') << "Car wash start time";     //
    std::cout << std::left << std::setw(20) << std::setfill(' ') << "Departure time";          //
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "Wait time";               //
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "Total time" << std::endl; //
}

/***********************
 * write_output():
 * Description: prints value for a car object
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
void Carwash::write_output(Car &item) const
{
    if (carwash_queue.empty()) // stops from printing if no items in grades
        return;
    std::cout << std::left << std::setw(15) << std::setfill(' ') << (item.get_number() + 1);
    std::cout << std::left << std::setw(15) << std::setfill(' ') << item.get_arrival();
    std::cout << std::left << std::setw(25) << std::setfill(' ') << item.get_start();
    std::cout << std::left << std::setw(20) << std::setfill(' ') << (item.get_start() + 3);
    std::cout << std::left << std::setw(15) << std::setfill(' ') << (item.get_start() - item.get_arrival());
    std::cout << std::left << std::setw(15) << std::setfill(' ') << ((item.get_start() - item.get_arrival()) + 3) << std::endl;

}

/***********************
 * print_results():
 * Description: Outputs statistics of simulation.
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
void Carwash::print_results() const
{
    float fractional = (avg_wait_time - floor(avg_wait_time));
    std::cout << "\nEnd of simulation\n" << std::endl;
    std::cout << "Statistics:" << std::endl;
    std::cout << "Total wait time: " << total_wait_time << std::endl;
    std::cout << "Average wait time: " << (avg_wait_time - fractional) << " minutes and " << std::setprecision(3) << (fractional*60) << " seconds." << std::endl;
    std::cout << "Total carwash time: " << total_carwash_time << std::endl;
    std::cout << "Percentage of time in use: " << std::setprecision(3) << percent_usage << "%" << std::endl;
}

