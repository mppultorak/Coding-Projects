Name: Michael Pultorak
ID: 109415599

Structure of program:
---------------------
File organization: main.cpp
Functional organization: main takes a string input postfix expression, evaluates it, then prints it.
"safe_int_conversion()" converts a string value to int and will throw and error if this is not possible. "is_operator()" checks if passed string value is an operator. "compute_operator()" evaluates the mathematical operator passed with the top two items of the stack passed. "evaluate()" takes a passed string input, splits it by space and uses is_operator and evaluate() to find result of expression. "main()" asks for string postfix expression and passed input to evaluate() to get result. This is then printed.


Status: It works completely.

Hardware & Platform I used: M1-Pro chip, 16 gb of ram, and mac os.

Compile: extract the archive and from a shell and run "make" This will create an executable "runexe" Then run ./runexe
