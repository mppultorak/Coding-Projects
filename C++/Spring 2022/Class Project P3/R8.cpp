#include "Grade.h"
#include <vector>
#include <iostream>
#include <string>
#include <iomanip>

/***********************
 * find_letter_grade():
 * Description: Finds letter grade for percentage
 * Returns: Float value for percentage
 * Receives: String value representing grade
 * Version: 05/08/22
 * Author: Michael Pultorak
 ***********************/
std::string find_letter_grade(float percentage)
{
    if (percentage < 60)
        return "F";
    else if (percentage < 70)
        return "D";
    else if (percentage < 80)
        return "C";
    else if (percentage < 90)
        return "B";
    else
        return "A";
}

/***********************
 * format_summary():
 * Description: Prints table for total grade scores int each type
 * Returns: Nothing
 * Receives: Vector of int representing total and score received for each grade type
 * Version: 05/08/22
 * Author: Michael Pultorak
 ***********************/
void format_summary(std::vector<int> &scores)
{
    int max_score = (scores[1] + scores[3] + scores[5] + scores[7]);
    int score = (scores[0] + scores[2] + scores[4] + scores[6]);
    std::cout << std::left << std::setw(105) << std::setfill('-') << "-" << std::endl;
    std::cout << "Summary:" << std::endl;

    std::cout << std::left << std::setw(75) << std::setfill(' ') << "HW";
    std::cout << std::left << std::setw(15) << std::setfill(' ') << scores[1]; // max hw
    std::cout << std::left << std::setfill(' ') << scores[0] << std::endl;        // hw score

    std::cout << std::left << std::setw(75) << std::setfill(' ') << "Class Work";
    std::cout << std::left << std::setw(15) << std::setfill(' ') << scores[3]; // max class work
    std::cout << std::left << std::setfill(' ') << scores[2] << std::endl;        // class work score

    std::cout << std::left << std::setw(75) << std::setfill(' ') << "Quiz";
    std::cout << std::left << std::setw(15) << std::setfill(' ') << scores[5]; // quiz max
    std::cout << std::left << std::setfill(' ') << scores[4] << std::endl;        // quiz score

    std::cout << std::left << std::setw(75) << std::setfill(' ') << "Exam";
    std::cout << std::left << std::setw(15) << std::setfill(' ') << scores[7]; // exam max
    std::cout << std::left << std::setfill(' ') << scores[6] << std::endl;        // exam score

    std::cout << std::left << std::setw(105) << std::setfill('-') << "-" << std::endl;

    std::cout << std::left << std::setw(75) << std::setfill(' ') << "Grand total";
    std::cout << std::left << std::setw(15) << std::setfill(' ') << max_score; // max score
    std::cout << std::left << std::setfill(' ') << score << std::endl;        // total score

    std::cout << std::left << std::setw(90) << std::setfill(' ') << "Grade percentage" << std::setprecision(3) << ((float(score)/float(max_score))*100) << "%" << std::endl; // percentage

    std::cout << std::left << std::setw(90) << std::setfill(' ') << "Letter grade" << find_letter_grade((float(score)/float(max_score)*100)) << std::endl; // letter grade
}

/***********************
 * print_summary():
 * Description: Finds total scores for each grade type
 * Returns: Nothing
 * Receives: Vector of grades and vector of scores
 * Version: 05/08/22
 * Author: Michael Pultorak
 ***********************/
void print_summary(std::vector<Grade> &grades, std::vector<int> &scores)
{
    for (int i = 0; i < grades.size(); i++)
    {
        if (grades[i].get_type() == "HW")
        {
            scores[0] += grades[i].get_grade();
            scores[1] += grades[i].get_maxgrade();
        }

        else if (grades[i].get_type() == "Class Work")
        {
            scores[2] += grades[i].get_grade();
            scores[3] += grades[i].get_maxgrade();
        }

        else if (grades[i].get_type() == "Quiz")
        {
            scores[4] += grades[i].get_grade();
            scores[5] += grades[i].get_maxgrade();
        }

        else if (grades[i].get_type() == "Exam")
        {
            scores[6] += grades[i].get_grade();
            scores[7] += grades[i].get_maxgrade();
        }

        else
            std::cout << "ERROR: type '" << grades[i].get_type() << "' is not supported and scores will not be included in final score." <<std::endl;

    }

    format_summary(scores);
}

