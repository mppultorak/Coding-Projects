#include <iostream>
using namespace std;

class Mammal
{
    public:
    Mammal(void);
    ~Mammal(void);

    virtual void Move() const;
    virtual void Speak() const;

    protected:
    int itsAge;
};

class Dog: public Mammal
{
    public:
    void Move() const;
    void Speak() const;
};

class Cat: public Mammal
{
    public:
    void Move() const;
    void Speak() const;
};

class Horse: public Mammal
{
    public:
    void Move() const;
    void Speak() const;
};

class GuineaPig: public Mammal
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

void Cat::Speak() const
{
    cout << "Meow" << endl;
}

void Cat::Move() const
{
    cout << "Cat jumps on keyboard" << endl;
}

void Horse::Move() const
{
    cout << "Horse walks" << endl;
}

void Horse::Speak() const
{
    cout << "Neighhh" << endl;
}

void GuineaPig::Speak() const
{
    cout << "weep weep" << endl;
}

void GuineaPig::Move() const
{
    cout << "GuineaPig hides in house" << endl;
}

int main()
{
    Mammal* theArray[5];
    Mammal* ptr;
    int choice, i;

    for(i = 0; i < 5; i++)
    {
        cout << "(1)dog (2)cat (3)horse (4)GuineaPig: ";
        cin >> choice;
        switch(choice)
        {
            case 1: ptr = new Dog; break;
            case 2: ptr = new Cat; break;
            case 3: ptr = new Horse; break;
            case 4: ptr = new GuineaPig; break;
            default: ptr = new Mammal; break;
        }
        theArray[i] = ptr;
    }

    for(i = 0; i < 5; i++)
    {
        theArray[i]->Speak();
    }

    for(i = 0; i < 5; i++)
    {
        delete theArray[i];
    }

    return 0;
}