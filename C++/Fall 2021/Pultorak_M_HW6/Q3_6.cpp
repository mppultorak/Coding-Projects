
#include <iostream>
using namespace std; 

class A{
public:
    virtual void f1() {cout << "B function f1()" << endl;}

};

class B : public A{
public: 
    void f1() {cout << "D function f1()" << endl;}
};

class D : public B{
  void f1(){cout << "C function f1()" << endl;}
};

int main(){
A* ptr = new D;
   ptr->f1();
   delete ptr;

  return 0;  
}