#ifndef LAP_SOLVERSTANDARD_H
#define LAP_SOLVERSTANDARD_H

#include "macros.h"
#include "solverAction.h"

#include "coreSolver.h"
#include "solver.h"

#include <string>
#include <sys/time.h>


using namespace std;

class SolverStandard : public  Solver {
    public:
        SolverStandard(CoreSolver * c, SolverAction * action, int verb=0, double timeout=0.0);
        ~SolverStandard();
        void addConstraint(string,int);
        void setDecidable(string);
        void addVar(string,string);
        int solve(string,int,int);
        int optimize(string,int,int);
        int check();
        long modelVarInt(string);
        bool modelVarBool(string);

        // afegit
        void retract(long);
        long assertRetractable(string);
    private:
        CoreSolver * core;
        SolverAction * actions;
        int verbose;
        double timeOut;
};

#endif // LAP_SOLVERSTANDARD_H
