#include <iostream>
#include <string>
#include <stack>
#include <sstream>

/***********************
 * int safe_int_conversion(std::string &value):
 * Description: Converts an string value to and integer value. Throws an error if this conversion is impossible.
 * Returns: int value of string
 * Receives: string value number
 * Version: 03/28/22
 * Author: Michael Pultorak
 ***********************/
int safe_int_conversion(std::string &value) noexcept(false)
{
    try
    {
        return std::stoi(value); // attempts to cast to int type
    }

    catch (std::invalid_argument &error)
    {
        std::cout << "ERROR: incorrect operator" << std::endl; // if not prints error and exits program
        exit(1);
    }
}

/***********************
 * bool is_operator(std::string const &val):
 * Description: Checks if passed string value is and operator (+,/,*,-)
 * Returns: true if operator false if not operator
 * Receives: string value
 * Version: 03/28/22
 * Author: Michael Pultorak
 ***********************/
bool is_operator(std::string const &val)
{
    bool return_val = false;
    if (val == "+")
        return_val = true;

    else if (val == "/")
        return_val = true;

    else if (val == "*")
        return_val = true;

    else if (val == "-")
        return_val = true;

    return return_val;
}

/***********************
 * int compute_operator(std::stack<std::string> &stack_in, std::string operator_in):
 * Description: Executes mathematical operation passed to the first two numbers in stack
 *              Throws error if less than two numbers are in stack.
 * Returns: Integer value of mathematical operation
 * Receives: Stack and string value for operation
 * Version: 03/28/22
 * Author: Michael Pultorak
 ***********************/
int compute_operator(std::stack<std::string> &stack_in, std::string operator_in)
{
    if (stack_in.empty() || stack_in.size() < 2) // checks if less than two values are in stack as two numbers are required for evaluation
    {
        std::cout << "ERROR: missing operand" << std::endl; // prints error then exits program
        exit(1);
    }

    int return_val;
    int RH_val;
    int LH_val;
    if (operator_in == "+")
    {
        RH_val = safe_int_conversion(stack_in.top());
        stack_in.pop();
        LH_val = safe_int_conversion(stack_in.top());
        stack_in.pop();
        return_val = (LH_val + RH_val);
    }

    else if (operator_in == "/")
    {
        RH_val = safe_int_conversion(stack_in.top());
        stack_in.pop();
        LH_val = safe_int_conversion(stack_in.top());
        stack_in.pop();
        return_val = (LH_val / RH_val);
    }

    else if (operator_in == "*") {
        RH_val = safe_int_conversion(stack_in.top());
        stack_in.pop();
        LH_val = safe_int_conversion(stack_in.top());
        stack_in.pop();
        return_val = (LH_val * RH_val);
    }

    else if (operator_in == "-")
    {
        RH_val = safe_int_conversion(stack_in.top());
        stack_in.pop();
        LH_val = safe_int_conversion(stack_in.top());
        stack_in.pop();
        return_val = (LH_val - RH_val);
    }
    return return_val;
}

/***********************
 * int evaluate(std::string text_in):
 * Description: Evaluates a post-fix mathematical expression using a stack
 *              Throws error if at end of evaluation there is more than one item left in the stack.
 * Returns: Integer result of mathematical operation
 * Receives: String input
 * Version: 03/28/22
 * Author: Michael Pultorak
 ***********************/
int evaluate(std::string text_in)
{
    std::stack<std::string> expression;
    int tempval;
    std::string value;
    std::stringstream ss(text_in);
    while (getline(ss, value, ' ')) // splits input by space
    {
        if (is_operator(value)) // checks if value is an operator
        {
            tempval = compute_operator(expression, value); // evaluates operator
            expression.push(std::to_string(tempval)); // returns result into stack
        }

        else
           expression.push(value); // if values is not an operator, add number to stack

    }

    if (expression.size() > 1) // checks if more than one item in stack (incorrect expression)
    {
        std::cout << "ERROR: missing operator" << std::endl; // prints error and exits program
        exit(1);
    }

    return safe_int_conversion(expression.top()); // returns top value of stack
}

/***********************
 * int main():
 * Description: Takes user input of a post-fix expression, passes it to evaluate() function and prints out result of expression.
 * Returns: Nothing
 * Receives: Nothing
 * Version: 03/28/22
 * Author: Michael Pultorak
 ***********************/
int main()
{
    std::string user_in;
    int result;
    std::cout << "Enter an arithmetic postfix expression with spaces between: ";
    std::getline(std::cin, user_in); // gets string input
    result = evaluate(user_in); // returns result of input
    std::cout << result << std::endl;

    return 0;
}
