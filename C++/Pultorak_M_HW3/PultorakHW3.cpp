#include<iostream>
#include<string>
using namespace std;


class Point
{
public:
Point(int xval, int yval);

int getx() const;
int gety() const;

void printcoords();
void setx(int x);
void sety(int y);


private:
int y;
int x;
};



class Rectangle
{
public:
Rectangle(Point a, int w, int l);
int getlength() const;
int getwidth() const;
int getx() const;
int gety() const;
string print() const;

private:
Point p;
int width;
int length;
};

bool operator%(const Rectangle& r1, const Rectangle& r2);


int main()
{
int x;
int y;
int width;
int length;
cout << "x of rectangle1: ";
cin >> x;
cout << "y of rectangle1: ";
cin >> y;
cout << "length of rectangle1: ";
cin >> length;
cout << "width of rectangle1: ";
cin >> width;
Point p1(x,y);
Rectangle rec1(p1, width, length);

cout << "x of rectangle2: ";
cin >> x;
cout << "y of rectangle2: ";
cin >> y;
cout << "length of rectangle2: ";
cin >> length;
cout << "width of rectangle2: ";
cin >> width;
Point p2(x,y);
Rectangle rec2(p2, width, length);

cout << "Co-ordinates of rectangle 1: " << rec1.print() << endl;
cout << "Co-ordinates of rectangle 2: " << rec2.print() << endl;

if (rec1 % rec2)
    cout << "They intersect." << endl;

else
    cout << "They do not intersect." << endl;

return 0;

}

Point::Point(int xval, int yval)
{
    x = xval;
    y = yval;
}

int Point::getx() const
{
    return x;
}

int Point::gety() const
{
    return y;
}

void Point::printcoords()
{
    std::cout << "(" << x << "," << y << ")";
}

void Point::setx(int xval)
{
    x = xval;
}

void Point::sety(int yval)
{
    y = yval;
}

Rectangle::Rectangle(Point a, int w, int l): p(a), width(w), length(l) { }

int Rectangle::getlength() const
{
    return length;
}

int Rectangle::getwidth() const
{
    return width;
}

string Rectangle::print() const
{
    int x = p.getx();
    int y = p.gety();
    int w = width;
    int l = length;
    string val1 = ("(" + to_string(x) + "," + to_string(y) + ")");
    string val2 = ("(" + to_string(x) + "," + to_string((y-l)) + ")");
    string val3 = ("(" + to_string((x+w)) + "," + to_string((y-l)) + ")");
    string val4 = ("(" + to_string((x+w)) + "," + to_string(y) + ")");
    return val1+","+val2+","+val3+","+val4;

}

int Rectangle::getx() const
{
    return p.getx();
}

int Rectangle::gety() const
{
    return p.gety();
}

bool operator%(const Rectangle& r1, const Rectangle& r2)
{
    if (r1.getx() > (r2.getx() + r2.getwidth()) || 
        r2.getx() > (r1.getx() + r1.getwidth()) ||
        r1.gety() < (r2.gety() -r2.getlength()) ||
        r2.gety() < (r1.gety() -r1.getlength()))
        return false;

    else
        return true;
}
