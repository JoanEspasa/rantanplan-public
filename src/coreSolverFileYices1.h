#ifndef LAP_CORESOLVERFILEYICES1_H
#define LAP_CORESOLVERFILEYICES1_H

#include <map>
#include <string>
#include <fstream>

#include "expression.h"
#include "coreSolverFile.h"

class CoreSolverFileYices1 : public CoreSolverFile {
    public:
        CoreSolverFileYices1(std::string name, int verbosity);
        ~CoreSolverFileYices1();

        void assertConstraint(std::string);
        long assertRetractable(std::string);
        void retract(long);
        void setDecidable(std::string);
        void addVar(std::string,std::string);
        int check();
        long modelVarInt(std::string);
        bool modelVarBool(std::string);

    private:
        string filename;
        int verbose;
        int t;
        vector<std::string> v_vars;
        vector<std::string> v_getvalue;
        vector<std::string> v_constraints;
        // file stream etc ... *

};

#endif // CORESOLVERFILEYICES1_H
