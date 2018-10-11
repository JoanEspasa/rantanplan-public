#ifndef LAP_SOLVERACTION_H
#define LAP_SOLVERACTION_H

#include <string>
//#include "encoder.h"

using namespace std;


class SolverAction {
    public:
        virtual ~SolverAction(){};
        virtual void lowerBoundAction()=0;
        virtual void upperBoundAction()=0;
        virtual void satAction()=0;
        virtual void unsatAction()=0;
        virtual void unknownAction()=0;
};

#endif // LAP_SOLVERACTION_H
