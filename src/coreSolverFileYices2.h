#ifndef LAP_CORESOLVERFILEYICES2_H
#define LAP_CORESOLVERFILEYICES2_H

#include <map>
#include <string>
#include <fstream>

#include "expression.h"
#include "coreSolverFileSMT2.h"

class CoreSolverFileYices2 : public CoreSolverFileSMT2 {
    public:
        CoreSolverFileYices2(std::string name, int verbosity);
        ~CoreSolverFileYices2();

        void setDecidable(string n);
        long assertRetractable(string s);
        void assertConstraint(string s);
        int check();
        long modelVarInt(std::string);
        bool modelVarBool(std::string);

    protected:
        int t;
        // file stream etc ... *
};

#endif // CORESOLVERFILEYICES2_H
