#include <iostream>
using namespace std;

class Mammal
{
    public:
    Mammal(void);
    ~Mammal(void);

    void Move() const;
    void Speak() const;

    protected:
    int itsAge;
};

class Dog: public Mammal
{
    public:

    void Move() const;
    void Speak() const;
};

Mammal::Mammal(void): itsAge(1)
{
    cout << "Mammal constructor..." << endl;
}

Mammal::~Mammal(void)
{
    cout << "Mammal deconstructor..." << endl;
}

void Mammal::Move() const
{
    cout << "Mammal moves a step!" << endl;
}

void Mammal::Speak() const
{
    cout << "What does a mammal speak? Mammilian!" << endl;
}

void Dog::Move() const
{
    cout << "Dog moves a step" << endl;
}

void Dog::Speak() const
{
    cout << "Woof Woof!" << endl;
}

int main()
{
    Mammal* pDog = new Dog;
    pDog->Move();
    pDog->Speak();

    Dog* pDog2 = new Dog;

    pDog2->Move();
    pDog2->Speak();

    delete pDog2;
    delete pDog;

    return 0;
}