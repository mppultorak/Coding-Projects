#include <iostream>
using namespace std; 

class A{
public:
    void f1() {cout << "B function f1()" << endl;}

};

class B : public A{
};


int main(){
   B obj;
   obj.f1();

  return 0;  
}