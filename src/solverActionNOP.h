#ifndef LAP_SOLVERNOPACTIONS_H
#define LAP_SOLVERNOPACTIONS_H

#include "macros.h"
#include "solverAction.h"
#include <string>

using namespace std;

class SolverActionNOP : public SolverAction {

    public:
        SolverActionNOP();
        ~SolverActionNOP();
        void lowerBoundAction();
        void upperBoundAction();
        void satAction();
        void unsatAction();
        void unknownAction();
};

#endif // LAP_SOLVERNOPACTIONS_H


