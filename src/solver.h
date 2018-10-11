#ifndef LAP_SOLVER_H
#define LAP_SOLVER_H

#include <string>

using namespace std;


class Solver {
    public:
        virtual ~Solver(){};
        virtual void addConstraint(string,int)=0;
        virtual void setDecidable(string)=0;
        virtual void addVar(string,string)=0;
        virtual int solve(string,int,int)=0;      // fa un check inicial i despres un optimize.
        virtual int optimize(string,int,int)=0;   // optimitza pensant que el ub es correcte.
        virtual int check()=0;                    // fbusca una solucio
        virtual long modelVarInt(string)=0;
        virtual bool modelVarBool(string)=0;

        virtual long assertRetractable(string)=0;
        virtual void retract(long)=0;
};

#endif // LAP_SOLVER_H
