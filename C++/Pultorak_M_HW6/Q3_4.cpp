#include <iostream>
using namespace std; 

class A{
public:
    void f1() {cout << "A function f1()" << endl;}
    void f2() {cout << "A function f2()"  << endl;}

};

class B : public A{
public: 
    void f3() {B::f1();}
};

int main()
{
  B obj;
  obj.f1();

  return 0;  
}