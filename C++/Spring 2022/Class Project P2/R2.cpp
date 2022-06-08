#include "Grade.h"
#include <vector>
#include <string>
#include <iostream>

/***********************
 * add_item():
 * Description: Adds item to grade vector catches incorrect inputs
 * Returns: Nothing
 * Receives: Grade vector
 * Version: 04/12/22
 * Author: Michael Pultorak
 ***********************/
void add_item(std::vector<Grade> &grades)
{
    Grade new_obj;
    std::string grade;
    std::string maxgrade;
    std::string type;
    std::string description;
    std::string date;
    std::cout << "Enter grade value: ";
    std::cin >> grade;
    std::cout << "Enter maxgrade value: ";
    std::cin >> maxgrade;
    std::cin.ignore();
    std::cout << "Enter grade type: ";
    std::getline(std::cin, type);
    std::cout << "Enter grade description: ";
    std::getline(std::cin, description);
    std::cout << "Enter date: ";
    std::getline(std::cin, date);
    try
    {
        new_obj.set_grade(std::stoi(grade));
        new_obj.set_maxgrade(std::stoi(maxgrade));
        new_obj.set_type(type);
        new_obj.set_description(description);
        new_obj.set_date(date);
        grades.push_back(new_obj);
    }
    catch(...)
    {
        std::cout << "ERROR: failed to add new grade item." << std::endl;
    }
}