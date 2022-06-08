#ifndef Grade_h
#define Grade_h
#include "Grade.h" // Guards against include errors
#endif

#include<iostream>
#include<fstream>
#include<vector>
#include<sstream>

/***********************
 * read_file(std::string const &file_name):
 * Description: Reads a .csv formatted file. The contents of this file are then put into a grade vector.
 *              Incorrect file names are caught and read_file is terminated.
 * Returns: Pointer to vector grade
 * Receives: file name
 * Version: 03/11/22
 * Author: Michael Pultorak
 ***********************/
std::vector<Grade> *read_file(std::string const &file_name)
{

    std::ifstream file(file_name);
    if (!file.is_open()) // if not open display an error
        std::cout << "Error: file could not open." << std::endl;
    auto *grades = new std::vector<Grade>;
    Grade grade;
    std::string headline;
    std::string date;
    std::string description;
    std::string type;
    std::string maxgrade;
    std::string gradeval;
    getline(file,headline); // skips heading
    while(file.good()) // will skip if not open
    {
        getline(file,headline); // gets line
        if (headline.empty())
            break; // stops reading if line is empty
        std::stringstream ss(headline); // uses string stream to break line by commas
        while (ss.good())
        {
            getline(ss,date,',');
            getline(ss,description, ',');
            getline(ss,type,',');
            getline(ss,maxgrade,',');
            getline(ss,gradeval,',');
        }


        grade.set_date(date);
        grade.set_description(description);
        grade.set_type(type);
        grade.set_maxgrade(std::stoi(maxgrade));
        grade.set_grade(std::stoi(gradeval));
        grades->push_back(grade);

    }
    file.close();
    return grades;
}

