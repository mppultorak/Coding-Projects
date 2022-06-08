#ifndef GRADE_H
#define GRADE_H
#include<string>

/***********************
 * class Grade:
 * Description: Grade obj represents one grade value. Each grade has a:
 *              (Grade, maximum grade, type of grade, description, and date).
 *              Has set / get functions or all items.
 *
 * Returns: Nothing
 * Version: 03/11/22
 * Author: Michael Pultorak
 ***********************/
class Grade
{
private:
    int grade;
    int maxgrade;
    std::string type;
    std::string description;
    std::string date;

public:
    Grade();
    Grade(int grade, int maxgrade, std::string type, std::string description, std::string date);
    int get_grade() const;
    int get_maxgrade() const;
    std::string get_type() const;
    std::string get_date() const;
    std::string get_description() const;
    void set_grade(int grade);
    void set_maxgrade(int maxgrade);
    void set_type(std::string type);
    void set_description(std::string description);
    void set_date(std::string date);
};

#endif