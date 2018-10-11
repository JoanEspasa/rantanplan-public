#ifndef LAP_EXPRESSION_H
#define LAP_EXPRESSION_H



#include <iostream>
#include <vector>
#include <string>


using namespace std;

class Expression{

public:
    Expression();
    Expression(string);


    int size();

    string element(int);

    friend ostream &operator << (ostream &o, const Expression &e);


private:

    vector<string> tokens;  //vector of tokens

};

#endif // LAP_EXPRESSION_H
