#include<iostream>
#include "SalesCalc.h"
using namespace std;

int main() // Main function returns amount of flowers sold in a week
{ 
    int flowers;
    int temp;
    int total;
    cin >> flowers;
    total = flowers;

    // For loop takes temp for the day of week and current amount of flowers. 
    // This is then given to sales function, which returns amount sold. This is then subtracted from flowers to find stock for the next day.
    for (int day = 0; day < 7; day++)  
    {
            cin >> temp;
            flowers -= sales(flowers, temp);
    }
    cout << "Estimated total sale is " << (total - flowers) << " plants." << endl; // Prints result (flowers sold).
    return 0;
}