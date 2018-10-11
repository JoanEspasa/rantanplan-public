#ifndef CORESOLVERZ3_H
#define CORESOLVERZ3_H

#include <string>
#include <vector>
#include "z3++.h"
#include "expression.h"
#include <map>
#include "coreSolver.h"

//using namespace std;
using namespace z3;


class CoreSolverZ3 : public CoreSolver {
    public:
        CoreSolverZ3(int);
        ~CoreSolverZ3();

        void assertConstraint(string);
        long assertRetractable(string);
        void retract(long);
        void setDecidable(string);
        void addVar(std::string,string);
        int check();
        long modelVarInt(string);
        bool modelVarBool(string);


    private:
        int verbose;
        context ctx;
        solver  * sol;
        struct infVar {
            expr * exp;
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



        expr tradExpr(Expression &,int &);
        expr tradIte(Expression &,int &);
        expr tradNot(Expression &,int &);
        expr tradRel(Expression &,int &,string);
        expr tradList(Expression &,int &,string);
        expr tradUnari(Expression &,int &);


};

#endif // CORESOLVERZ3_H
