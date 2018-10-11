#ifndef LAP_CORESOLVERFILESMT2_H
#define LAP_CORESOLVERFILESMT2_H

#include <map>
#include <string>
#include <fstream>

#include "expression.h"
#include "coreSolverFile.h"

class CoreSolverFileSMT2 : public CoreSolverFile {
    public:
        CoreSolverFileSMT2();
        CoreSolverFileSMT2(std::string name, int verbosity);
        ~CoreSolverFileSMT2();

        void assertConstraint(std::string);
        long assertRetractable(std::string);
        void retract(long);
        void addVar(std::string name,std::string type);
        virtual int check()=0;
        virtual long modelVarInt(std::string)=0;
        virtual bool modelVarBool(std::string)=0;

    protected:
        string filename;
        int verbose;
        vector<std::string> v_vars;
        vector<std::string> v_constraints;
        // file stream etc ... *

};

#endif // CORESOLVERFILESMT2_H
