#ifndef LAP_SOLVERLINEALUP_H
#define LAP_SOLVERLINEALUP_H

#include "macros.h"
#include "solverAction.h"

#include "coreSolver.h"
#include "solver.h"

#include <string>
#include <sys/time.h>


using namespace std;

class SolverLinealUp : public  Solver {
    public:
        SolverLinealUp(CoreSolver * c, SolverAction * action, int verb=0, double timeout=0.0);
        ~SolverLinealUp();
        void addConstraint(string,int);
        void addVar(string,string);
        int solve(string,int,int);
        int optimize(string,int,int);
        int check();
        long modelVarInt(string);
        bool modelVarBool(string);
    private:
        CoreSolver * core;
        SolverAction * actions;
        int verbose;
        double timeOut;
};


#endif // LAP_SOLVERLINEALUP_H
