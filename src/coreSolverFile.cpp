#include "coreSolverFile.h"
#include "expression.h"

#include <sstream>
#include <string>
#include <cstdlib>
#include <map>

using namespace std;


CoreSolverFile::~CoreSolverFile(){
}

string CoreSolverFile::tradIte(Expression & e,int & i) {
    i++;
    string e1=tradExpr(e,i);
    string e2=tradExpr(e,i);
    string e3=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a ite" << endl;exit(-1);}
    i++;
    return "(ite "+e1+" "+e2+" "+e3+")";
}

string CoreSolverFile::tradNot(Expression & e,int & i) {
    i++;
    string e1=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a not" << endl;exit(-1);}
    i++;
    return "(not "+e1+")";
}

string CoreSolverFile::tradRel(Expression & e,int & i,string a) {
    i++;
    string e1=tradExpr(e,i);
    string e2=tradExpr(e,i);
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a Rel, es: " << e.element(i) << endl;exit(-1);}
    i++;
    if (a.compare(string("="))==0) return "(= "+e1+" "+e2+")";
    else if (a.compare(string("!="))==0) return "(not (= "+e1+" "+e2+"))";
    else if (a.compare(string("<="))==0) return "(<= "+e1+" "+e2+")";
    else if (a.compare(string("<"))==0) return "(< "+e1+" "+e2+")";
    else if (a.compare(string(">="))==0) return "(>= "+e1+" "+e2+")";
    else if (a.compare(string(">"))==0) return "(> "+e1+" "+e2+")";
    else if (a.compare(string("dimpl"))==0) return "(= "+e1+" "+e2+")"; // check its ok
    else if (a.compare(string("impl"))==0) return "(or (not "+e1+") "+e2+")";
    //else if (a.compare(string("impl"))==0) return "(=> "+e1+" "+e2+")";
    else return "ERROR";
}

string CoreSolverFile::tradList(Expression & e,int & i,string a) {
    i++;
    vector<string> ye;
    while (e.element(i).compare(string(")"))!=0) {
        ye.push_back(tradExpr(e,i));
    }
    if (e.element(i).compare(string(")"))!=0) {cout << "error ) a List" << endl;exit(-1);}
    i++;
    if (ye.size()>0) {
        string inside ="";
        for(const auto& s : ye){inside += s + " ";}

        if (a.compare(string("+"))==0) return "(+ "+inside+")";
        else if (a.compare(string("-"))==0) return "(- "+inside+")"; 
        else if (a.compare(string("*"))==0) return "(* "+inside+")"; 
        else if (a.compare(string("or"))==0) return "(or "+inside+")"; 
        else if (a.compare(string("and"))==0) return "(and "+inside+")"; 
    }

    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
    return "";
}

string CoreSolverFile::tradUnari(Expression & e,int & i) {
    // (- 0 expr)
    return "(- " + tradExpr(e,i);
}

string CoreSolverFile::tradExpr(Expression & e,int & i) {

    // som dins d'un element
    if (e.element(i).compare(string("("))!=0) {
        //cout << e << endl;
        //i++;
        string a=e.element(i);

        if (a.compare(string("ite"))==0) {
            i++;
            return tradIte(e,i);

        } else if (a.compare(string("<"))==0  ||
                a.compare(string("<="))==0    ||
                a.compare(string(">"))==0     ||
                a.compare(string(">="))==0    ||
                a.compare(string("="))==0     ||
                a.compare(string("!="))==0    || //?
                a.compare(string("impl"))==0  || // =>
                a.compare(string("dimpl"))==0) { // diria que (and (=> ) (=> ))
            i++;
            return tradRel(e,i,a);

        } else if (a.compare(string("-"))==0 ||
                a.compare(string("+"))==0) {
            string aux=a; // perque?
            i++;
            if (e.element(i).compare(string("("))==0) return tradList(e,i,a);
            else {
                if (a.compare(string("-"))==0) return tradUnari(e,i);
                else return tradExpr(e,i);
            }

        } else if (a.compare(string("*"))==0 ||
                a.compare(string("or"))==0 ||
                a.compare(string("and"))==0) {
            i++;
            return tradList(e,i,a);

        } else  if (a.compare(string("not"))==0) {
            i++;
            return tradNot(e,i);

        } else  if (a.compare(string("true"))==0) {
            i++;
            return "true";

        } else  if (a.compare(string("false"))==0) {
            i++;
            return "false";

        } else   if (a.compare(string("EOE"))==0) {
            cout << "error in Expression" << endl;
            exit(-1);

        } else {
            if (a[0]>='0' && a[0]<='9') {
                i++;
                return a;//atoi(a.c_str());
            } else {
                i++;
                return a;
                //return mapVar[a].first;
            }
        }
    }
    cout << "ERR? " << __FILE__ << " " <<  __LINE__ << " " << __func__ << endl;
    return "";
}

