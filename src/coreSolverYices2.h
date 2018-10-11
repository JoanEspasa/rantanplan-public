#ifndef LAP_CORESOLVERYICES2_H
#define LAP_CORESOLVERYICES2_H


#include <string>
#include <map>
#include "expression.h"
#include "coreSolver.h"

#include <yices.h>


using namespace std;


class CoreSolverYices2 : public CoreSolver {
    public:
        CoreSolverYices2(int);
        ~CoreSolverYices2();

        void assertConstraint(string);
        long assertRetractable(string);
        void retract(long);
        void addVar(string,string);
        void setDecidable(string); 
        int check();
        long modelVarInt(string);
        bool modelVarBool(string);


    private:

        FILE * logfile;
        int verbose;
        context_t * ctx;
        struct infVar {
            string decl;
            term_t expr;
            string val;
            char tipus;
        };
        map<string,infVar> mapVar;



        term_t tradExpr(Expression &,int &);
        term_t tradIte(Expression &,int &);
        term_t tradNot(Expression &,int &);
        term_t tradRel(Expression &,int &,string);
        term_t tradList(Expression &,int &,string);
        term_t tradUnari(Expression &,int &);


};

#endif // CORESOLVERYICES2_H
