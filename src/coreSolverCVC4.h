#ifndef CORESOLVERCVC4_H
#define CORESOLVERCVC4_H

#include <string>
#include <vector>
#include <cvc4/cvc4.h>
#include "expression.h"
#include <map>
#include "coreSolver.h"

//using namespace std;
using namespace CVC4;

class CoreSolverCVC4 : public CoreSolver {
    public:
        CoreSolverCVC4(int);
        ~CoreSolverCVC4();

        void assertConstraint(string);
        long assertRetractable(string);
        void retract(long);
        void addVar(string,string);
        int check();
        long modelVarInt(string);
        bool modelVarBool(string);

    private:
        int verbose;
        ExprManager ctx;
        SmtEngine * sol;
        struct infVar {
            Expr * exp;
            string val;
            char tipus;
        };
        map<string,infVar> mapVar;
        struct infRectract {
            bool retract;
            int index;
        };
        vector<infRectract> retractable;
        int contRetract;



        Expr tradExpr(Expression &,int &);
        Expr tradIte(Expression &,int &);
        Expr tradNot(Expression &,int &);
        Expr tradRel(Expression &,int &,string);
        Expr tradList(Expression &,int &,string);
        Expr tradUnari(Expression &,int &);


};

#endif // CORESOLVERCVC4_H
