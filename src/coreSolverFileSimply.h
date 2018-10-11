#ifndef LAP_CORESOLVERFILESIMPLY_H
#define LAP_CORESOLVERFILESIMPLY_H

#include <map>
#include <string>
#include <fstream>
#include <regex>

#include "expression.h"
#include "coreSolverFileSMT2.h"

class CoreSolverFileSimply : public CoreSolverFileSMT2 {
    public:
        CoreSolverFileSimply(std::string name, int verbosity);
        ~CoreSolverFileSimply();

        void setDecidable(string n);
        long assertRetractable(string s);
        void assertString(string s);
        void assertSoftConstraint(string s, int weight);
        void assertConstraint(string s);
        int check();
        long modelVarInt(std::string);
        bool modelVarBool(std::string);

    protected:
        int t;
        // file stream etc ... *
};

#endif
