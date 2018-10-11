#include "expression.h"
#include <iostream>

using namespace std;


Expression::Expression() {
    tokens.resize(0);
}

Expression::Expression(string s) {
    tokens.resize(0);
    string aux="";
    for (unsigned int i=0;i<s.size();i++) {
        if (s[i]!=' ' && s[i]!=',' && s[i]!='\t' && s[i]!='\r' && s[i]!='\n' && s[i]!='(' && s[i]!=')' && s[i]!='-' && s[i]!='+') {  //separators: espai , \t \n \r ( )
            aux += s[i];
        } else {
            if (aux.size()>0) tokens.push_back(aux);
            aux="";
            if (s[i]=='(' || s[i]==')' || s[i]=='-' || s[i]=='+') {
                aux += s[i];
                tokens.push_back(aux);
                aux="";
            }
        }
    }
    if (aux.size()>0) {
        tokens.push_back(aux);
    }
    tokens.push_back("EOE");

}


int Expression::size() {
    return tokens.size();
}


string Expression::element(int i) {
    if (i<size() && i>=0) return tokens[i]; else return string("");
}

ostream &operator << (ostream &o, const Expression &e) {
    o << "===== Expression ======" << endl;
    for (vector<string>::const_iterator it = e.tokens.begin(); it != e.tokens.end();++it) {
        o << *it << " | ";
    }
    o << endl;

    return o;
}
