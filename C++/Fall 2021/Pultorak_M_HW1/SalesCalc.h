// Header file for sales calculation.
#include<cmath>

int sales(int flowers, int temp) // Sales function that takes ammount of flowers and temp and returns amount of flowers sold.
{
   if (temp < 40)
        flowers = (floor (flowers * .10));
        
    else if (40 <= temp && temp < 60)
        flowers = (floor (flowers * .30));
        
    else if (60 <= temp && temp < 70)
        flowers = (floor (flowers * .50));
        
    else if (70 <= temp && temp < 80)
        flowers = (floor (flowers * .60));

    else
        flowers = (floor (flowers * .40));

    return flowers;
}