#ifndef CORESOLVERMATHSAT_H
#define CORESOLVERMATHSAT_H

#include <string>
#include <vector>
#include "mathsat.h"
#include "expression.h"
#include <map>
#include "coreSolver.h"





class CoreSolverMathSat : public CoreSolver {
    public:
        CoreSolverMathSat(int);
        ~CoreSolverMathSat();

        void assertConstraint(string);
        long assertRetractable(string);
        void retract(long);
        void addVar(std::string,string);
        int check();
        long modelVarInt(string);
        bool modelVarBool(string);


    private:
        int verbose;
        msat_config ctx;
        msat_env sol;
        struct infVar {
            msat_decl decl;
            msat_term exp;
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



        msat_term tradExpr(Expression &,int &);
        msat_term tradIte(Expression &,int &);
        msat_term tradNot(Expression &,int &);
        msat_term tradRel(Expression &,int &,string);
        msat_term tradList(Expression &,int &,string);
        msat_term tradUnari(Expression &,int &);


};

#endif // CORESOLVERMATHSAT_H
