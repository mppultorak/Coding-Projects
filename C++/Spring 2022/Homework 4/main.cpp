#include "Carwash.h"

/***********************
 * main():
 * Description: Creates carwash object, reads input from file, simulates carwash, and displays output
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/22/22
 * Author: Michael Pultorak
 ***********************/
int main()
{
    Carwash car_wash;
    car_wash.read_input("arrival_time.txt");
    car_wash.start_simulation();
    car_wash.print_results();
    return 0;
}
