#ifndef LAP_CORESOLVERFILE_H
#define LAP_CORESOLVERFILE_H

#include <map>
#include <string>

#include "expression.h"
#include "coreSolver.h"



class CoreSolverFile : public CoreSolver {
    public:
        virtual ~CoreSolverFile();

        virtual void assertConstraint(string)=0;
        virtual long assertRetractable(string)=0;
        virtual void retract(long)=0;
        virtual void addVar(string,string)=0;
        virtual int check()=0;
        virtual long modelVarInt(string)=0;
        virtual bool modelVarBool(string)=0;

        virtual std::string tradExpr(Expression &,int &);
        virtual std::string tradIte(Expression &,int &);
        virtual std::string tradNot(Expression &,int &);
        virtual std::string tradRel(Expression &,int &,std::string);
        virtual std::string tradList(Expression &,int &,std::string);
        virtual std::string tradUnari(Expression &,int &);

        map<std::string, std::pair<std::string, std::string> > mapVar;
};

#endif // CORESOLVERFILE_H
