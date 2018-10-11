#include "solverActionNOP.h"

using namespace std;

SolverActionNOP::SolverActionNOP(){
    //NOP
    return;
}

SolverActionNOP::~SolverActionNOP(){
}

void SolverActionNOP::lowerBoundAction(){
    //NOP
    return;
}

void SolverActionNOP::upperBoundAction(){
    //NOP
    return;
}

void SolverActionNOP::satAction(){
    //NOP
    return;
}

void SolverActionNOP::unsatAction(){
    //NOP
    return;
}

void SolverActionNOP::unknownAction(){
    //NOP
    return;
}
