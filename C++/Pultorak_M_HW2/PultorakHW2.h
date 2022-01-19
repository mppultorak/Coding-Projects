#include<string>
#include<vector>
#include<iostream>
using namespace std;

// header file for storing functions

vector<string> makestrArray(string str)
{
    vector<string> vect;
    string temp = "";
    for (int i = 0; i < str.length(); i++)
    {
        if (str[i] == ' ')
        {
            vect.push_back(temp);
            temp = "";
        }
        else
            temp.push_back(str[i]);
    }
    vect.push_back(temp);
    return vect;
};

vector<int> makeintArray(string str)
{
    vector<int> intvect;
    vector<string> vect;
    string temp = "";
    for (int i = 0; i < str.length(); i++)
    {
        if (str[i] == ' ')
        {
            vect.push_back(temp);
            temp = "";
        }
        else
            temp.push_back(str[i]);
    }
    vect.push_back(temp);
    for (int i = 0; i < vect.size(); i++)
        intvect.push_back(stol(vect[i]));

    return intvect;
};

string makeString(string arr[], int point)
{
string output;
for (int i = 0; i < point; i++)
{
    output += arr[i];
    if (i == point - 1)
        break;
    output += " ";    
}
return output;
};

string makeString(int arr[], int point)
{
string output;
for (int i = 0; i < point; i++)
{
    output += to_string(arr[i]);
    if (i == point - 1)
        break;
    output += " ";    
}
return output;
};

int isPalindromic(string val)
{
    for (int i = 0, k = val.size() - 1; i <= k; i++, k--)
    {
        if (val[i] != val[k])
            return 0;
    }
    return 1;
};

int isPalindromic(string arr[], int point)
{
    int itter = point - 1;
    for (int i = 0; i < point; i++)
    {
        if (arr[i] != arr[itter])
            return 0;
        itter--;
    }
    return 1;
};

int isPalindromic(int arr[], int point)
{
    int itter = point - 1;
    for (int i = 0; i < point; i++)
    {
        if (arr[i] != arr[itter])
            return 0;
        itter--;
    }
    return 1;
}

void makePalindromic(string val)
{
    string out = val;
    string build;
    for (int i = 0, k = val.size()-1; i <=  k; i++)
    {
        if (isPalindromic(out) == 1)
        {
            out.clear();
            for (int k = build.size()-1; k >= 0; k--)
                out += build[k];
            val += out;
            cout << "A generated one: " << val << endl;
            return;
        }
        else
        {
            build += out[0];
            out.erase(out.begin());
        }
    }
    cout << "Generation of such sequence is not possible." << endl;
};

void makePalindromic(string arr[], int size)
{
 int itter = size;
 string *p;
 p = arr;
 string out = makeString(arr, size);
 int build = 0;
    for (int i = 0; i < size; i++)
    {
        if (isPalindromic(p, itter) == 1)
            {
            build--;
            for (int i = 0, k = build; i <= k; i++, build--)
            {
                out += " ";
                out += arr[build];
            }
            cout << "A generated one: " << out << endl;
            return;
            }
        else{
            build++;
            *p++;
            itter--;
        }
    }
    cout << "Generation of such sequence is not possible." << endl;
};

void makePalindromic(int arr[], int size)
{
 int itter = size;
 int *p;
 p = arr;
 string out = makeString(arr, size);
 int build = 0;
    for (int i = 0; i < size; i++)
    {
        if (isPalindromic(p, itter) == 1)
            {
            build--;
            for (int i = 0, k = build; i <= k; i++, build--)
            {
                out += " ";
                out += to_string(arr[build]);
            }
            cout << "A generated one: " << out << endl;
            return;
            }
        else
        {
            build++;
            *p++;
            itter--;
        }
    }
    cout << "Generation of such sequence is not possible." << endl;
};