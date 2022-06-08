#include "Grade.h"
#include <vector>
#include <iostream>
#include <string>
#include <algorithm>

/***********************
 * display_header():
 * Description: displays a header for grade items
 * Returns: Nothing
 * Receives: Nothing
 * Version: 04/12/22
 * Author: Michael Pultorak
 ***********************/
void display_header()
{
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "Date";                 //
    std::cout << std::left << std::setw(35) << std::setfill(' ') << "Description";          //  Displays heading for data
    std::cout << std::left << std::setw(25) << std::setfill(' ') << "Type";                 //
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "MaxGrade";             //
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "Grade" << std::endl;   //
}

/***********************
 * display_grade():
 * Description: Displays one grade item passed
 * Returns: Nothing
 * Receives: Grade item
 * Version: 04/12/22
 * Author: Michael Pultorak
 ***********************/
void display_grade(Grade const &grade_item)
{
    std::cout << std::left << std::setw(15) << std::setfill(' ') << grade_item.get_date();
    std::cout << std::left << std::setw(35) << std::setfill(' ') << grade_item.get_description();
    std::cout << std::left << std::setw(25) << std::setfill(' ') << grade_item.get_type();
    std::cout << std::left << std::setw(15) << std::setfill(' ') << grade_item.get_maxgrade();
    std::cout << std::left << std::setw(15) << std::setfill(' ') << grade_item.get_grade() << std::endl;
}

/***********************
 * search_menu():
 * Description: Takes input of type of search: 1. data
 *                                             2. description
 *                                             all other inputs return 0 and result in error
 * Returns: input
 * Receives: Nothing
 * Version: 04/12/22
 * Author: Michael Pultorak
 ***********************/
int search_menu()
{
    std::string input_type;
    std::cout << "1. date\n2. description\nEnter search type (1-2): ";
    std::cin >> input_type;
    if (input_type == "1")
        return 1;

    else if (input_type == "2")
        return 2;

    else
        return 0;
}

/***********************
 * search_grades(std::vector<Grade> const &grades):
 * Description: searches grade item dates or descriptions and prints them to terminal
 * Returns: Nothing
 * Receives: Grade vector
 * Version: 04/12/22
 * Author: Michael Pultorak
 ***********************/
void search_grades(std::vector<Grade> const &grades)
{
    int search_type = search_menu();
    if (search_type < 1 || search_type > 2)  // error for wrong input
    {
        std::cout << "ERROR: input is not a search type" << std::endl;
        return;
    }

    std::string value;
    std::cout << "Enter item to search: ";
    std::cin.ignore();
    std::getline(std::cin, value);
    display_header(); // displays menu heading
    for (int i = 0; i < grades.size(); i++)
    {
        if (search_type == 1)
        {
            if (grades[i].get_date() == value)
                display_grade(grades[i]); // prints grade item
        }

        else if (search_type == 2)
        {
            if (grades[i].get_description() == value)
                display_grade(grades[i]); // prints grade item
        }
    }
}