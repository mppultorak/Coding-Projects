#include "Grade.h"
#include <vector>
#include <iostream>
#include <iomanip>

/***********************
 * display_list(std::vector<Grade> *grades):
 * Description: Displays values in vector grade in a column format
 * Returns: Nothing
 * Receives: Pointer to vector grade
 * Version: 03/11/22
 * Author: Michael Pultorak
 ***********************/
void display_list(std::vector<Grade> const &grades)
{
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "Date";                 //
    std::cout << std::left << std::setw(35) << std::setfill(' ') << "Description";          //  Displays heading for data
    std::cout << std::left << std::setw(25) << std::setfill(' ') << "Type";                 //
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "MaxGrade";             //
    std::cout << std::left << std::setw(15) << std::setfill(' ') << "Grade" << std::endl;   //
    if (grades.empty()) // stops from printing if no items in grades
        return;
    for (int i = 0; i < grades.size(); i++)
    {
        std::cout << std::left << std::setw(15) << std::setfill(' ') << grades[i].get_date();
        std::cout << std::left << std::setw(35) << std::setfill(' ') << grades[i].get_description();
        std::cout << std::left << std::setw(25) << std::setfill(' ') << grades[i].get_type();
        std::cout << std::left << std::setw(15) << std::setfill(' ') << grades[i].get_maxgrade();
        std::cout << std::left << std::setw(15) << std::setfill(' ') << grades[i].get_grade() << std::endl;
    }
}

