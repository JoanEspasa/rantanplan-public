#ifndef LAP_CORESOLVER_H
#define LAP_CORESOLVER_H

#include <string>



using namespace std;


class CoreSolver {
    public:
        virtual ~CoreSolver(){};
        virtual void assertConstraint(string)=0;
        virtual long assertRetractable(string)=0;
        virtual void retract(long)=0;
        virtual void setDecidable(string)=0; 
        virtual void addVar(string,string)=0;
        virtual int check()=0;
        virtual long modelVarInt(string)=0;
        virtual bool modelVarBool(string)=0;
   private:
};

#endif // CORESOLVER_H
