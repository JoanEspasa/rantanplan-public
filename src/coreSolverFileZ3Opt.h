#ifndef LAP_CORESOLVERFILEZ3OPT_H
#define LAP_CORESOLVERFILEZ3OPT_H

#include <map>
#include <string>
#include <fstream>
#include <regex>

#include "expression.h"
#include "coreSolverFileSMT2.h"

class CoreSolverFileZ3Opt : public CoreSolverFileSMT2 {
    public:
        CoreSolverFileZ3Opt(std::string name, int verbosity);
        ~CoreSolverFileZ3Opt();

        void setDecidable(string n);
        long assertRetractable(string s);
        void assertString(string s);
        void assertSoftConstraint(string s, int weight);
        void assertConstraint(string s);
        int check();
        long modelVarInt(std::string);
        bool modelVarBool(std::string);
        bool model = false;
        bool capture_softs = false;

    protected:
        int t;
        // file stream etc ... *
};

#endif
