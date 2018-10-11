#include "coreSolverFileYices2.h"
#include "expression.h"

#include <sstream>
#include <string>
#include <cstdlib>
#include <map>

using namespace std;

CoreSolverFileYices2::CoreSolverFileYices2(string name, int verbosity) {
    filename = name;
    verbose = verbosity;
    t = 0;
}

CoreSolverFileYices2::~CoreSolverFileYices2() {
}

void CoreSolverFileYices2::setDecidable(string n) { 
    cerr << "no es pot implementar aqui" << endl;
    exit(1);
}

void CoreSolverFileYices2::assertConstraint(string s) { 
    Expression e(s); int i = 0;
    string exp =tradExpr(e,i);
    if (verbose >= -10) { cout << "expr:" << exp << endl; }                                         
    v_constraints.push_back("(assert " + exp + ")");             
}                                                    
                                                      
long CoreSolverFileYices2::assertRetractable(string s){  
    Expression e(s); int i = 0;
    string exp =tradExpr(e,i);
    if (verbose>=10) {cout << "retr:" << exp << endl;} 
    v_constraints.push_back("(assert " + exp + ")");             
    return v_constraints.size() - 1;
}

int CoreSolverFileYices2::check(){

    string temp_file = filename +"."+std::to_string(t);

     // dumpejem el contingut al fitxer
     ofstream f_sortida;
     f_sortida.open(temp_file, ios::trunc | ios::out);

     f_sortida << "(set-option :produce-models true)" << endl;
     f_sortida << "(set-logic QF_UFLIA)" << endl;
     for(const auto& line : v_vars){ f_sortida << line << endl; }
     for(const auto& line : v_constraints){ f_sortida << line << endl; }
     f_sortida << "(check-sat)" << endl;
     f_sortida << "(get-model)" << endl;
     f_sortida << "(exit)" << endl;

     f_sortida.close();

     // si es volgues passar per STDIN es podria implementar aixi
     // http://jineshkj.wordpress.com/2006/12/22/how-to-capture-stdin-stdout-and-stderr-of-child-program/
     FILE *in;
     char buff[512];

     cout << " ./../solvers/yices-2.3.0/bin/yices-smt2 -s " << temp_file << endl;
     if(!(in = popen(string(" ./../solvers/yices-2.3.0/bin/yices-smt2 -s "+temp_file).c_str(), "r"))){
         return 1;
     }

     bool is_sat = true;
     while(fgets(buff, sizeof(buff), in)!=NULL){
         if ( string(buff) == "unsat\n"){
             cout << "unsat: " << buff << " !!!!" << endl;
             is_sat = false;
         } 
         cout << buff;
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
long CoreSolverFileYices2::modelVarInt(string s){
    return 1;//atoi(mapVar[s].val.c_str());
}

// TODO
bool CoreSolverFileYices2::modelVarBool(string s){
    //if (mapVar[s].val.compare(string("0"))==0) return false;
    //return true;
    return true;
}
