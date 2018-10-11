#ifndef LAP_CORESOLVERYICES1_H
#define LAP_CORESOLVERYICES1_H

#include <string>
#include <yices_c.h>
#include "expression.h"
#include <map>
#include "coreSolver.h"
#include <cstdlib>
#include <sstream>

using namespace std;


class CoreSolverYices1 : public CoreSolver {
    public:
        CoreSolverYices1(int);
        ~CoreSolverYices1();

        void assertConstraint(string);
        long assertRetractable(string);
        void retract(long);
        void setDecidable(string);
        void addVar(string,string);
        int check();
        long modelVarInt(string);
        bool modelVarBool(string);


    private:
        int verbose;
        yices_context ctx;
        struct infVar {
            yices_var_decl decl;
            yices_expr expr;
            string val;
            char tipus;
        };
        map<string,infVar> mapVar;



        yices_expr tradExpr(Expression &,int &);
        yices_expr tradIte(Expression &,int &);
        yices_expr tradNot(Expression &,int &);
        yices_expr tradRel(Expression &,int &,string);
        yices_expr tradList(Expression &,int &,string);
        yices_expr tradUnari(Expression &,int &);


};

#endif // CORESOLVERYICES1_H
