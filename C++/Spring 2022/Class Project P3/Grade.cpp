#include "Grade.h"

// Implementation of grade class:
Grade::Grade()
{
    date = "";
    description = "";
    type = "";
    maxgrade = 0;
    grade = 0;
}

Grade::Grade(int grade, int maxgrade, std::string type, std::string description, std::string date)
{
    this->date = date;
    this->description = description;
    this->type = type;
    this->maxgrade = maxgrade;
    this->grade = grade;
}

int Grade::get_grade() const
{
    return grade;
}

int Grade::get_maxgrade() const
{
    return maxgrade;
}

std::string Grade::get_type() const
{
    return type;
}

std::string Grade::get_date() const
{
    return date;
}

std::string Grade::get_description() const
{
    return description;
}

void Grade::set_grade(int grade)
{
    this->grade = grade;
}

void Grade::set_maxgrade(int maxgrade)
{
    this->maxgrade = maxgrade;
}

void Grade::set_type(std::string type)
{
    this->type = type;
}

void Grade::set_description(std::string description)
{
    this->description = description;
}

void Grade::set_date(std::string date)
{
    this->date = date;
}


