#include "coreSolverFileSMT2.h"
#include "expression.h"

#include <sstream>
#include <string>
#include <cstdlib>
#include <map>

using namespace std;

CoreSolverFileSMT2::CoreSolverFileSMT2() {
}

CoreSolverFileSMT2::CoreSolverFileSMT2(string name, int verbosity) {
    filename = name;
    verbose = verbosity;
}

CoreSolverFileSMT2::~CoreSolverFileSMT2() {
}

void CoreSolverFileSMT2::assertConstraint(string s) {
    Expression e(s);
    int i = 0;
    string expr=tradExpr(e,i);
    if (verbose >= 10) {
        cout << "expr:" << expr << endl;
    }
    v_constraints.push_back(expr);
}

long CoreSolverFileSMT2::assertRetractable(string s){
    Expression e(s);
    int i = 0;
    string expr=tradExpr(e,i);
    if (verbose>=10) {cout << "retr:" << expr << endl;}
    v_constraints.push_back(expr);
    return v_constraints.size() - 1;
}

void CoreSolverFileSMT2::retract(long l){
    v_constraints.erase(v_constraints.begin()+(int)l);
}

void CoreSolverFileSMT2::addVar(string name,string type) {
    string smt_type = "undefined";
    if(type == "int"){ 
        smt_type = "Int";
    } else if(type=="bool") {
        smt_type = "Bool";
    } else if(type=="real") {
        smt_type = "Real";
    } else if(type=="function"){
        smt_type = "Int"; // TODO rly?
    }

    string var;
    if(type == "function"){
        var = name;
    } else {
        var = "(declare-fun " + name + " () "+ smt_type + ")";
    }
    //string var = ":extrafuns (("+ s +" "+ smt_type +") )";

    if (verbose>=10) {cout << var << endl;}
    //mapVar[s].val="";
    if (type.compare(string("int"))==0) mapVar[name] = std::make_pair(var,"I");
    else if (type.compare(string("bool"))==0) mapVar[name] = std::make_pair(var,"B");
    else if (type.compare(string("real"))==0) mapVar[name] = std::make_pair(var,"R");
    else if (type.compare(string("function"))==0) mapVar[name] = std::make_pair(var,"F");
    else cerr << "MEeeec" << endl;//mapVar[s].tipus = "undefined";
    v_vars.push_back(var);
}

