#ifndef Grade_h
#define Grade_h
#include "Grade.h" // avoids include errors
#endif

#include <fstream>
#include <vector>
#include <iostream>

/***********************
 * write_file(std::vector<Grade> *grades, const std::string& file_name):
 * Description: Writes a .csv formatted file from a vector of grades.
 * Returns: Nothing
 * Receives: Pointer to grade vector and string for file name
 * Version: 03/11/22
 * Author: Michael Pultorak
 ***********************/
void write_file(std::vector<Grade> *grades, const std::string& file_name)
{
    std::ofstream outfile(file_name);
    outfile << "Date" << "," << "Description" << "," <<    // Writes heading for data
    "Type" << "," << "MaxGrade" << "," << "Grade" << "\n"; //
    if (grades == nullptr) // checks if nothing is in grades vector
	return;  
    for (auto itr = grades->begin() ; itr != grades->end(); itr++)
    {
        outfile << itr->get_date() << "," << itr->get_description() << "," <<
        itr->get_type() << "," << itr->get_maxgrade() << "," << itr->get_grade() << "\n";
    }
    outfile.close();
}
