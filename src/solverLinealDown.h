#ifndef LAP_SOLVERLINEALDOWN_H
#define LAP_SOLVERLINEALDOWN_H

#include "macros.h"
#include "solverAction.h"

#include "coreSolver.h"
#include "solver.h"
// includes al cpp

#include <string>
#include <sys/time.h>

using namespace std;

class SolverLinealDown : public  Solver {
    public:
        SolverLinealDown(CoreSolver * c, SolverAction * action,int verb=0, double timeout=0.0);
        ~SolverLinealDown();
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

#endif // LAP_SOLVERLINEALDOWN_H
