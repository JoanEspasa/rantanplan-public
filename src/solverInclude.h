#ifndef LAP_SOLVERINCLUDE_H
#define LAP_SOLVERINCLUDE_H


#include "solver.h"
#include "solverStandard.h"
#include "solverLinealUp.h"
#include "solverLinealDown.h"
#include "coreSolver.h"

#ifdef YICES1
#include "coreSolverYices1.h"
#else
#include "coreSolverYices2.h"
#endif

#include "coreSolverFileYices1.h"
#include "coreSolverFileYices2.h"
#include "coreSolverFileSimply.h"
#include "coreSolverFileZ3Opt.h"

#include "coreSolverZ3.h"
// TODO: estan deprecateds de mentres no ens hi posem
//#include "coreSolverCVC4.h"
//#include "coreSolverMathSat.h"

#endif // LAP_SOLVERINCLUDE_H
