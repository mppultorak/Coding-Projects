#include "R1.cpp"
#include "R2.cpp"
#include "R3.cpp"
#include "R7.cpp"
#include "R6.cpp"
#include "R8.cpp"
#include <limits>

/***********************
 * display_menu():
 * Description: displays a menu
 * Returns: Nothing
 * Receives: Nothing
 * Version: 03/11/22
 * Author: Michael Pultorak
 ***********************/
void display_menu()
{
    std::cout << '\n';
    std::cout << "1. Read csv file" << std::endl;
    std::cout << "2. Write csv file" << std::endl;
    std::cout << "3. Add grade item" << std::endl;
    std::cout << "4. Display grade items and total grade" << std::endl;
    std::cout << "5. Search for grade items" << std::endl;
    std::cout << "6. Exit program" << std::endl;
    std::cout << "Please select a menu option: ";
}

/***********************
 * get_input(int menuoption):
 * Description: Returns an int input from user and checks for non int inputs
 * Returns: User input
 * Receives: int
 * Version: 03/11/22
 * Author: Michael Pultorak
 ***********************/
int get_input(int menuoption)
{
    bool check = true;
    while (check)
    {
        std::cin >> menuoption;
        if (std::cin.fail()) // in case of string input clears cin fail state
        {                    // Code cited from: https://stackoverflow.com/questions/5864540/infinite-loop-with-cin-when-typing-string-while-a-number-is-expected
            std::cin.clear();
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
            std::cout << "Error: Menu item input is not an int." << std::endl; // outputs error for non int input
            display_menu();
            continue;
        }
        check = false; // checks for int input before returning
    }
    return menuoption;
}

/***********************
 * menu():
 * Description: Implements menu. Writes, reads, and displays
 *              items in a csv file. Items are saved to a vector of grade items
 * Returns: Nothing
 * Receives: Nothing
 * Version: 03/11/22
 * Author: Michael Pultorak
 ***********************/
void menu()
{
    std::string val;
    std::vector<int> scores = {0,0,0,0,0,0,0,0}; // 0-1 hw score and total - 2-3 class work score and total - 4-5 quiz score and total - 6-7 exam total and score
    std::vector<Grade> grades;
    int menuoption = 0;
    int menuloop = 1;
    while (menuloop == 1)
    {
        display_menu();
        menuoption = get_input(menuoption);
        switch (menuoption)
        {
            case (1):
                std::cout << "Enter file name: ";
                std::cin >> val;
                read_file(grades, val);
                break;

            case (2):
                std::cout << "Enter file name: ";
                std::cin >> val;
                write_file(grades, val);
                break;

            case (3):
                add_item(grades);
                break;

            case (4):
                display_list(grades); // prints list of grades
                print_summary(grades, scores); // prints score and grade for grades items
                break;

            case (5):
                search_grades(grades);
                break;

            case (6):
                menuloop = 0; // exits program
                break;

            default: // all incorrect int inputs are caught here
                std::cout << "Error: Menu item " << menuoption << " does not exist." << std::endl; // outputs error for incorrect int
                break;
        }
    }
}

