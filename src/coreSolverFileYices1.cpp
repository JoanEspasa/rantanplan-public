#include "coreSolverFileYices1.h"
#include "expression.h"

#include <sstream>
#include <string>
#include <cstdlib>
#include <map>

using namespace std;

CoreSolverFileYices1::CoreSolverFileYices1(string name, int verbosity) {
    filename = name;
    verbose = verbosity;
    t = 0;
}

CoreSolverFileYices1::~CoreSolverFileYices1() {
}

void CoreSolverFileYices1::assertConstraint(string s) {
    if (verbose>=10) {cout << "expr:" << s << endl;}
    v_constraints.push_back(s);
}

long CoreSolverFileYices1::assertRetractable(string s){
    if (verbose>=10) {cout << "retr:" << s << endl;}
    v_constraints.push_back(s);
    return v_constraints.size() - 1;
}

void CoreSolverFileYices1::retract(long l){
    v_constraints.erase(v_constraints.begin()+(int)l,v_constraints.end());
}

void CoreSolverFileYices1::setDecidable(string n) {
    // NOOP
    cerr << "no es pot implementar aqui" << endl;
    exit(1);
}

void CoreSolverFileYices1::addVar(string s,string t) {
    string var = s; 

    // TODO fix 
    if (verbose>=10) {cout << s << endl;}
    if (t == "int")       mapVar[s] = std::make_pair(s,"I");
    else if (t == "bool") mapVar[s] = std::make_pair(s,"B");
    else if (t == "real") mapVar[s] = std::make_pair(s,"R");
    v_vars.push_back(var);
}


int CoreSolverFileYices1::check(){
    /* SMT1
    (benchmark pedigree_.smt
        :source { Pedigree Generator v1}
        :logic QF_LIA
        :extrafuns ((test_var Int) ) 
        :formula (and 
    ...
    ))
    */

     /* SMT2
      (set-option :produce-models true)
      (set-logic QF_LIA)
      ....
      (check-sat)
      (exit)
      */

    string temp_file = filename +"."+std::to_string(t);

     // dumpejem el contingut al fitxer
     ofstream f_sortida;
     f_sortida.open(temp_file, ios::trunc | ios::out);

     f_sortida << "(set-option :produce-models true)" << endl;
     f_sortida << "(set-logic QF_UFLIA)" << endl;

     /*f_sortida << "(benchmark foobar\n"; 
     f_sortida << ":source { foobar }\n";
     f_sortida << ":logic QF_LIA\n";
     for(const auto& line : v_vars){ f_sortida << line << endl; }
     f_sortida << ":formula (and\n";
     for(const auto& line : v_constraints){ f_sortida << line << endl; }
     f_sortida << "))" << endl;*/

     for(const auto& line : v_vars){ f_sortida << line << endl; }
     for(const auto& line : v_constraints){ f_sortida << line << endl; }
     f_sortida << "(check-sat)" << endl;
     //f_sortida << "(exit)" << endl;
     for(const auto& line : v_getvalue){ f_sortida << line << endl; }
     f_sortida.close();

     // si es volgues passar per STDIN es podria implementar aixi
     // http://jineshkj.wordpress.com/2006/12/22/how-to-capture-stdin-stdout-and-stderr-of-child-program/
     FILE *in;
     char buff[512];

     if(!(in = popen(string("./../solvers/yices-2.3.0_64b/bin/yices-smt2 --verbosity=0 --stats "+temp_file).c_str(), "r"))){
         return 1;
     }

     bool is_sat = false;
     while(fgets(buff, sizeof(buff), in)!=NULL){
         if ( string(buff) == "sat\n"){
             cout << "found: " << buff << " !!!!" << endl;
             is_sat = true;
         } else {
             cout << buff;
         }
     }
     pclose(in);
     t++;

    if( is_sat ) {
        return 1;
    } else {
        return 0;
    }

    // TODO : recuperar el model
    /*lbool status = yices_check(ctx);
    if(status == l_false) return 0;
    if(status == l_undef) return -1;
    yices_model m = yices_get_model(ctx);
    for (map<string,infVar>::iterator it = mapVar.begin();it != mapVar.end(); ++it) {
        switch(it->second.tipus) {
            case 'B':
                lbool r;
                r=yices_get_value(m,it->second.decl);
                if (r==l_true) it->second.val="1"; else it->second.val="0";
                break;
            case 'I':
                long v;
                yices_get_int_value(m,it->second.decl,&v);
                it->second.val=static_cast<ostringstream*>( &(ostringstream() << v) )->str();
                break;
            case ' ':
                it->second.val="";
                break;
        }
    }
    return 1;*/
}

// TODO
long CoreSolverFileYices1::modelVarInt(string s){
    return 1;//atoi(mapVar[s].val.c_str());
}

// TODO
bool CoreSolverFileYices1::modelVarBool(string s){
    //if (mapVar[s].val.compare(string("0"))==0) return false;
    //return true;
    return true;
}
