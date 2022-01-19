Name: Michael Pultorak
ID: 109415599

Structure of program:
---------------------
File organization: Taks1.cpp, Task2.cpp, Task3.cpp
Functional organization: Each file answers question.

Status: It works completely.

Hardware & Platform I used: M1-Pro chip, 16 gb of ram, and mac os.

Answers: -------------

Task2.2: It printed the values from the Dog class. 
I expected it to print the functions from the Dog class, 
as the vitual function tells c++ to wait to read function untill runtime.

Task2.3: It printed the value from the Mammel class.
I expected it to print the functions from the Mammel class, 
as the absense of the virtual function no longer tells c++ to wait till runtime to define functions.

Task2.4: It printed the values from the Dog class.
It is a Dog class pointer which tells c++ which function to call.

Question 3.2: Yes. Derived classes inherit from all of their base classes

Question 3.3: It will inherit the overridden function. However, the base class version can be accessed aswell through "::".

Question 3.4: As mentioned before, you can access the base class version though the scope resolution operator: "::" 
                ie: base_class::overridden_function(); Provided code shows this.

Question 3.5: A simple call to the function is all that is needed: Derived_class.inherited_function(); Provided code shows this.

Question 3.6: Doing so is possible, but not nessary. An overridden virtual function will always be vitual. Provided code shows this.
