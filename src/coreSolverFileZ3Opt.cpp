#include "coreSolverFileZ3Opt.h"
#include "expression.h"

#include <sstream>
#include <string>
#include <cstdlib>
#include <map>

using namespace std;

CoreSolverFileZ3Opt::CoreSolverFileZ3Opt(string name, int verbosity) {
    filename = name;
    verbose = verbosity;
    t = 0;
}

CoreSolverFileZ3Opt::~CoreSolverFileZ3Opt() {
}

void CoreSolverFileZ3Opt::setDecidable(string n) { 
    cerr << "no es pot implementar aqui" << endl;
    exit(1);
}

void CoreSolverFileZ3Opt::assertSoftConstraint(string s, int weight) {
    Expression e(s); int i = 0;
    string exp =tradExpr(e,i);
    if (verbose >= 10) { cout << "expr:" << exp << endl; }
    v_constraints.push_back("(assert-soft " + exp + " :weight " + std::to_string(weight) + ")");
}

/*void CoreSolverFileZ3Opt::assertUnweightedSoftConstraint(string s) {
    Expression e(s); int i = 0;
    string exp =tradExpr(e,i);
    if (verbose >= 10) { cout << "expr:" << exp << endl; }
    v_constraints.push_back("(assert-soft " + exp + ")");
}                                                    
*/

void CoreSolverFileZ3Opt::assertString(string s) { 
    if (verbose >= 10) { cout << "string :" << s << endl; }
    v_constraints.push_back(s);             
}                                                    
 
void CoreSolverFileZ3Opt::assertConstraint(string s) { 
    Expression e(s); int i = 0;
    string exp =tradExpr(e,i);
    if (verbose >= 10) { cout << "expr:" << exp << endl; }
    v_constraints.push_back("(assert " + exp + ")");             
}                                                    
                                                      
long CoreSolverFileZ3Opt::assertRetractable(string s){
    Expression e(s); int i = 0;
    string exp =tradExpr(e,i);
    if (verbose >= 10) {cout << "retr:" << exp << endl;}
    v_constraints.push_back("(assert " + exp + ")");             
    return v_constraints.size() - 1;
}

int CoreSolverFileZ3Opt::check(){
    std::function<vector<string>(string, string)> explode;
    explode = [&](string inputstring, string delimiter)-> vector<string> {
        vector<string> explodes;
        inputstring.append(delimiter);
        while(inputstring.find(delimiter)!=string::npos){
            explodes.push_back(inputstring.substr(0, inputstring.find(delimiter)));
            inputstring.erase(inputstring.begin(), inputstring.begin() + 
                    inputstring.find(delimiter)+delimiter.size());
        }
        return explodes;
    };

    string temp_file = filename +"."+std::to_string(t);

     // dumpejem el contingut al fitxer
     ofstream f_sortida;
     f_sortida.open(temp_file, ios::trunc | ios::out);

     f_sortida << "(set-option :produce-models true)" << endl;
     f_sortida << "(set-logic QF_UFLIA)" << endl;
     for(const auto& line : v_vars){ f_sortida << line << endl; }
     for(const auto& line : v_constraints){ f_sortida << line << endl; }
     f_sortida << "(check-sat)" << endl;
     if(model){
       f_sortida << "(get-model)" << endl;
         for(const auto& line : mapVar){ f_sortida << "(get-value (" << line.first << "))" << endl; }
     }
     f_sortida << "(exit)" << endl;

     f_sortida.close();

     // si es volgues passar per STDIN es podria implementar aixi
     // http://jineshkj.wordpress.com/2006/12/22/how-to-capture-stdin-stdout-and-stderr-of-child-program/
     FILE *in;
     char buff[1024];

     cout << "z3 -st -v:10 -t:300 " << temp_file << " 2>&1" << endl; // -st
     if(!(in = popen(string("z3 -v:1 "+temp_file+" 2>&1").c_str(), "r"))){
         return 1;
     }
     if(capture_softs){ // ens petem el mapVar
         mapVar.clear();
     }

     bool is_sat = true;
     while(fgets(buff, sizeof(buff), in)!=NULL){
         string linia(buff);
         cout << buff;
         if ( linia == "unsat\n"){
             cout << "unsat: " << buff << " !!!!" << endl;
             is_sat = false;
       
         } else {
             // HACK HACK HACK
             if(linia[0] == '(' && linia[1] == '('){
                 vector<string> exploded = explode(linia.substr(2,linia.size()-5), " ");
                 mapVar[exploded[0]] = std::pair<std::string,std::string>("I",exploded[1]);
             } else {
                 if(capture_softs){
                     auto posicio = linia.find(" |-> ");
                     if(posicio != string::npos){
                         vector<string> exploded = explode(linia," |-> ");
                         // treiem espais en blanc i el \n del final
                         exploded[0].erase( std::remove(exploded[0].begin(), exploded[0].end(), ' '), exploded[0].end() );
                         exploded[1].erase( std::remove(exploded[1].begin(), exploded[1].end(), ' '), exploded[1].end() );
                         if (!exploded[1].empty() && exploded[1][exploded[1].length()-1] == '\n') {
                             exploded[1].erase(exploded[1].length()-1); }
                         mapVar[exploded[0]] = std::pair<std::string,std::string>("B",exploded[1]);
                     }
                 }
             }
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
long CoreSolverFileZ3Opt::modelVarInt(string s){
    return 1;//atoi(mapVar[s].val.c_str());
}

// TODO
bool CoreSolverFileZ3Opt::modelVarBool(string s){
    //if (mapVar[s].val.compare(string("0"))==0) return false;
    //return true;
    return true;
}
